unit HighballConfig;

interface
function HighballParseConfig(ConfPath : String) : Integer;

implementation
uses
	IniFiles;

function HighballParseConfig(ConfPath : String) : Integer;
begin
	HighballParseConfig := 0;
end;

end.
