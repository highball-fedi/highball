program fpmake;

uses
	fpmkunit;

var
	P: TPackage;
	T: TTarget;

begin
	with Installer do
	begin
		Run;
	end;
end.
