unit HighballConfig;

interface
type
	THighballConfig = record
		ServerPort : Integer;
		ServerURL : String;
		ServerName : String;
		ServerDescription : String;
		UserAllowRegister : Boolean;
		DatabasePath : String;
		DatabaseHostname : String;
		DatabaseUsername : String;
		DatabasePassword : String;
		DatabaseDatabase : String;
	end;

var
	HighballParsedConfig : THighballConfig = (
		ServerPort : -1;
		ServerURL : '';
		ServerName : '';
		ServerDescription : '';
		UserAllowRegister : False;
		DatabasePath : '';
		DatabaseHostname : '';
		DatabaseUsername : '';
		DatabasePassword : '';
		DatabaseDatabase : '';
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
	HighballParsedConfig.DatabasePath := INI.ReadString('database', 'path', HighballParsedConfig.DatabasePath);
	HighballParsedConfig.DatabaseHostname := INI.ReadString('database', 'hostname', HighballParsedConfig.DatabaseHostname);
	HighballParsedConfig.DatabaseUsername := INI.ReadString('database', 'username', HighballParsedConfig.DatabaseUsername);
	HighballParsedConfig.DatabasePassword := INI.ReadString('database', 'password', HighballParsedConfig.DatabasePassword);
	HighballParsedConfig.DatabaseDatabase := INI.ReadString('database', 'database', HighballParsedConfig.DatabaseDatabase);

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
{$if defined(SQLITE)}
	if Length(HighballParsedConfig.DatabasePath) = 0 then
	begin
		WriteLn(StdErr, 'ERROR! database.path not set');
		HighballCheckConfig := 1;
	end;
{$elseif defined(POSTGRES)}
	if Length(HighballParsedConfig.DatabaseHostname) = 0 then
	begin
		WriteLn(StdErr, 'ERROR! database.hostname not set');
		HighballCheckConfig := 1;
	end;
	if Length(HighballParsedConfig.DatabaseUsername) = 0 then
	begin
		WriteLn(StdErr, 'ERROR! database.username not set');
		HighballCheckConfig := 1;
	end;
	if Length(HighballParsedConfig.DatabasePassword) = 0 then
	begin
		WriteLn(StdErr, 'ERROR! database.password not set');
		HighballCheckConfig := 1;
	end;
	if Length(HighballParsedConfig.DatabaseDatabase) = 0 then
	begin
		WriteLn(StdErr, 'ERROR! database.database not set');
		HighballCheckConfig := 1;
	end;
{$endif}
end;

end.
