unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, SimpleConnection, Vcl.ExtCtrls;

type
  TFrmMain = class(TForm)
    pnlBotoes: TPanel;
    btnConnect: TButton;
    pnlCorpo: TPanel;
    pnlFields1: TPanel;
    lblDriver: TLabel;
    pnlFields2: TPanel;
    lblHostname: TLabel;
    edtHostname: TEdit;
    lblPort: TLabel;
    edtPort: TEdit;
    cbbDriver: TComboBox;
    pnlFields3: TPanel;
    lblDatabase: TLabel;
    edtDatabase: TEdit;
    pnlFields21: TPanel;
    lblUsername: TLabel;
    lblPassword: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    pnlFields31: TPanel;
    lblLibrary: TLabel;
    edtLibrary: TEdit;
    mmoResult: TMemo;
    btnQuery: TButton;
    procedure btnConnectClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
    LConn: IConnection;
  const
    clPastelBlue   = $00DCAD79;
    clPastelRed    = $009FC0FF;
    clPastelYellow = $0093EEFF;
    clPastelGreen  = $00B6F7AD;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  System.IOUtils, uDataGrid;

procedure TFrmMain.btnConnectClick(Sender: TObject);
begin
  if not Assigned(LConn) then
    LConn := TConnection.New
  else if LConn.IsActive then
    LConn.Close;

  LConn.SetSilence(True)
    .SetEngine(cbbDriver.Text)
    .SetHost(edtHostname.Text)
    .SetPort(edtPort.Text)
    .SetDatabase(TPath.GetFullPath(edtDatabase.Text))
    .SetUser(edtUsername.Text)
    .SetPass(edtPassword.Text)
    .SetLibrary(edtLibrary.Text);

  mmoResult.Color      := clPastelBlue;
  mmoResult.Lines.Text := 'Tentando conexão com os parâmetros acima...';

  try
    LConn.Open;

    if LConn.IsActive then
    begin
      mmoResult.Color      := clPastelGreen;
      mmoResult.Lines.Text := 'Conexão realizada com sucesso.';
    end
    else
    begin
      mmoResult.Color      := clPastelRed;
      mmoResult.Lines.Text := 'Conexão não realizada.';
    end;
  except
    on E: Exception do
    begin
      mmoResult.Color      := clPastelRed;
      mmoResult.Lines.Text := 'Conexão não realizada.' + #13#10 + E.Message;
    end;
  end;
end;

procedure TFrmMain.btnQueryClick(Sender: TObject);
var
  LQuery: IQuery;
begin
  if not Assigned(LConn) then
    btnConnect.Click;

  if LConn.IsActive then
  begin
    LQuery := TQuery.New
      .SetSilence(False)
      .SetConnection(LConn.GetConnection)
      .SetSQL('select * from customer');

    try
      LQuery.Open;

      if LQuery.IsActive then
      begin
        mmoResult.Color      := clPastelGreen;
        mmoResult.Lines.Text := 'Consulta realizada com sucesso.';

        Application.CreateForm(TFrmDataGrid, FrmDataGrid);
        FrmDataGrid.dsData.DataSet := LQuery.GetDataSet;
        FrmDataGrid.ShowModal;
        FreeAndNil(FrmDataGrid);
      end
      else
      begin
        mmoResult.Color      := clPastelRed;
        mmoResult.Lines.Text := 'Consulta não realizada.';
      end;
    except
      on E: Exception do
      begin
        mmoResult.Color      := clPastelRed;
        mmoResult.Lines.Text := 'Consulta não realizada.' + #13#10 + E.Message;
      end;
    end;
  end;
end;

end.
