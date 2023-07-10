unit SimpleConnection.Connection;

interface

uses
  SimpleConnection.Connection.Intf
  {$IF DEFINED(CON_FIREDAC)}
  , SimpleConnection.Connection.FireDAC
  {$ENDIF}
  ;

type
  IConnection = SimpleConnection.Connection.Intf.IConnection;

  TConnection = class
    class function New: IConnection;
  end;

implementation

{ TConnection }

class function TConnection.New: IConnection;
begin
  {$IF DEFINED(CON_FIREDAC)}
  Result := TConnectionFireDAC.New;
  {$ENDIF}
end;

end.
