unit SimpleConnection;

interface

uses
  SimpleConnection.Connection,
  SimpleConnection.Query;

type
  IConnection = SimpleConnection.Connection.IConnection;
  TConnection = SimpleConnection.Connection.TConnection;

  IQuery = SimpleConnection.Query.IQuery;
  TQuery = SimpleConnection.Query.TQuery;

implementation

end.
