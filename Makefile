# Just some script to compile stuffs easier

.PHONY: all ./build

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

clean: ./build/Makefile
	$(MAKE) -C ./build clean
