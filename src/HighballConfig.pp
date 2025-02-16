unit HighballConfig;

interface
type
	THighballConfig = record
		ServerPort : Integer;
		ServerDomain : String;
	end;

var
	HighballParsedConfig : THighballConfig = (
		ServerPort : 4000;
		ServerDomain : '';
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

	HighballParsedConfig.ServerPort := INI.ReadInteger('server', 'port', HighballParsedConfig.ServerPort);
	HighballParsedConfig.ServerDomain := INI.ReadString('server', 'domain', HighballParsedConfig.ServerDomain);

	INI.Free();
end;

function HighballCheckConfig() : Integer;
begin
	HighballCheckConfig := -1;
	if Length(HighballParsedConfig.ServerDomain) = 0 then
	begin
		WriteLn(StdErr, 'ERROR! server.domain not set');
		HighballCheckConfig := 1;
	end;
end;

end.
