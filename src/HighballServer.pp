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

	RouteWellKnown := TRouteWellKnown.Create();

	WriteLn('Started server');
	HTTPRouter.RegisterRoute('/.well-known/:name', @RouteWellKnown.Route);
	Application.Port := HighballParsedConfig.ServerPort;
	Application.Threaded := True;
	Application.Initialize;
	Application.Run;
end;

end.
