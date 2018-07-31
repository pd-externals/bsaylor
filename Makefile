# Makefile to build library 'mlib' for Pure Data.
# Needs Makefile.pdlibbuilder as helper makefile for platform-dependent build
# settings and rules.
#
# use : make pdincludepath=/path/to/pure-data/src/
#
# The following command will build the external and install the distributable 
# files into a subdirectory called build/moonlib :
#
# make install pdincludepath=../pure-data/src/ objectsdir=./build

lib.name = bsaylor

objects = aenv~ partconv~ pvoc~ susloop~ svf~ zhzxh~

# link statically
partconv~.class.ldlibs = -l:libfftw3f.a
pvoc~.class.ldlibs = -l:libfftw3.a

class.sources = $(addsuffix .c,$(objects))

# all extra files to be included in binary distribution of the library
datafiles = $(addsuffix -help.pd,$(objects)) LICENSE.txt README.txt
datadirs = examples

cflags = -Wno-unused -Wno-unused-parameter 

include pd-lib-builder/Makefile.pdlibbuilder
