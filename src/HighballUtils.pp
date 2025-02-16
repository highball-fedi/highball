unit HighballUtils;

interface
function HighballIsArg(Argument : String; ExpShort : String; ExpLong : String) : Boolean;
function HighballHasArgPrefix(Argument : String) : Boolean;
function HighballJSONEmpty(JSON : String) : Boolean;

implementation
uses
	Sysutils;

function HighballIsArg(Argument: String; ExpShort: String; ExpLong: String) : Boolean;
begin
	HighballIsArg := (('-' + ExpShort) = Argument) or (('--' + ExpLong) = Argument);
end;

function HighballHasArgPrefix(Argument: String) : Boolean;
begin
	HighballHasArgPrefix := False;
	if Length(Argument) > 0 then begin
		if Argument[1] = '-' then begin
			HighballHasArgPrefix := True;
		end;
	end;
end;

function HighballJSONEmpty(JSON : String) : Boolean;
begin
	HighballJSONEmpty := Length(Trim(JSON)) = 2;
end;

end.
