unit HBNodeinfo;

interface
uses
	HBBase;

type
	TRouteNodeinfo = class(TRouteBase)
	protected
		procedure Job(); override;
	end;

var
	RouteNodeinfo : TRouteNodeinfo;

implementation
uses
	HighballConfig;

procedure TRouteNodeinfo.Job();
var
	EPName : String;
begin
	EPName := RouteReq.RouteParams['name'];
	if (EPName = '2.0') or (EPName = '2.1') then
	begin
		RouteJSON.Strings['version'] := EPName;
	end
	else
	begin
		RouteRes.Code := 404;
		RouteJSON.Strings['error'] := 'Version not handled';
	end
end;

end.
