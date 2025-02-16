unit HighballDatabase;

interface

implementation
uses
	{$ifdef POSTGRES}
	Postgres;
	{$endif}
	{$ifdef SQLITE}
	SQLite3;
	{$endif}

end.
