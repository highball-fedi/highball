unit HighballDatabase;

interface

implementation
uses
	{$ifdef POSTGRES}
	postgres;
	{$endif}
	{$ifdef SQLITE}
	sqlite;
	{$endif}

end.
