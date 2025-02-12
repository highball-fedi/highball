unit HighballConfig;

interface
function HighballParseConfig(ConfPath : String) : Integer;

implementation
uses
	IniFiles;

function HighballParseConfig(ConfPath : String) : Integer;
var
	INI : TINIFile;
begin
	HighballParseConfig := 0;
	INI := TINIFile.Create(ConfPath);
	INI.Free();
end;

end.
