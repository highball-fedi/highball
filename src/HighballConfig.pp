unit HighballConfig;

interface
type
	THighballConfig = record
		ServerPort : Integer;
	end;

var
	HighballParsedConfig : THighballConfig = (
		ServerPort : 4000;
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

	INI.Free();
end;

function HighballCheckConfig() : Integer;
begin
	HighballCheckConfig := -1;
end;

end.
