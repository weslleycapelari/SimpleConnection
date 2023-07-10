program Example;

{$DEFINE CON_FIREDAC}

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  SimpleConnection in '..\src\SimpleConnection.pas',
  SimpleConnection.Connection.Intf in '..\src\Connection\SimpleConnection.Connection.Intf.pas',
  SimpleConnection.Connection in '..\src\Connection\SimpleConnection.Connection.pas',
  SimpleConnection.Connection.FireDAC in '..\src\Connection\SimpleConnection.Connection.FireDAC.pas',
  SimpleConnection.Query in '..\src\Query\SimpleConnection.Query.pas',
  SimpleConnection.Query.Intf in '..\src\Query\SimpleConnection.Query.Intf.pas',
  SimpleConnection.Query.FireDAC in '..\src\Query\SimpleConnection.Query.FireDAC.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
