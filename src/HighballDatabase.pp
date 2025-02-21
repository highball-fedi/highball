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
	TSQLite3Connection = TPQConnection;
	{$elseif defined(SQLITE)}
	THighballDBConnection = TSQLite3Connection;
	{$endif}

procedure HighballDatabaseInit();

implementation
uses
	SQLDB;

procedure HighballDatabaseInit();
var
	DBConn : THighballDBConnection;
	DBTrans : TSQLTransaction;
begin
	DBConn := THighballDBConnection.Create(nil);
	DBTrans := TSQLTransaction.Create(nil);
	DBConn.Transaction := DBTrans;
	DBTrans.Database := DBConn;
	{$if defined(POSTGRES)}
	{$elseif defined(SQLITE)}
	DBConn.DatabaseName := 'a';
	DBConn.HostName := 'localhost';
	DBConn.CharSet := 'UTF8';
	{$endif}
	DBConn.Open();
	//DBConn.ExecuteDirect('CREATE TABLE IF NOT EXISTS users(name text)');
	//DBTrans.Commit();
	DBTrans.Free();
	DBConn.Free();
end;

end.
