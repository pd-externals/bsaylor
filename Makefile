# Makefile to build library 'bsaylor' for Pure Data.
# Needs Makefile.pdlibbuilder as helper makefile for platform-dependent build
# settings and rules.
#
# use : make pdincludepath=/path/to/pure-data/src/
#
# The following command will build the external and install the distributable 
# files into a subdirectory called build/bsaylor :
#
# make install pdincludepath=../pure-data/src/ objectsdir=./build

lib.name = bsaylor

# link statically
FFTW3_CFLAGS =
FFTW3_LIBS = -l:libfftw3.a
FFTW3F_CFLAGS =
FFTW3F_LIBS = -l:libfftw3f.a

objects = aenv~ partconv~ pvoc~ susloop~ svf~ zhzxh~

pvoc~.class.ldlibs = $(FFTW3_LIBS)
partconv~.class.ldlibs = $(FFTW3F_LIBS)

class.sources = $(addsuffix .c,$(objects))

# all extra files to be included in binary distribution of the library
datafiles = $(addsuffix -help.pd,$(objects)) LICENSE.txt README.txt
datadirs = examples

cflags += -Wno-unused -Wno-unused-parameter $(FFTW3_CFLAGS) $(FFTW3F_CFLAGS)

# include Makefile.pdlibbuilder from submodule directory 'pd-lib-builder'
PDLIBBUILDER_DIR=pd-lib-builder/
include $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder
