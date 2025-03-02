unit HBWebFinger;

interface
uses
	HBRoute;

type
	TRouteWebFinger = class(TRouteBase)
	protected
		procedure Job(); override;
	end;

var
	RouteWebFinger: TRouteWebFinger;

implementation
uses
	FPJSON,
	HighballConfig;

procedure TRouteWebFinger.Job();
begin
end;

end.
