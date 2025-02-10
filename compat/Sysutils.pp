unit Sysutils;

interface
function IntToStr(Number : Integer) : String;

implementation
function IntToStr(Number : Integer) : String;
const
	NumToStr : String = '0123456789';
var
	RetThis : String;
begin
	RetThis := '';
	repeat
		RetThis := RetThis + copy(NumToStr, (Number mod 10) + 1, (Number mod 10) + 1);
		Number := Number / 10;
	until Number = 0;
	IntToStr := RetThis;
end;

end.
