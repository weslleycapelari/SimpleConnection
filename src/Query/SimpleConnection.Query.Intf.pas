unit SimpleConnection.Query.Intf;

interface

uses
  Data.DB;

type
  IQuery = interface
    ['{9F3B13A0-F584-4946-9AB0-0DA7128914EB}']
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
  end;

implementation

end.
