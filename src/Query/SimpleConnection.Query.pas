unit SimpleConnection.Query;

interface

uses
  SimpleConnection.Query.Intf
  {$IF DEFINED(SC_BDE)}

  {$ELSEIF DEFINED(SC_ADO)}

  {$ELSEIF DEFINED(SC_DBX)}

  {$ELSEIF DEFINED(SC_ADO)}

  {$ELSE}
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
  {$IF DEFINED(SC_BDE)}

  {$ELSEIF DEFINED(SC_ADO)}

  {$ELSEIF DEFINED(SC_DBX)}

  {$ELSEIF DEFINED(SC_ADO)}

  {$ELSE}
  Result := TQueryFireDAC.New;
  {$ENDIF}
end;

end.
