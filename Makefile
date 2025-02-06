# Just some script to compile stuffs easier

.PHONY: all ./build

all: ./build

./build: ./build/Makefile
	$(MAKE) -C ./build

./build/Makefile: Makefile
	mkdir -p ./build
	echo ".PHONY: all clean"		> $@
	echo "all: ./highball"			>> $@
	echo "./highball: ../src/*.pp"		>> $@
	echo "	fpc -FE. ../src/highball.pp"	>> $@
	echo "clean:"				>> $@
	echo "	-rm -f *"			>> $@

clean: ./build/Makefile
	$(MAKE) -C ./build clean
