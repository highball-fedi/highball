unit HighballDatabase;

interface

implementation
uses
	{$ifdef POSTGRES}
	postgres;
	{$endif}
	{$ifdef SQLITE}
	sqlite3;
	{$endif}

end.
