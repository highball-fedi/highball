unit HBDefault;

interface
uses
	HBRoute;

type
	TRouteDefault = class(TRouteBase)
	protected
		procedure Job(); override;
	end;

var
	RouteDefault : TRouteDefault;

implementation
uses
	HighballConfig;

procedure TRouteDefault.Job();
begin
	DefaultProcess := False;
	RouteRes.ContentType := 'text/html';
	RouteRes.Content := '';
	RouteRes.ContentLength := Length(RouteRes.Content);
end;

end.
