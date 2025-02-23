unit HighballDatabase;

interface
procedure HighballDatabaseInit();

implementation
uses
	HBDatabase;

procedure HighballDatabaseInit();
var
	DB : THighballDB;
begin
	DB := THighballDB.Create();
	DB.ExecuteDirect('CREATE TABLE IF NOT EXISTS users(username text, password text, created_at bigint, updated_at bigint, admin boolean)');
	DB.Free();
end;

end.
