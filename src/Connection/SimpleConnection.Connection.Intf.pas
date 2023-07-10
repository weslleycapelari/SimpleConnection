unit SimpleConnection.Connection.Intf;

interface

uses
  Data.DB;

type
  IConnection = interface
    ['{20B19CE6-8227-4CCB-9A17-F5C5715473D4}']
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
  end;

implementation

end.
