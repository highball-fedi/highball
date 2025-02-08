# Just some script to compile stuffs easier

.PHONY: all get-version ./build

all: ./build

./build: ./build/Makefile
	$(MAKE) -C ./build

./build/Makefile: Makefile
	mkdir -p ./build
	echo ".PHONY: all clean"			> $@
	echo "all: ./highball$(EXEC)"			>> $@
	echo "./highball$(EXEC): ../src/*.pp"		>> $@
	echo "	fpc $(FPARGS) -FE. ../src/highball.pp"	>> $@
	echo "clean:"					>> $@
	echo "	-rm -f *"				>> $@

get-version:
	@echo `grep '(\* MAJOR \*)' src/HighballVersion.pp | sed 's/.*Major : //g' | sed 's/;.*//g'`.`grep '(\* MINOR \*)' src/HighballVersion.pp | sed 's/.*Minor : //g' | sed 's/;.*//g'`.`grep '(\* PATCH \*)' src/HighballVersion.pp | sed 's/.*Patch : //g' | sed 's/;.*//g'` | tr -d '\\r\\n'

clean: ./build/Makefile
	$(MAKE) -C ./build clean
