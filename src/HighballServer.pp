unit HighballServer;

interface
function HighballServerStart() : Integer;

implementation
uses
	FPHTTPApp,
	HTTPDefs,
	HTTPRoute,
	HighballConfig,
	HBDefault,
	HBWellKnown,
	Sysutils;

function HighballServerStart() : Integer;
begin
	HighballServerStart := 0;

	RouteDefault := TRouteDefault.Create();
	RouteWellKnown := TRouteWellKnown.Create();

	WriteLn('Started server');
	HTTPRouter.RegisterRoute('/', @RouteDefault.Route, True);
	HTTPRouter.RegisterRoute('/.well-known/:name', @RouteWellKnown.Route);
	Application.Port := HighballParsedConfig.ServerPort;
	Application.Threaded := True;
	Application.Initialize;
	Application.Run;
end;

end.
