unit HBBase;

interface
uses
	HTTPDefs,
	FPJSON;

type
	TRouteBase = class
	public
		RouteReq : TRequest;
		RouteRes : TResponse;
		RouteJSON : TJSONObject;

		procedure Before();
		procedure Job();
		procedure After();
		procedure Route(req: TRequest; res: TResponse);
	end;

implementation
uses
	HighballUtils;

procedure TRouteBase.Before();
begin
	RouteJSON := TJSONObject.Create();
	RouteRes.Code := 200;
	RouteRes.ContentType := 'application/json';
end;

procedure TRouteBase.Job();
begin
	(* This is base class; do nothing *)
end;

procedure TRouteBase.After();
begin
	try
		RouteRes.Content := RouteJSON.AsJSON;
		if HighballJSONEmpty(RouteRes.Content) then
		begin
			RouteJSON.Strings['error'] := 'Endpoint not found';
			RouteRes.Content := RouteJSON.AsJSON;
			RouteRes.Code := 404;
		end;
		RouteRes.ContentLength := Length(RouteRes.Content);
		RouteRes.SendContent();
	finally
		RouteJSON.Free();
	end;
end;

procedure TRouteBase.Route(req: TRequest; res: TResponse);
begin
	RouteReq := req;
	RouteRes := res;
	Before();
	Job();
	After();
end;

end.
