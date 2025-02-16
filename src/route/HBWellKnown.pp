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
procedure TRouteWellKnown.Job();
begin
end;

end.
