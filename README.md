<p align="center">
  <a href="https://github.com/weslleycapelari/simple-connection/blob/master/img/logo.png">
    <img alt="SimpleConnection" height="150" src="https://github.com/weslleycapelari/simple-connection/blob/master/img/logo.png">
  </a>  
</p><br>
<p align="center">
  <b>SimpleConnection</b> is a library responsible for generating <b>database connections</b> and <b>queries</b> in an <b>abstract</b> and <b>simple</b> way.
</p><br>
<p align="center">
  <img src="https://img.shields.io/github/v/release/weslleycapelari/simple-connection?style=flat-square">
  <img src="https://img.shields.io/github/stars/weslleycapelari/simple-connection?style=flat-square">
</p>
 
## ⚙️ Installation 

* **Manual installation**: Add the following folders to your project, in *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*

```
../simple-connection/src
```

* Installation using the [**Boss**](https://github.com/HashLoad/boss):

```
boss install github.com/weslleycapelari/simple-connection
```

## 🔰 Engines

By default the library uses the most updated component for the delphi version, in this case the most current one is [**FireDAC**](https://www.embarcadero.com/br/products/rad-studio/firedac), but it is possible to define components through the definition of directives. You can change the engine to make requests. To do this, simply define in: *Project > Options > Delphi Compiler > Conditional defines* the compiler directive `SC_BDE`, `SC_ADO`, `SC_DBX` or `SC_FIREDAC`

## ⚡️ Quickstart

You need to use SimpleConnection

```pascal
uses SimpleConnection;
```

* **Connection**

```pascal
var
  LConn: IConnection;
begin
  LConn := TConnection.New
    .Silence(True)
    .Engine('Firebird')
    .Hostname('localhost')
    .Port('3050')
    .Database('database.fdb')
    .Username('SYSDBA')
    .Password('masterkey')
    .VendorLib('fbclient.dll')
    .Open;

  if LConn.IsActive then
    ShowMessage('Connected')
  else
    ShowMessage('Not Connected');
end;
``` 

* **Query**

```pascal
var
  LConn : IConnection;
  LQuery: IQuery;
begin
  LConn := TConnection.New
    .Silence(True)
    .Engine('Firebird')
    .Hostname('localhost')
    .Port('3050')
    .Database('database.fdb')
    .Username('SYSDBA')
    .Password('masterkey')
    .VendorLib('fbclient.dll')
    .Open;

  if LConn.IsActive then
  begin
    LQuery := TQuery.New
      .Silence(True)
      .Connection(LConn.Connection)
      .SQL('select * from customer')
      .Open;

    while not LQuery.Eof do
    begin
      ShowMessage(LQuery.FieldAsString('name'));
      LQuery.Next;
    end;
  end;
end;
``` 

## 📝 Samples

A project was developed inside the example folder

## 💻 Code Contributors

<img src="https://opencollective.com/SimpleConnection/contributors.svg?width=890&button=false" alt="Code Contributors" style="max-width:100%;">

## ⚠️ License

`SimpleConnection` is free and open-source software licensed under the [Apache-2.0 License](https://github.com/weslleycapelari/simple-connection/blob/master/LICENSE). 