unit SimpleConnection.Query.FireDAC;

interface

uses
  SimpleConnection.Query.Intf,
  FireDAC.Stan.Param,
  FireDAC.Comp.Client,
  FireDAC.DApt,
  Data.DB,
  SysUtils;

type
  TQueryFireDAC = class(TInterfacedObject, IQuery)
  private
    FQuery  : TFDQuery;
    FSilence: Boolean;
    function Open: IQuery;
    function Close: IQuery;
    function Next: IQuery;
    function Prior: IQuery;
    function First: IQuery;
    function Last: IQuery;
    function Eof: Boolean;
    function Bof: Boolean;
    function RecordCount: Integer;
    function RecNo: Integer;
    function IsEmpty: Boolean;
    function IsActive: Boolean;
    function SetConnection(const pConnection: TCustomConnection): IQuery;
    function GetConnection: TCustomConnection;
    function GetDataSet: TDataSet;
    function AddSQL(const pCommand: string): IQuery;
    function ClearSQL: IQuery;
    function SetSQL(const pSQL: string): IQuery;
    function SetSilence(const pValue: Boolean): IQuery;
    function AddParamByName(const pName, pValue: string): IQuery; overload;
    function AddParamByName(const pName: string; const pValue: Integer): IQuery; overload;
    function AddParamByName(const pName: string; const pValue: Boolean): IQuery; overload;
    function AddParamByName(const pName: string; const pValue: Extended): IQuery; overload;
    function FieldAsString(const pName: string): string;
    function FieldAsInteger(const pName: string): Integer;
    function FieldAsBoolean(const pName: string): Boolean;
    function FieldAsExtended(const pName: string): Extended;
    constructor Create;
  public
    destructor Destroy; override;
    class function New: IQuery;
  end;

implementation

{ TQueryFireDAC }

function TQueryFireDAC.AddParamByName(const pName: string;
  const pValue: Boolean): IQuery;
begin
  Result := Self;
  try
    FQuery.ParamByName(pName).AsBoolean := pValue;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TQueryFireDAC.AddParamByName(const pName: string;
  const pValue: Integer): IQuery;
begin
  Result := Self;
  try
    FQuery.ParamByName(pName).AsInteger := pValue;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TQueryFireDAC.AddParamByName(const pName, pValue: string): IQuery;
begin
  Result := Self;
  try
    FQuery.ParamByName(pName).AsString := pValue;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TQueryFireDAC.AddParamByName(const pName: string;
  const pValue: Extended): IQuery;
begin
  Result := Self;
  try
    FQuery.ParamByName(pName).AsExtended := pValue;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TQueryFireDAC.AddSQL(const pCommand: string): IQuery;
begin
  Result := Self;
  try
    FQuery.SQL.Add(pCommand);
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TQueryFireDAC.Bof: Boolean;
begin
  Result := FQuery.Bof;
end;

function TQueryFireDAC.ClearSQL: IQuery;
begin
  Result := Self;
  try
    FQuery.SQL.Clear;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TQueryFireDAC.Close: IQuery;
begin
  Result := Self;
  try
    FQuery.Close;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

constructor TQueryFireDAC.Create;
begin
  inherited;
  FSilence := False;

  FQuery := TFDQuery.Create(nil);
end;

destructor TQueryFireDAC.Destroy;
begin
  FQuery.Free;
  inherited;
end;

function TQueryFireDAC.Eof: Boolean;
begin
  Result := FQuery.Eof;
end;

function TQueryFireDAC.FieldAsBoolean(const pName: string): Boolean;
begin
  Result := FQuery.FieldByName(pName).AsBoolean;
end;

function TQueryFireDAC.FieldAsExtended(const pName: string): Extended;
begin
  Result := FQuery.FieldByName(pName).AsExtended;
end;

function TQueryFireDAC.FieldAsInteger(const pName: string): Integer;
begin
  Result := FQuery.FieldByName(pName).AsInteger;
end;

function TQueryFireDAC.FieldAsString(const pName: string): string;
begin
  Result := FQuery.FieldByName(pName).AsString;
end;

function TQueryFireDAC.First: IQuery;
begin
  Result := Self;
  try
    FQuery.First;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TQueryFireDAC.GetConnection: TCustomConnection;
begin
  Result := FQuery.Connection;
end;

function TQueryFireDAC.GetDataSet: TDataSet;
begin
  Result := FQuery;
end;

function TQueryFireDAC.IsActive: Boolean;
begin
  Result := FQuery.Active;
end;

function TQueryFireDAC.IsEmpty: Boolean;
begin
  Result := FQuery.IsEmpty;
end;

function TQueryFireDAC.Last: IQuery;
begin
  Result := Self;
  try
    FQuery.Last;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

class function TQueryFireDAC.New: IQuery;
begin
  Result := TQueryFireDAC.Create;
end;

function TQueryFireDAC.Next: IQuery;
begin
  Result := Self;
  try
    FQuery.Next;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TQueryFireDAC.Open: IQuery;
begin
  Result := Self;
  try
    FQuery.Open;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TQueryFireDAC.Prior: IQuery;
begin
  Result := Self;
  try
    FQuery.Prior;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TQueryFireDAC.RecNo: Integer;
begin
  Result := FQuery.RecNo;
end;

function TQueryFireDAC.RecordCount: Integer;
begin
  Result := FQuery.RecordCount;
end;

function TQueryFireDAC.SetConnection(
  const pConnection: TCustomConnection): IQuery;
begin
  Result := Self;
  try
    FQuery.Connection := TFDCustomConnection(pConnection);
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TQueryFireDAC.SetSilence(const pValue: Boolean): IQuery;
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

function TQueryFireDAC.SetSQL(const pSQL: string): IQuery;
begin
  Result := Self;
  try
    FQuery.SQL.Text := pSQL;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

end.
