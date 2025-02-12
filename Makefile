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
	echo ".PHONY: all install clean" > $@
	echo "all: ./highball$(EXEC)" >> $@
	CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" PC="$(PASC)" FPARGS="$(FPARGS)" EXEC="$(EXEC)" ./compgen >> $@
	echo "install: all" >> $@
	echo "	cp ./highball$(EXEC) $(DESTDIR)$(PREFIX)/bin/" >> $@
	echo "clean:" >> $@
	echo "	-rm -f *" >> $@

get-version:
	@echo `grep '(\* MAJOR \*)' src/HighballVersion.pp | sed 's/.*Major : //g' | sed 's/;.*//g'`.`grep '(\* MINOR \*)' src/HighballVersion.pp | sed 's/.*Minor : //g' | sed 's/;.*//g'`.`grep '(\* PATCH \*)' src/HighballVersion.pp | sed 's/.*Patch : //g' | sed 's/;.*//g'` | tr -d '\\r\\n'

clean: ./build/Makefile
	$(MAKE) -C ./build clean
