unit HighballDatabase;

interface
uses
	{$if defined(POSTGRES)}
	Postgres,
	PQConnection;
	{$elseif defined(SQLITE)}
	SQLite3,
	SQLite3Conn;
	{$endif}

type
	{$if defined(POSTGRES)}
	THighballDatabase = TPQConnection;
	{$elseif defined(SQLITE)}
	THighballDatabase = TSQLite3Connection;
	{$endif}

implementation

end.
