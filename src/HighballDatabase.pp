unit HighballDatabase;

interface
uses
	{$if defined(POSTGRES)}
	Postgres,
	PQConnection;
	{$elseif defined(SQLITE)}
	SQLite3dyn,
	SQLite3Conn;
	{$endif}


type
	{$if defined(POSTGRES)}
	THighballDBConnection = TPQConnection;
	{$elseif defined(SQLITE)}
	THighballDBConnection = TSQLite3Connection;
	{$endif}

procedure HighballDatabaseInit();

implementation
uses
	SQLDB,
	HighballConfig;

procedure HighballDatabaseInit();
var
	DBConn : THighballDBConnection;
	DBTrans : TSQLTransaction;
begin
	DBConn := THighballDBConnection.Create(nil);
	DBTrans := TSQLTransaction.Create(nil);
	DBConn.Transaction := DBTrans;
	DBTrans.Database := DBConn;
	DBConn.CharSet := 'UTF8';
	{$if defined(POSTGRES)}
	DBConn.DatabaseName := HighballParsedConfig.DatabaseDatabase;
	DBConn.Username := HighballParsedConfig.DatabaseUsername;
	DBConn.Password := HighballParsedConfig.DatabasePassword;
	DBConn.Hostname := HighballParsedConfig.DatabaseHostname;
	{$elseif defined(SQLITE)}
	DBConn.DatabaseName := HighballParsedConfig.DatabasePath;
	{$endif}
	DBConn.Open();
	DBConn.ExecuteDirect('CREATE TABLE IF NOT EXISTS users(name text)');
	DBTrans.Commit();
	DBTrans.Free();
	DBConn.Free();
end;

end.
