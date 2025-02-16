unit HighballServer;

interface
function HighballServerStart() : Integer;

implementation
uses
	FPHTTPApp,
	HTTPDefs,
	HTTPRoute,
	Sysutils,
	HighballConfig,
	HBDefault,
	HBWellKnown,
	HBNodeinfo;

function HighballServerStart() : Integer;
begin
	HighballServerStart := 0;

	RouteDefault := TRouteDefault.Create();
	RouteWellKnown := TRouteWellKnown.Create();
	RouteNodeinfo := TRouteNodeinfo.Create();

	WriteLn('Started server');
	HTTPRouter.RegisterRoute('/', @RouteDefault.Route, True);
	HTTPRouter.RegisterRoute('/.well-known/:name', @RouteWellKnown.Route);
	HTTPRouter.RegisterRoute('/nodeinfo/:name', @RouteNodeinfo.Route);
	Application.Port := HighballParsedConfig.ServerPort;
	Application.Threaded := True;
	Application.Initialize;
	Application.Run;
end;

end.
