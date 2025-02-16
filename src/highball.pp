program highball;

uses
	{$ifdef UNIX}
	CThreads,
	CMem,
	{$endif}
	HighballVersion,
	HighballUtils,
	HighballServer,
	HighballConfig,
	HighballDatabase;

function ParseArgs() : Integer;
var
	ArgI : Integer;
begin
	ParseArgs := -1;
	for ArgI := 1 to ParamCount do
	begin
		if HighballIsArg(ParamStr(ArgI), 'V', 'version') then
		begin
			ParseArgs := 0;
		end
		else
		begin
			WriteLn('Invalid argument');
			ParseArgs := 1;
		end;
	end;
end;

var
	ResultParseArgs : Integer;
begin
	WriteLn('Highball - ActivityPub server in Pascal, version ' + HighballGetVersion());
	WriteLn('Copyright (c) 2025 Nishi & Contributors');
	ResultParseArgs := ParseArgs;
	if not (ResultParseArgs = -1) then
	begin
		Halt(ResultParseArgs);
	end;
	WriteLn('');
	WriteLn('Parsing config');
	HighballParseConfig('config.ini');
	WriteLn('Starting server');
	Halt(HighballServerStart());
end.
