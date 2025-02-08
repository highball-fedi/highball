unit HighballUtils;

interface
function HighballIsArg(Argument: String; ExpShort: String; ExpLong: String) : Boolean;
function HighballHasArgPrefix(Argument: String) : Boolean;

implementation
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

end.
