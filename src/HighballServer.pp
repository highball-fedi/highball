unit HighballServer;

interface
function HighballServerStart : Integer;

implementation
uses
	fphttpapp,
	httpdefs,
	httproute;

function HighballServerStart : Integer;
begin
	HighballServerStart := 0;
	WriteLn('Started server');
	Application.Port := 1999;
	Application.Threaded := True;
	Application.Initialize;
	Application.Run;
end;

end.
