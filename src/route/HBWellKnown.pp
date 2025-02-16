unit HBWellKnown;

interface
uses
	HTTPDefs;

procedure RouteWellKnown(req: TRequest; res: TResponse);

implementation
uses
	FPJSON,
	HighballUtils;

procedure RouteWellKnown(req: TRequest; res: TResponse);
var
	JSON : TJSONObject;
begin
	JSON := TJSONObject.Create();
	try
		res.Code := 200;
		res.ContentType := 'application/json';
		res.Content := JSON.AsJSON;
		if HighballJSONEmpty(res.Content) then
		begin
			JSON.Strings['error'] := 'Endpoint not found';
			res.Content := JSON.AsJSON;
			res.Code := 404;
		end;
		res.ContentLength := Length(res.Content);
		res.SendContent();
	finally
		JSON.Free();
	end;
end;

end.
