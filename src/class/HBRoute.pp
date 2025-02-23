unit HBRoute;

interface
uses
	HTTPDefs,
	FPJSON;

type
	TRouteBase = class
	protected
		RouteReq: TRequest;
		RouteRes: TResponse;
		RouteJSON: TJSONObject;
		DefaultProcess: Boolean;

		procedure Before();
		procedure Job(); virtual; abstract;
		procedure After();

	public
		procedure Route(Req: TRequest; Res: TResponse);
	end;

implementation
uses
	HighballUtils,
	HighballVersion;

procedure TRouteBase.Before();
begin
	RouteJSON := TJSONObject.Create();
	RouteRes.Code := 200;
	RouteRes.ContentType := 'application/json';
	RouteRes.Server := 'Highball/' + HighballGetVersion();
end;

procedure TRouteBase.After();
begin
	try
		if DefaultProcess then
		begin
			RouteRes.Content := RouteJSON.AsJSON;
			if HighballJSONEmpty(RouteRes.Content) and (RouteRes.Code = 200) then
			begin
				RouteJSON.Strings['error'] := 'Endpoint not found';
				RouteRes.Content := RouteJSON.AsJSON;
				RouteRes.Code := 404;
			end;
			RouteRes.ContentLength := Length(RouteRes.Content);
		end;
		RouteRes.SendContent();
	finally
		RouteJSON.Destroy();
	end;
end;

procedure TRouteBase.Route(Req: TRequest; Res: TResponse);
begin
	DefaultProcess := True;
	RouteReq := Req;
	RouteRes := Res;
	Before();
	Job();
	After();
end;

end.
