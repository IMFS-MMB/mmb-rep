/*********************************************************************
 This is the header file for the Aim MatLab parser.
 It contains the following:
      #includes
      #defines
      enum definitions
      other type definitions
      function declarations
**********************************************************************/

#ifndef HEADER_H
#define HEADER_H

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <ctype.h>

#define MAX_EQUATIONS 1000
#define MAX_COEFFICIENTS 1100
#define DEBUG (1)


/*********************  ENUM DEFINITIONS  **********************/

enum errorcode { WRONG_NODE_TYPE, INVALID_NODE_TYPE,
		 CANNOT_ALLOCATE_MEMORY };

enum eqtypetype { STOCH = 0, IMPOSED = 1 };

enum vtypetype { DATA = 0, NOTD = 1, DTRM = 2 };

enum yesornotype { NO, YES };

enum sidetype { LEFT_SIDE, RIGHT_SIDE };

enum matrixtype { G_MATRIX, H_MATRIX };

enum nodetype { CONSTANT, COEFFICIENT, VARIABLE, SUM, PRODUCT, 
		  POWER };


/*****************  OTHER TYPE DEFINITIONS  ********************/


struct consinfo {   /* used in nodes with type = CONSTANT     */
  double value;
};

struct coeffinfo {   /* used in nodes with type = COEFFICIENT  */
  char *name;
  int coeffnum;
};

struct varinfo {     /* used in nodes with type = VARIABLE     */
  char *name;
  int period;
  enum yesornotype elag;
  int varnum;
};

struct suminfo {     /* used in nodes with type = SUM          */
  struct node *summand1;
  struct node *summand2;
};

struct prodinfo {    /* used in nodes with type = PRODUCT      */
  struct node *multiplicand1;
  struct node *multiplicand2;
};

struct powerinfo {   /* used in nodes with type = POWER        */
  struct node *base;
  struct node *exponent;
};


struct node {
  enum nodetype type;
  union {
    struct consinfo cons;
    struct coeffinfo coeff;
    struct varinfo var;
    struct suminfo sum;
    struct prodinfo prod;
    struct powerinfo power;
  } info;
};


struct equation {
  struct node *LHS;        /* node tree of lhs of equation */
  struct node *RHS;        /* node tree of rhs of equation */
};


struct model {
  char *endog[MAX_EQUATIONS];             /* endogenous variable names  */
  int delay[MAX_EQUATIONS];               /* delay values               */
  enum vtypetype vtype[MAX_EQUATIONS];    /* DATA, NOTD, or DTRM        */
  int neq;                                /* number of equations        */
  int nlag;                               /* maximum lag in model       */
  int nlead;                              /* maximum lead in model      */
  enum eqtypetype eqtype[MAX_EQUATIONS];  /* STOCH or IMPOSED           */
  char *eqname[MAX_EQUATIONS];            /* array of equation names    */
  struct equation eqns[MAX_EQUATIONS];    /* array of equation trees    */
  char *modelname;                        /* name of model              */
  int ncoeffs;                            /* number of coefficients     */
  char *cname[MAX_COEFFICIENTS];          /* coefficient names          */
};  



/******************** FUNCTION DECLARATIONS *********************/

struct node *copy_subtree();    /* returns copy of subtree rooted at 
				   argument node */
int count_variables();          /* counts variables in subtree rooted 
				   at argument node */

/** each create_*_node creates a new * node and returns a ptr to it **/

struct node *create_constant_node();
struct node *create_coefficient_node();
struct node *create_variable_node();
struct node *create_sum_node();
struct node *create_product_node();
struct node *create_power_node();

void error();                   /* prints error messages */
int error_check();              /* checks eqn trees for errors */
struct node *expand_subtree();  /* expands eqn into sum of prods */
int find_index();               /* returns index of array element that 
				   matches string */
struct node *find_variable();   /* returns 1st var node found */
void initialize_model();        /* does what it says */
int power_error_check();        /* checks eqn trees for errors in POWER 
				   nodes */
int product_error_check();      /* checks eqn trees for errors in products */
void print_equation();          /* prints given equation */
void print_function();          /* prints c function as output */
void print_g_matrix_entries();  /* prints g matrix entries */
void print_h_matrix_entries();  /* prints h matrix entries */
void print_subtree();           /* prints subtree rooted at argument node */
void print_term();              /* prints subtree in C code but prints 
				   variables as 1's */
int str_lower();

void yyerror();                 /* Error routine for yacc. */
#endif


