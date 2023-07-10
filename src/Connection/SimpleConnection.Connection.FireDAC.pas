unit SimpleConnection.Connection.FireDAC;

interface

uses
  SimpleConnection.Connection.Intf,
  FireDAC.Comp.Client,
  FireDAC.Stan.Def,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Comp.UI,
  Data.DB,
  SysUtils,
  StrUtils;

type
  TConnectionFireDAC = class(TInterfacedObject, IConnection)
  private
    FConnection: TFDConnection;
    FManager   : TFDManager;
    FSilence   : Boolean;
    function SetDatabase(const pDatabase: string): IConnection;
    function SetLibrary(const pLibrary: string): IConnection;
    function SetEngine(const pEngine: string): IConnection;
    function SetHost(const pHost: string): IConnection;
    function SetPort(const pPort: string): IConnection;
    function SetUser(const pUser: string): IConnection;
    function SetPass(const pPass: string): IConnection;
    function SetSilence(const pValue: Boolean): IConnection;
    function ClearParams: IConnection;
    function Open: IConnection;
    function Close: IConnection;
    function IsActive: Boolean;
    function StartTransaction: IConnection;
    function Commit: IConnection;
    function Rollback: IConnection;
    function InTransaction: Boolean;
    function GetConnection: TCustomConnection;
    constructor Create;
  public
    destructor Destroy; override;
    class function New: IConnection;
  end;

implementation

{ TConnectionFireDAC }

function TConnectionFireDAC.ClearParams: IConnection;
begin
  FConnection.Params.Clear;
  Result := Self;
end;

function TConnectionFireDAC.Close: IConnection;
begin
  Result := Self;
  try
    FConnection.Connected := False;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.Commit: IConnection;
begin
  Result := Self;
  try
    FConnection.Commit;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

constructor TConnectionFireDAC.Create;
begin
  inherited;
  FSilence := False;

  try
    FManager := TFDManager.Create(nil);
    FManager.SilentMode := True;
    FManager.Active     := True;
  except
    on E: Exception do

  end;

  FConnection := TFDConnection.Create(nil);
  FConnection.LoginPrompt := False;
  SetEngine('Firebird');
end;

destructor TConnectionFireDAC.Destroy;
begin
  FConnection.Free;
  inherited;
end;

function TConnectionFireDAC.GetConnection: TCustomConnection;
begin
  Result := FConnection;
end;

function TConnectionFireDAC.InTransaction: Boolean;
begin
  Result := FConnection.InTransaction;
end;

function TConnectionFireDAC.IsActive: Boolean;
begin
  Result := FConnection.Connected;
end;

class function TConnectionFireDAC.New: IConnection;
begin
  Result := TConnectionFireDAC.Create;
end;

function TConnectionFireDAC.Open: IConnection;
begin
  Result := Self;
  try
    FConnection.Connected := True;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.Rollback: IConnection;
begin
  Result := Self;
  try
    FConnection.Rollback;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.SetDatabase(const pDatabase: string): IConnection;
begin
  Result := Self;
  try
    FConnection.Params.AddPair('Database', pDatabase);
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.SetEngine(const pEngine: string): IConnection;
begin
  Result := Self;
  try
    case AnsiIndexText(pEngine, ['Firebird']) of
      0:
        begin
          FConnection.DriverName      := 'FB';
          FConnection.Params.DriverID := 'FB';
        end;
    end;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.SetHost(const pHost: string): IConnection;
begin
  Result := Self;
  try
    FConnection.Params.AddPair('Server', pHost);
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.SetLibrary(const pLibrary: string): IConnection;
begin
  Result := Self;
  try
    FConnection.Params.AddPair('VendorLib', pLibrary);
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.SetPass(const pPass: string): IConnection;
begin
  Result := Self;
  try
    FConnection.Params.Password := pPass;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.SetPort(const pPort: string): IConnection;
begin
  Result := Self;
  try
    FConnection.Params.AddPair('Port', pPort);
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.SetSilence(const pValue: Boolean): IConnection;
begin
  Result := Self;
  try
    FSilence := pValue;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.SetUser(const pUser: string): IConnection;
begin
  Result := Self;
  try
    FConnection.Params.UserName := pUser;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.StartTransaction: IConnection;
begin
  Result := Self;
  try
    FConnection.StartTransaction;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

end.
