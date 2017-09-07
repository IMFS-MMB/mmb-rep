####                                                             ####
####     Hello. Welcome to the official Aim  parser makefile.    ####
####                                                             ####


CC = gcc	

DEBUG = -g

OPTS = 

INCL = -Ic:\\RSMA\\Cygwin\\usr\\i686-cygwin\\include\\mingw32\\

LIB = -Lc:\\RSMA\\Cygwin\\usr\\i686-cygwin\\lib -lm -lfl -lcrtdll

SRC = main.c

ALLSRC = copy_subtree.c count_variables.c create_node.c error.c error_check.c \
	expand_subtree.c find_index.c find_variable.c initialize_model.c \
	print_equation.c print_functions.c print_g_matrix_entries.c \
	print_h_matrix_entries.c print_subtree.c print_term.c lex.yy.c \
	y.tab.c

MATLABOBJ = copy_subtree.o count_variables.o create_node.o error.o \
	error_check.o expand_subtree.o find_index.o find_variable.o \
	initialize_model.o print_equation.o print_functions.o \
	print_g_matrix_entries.o print_h_matrix_entries.o print_subtree.o \
	print_term.o lex.yy.o y.tab.o

SPLUSOBJ = copy_subtree.o count_variables.o create_node.o error.o \
	error_check.o expand_subtree.o find_index.o find_variable.o \
	initialize_model.o print_equation.o print_functions_splus.o \
	print_g_matrix_entries_splus.o print_h_matrix_entries_splus.o \
	print_subtree.o print_term.o lex.yy.o y.tab.o

all: matlab

matlab: header.h $(MATLABOBJ) $(SRC)
	$(CC) -o mdlez-aim $(DEBUG) $(OPTS) $(INCL) \
	$(MATLABOBJ) $(SRC) $(LIB)

splus: header.h $(SPLUSOBJ) $(SRC)
	$(CC) -o mdlez-aim_s $(DEBUG) $(OPTS) $(INCL) \
	$(SPLUSOBJ) $(SRC) $(LIB)

pure: header.h $(MATLABOBJ) $(SRC)
	$(CC) -o mdlez-aim $(DEBUG) $(OPTS) $(INCL) \
	$(MATLABOBJ) $(SRC) $(LIB)

copy_subtree.o: header.h copy_subtree.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) copy_subtree.c

count_variables.o: header.h count_variables.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) count_variables.c

create_node.o: header.h create_node.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) create_node.c

error.o: header.h error.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) error.c

error_check.o: header.h error_check.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) error_check.c

expand_subtree.o: header.h expand_subtree.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) expand_subtree.c

find_variable.o: header.h find_variable.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) find_variable.c

find_index.o: header.h find_index.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) find_index.c

initialize_model.o: header.h initialize_model.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) initialize_model.c

print_equation.o: header.h print_equation.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) print_equation.c

print_functions.o: header.h print_functions.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) print_functions.c

print_functions_splus.o: header.h print_functions_splus.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) print_functions_splus.c

print_g_matrix_entries.o: header.h print_g_matrix_entries.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) print_g_matrix_entries.c

print_g_matrix_entries_splus.o: header.h print_g_matrix_entries_splus.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) print_g_matrix_entries_splus.c

print_h_matrix_entries.o: header.h print_h_matrix_entries.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) print_h_matrix_entries.c

print_h_matrix_entries_splus.o: header.h print_h_matrix_entries_splus.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) print_h_matrix_entries_splus.c

print_subtree.o: header.h print_subtree.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) print_subtree.c

print_term.o: header.h print_term.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) print_term.c

y.tab.o: lex.yy.c y.tab.c
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) y.tab.c

lex.yy.c: tokens.l header.h
	flex -v tokens.l

lex.yy.o: lex.yy.c y.tab.h
	$(CC) -c $(DEBUG) $(OPTS) $(INCL) lex.yy.c

y.tab.c: parse.y lex.yy.c header.h
	bison -vd parse.y

y.tab.h: parse.y lex.yy.c header.h
	bison -vd parse.y

testprog: caller.c test.c
	gcc -o testprog $(OPTS) $(INCL) caller.c test.c $(LIBS)

lint: $(SRC) $(ALLSRC)
	lint $(SRC) $(ALLSRC)

clean:
	rm *.o
	rm y.tab.c
	rm y.tab.h
	rm lex.yy.c
	rm mdlez-aim
	rm mdlez-aim_s



