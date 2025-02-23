unit HBDatabase;

interface
uses
	SQLDB,
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
	THighballDB = class
	protected
		Connection : THighballDBConnection;
		Transaction : TSQLTransaction;

	public
		constructor Create();
		destructor Destroy(); override;
		procedure ExecuteDirect(Query : String);
	end;
	THighballDBPointer = ^THighballDB;

implementation
uses
	HighballConfig;

constructor THighballDB.Create();
begin
	Connection := THighballDBConnection.Create(nil);
	Transaction := TSQLTransaction.Create(nil);
	Connection.Transaction := Transaction;
	Transaction.Database := Connection;
	Connection.CharSet := 'UTF8';
	{$if defined(POSTGRES)}
	Connection.DatabaseName := HighballParsedConfig.DatabaseDatabase;
	Connection.Username := HighballParsedConfig.DatabaseUsername;
	Connection.Password := HighballParsedConfig.DatabasePassword;
	Connection.Hostname := HighballParsedConfig.DatabaseHostname;
	{$elseif defined(SQLITE)}
	Connection.DatabaseName := HighballParsedConfig.DatabasePath;
	{$endif}
	Connection.Open();
end;

destructor THighballDB.Destroy();
begin
	Transaction.Free();
	Connection.Free();
	inherited;
end;

procedure THighballDB.ExecuteDirect(Query : String);
begin
	Connection.ExecuteDirect(Query);
	Transaction.Commit();
end;

end.
