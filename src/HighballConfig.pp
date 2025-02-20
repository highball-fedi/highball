unit HighballConfig;

interface
type
	THighballConfig = record
		ServerPort : Integer;
		ServerURL : String;
		ServerName : String;
		ServerDescription : String;
		UserAllowRegister : Boolean;
	end;

var
	HighballParsedConfig : THighballConfig = (
		ServerPort : -1;
		ServerURL : '';
		ServerName : '';
		ServerDescription : '';
		UserAllowRegister : False;
	);

function HighballParseConfig(ConfPath : String) : Integer;
function HighballCheckConfig() : Integer;

implementation
uses
	IniFiles;

function HighballParseConfig(ConfPath : String) : Integer;
var
	INI : TINIFile;
begin
	HighballParseConfig := 0;
	INI := TINIFile.Create(ConfPath);

	INI.BoolTrueStrings := ['true','yes','1'];
	INI.BoolFalseStrings := ['false','no','0'];

	HighballParsedConfig.ServerPort := INI.ReadInteger('server', 'port', HighballParsedConfig.ServerPort);
	HighballParsedConfig.ServerName := INI.ReadString('server', 'name', HighballParsedConfig.ServerName);
	HighballParsedConfig.ServerDescription := INI.ReadString('server', 'description', HighballParsedConfig.ServerDescription);
	HighballParsedConfig.ServerURL := INI.ReadString('server', 'url', HighballParsedConfig.ServerURL);
	HighballParsedConfig.UserAllowRegister := INI.ReadBool('user', 'allow-register', HighballParsedConfig.UserAllowRegister);

	INI.Free();
end;

function HighballCheckConfig() : Integer;
begin
	HighballCheckConfig := -1;
	if HighballParsedConfig.ServerPort = -1 then
	begin
		WriteLn(StdErr, 'ERROR! server.port not set');
		HighballCheckConfig := 1;
	end;
	if Length(HighballParsedConfig.ServerURL) = 0 then
	begin
		WriteLn(StdErr, 'ERROR! server.url not set');
		HighballCheckConfig := 1;
	end;
	if Length(HighballParsedConfig.ServerName) = 0 then
	begin
		WriteLn(StdErr, 'ERROR! server.name not set');
		HighballCheckConfig := 1;
	end;
	if Length(HighballParsedConfig.ServerDescription) = 0 then
	begin
		WriteLn(StdErr, 'ERROR! server.description not set');
		HighballCheckConfig := 1;
	end;
end;

end.
