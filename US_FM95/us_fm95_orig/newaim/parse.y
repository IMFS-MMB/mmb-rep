/*******************************************************************
             Parser for Aim Models: ModelEasy-like Syntax
********************************************************************/


%{

#include "header.h"

extern struct model *m;
struct node *n1;
struct node *n2;

int eqnumber = 0;
int maxlag = 0;  
int maxlead = 0; 
int varnumber = 0;
int coeffnumber = 0;

%}

%start finished

%token  MODEL
%token  EQUATION
%token  EQ
%token  EQTYPE
%token  ENDOG
%token  PROMPT

%token  _DATA
%token  _NOTD
%token  _DTRM

%token  IMPO
%token  STOC

%token  LAG
%token  ELAG
%token  LEAD

%token  END

%token 	EQUALS	

%token 	COMMA	
%token 	'('
%token 	')'

%token  POW
%token  DIV
%token  PLUS
%token  MULT
%token  MINUS 
%token  NEG

%token  <stringtype>  SYMBOLNAME
%token  <stringtype>  REAL
%token  <stringtype>  INTEGER

/* Specify operator precedence. */

%left  MINUS PLUS
%left  MULT DIV
%right POW
%left  NEG

/* Nonterminal symbols: "%type <nodetype> A B" declares the 
   nonterminals A and B as nodetype. */

%type <modeltype> finished
%type <modeltype> mdl
%type <vtypetypetype> variabletype
%type <eqtypetypetype> eqntype
%type <nodetype> expression
%type <nodetype> lagvariable
%type <nodetype> elagvariable
%type <nodetype> leadvariable
%type <nodetype> addition
%type <nodetype> subtraction
%type <nodetype> multiplication
%type <nodetype> division
%type <nodetype> exponentiation
%type <nodetype> unaryminus

%right EQUALS 
  
%union {
	char *stringtype;
	struct model *modeltype;
	enum vtypetype vtypetypetype;
	enum eqtypetype eqtypetypetype;
	struct node *nodetype;
	struct equation *equationtype;
	int inumber;
	double dnumber;
	}
%%

finished
	: mdl
		{
		m->neq = eqnumber;
		m->nlag = maxlag;
		m->nlead = maxlead;
		m->ncoeffs = coeffnumber;
		$$ = $1;
		}


mdl
	: MODEL PROMPT SYMBOLNAME ENDOG PROMPT variablelist eqnlist END
		{
		m->modelname = $3;
		$$ = m;
		}


variablelist
	: variabledef
		{ }
	| variablelist variabledef
		{ }


variabledef
	: SYMBOLNAME INTEGER variabletype
		{
		m->endog[varnumber] = $1;
		m->delay[varnumber] = atoi($2);
		m->vtype[varnumber] = $3;
		varnumber++;
		}
	| SYMBOLNAME INTEGER
		{  /* m->vtype default is DATA. */
		m->endog[varnumber] = $1;
		m->delay[varnumber] = atoi($2);
		m->vtype[varnumber] = DATA;
		varnumber++;
		}
	| SYMBOLNAME variabletype
		{  /* m->delay default is 0. */
		m->endog[varnumber] = $1;
		m->delay[varnumber] = 0;
		m->vtype[varnumber] = $2;
		varnumber++;
		}
	| SYMBOLNAME
		{  /* Handle both defaults at once. */
		m->endog[varnumber] = $1;
		m->delay[varnumber] = 0;
		m->vtype[varnumber] = DATA;
		varnumber++;
		}


variabletype
	: _DATA
		{
		$$ = DATA;
		}
	| _NOTD
		{
		$$ = NOTD;
		}
	| _DTRM
		{
		$$ = DTRM;
		}


eqnlist
	: EQUATION PROMPT SYMBOLNAME EQTYPE PROMPT eqntype 
          EQ PROMPT expression EQUALS expression
		{
		m->eqname[eqnumber] = $3;
		m->eqtype[eqnumber] = $6;
		m->eqns[eqnumber].LHS = $9;
		m->eqns[eqnumber].RHS = $11;
		eqnumber++;
		}
	| EQUATION PROMPT SYMBOLNAME EQ PROMPT expression EQUALS expression
		{   /* If omitted, EQTYPE> defaults to STOCH. */
		m->eqname[eqnumber] = $3;
		m->eqtype[eqnumber] = STOCH;
		m->eqns[eqnumber].LHS = $6;
		m->eqns[eqnumber].RHS = $8;
		eqnumber++;
		}
	| eqnlist EQUATION PROMPT SYMBOLNAME EQTYPE PROMPT eqntype 
          EQ PROMPT expression EQUALS expression
		{
		m->eqname[eqnumber] = $4;
		m->eqtype[eqnumber] = $7;
		m->eqns[eqnumber].LHS = $10;
		m->eqns[eqnumber].RHS = $12;
		eqnumber++;
		}
	| eqnlist EQUATION PROMPT SYMBOLNAME EQ PROMPT 
          expression EQUALS expression
		{   /* If omitted, EQTYPE> defaults to STOCH. */
		m->eqname[eqnumber] = $4;
		m->eqtype[eqnumber] = STOCH;
		m->eqns[eqnumber].LHS = $7;
		m->eqns[eqnumber].RHS = $9;
		eqnumber++;
		}

eqntype
	: IMPO
		{
		$$ = IMPOSED;
		}
	| STOC
		{
		$$ = STOCH;
		}

expression
	: SYMBOLNAME
		{   /* could be either variable or coefficient */
		if (find_index(m->endog, varnumber, $1) == -1)
		  {
		    if (find_index(m->cname, coeffnumber, $1) == -1)
		      m->cname[coeffnumber++] = $1;
		    $$ = create_coefficient_node($1);
		  }
		else
		  $$ = create_variable_node($1, 0, NO);
		}
	| lagvariable
		{
		$$ = $1;
		}
	| elagvariable
		{
		$$ = $1;
		}
	| leadvariable
		{
		$$ = $1;
		}
	| REAL
		{
		$$ = create_constant_node(atof($1));
		}
	| INTEGER
		{
		$$ = create_constant_node(atof($1));
		}
	| addition
		{
		$$ = $1;
		}
	| subtraction
		{
		$$ = $1;
		}
	| multiplication
		{
		$$ = $1;
		}
	| division
		{
		$$ = $1;
		}
	| exponentiation
		{
		$$ = $1;
		}
	| unaryminus
		{
		$$ = $1;
		}
	| '(' expression ')'
		{
		$$ = $2;
		}


lagvariable
	: LAG '(' SYMBOLNAME COMMA INTEGER ')'
		{
		int lagint;
		if (find_index(m->endog, varnumber, $3) == -1)
		  yyerror("First operand of LAG must be a variable.");
		lagint = atoi($5);
		if (lagint <= 0)
		  yyerror("LAG must be positive.");
		if (maxlag < lagint)
		  maxlag = lagint;
		$$ = create_variable_node($3, -1 * lagint, NO);
		}
	| LAG '(' SYMBOLNAME ')'
		{  /* The second argument to LAG defaults to 1 if omitted. */
		if (find_index(m->endog, varnumber, $3) == -1)
		  yyerror("First operand of LAG must be a variable.");
		if (maxlag < 1)
		  maxlag = 1;
		$$ = create_variable_node($3, -1, NO);
		}


elagvariable
	: ELAG '(' SYMBOLNAME COMMA INTEGER ')'
		{
		int elagint;
		if (find_index(m->endog, varnumber, $3) == -1)
		  yyerror("First operand of ELAG must be a variable.");
		elagint = atoi($5);
		if (elagint <= 0)
		  yyerror("ELAG must be positive.");
		if (maxlag < elagint)
		  maxlag = elagint;
		$$ = create_variable_node($3, -1 * elagint, YES);
		}
	| ELAG '(' SYMBOLNAME ')'
		{  /* The second argument to ELAG defaults to 1 if omitted. */
		if (find_index(m->endog, varnumber, $3) == -1)
		  yyerror("First operand of ELAG must be a variable.");
		if (maxlag < 1)
		  maxlag = 1;
		$$ = create_variable_node($3, -1, YES);
		}


leadvariable
	: LEAD '(' SYMBOLNAME COMMA INTEGER ')'
		{
		int leadint;
		if (find_index(m->endog, varnumber, $3) == -1)
		  yyerror("First operand of LEAD must be a variable.");
		leadint = atoi($5);
		if (leadint <= 0)
		  yyerror("LEAD must be positive.");
		if (maxlead < leadint)
		  maxlead = leadint;
		$$ = create_variable_node($3, leadint, NO);
		}
	| LEAD '(' SYMBOLNAME ')'
		{  /* The second argument to LEAD defaults to 1 if omitted. */
		if (find_index(m->endog, varnumber, $3) == -1)
		  yyerror("First operand of LEAD must be a variable.");
		if (maxlead < 1)
		  maxlead = 1;
		$$ = create_variable_node($3, 1, NO);
		}


addition
	: expression PLUS expression
		{
		$$ = create_sum_node($1, $3);
		}


subtraction
	: expression MINUS expression
		{
		n1 = create_constant_node(-1.0);
		n2 = create_product_node(n1, $3);
		$$ = create_sum_node($1, n2);
		}


multiplication
	: expression MULT expression
		{
		$$ = create_product_node($1, $3);
		}


division
	: expression DIV expression
		{
		n1 = create_constant_node(-1.0);
		n2 = create_power_node($3, n1);
		$$ = create_product_node($1, n2);
		}


exponentiation
	: expression POW expression
		{
		$$ = create_power_node($1, $3);
		}


unaryminus
	: MINUS expression %prec NEG
                { 
                if ($2->type == CONSTANT)
                  {
		    $$ = create_constant_node(-1.0 * $2->info.cons.value);
		    free($2);
		  }
                else
                  {
		    n1 = create_constant_node(-1.0);
		    $$ = create_product_node(n1, $2);
		  }
		}


