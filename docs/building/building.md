# Building the source code

## Requirements
1. [Free Pascal](https://freepascal.org)
2. POSIX environment, following platforms are checked working[^1]:
    1. NetBSD/amd64
    2. Debian GNU/Linux 12
3. [PostgreSQL](https://www.postgresql.org) or [SQLite](https://www.sqlite.org)

## Building steps
1. Clone the [repository](https://github.com/highball-fedi/highball)[^2].
2. Copy `./default/config` to `config`.
3. Adjust `config` if needed[^3].
4. Run `make`.

[^1]: Might work on [Cygwin](https://www.cygwin.com)/[MSYS2](https://www.msys2.org)/[w64devkit](https://github.com/skeeto/w64devkit).
[^2]: There might be an another repository like mirror/fork, but we recommend this one.
[^3]: See [Adjusting compile-time config](../config).
