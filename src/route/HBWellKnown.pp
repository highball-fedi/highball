unit HBWellKnown;

interface
uses
	HBBase;

type
	TRouteWellKnown = class(TRouteBase)
	protected
		procedure Job(); override;
	end;

var
	RouteWellKnown : TRouteWellKnown;

implementation
uses
	FPJSON;

procedure TRouteWellKnown.Job();
var
	EPName : String;
begin
	EPName := RouteReq.RouteParams['name'];
	if EPName = 'nodeinfo' then
	begin
		RouteJSON.Arrays['links'] := TJSONArray.Create();
		RouteJSON.Arrays['links'].Add(TJSONObject.Create());
		RouteJSON.Arrays['links'].Objects[0].Strings['rel'] := 'http://nodeinfo.diaspora.software/ns/schema/2.1';
	end;
end;

end.
