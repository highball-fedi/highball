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
	ResultFunc : Integer;
begin
	WriteLn('Highball - ActivityPub server in Pascal, version ' + HighballGetVersion());
	WriteLn('Copyright (c) 2025 Nishi & Contributors');
	ResultFunc := ParseArgs;
	if not (ResultFunc = -1) then
	begin
		Halt(ResultFunc);
	end;
	WriteLn('');
	WriteLn('Parsing config');
	HighballParseConfig('config.ini');
	WriteLn('Check config');
	ResultFunc := HighballCheckConfig();
	if not (ResultFunc = -1) then
	begin
		Halt(ResultFunc);
	end;
	WriteLn('Starting server');
	Halt(HighballServerStart());
end.
