program highball;

uses
	HighballVersion,
	HighballUtils,
	Sysutils;

var
	ArgI : Integer;
begin
	WriteLn('Highball - ActivityPub server in Pascal, version ' + HighballGetVersion());
	WriteLn('Copyright (c) 2025 Nishi & Contributors');
	for ArgI := 1 to ParamCount do
	begin
	end;
end.
