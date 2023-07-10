unit SimpleConnection.Query;

interface

uses
  SimpleConnection.Query.Intf
  {$IF DEFINED(CON_FIREDAC)}
  , SimpleConnection.Query.FireDAC
  {$ENDIF}
  ;

type
  IQuery = SimpleConnection.Query.Intf.IQuery;

  TQuery = class
    class function New: IQuery;
  end;

implementation

{ TConnection }

class function TQuery.New: IQuery;
begin
  {$IF DEFINED(CON_FIREDAC)}
  Result := TQueryFireDAC.New;
  {$ENDIF}
end;

end.
