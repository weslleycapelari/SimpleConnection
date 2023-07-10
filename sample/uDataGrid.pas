unit uDataGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TFrmDataGrid = class(TForm)
    pnlCorpo: TPanel;
    dbgrdData: TDBGrid;
    dsData: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDataGrid: TFrmDataGrid;

implementation

{$R *.dfm}

end.
