unit SimpleConnection.Connection;

interface

uses
  SimpleConnection.Connection.Intf
  {$IF DEFINED(SC_BDE)}

  {$ELSEIF DEFINED(SC_ADO)}

  {$ELSEIF DEFINED(SC_DBX)}

  {$ELSEIF DEFINED(SC_ADO)}

  {$ELSE}
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
  {$IF DEFINED(SC_BDE)}

  {$ELSEIF DEFINED(SC_ADO)}

  {$ELSEIF DEFINED(SC_DBX)}

  {$ELSEIF DEFINED(SC_ADO)}

  {$ELSE}
  Result := TConnectionFireDAC.New;
  {$ENDIF}
end;

end.
