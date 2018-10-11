# For the record:
# $@ The name of the target file (the one before the colon)
# $< The name of the first (or only) prerequisite file (the first one after the colon)
# $^ The names of all the prerequisite files (space separated)
# $* The stem (the bit which matches the % wildcard in the rule definition.

CC := g++ # clang++ # clang++ #g++ 
SHELL := /bin/bash

# what version of antlrc we want? ancient or very ancient?
ANTLRVERSION := NEW 
# version 1 or 2 for yices?
YICESVERSION := 2

# sources to compile
SOURCES := solverActionNOP.cpp 
SOURCES += coreSolverZ3.cpp encoderVisitor.cpp
SOURCES += coreSolverFileYices2.cpp coreSolverFileSMT2.cpp coreSolverFile.cpp coreSolverFileYices1.cpp coreSolverFileSimply.cpp coreSolverFileZ3Opt.cpp
SOURCES += expression.cpp solverStandard.cpp solverLinealUp.cpp solverLinealDown.cpp 
SOURCES += PDDLTreeEvaluator.cpp PDDLLexer.c PDDLParser.c PDDLProblem.cpp sym_register.cpp
SOURCES += thing.cpp functor.cpp parameter.cpp predicate.cpp function.cpp action.cpp constraint.cpp
SOURCES += undefinedVisitor.cpp firstEncodingVisitor.cpp simplifyVisitor.cpp encodingUFVisitor.cpp  encodingUFVisitorFile.cpp encodingUFVisitorZ3.cpp conditionalChainEncodingVisitor.cpp chainEncodingVisitor.cpp
SOURCES += anthelp.cpp timer.cpp main.cpp

# so it compiles in the macbook
CFLAGS += -I/usr/include/malloc/
LFLAGS += -L/opt/local/lib/

# Both versions of Yices can't live together
ifeq ($(YICESVERSION),1)
CFLAGS += -DYICES1
SOURCES += coreSolverYices1.cpp
else
CFLAGS += -DYICES2
SOURCES += coreSolverYices2.cpp 
endif

# substituted names
OBJS := $(SOURCES:.cpp=.o)
OBJS := $(OBJS:.c=.o)

# file from where we should remove the extern C
EXTERN_C_SOURCES += PDDLParser.h

# ----------------------------------------------------
###### Posem els includes depen de si som 32 o 64 bits
# ----------------------------------------------------
LFLAGS += -L.
 
ifeq ($(ANTLRVERSION),OLD)
CFLAGS += -D__FUCKING_OLD_ANTLR_VERSION__
CFLAGS += -I./libantlr3c-3.2_64b/include/
LFLAGS += -L./libantlr3c-3.2_64b/lib/
else
CFLAGS += -I./libantlr3c-3.4_64b/include/
LFLAGS += -L./libantlr3c-3.4_64b/lib/
endif

# Solvers Include Flags
CFLAGS += -I../solvers/z3/include
LFLAGS += -L../solvers/z3/lib

# What version of yices we want?
# -------------------------------------------------------------
ifeq ($(YICESVERSION),1)
CFLAGS += -I../solvers/yices-1.0.38/include
LFLAGS += -L../solvers/yices-1.0.38/lib
else
CFLAGS += -I../solvers/yices/include
LFLAGS += -L../solvers/yices/lib
endif

# --------------------------------------------------
################ All set!
# --------------------------------------------------
#
# flags varies de compilacio i linkat
CFLAGS += -fpermissive -Wall -std=c++11 
LFLAGS += -lantlr3c -lgmp -lz3 -lyices #-lcvc4 #-lmathsat 

#$(warning CFLAGS is $(CFLAGS))
all: release

release: CFLAGS += -O3
release: executable

verbose: CFLAGS += -O3 -DVERBOSE_VERSION
verbose: executable

debug: CFLAGS += -g -O0 -DVERBOSE_VERSION -DDEBUG_VERSION -fbuiltin -fstack-protector-all
debug: executable

# TODO: Make the hack a little bit prettier, as antlr generates files only for C, not C++
fora_extern_c: 
	cat $(EXTERN_C_SOURCES) | awk '/\#ifdef __cplusplus/ {print; banner=1; next} /\#endif/ {banner=0} banner {next} {print}' > temp_fora_extern_c.txt
	cp temp_fora_extern_c.txt $(EXTERN_C_SOURCES) 
	rm temp_fora_extern_c.txt

# Compile the binary by calling the compiler with cflags, lflags, and any libs (if defined) and the list of objects.
executable: $(OBJS)
	$(CC) $(OBJS) $(CFLAGS) $(INCLUDES) $(LFLAGS) -o parser

# Get a .o from a .cpp by calling compiler with cflags and includes (if defined)
.cpp.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<

.c.o:
	$(CC) $(subst -std=c++11,,$(CFLAGS)) $(INCLUDES) -c $<

clean: 
	rm -f *.o parser
