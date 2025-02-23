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
		Connection: THighballDBConnection;
		Transaction: TSQLTransaction;
		DidRun: Boolean;

	public
		Query: TSQLQuery;

		constructor Create();
		destructor Destroy(); override;
		procedure Execute(ExecQuery: String);
		procedure Run(RunQuery: String);
	end;
	THighballDBPointer = ^THighballDB;

implementation
uses
	HighballConfig;

constructor THighballDB.Create();
begin
	Connection := THighballDBConnection.Create(nil);
	Transaction := TSQLTransaction.Create(nil);
	Query := TSQLQuery.Create(nil);
	Connection.Transaction := Transaction;
	Transaction.Database := Connection;
	Query.Database := Connection;
	Query.Transaction := Transaction;
	Connection.CharSet := 'UTF8';
	DidRun := False;

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
	if DidRun then
	begin
		Query.Close();
	end
	else
	begin
		Query.ExecSQL();
		Transaction.Commit();
	end;
	Query.Free();
	Transaction.Free();
	Connection.Free();
	inherited;
end;

procedure THighballDB.Execute(ExecQuery: String);
begin
	Query.SQL.Text := ExecQuery;
end;

procedure THighballDB.Run(RunQuery: String);
begin
	DidRun := True;
	Query.SQL.Text := RunQuery;
	Query.Open;
end;

end.
