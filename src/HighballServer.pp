unit HighballServer;

interface
function HighballServerStart : Integer;

implementation
uses
	fphttpapp,
	httpdefs,
	httproute;

function HighballServerStart : Integer;
begin
	HighballServerStart := 0;
end;

end.
