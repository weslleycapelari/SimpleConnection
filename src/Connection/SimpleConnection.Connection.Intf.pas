unit SimpleConnection.Connection.Intf;

interface

uses
  Data.DB;

type
  IConnection = interface
    ['{20B19CE6-8227-4CCB-9A17-F5C5715473D4}']
    function StartTransaction: IConnection;
    function Commit: IConnection;
    function Rollback: IConnection;
    function InTransaction: Boolean;
    function GetConnection: TCustomConnection;
  end;

implementation

end.
