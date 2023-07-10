unit SimpleConnection.Query.FireDAC;

interface

uses
  SimpleConnection.Query.Intf,
  FireDAC.Stan.Param,
  FireDAC.Comp.Client,
  Data.DB;

type
  TQueryFireDAC = class(TInterfacedObject, IQuery)
  private
    FQuery: TFDQuery;
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
    {$IF DEFINED(CON_FIREDAC)}
    function SetConnection(const pConnection: TFDCustomConnection): IQuery;
    function GetConnection: TCustomConnection;
    {$ENDIF}
    function AddSQL(const pCommand: string): IQuery;
    function ClearSQL: IQuery;
    function SetSQL(const pSQL: string): IQuery;
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
  FQuery.ParamByName(pName).AsBoolean := pValue;
end;

function TQueryFireDAC.AddParamByName(const pName: string;
  const pValue: Integer): IQuery;
begin
  Result := Self;
  FQuery.ParamByName(pName).AsInteger := pValue;
end;

function TQueryFireDAC.AddParamByName(const pName, pValue: string): IQuery;
begin
  Result := Self;
  FQuery.ParamByName(pName).AsString := pValue;
end;

function TQueryFireDAC.AddParamByName(const pName: string;
  const pValue: Extended): IQuery;
begin
  Result := Self;
  FQuery.ParamByName(pName).AsExtended := pValue;
end;

function TQueryFireDAC.AddSQL(const pCommand: string): IQuery;
begin
  Result := Self;
  FQuery.SQL.Add(pCommand);
end;

function TQueryFireDAC.Bof: Boolean;
begin
  Result := FQuery.Bof;
end;

function TQueryFireDAC.ClearSQL: IQuery;
begin
  Result := Self;
  FQuery.SQL.Clear;
end;

function TQueryFireDAC.Close: IQuery;
begin
  Result := Self;
  FQuery.Close;
end;

constructor TQueryFireDAC.Create;
begin
  inherited;
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
  FQuery.First;
end;

{$IF DEFINED(CON_FIREDAC)}
function TQueryFireDAC.GetConnection: TCustomConnection;
begin
  Result := FQuery.Connection;
end;
{$ENDIF}

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
  FQuery.Last;
end;

class function TQueryFireDAC.New: IQuery;
begin
  Result := TQueryFireDAC.Create;
end;

function TQueryFireDAC.Next: IQuery;
begin
  Result := Self;
  FQuery.Next;
end;

function TQueryFireDAC.Open: IQuery;
begin
  Result := Self;
  FQuery.Open;
end;

function TQueryFireDAC.Prior: IQuery;
begin
  Result := Self;
  FQuery.Prior;
end;

function TQueryFireDAC.RecNo: Integer;
begin
  Result := FQuery.RecNo;
end;

function TQueryFireDAC.RecordCount: Integer;
begin
  Result := FQuery.RecordCount;
end;

{$IF DEFINED(CON_FIREDAC)}
function TQueryFireDAC.SetConnection(
  const pConnection: TFDCustomConnection): IQuery;
begin
  Result := Self;
  FQuery.Connection := pConnection;
end;
{$ENDIF}

function TQueryFireDAC.SetSQL(const pSQL: string): IQuery;
begin
  Result := Self;
  FQuery.SQL.Text := pSQL;
end;

end.
