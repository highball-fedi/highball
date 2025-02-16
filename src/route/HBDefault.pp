unit HBDefault;

interface
uses
	HBBase;

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
	RouteRes.Content := 'aa';
	RouteRes.ContentLength := Length(RouteRes.Content);
end;

end.
