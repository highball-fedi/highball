unit HBNodeinfo;

interface
uses
	HBRoute;

type
	TRouteNodeinfo = class(TRouteBase)
	protected
		procedure Job(); override;
	end;

var
	RouteNodeinfo: TRouteNodeinfo;

implementation
uses
	FPJSON,
	HighballConfig,
	HighballVersion;

procedure TRouteNodeinfo.Job();
var
	EPName: String;
begin
	EPName := RouteReq.RouteParams['name'];
	if (EPName = '2.0') or (EPName = '2.1') then
	begin
		RouteJSON.Booleans['openRegistrations'] := HighballParsedConfig.UserAllowRegister;

		RouteJSON.Strings['version'] := EPName;

		RouteJSON.Arrays['protocols'] := TJSONArray.Create();
		RouteJSON.Arrays['protocols'].Add('activitypub');

		RouteJSON.Objects['software'] := TJSONObject.Create();
		RouteJSON.Objects['software'].Strings['name'] := 'highball';
		RouteJSON.Objects['software'].Strings['version'] := HighballGetVersion();
		if EPNAME = '2.1' then
		begin
			RouteJSON.Objects['software'].Strings['repository'] := 'https://github.com/highball-fedi/highball';
		end;

		RouteJSON.Objects['services'] := TJSONObject.Create();
		RouteJSON.Objects['services'].Arrays['inbound'] := TJSONArray.Create();
		RouteJSON.Objects['services'].Arrays['outbound'] := TJSONArray.Create();

		RouteJSON.Objects['metadata'] := TJSONObject.Create();
		RouteJSON.Objects['metadata'].Strings['nodeName'] := HighballParsedConfig.ServerName;
		RouteJSON.Objects['metadata'].Strings['nodeDescription'] := HighballParsedConfig.ServerDescription;

		RouteJSON.Objects['usage'] := TJSONObject.Create();
		// TODO: Return usage.localPosts
		RouteJSON.Objects['usage'].Objects['users'] := TJSONObject.Create();
		// TODO: Return usage.users.total
	end
	else
	begin
		RouteRes.Code := 404;
		RouteJSON.Strings['error'] := 'Version not handled';
	end
end;

end.
