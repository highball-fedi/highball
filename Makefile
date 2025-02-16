# Just some script to compile stuffs easier

PASC ?= fpc

DESTDIR ?=
PREFIX ?= /usr/local

CC ?= cc
CFLAGS ?=
LDFLAGS ?=

.PHONY: all install get-version ./build

all: ./build

install: all
	$(MAKE) -C ./build install

./build: ./build/Makefile
	$(MAKE) -C ./build

./build/Makefile: Makefile compgen
	mkdir -p ./build
	echo "unit HighballPathnames;" > HighballPathnames.pp
	echo "interface" >> HighballPathnames.pp
	echo "const" >> HighballPathnames.pp
	echo "	HBPREFIX = '$(PREFIX)';" >> HighballPathnames.pp
	echo 'implementation' >> HighballPathnames.pp
	echo 'end.' >> HighballPathnames.pp
	echo ".PHONY: all install clean" > $@
	echo "all: ./highball$(EXEC)" >> $@
	PREFIX="$(PREFIX)" CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" PC="$(PASC)" FPARGS="$(FPARGS)" EXEC="$(EXEC)" ./compgen >> $@
	echo "install: all" >> $@
	echo "	cp ./highball$(EXEC) $(DESTDIR)$(PREFIX)/bin/" >> $@
	echo "clean:" >> $@
	echo "	-rm -f * ../HighballPathnames.pp" >> $@

get-version:
	@echo `grep '(\* MAJOR \*)' src/HighballVersion.pp | sed 's/.*Major : //g' | sed 's/;.*//g'`.`grep '(\* MINOR \*)' src/HighballVersion.pp | sed 's/.*Minor : //g' | sed 's/;.*//g'`.`grep '(\* PATCH \*)' src/HighballVersion.pp | sed 's/.*Patch : //g' | sed 's/;.*//g'` | tr -d '\\r\\n'

clean: ./build/Makefile
	$(MAKE) -C ./build clean
