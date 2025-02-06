unit HighballVersion;

interface
type
	THighballVersion = record
		Major : Integer;
		Minor : Integer;
		Patch : Integer;
	end;

const
	HighballVersionRaw : THighballVersion = (
		Major : 1;
		Minor : 0;
		Patch : 0;
	);

function HighballGetVersion() : String;

implementation
uses
	Sysutils;

function HighballGetVersion() : String;
begin
	HighballGetVersion :=	  IntToStr(HighballVersionRaw.Major) + '.'
				+ IntToStr(HighballVersionRaw.Minor) + '.'
				+ IntToStr(HighballVersionRaw.Patch) + '.';
end;

end.
