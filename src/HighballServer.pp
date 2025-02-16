unit HighballServer;

interface
function HighballServerStart() : Integer;

implementation
uses
	FPHTTPApp,
	HTTPDefs,
	HTTPRoute,
	HighballConfig,
	HBWellKnown,
	Sysutils;

function HighballServerStart() : Integer;
begin
	HighballServerStart := 0;
	WriteLn('Started server');
	HTTPRouter.RegisterRoute('/.well-known', @RouteWellKnown.Route);
	Application.Port := HighballParsedConfig.ServerPort;
	Application.Threaded := True;
	Application.Initialize;
	Application.Run;
end;

end.
