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
		(* DO NOT REMOVE COMMENTS!! - THEY ARE USED INTERNALLY *)
		Major : 1; (* MAJOR *)
		Minor : 0; (* MINOR *)
		Patch : 0; (* PATCH *)
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
