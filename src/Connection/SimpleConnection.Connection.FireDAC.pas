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
    function Database(const pDatabase: string): IConnection; overload;
    function Database: string; overload;
    function VendorLib(const pLibrary: string): IConnection; overload;
    function VendorLib: string; overload;
    function Engine(const pEngine: string): IConnection; overload;
    function Engine: string; overload;
    function Hostname(const pHost: string): IConnection; overload;
    function Hostname: string; overload;
    function Port(const pPort: string): IConnection; overload;
    function Port: string; overload;
    function Username(const pUser: string): IConnection; overload;
    function Username: string; overload;
    function Password(const pPass: string): IConnection; overload;
    function Password: string; overload;
    function Silence(const pValue: Boolean): IConnection; overload;
    function Silence: Boolean; overload;
    function ClearParams: IConnection;
    function Open: IConnection;
    function Close: IConnection;
    function IsActive: Boolean;
    function StartTransaction: IConnection;
    function Commit: IConnection;
    function Rollback: IConnection;
    function InTransaction: Boolean;
    function Connection: TCustomConnection;
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
  Engine('Firebird');
end;

function TConnectionFireDAC.Database: string;
var
  Idx: Integer;
begin
  Result := '';
  try
    Idx := FConnection.Params.IndexOfName('Database');
    if Idx >= 0 then
      Result := FConnection.Params[Idx];
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

destructor TConnectionFireDAC.Destroy;
begin
  FConnection.Free;
  inherited;
end;

function TConnectionFireDAC.Engine: string;
begin
  Result := '';
  try
    case IndexStr(FConnection.DriverName , ['FB']) of
      0: Result := 'Firebird';
    end;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.Connection: TCustomConnection;
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

function TConnectionFireDAC.Database(const pDatabase: string): IConnection;
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

function TConnectionFireDAC.Engine(const pEngine: string): IConnection;
begin
  Result := Self;
  try
    case IndexStr(pEngine, ['Firebird']) of
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

function TConnectionFireDAC.Hostname(const pHost: string): IConnection;
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

function TConnectionFireDAC.VendorLib(const pLibrary: string): IConnection;
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

function TConnectionFireDAC.Password(const pPass: string): IConnection;
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

function TConnectionFireDAC.Port(const pPort: string): IConnection;
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

function TConnectionFireDAC.Silence(const pValue: Boolean): IConnection;
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

function TConnectionFireDAC.Username(const pUser: string): IConnection;
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

function TConnectionFireDAC.Silence: Boolean;
begin
  Result := FSilence;
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

function TConnectionFireDAC.Hostname: string;
var
  Idx: Integer;
begin
  Result := '';
  try
    Idx := FConnection.Params.IndexOfName('Server');
    if Idx >= 0 then
      Result := FConnection.Params[Idx];
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.Password: string;
begin
  Result := FConnection.Params.Password;
end;

function TConnectionFireDAC.Port: string;
var
  Idx: Integer;
begin
  Result := '';
  try
    Idx := FConnection.Params.IndexOfName('Port');
    if Idx >= 0 then
      Result := FConnection.Params[Idx];
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TConnectionFireDAC.Username: string;
begin
  Result := FConnection.Params.UserName;
end;

function TConnectionFireDAC.VendorLib: string;
var
  Idx: Integer;
begin
  Result := '';
  try
    Idx := FConnection.Params.IndexOfName('VendorLib');
    if Idx >= 0 then
      Result := FConnection.Params[Idx];
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

end.
