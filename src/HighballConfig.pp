unit HighballConfig;

interface
type
	THighballConfig = record
		ServerPort : Integer;
		ServerURL : String;
	end;

var
	HighballParsedConfig : THighballConfig = (
		ServerPort : 4000;
		ServerURL : '';
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
	HighballParsedConfig.ServerURL := INI.ReadString('server', 'url', HighballParsedConfig.ServerURL);

	INI.Free();
end;

function HighballCheckConfig() : Integer;
begin
	HighballCheckConfig := -1;
	if Length(HighballParsedConfig.ServerURL) = 0 then
	begin
		WriteLn(StdErr, 'ERROR! server.url not set');
		HighballCheckConfig := 1;
	end;
end;

end.
