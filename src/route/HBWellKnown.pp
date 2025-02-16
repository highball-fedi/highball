unit HBWellKnown;

interface
uses
	HBBase;

type
	TRouteWellKnown = class(TRouteBase)
	public
		procedure Job(); override;
	end;

var
	RouteWellKnown : TRouteWellKnown;

implementation
procedure TRouteWellKnown.Job();
begin
	RouteJSON.Strings['a'] := 'a';
end;

end.
