unit HighballServer;

interface
function HighballServerStart : Integer;

implementation
uses
	fphttpapp,
	httpdefs,
	httproute,
	HighballConfig,
	Sysutils;

function HighballServerStart : Integer;
begin
	HighballServerStart := 0;
	WriteLn('Started server');
	Application.Port := HighballParsedConfig.ServerPort;
	Application.Threaded := True;
	Application.Initialize;
	Application.Run;
end;

end.
