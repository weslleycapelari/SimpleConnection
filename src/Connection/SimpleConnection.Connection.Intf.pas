unit SimpleConnection.Connection.Intf;

interface

uses
  Data.DB;

type
  IConnection = interface
    ['{20B19CE6-8227-4CCB-9A17-F5C5715473D4}']
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
  end;

implementation

end.
