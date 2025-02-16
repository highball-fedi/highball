unit HighballRoute;

interface
uses
	httpdefs;

procedure HighballRouteWellKnown(req: TRequest; res: TResponse);

implementation
uses
	fpjson;

procedure HighballRouteWellKnown(req: TRequest; res: TResponse);
var
	JSON : TJSONObject;
begin
	JSON := TJSONObject.Create();
	try
		res.Content := JSON.AsJSON;
		res.Code := 200;
		res.ContentType := 'application/json';
		res.ContentLength := Length(res.Content);
		res.SendContent();
	finally
		JSON.Free();
	end;
end;

end.
