# Contribution guide

Just follow these coding styles (for now).

## Filename

Use unit name as the filename, e.g.

```pascal
unit foobar;

interface

implementation

end.
```

File containing above code should be named `foobar.pp`.

## Directory layout

Put class files in [./src/class/](./src/class/), and and specifically routing class files in [./src/route/](./src/route/).

## Class

Class files should be called `HB[class name here].pp`.

## Routing

Routing class files should be called as same as normal class files, e.g.

```pascal
unit HBFoobar;

interface
uses
	HBRoute;

type
	TRouteFoobar = class(TRouteBase)
	protected
		procedure Job(); override;
	end;

var
	RouteFoobar: TRouteFoobar;

implementation
procedure TRouteFoobar.Job();
begin
	// Do stuffs here
end;

end.
```

File containing above code should be named `HBFoobar.pp`, in directory [./src/route/](./src/route/).

Initializing routing rules and registering them should be done in [./src/HighballServer.pp](./src/HighballServer.pp).

## Declaration/Argument

They should be always `Name: Type`.

## Procedure/Function

Always put `(` and `)`, even if they don't take any arguments.

## ifdef/elseif/endif

Do not use indent for them, simply put them in the beginning of the line.

## Misc

Put a blank line between them like:

```pascal
unit foobar;

interface
uses
	HBDatabase;

procedure DoSomething();
procedure DoSomething2();

implementation
uses
	FPJSON;

procedure DoSomething();
begin
	// Do something...
end;

procedure DoSomething2();
begin
	// Do something...
end;

end.
```

TODO: write more
