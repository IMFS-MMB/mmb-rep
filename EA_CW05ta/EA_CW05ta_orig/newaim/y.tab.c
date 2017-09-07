
# line 7 "parse.y"

#include "header.h"

extern struct model *m;
struct node *n1;
struct node *n2;

int eqnumber = 0;
int maxlag = 0;  
int maxlead = 0; 
int varnumber = 0;
int coeffnumber = 0;


# line 88 "parse.y"
typedef union
#ifdef __cplusplus
	YYSTYPE
#endif
 {
	char *stringtype;
	struct model *modeltype;
	enum vtypetype vtypetypetype;
	enum eqtypetype eqtypetypetype;
	struct node *nodetype;
	struct equation *equationtype;
	int inumber;
	double dnumber;
	} YYSTYPE;
# define MODEL 257
# define EQUATION 258
# define EQ 259
# define EQTYPE 260
# define ENDOG 261
# define PROMPT 262
# define _DATA 263
# define _NOTD 264
# define _DTRM 265
# define IMPO 266
# define STOC 267
# define LAG 268
# define ELAG 269
# define LEAD 270
# define END 271
# define EQUALS 272
# define COMMA 273
# define POW 274
# define DIV 275
# define PLUS 276
# define MULT 277
# define MINUS 278
# define NEG 279
# define SYMBOLNAME 280
# define REAL 281
# define INTEGER 282

#ifdef __STDC__
#include <stdlib.h>
#include <string.h>
#else
#include <malloc.h>
#include <memory.h>
#endif

#include <values.h>

#ifdef __cplusplus

#ifndef yyerror
	void yyerror(const char *);
#endif

#ifndef yylex
#ifdef __EXTERN_C__
	extern "C" { int yylex(void); }
#else
	int yylex(void);
#endif
#endif
	int yyparse(void);

#endif
#define yyclearin yychar = -1
#define yyerrok yyerrflag = 0
extern int yychar;
extern int yyerrflag;
YYSTYPE yylval;
YYSTYPE yyval;
typedef int yytabelem;
#ifndef YYMAXDEPTH
#define YYMAXDEPTH 150
#endif
#if YYMAXDEPTH > 0
int yy_yys[YYMAXDEPTH], *yys = yy_yys;
YYSTYPE yy_yyv[YYMAXDEPTH], *yyv = yy_yyv;
#else	/* user does initial allocation */
int *yys;
YYSTYPE *yyv;
#endif
static int yymaxdepth = YYMAXDEPTH;
# define YYERRCODE 256
static const yytabelem yyexca[] ={
-1, 1,
	0, -1,
	-2, 0,
	};
# define YYNPROD 43
# define YYLAST 284
static const yytabelem yyact[]={

    50,    16,    17,    18,    96,    95,    63,    62,    59,    61,
    60,    92,    78,    63,    62,    59,    61,    60,    94,    70,
    14,    63,    62,    59,    61,    60,    58,    93,    63,    62,
    59,    61,    60,    63,    62,    59,    61,    60,    13,    90,
    81,    80,    79,    25,    24,    10,     5,    63,    62,    88,
    61,    86,    63,    20,    35,    36,    16,    17,    18,    82,
    10,    71,    33,    32,    31,    30,    19,    23,    21,     7,
     4,    29,    28,    27,    26,    69,     6,    57,     3,    37,
   100,    99,    98,    67,    66,    65,    34,    15,     9,    11,
     8,    49,    48,    47,    46,    45,    44,    12,    41,    40,
    39,     2,    22,     1,     0,     0,     0,     0,     0,     0,
     0,     0,     0,    56,     0,     0,     0,     0,     0,    55,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    64,     0,     0,     0,    68,     0,     0,     0,    72,    73,
    74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
    83,    84,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,    91,     0,     0,     0,     0,     0,     0,     0,
     0,     0,    97,     0,     0,     0,   101,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,    51,    52,
    53,     0,     0,     0,     0,     0,     0,     0,    54,     0,
    38,    42,    43,     0,     0,    63,    62,    59,    61,    60,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,    89,     0,     0,     0,     0,     0,     0,     0,     0,
     0,    87,     0,    85 };
static const yytabelem yypact[]={

  -179,-10000000,-10000000,  -192,  -234,  -185,  -193,  -235,  -220,-10000000,
  -262,  -205,-10000000,  -194,  -207,-10000000,-10000000,-10000000,-10000000,-10000000,
  -195,  -236,-10000000,  -237,  -186,  -188,  -197,  -198,  -199,  -200,
  -212,   -40,  -212,   -40,  -182,-10000000,-10000000,  -246,-10000000,-10000000,
-10000000,-10000000,-10000000,-10000000,-10000000,-10000000,-10000000,-10000000,-10000000,-10000000,
   -40,    45,    44,    43,   -40,  -184,  -253,  -201,   -40,   -40,
   -40,   -40,   -40,   -40,   -29,  -238,  -239,  -240,-10000000,  -203,
   -40,   -40,  -241,  -227,  -227,  -222,  -222,  -222,-10000000,    10,
     8,    -2,   -40,  -241,  -261,  -255,-10000000,  -264,-10000000,  -277,
-10000000,  -268,   -40,    41,    40,    39,   -40,  -241,-10000000,-10000000,
-10000000,  -241 };
static const yytabelem yypgo[]={

     0,   103,   101,    87,    86,    79,   100,    99,    98,    96,
    95,    94,    93,    92,    91,    90,    89,    88 };
static const yytabelem yyr1[]={

     0,     1,     2,    15,    15,    17,    17,    17,    17,     3,
     3,     3,    16,    16,    16,    16,     4,     4,     5,     5,
     5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
     5,     6,     6,     7,     7,     8,     8,     9,    10,    11,
    12,    13,    14 };
static const yytabelem yyr2[]={

     0,     3,    17,     3,     5,     7,     5,     5,     3,     3,
     3,     3,    23,    17,    25,    19,     3,     3,     3,     3,
     3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
     7,    13,     9,    13,     9,    13,     9,     7,     7,     7,
     7,     7,     5 };
static const yytabelem yychk[]={

-10000000,    -1,    -2,   257,   262,   280,   261,   262,   -15,   -17,
   280,   -16,   -17,   258,   282,    -3,   263,   264,   265,   271,
   258,   262,    -3,   262,   280,   280,   260,   259,   260,   259,
   262,   262,   262,   262,    -4,   266,   267,    -5,   280,    -6,
    -7,    -8,   281,   282,    -9,   -10,   -11,   -12,   -13,   -14,
    40,   268,   269,   270,   278,    -4,    -5,   259,   272,   276,
   278,   277,   275,   274,    -5,    40,    40,    40,    -5,   259,
   272,   262,    -5,    -5,    -5,    -5,    -5,    -5,    41,   280,
   280,   280,   262,    -5,    -5,   273,    41,   273,    41,   273,
    41,    -5,   272,   282,   282,   282,   272,    -5,    41,    41,
    41,    -5 };
static const yytabelem yydef[]={

     0,    -2,     1,     0,     0,     0,     0,     0,     0,     3,
     8,     0,     4,     0,     6,     7,     9,    10,    11,     2,
     0,     0,     5,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,    16,    17,     0,    18,    19,
    20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,    42,     0,
     0,     0,    13,    37,    38,    39,    40,    41,    30,     0,
     0,     0,     0,    15,     0,     0,    32,     0,    34,     0,
    36,     0,     0,     0,     0,     0,     0,    12,    31,    33,
    35,    14 };
typedef struct
#ifdef __cplusplus
	yytoktype
#endif
{ char *t_name; int t_val; } yytoktype;
#ifndef YYDEBUG
#	define YYDEBUG	0	/* don't allow debugging */
#endif

#if YYDEBUG

yytoktype yytoks[] =
{
	"MODEL",	257,
	"EQUATION",	258,
	"EQ",	259,
	"EQTYPE",	260,
	"ENDOG",	261,
	"PROMPT",	262,
	"_DATA",	263,
	"_NOTD",	264,
	"_DTRM",	265,
	"IMPO",	266,
	"STOC",	267,
	"LAG",	268,
	"ELAG",	269,
	"LEAD",	270,
	"END",	271,
	"EQUALS",	272,
	"COMMA",	273,
	"(",	40,
	")",	41,
	"POW",	274,
	"DIV",	275,
	"PLUS",	276,
	"MULT",	277,
	"MINUS",	278,
	"NEG",	279,
	"SYMBOLNAME",	280,
	"REAL",	281,
	"INTEGER",	282,
	"-unknown-",	-1	/* ends search */
};

char * yyreds[] =
{
	"-no such reduction-",
	"finished : mdl",
	"mdl : MODEL PROMPT SYMBOLNAME ENDOG PROMPT variablelist eqnlist END",
	"variablelist : variabledef",
	"variablelist : variablelist variabledef",
	"variabledef : SYMBOLNAME INTEGER variabletype",
	"variabledef : SYMBOLNAME INTEGER",
	"variabledef : SYMBOLNAME variabletype",
	"variabledef : SYMBOLNAME",
	"variabletype : _DATA",
	"variabletype : _NOTD",
	"variabletype : _DTRM",
	"eqnlist : EQUATION PROMPT SYMBOLNAME EQTYPE PROMPT eqntype EQ PROMPT expression EQUALS expression",
	"eqnlist : EQUATION PROMPT SYMBOLNAME EQ PROMPT expression EQUALS expression",
	"eqnlist : eqnlist EQUATION PROMPT SYMBOLNAME EQTYPE PROMPT eqntype EQ PROMPT expression EQUALS expression",
	"eqnlist : eqnlist EQUATION PROMPT SYMBOLNAME EQ PROMPT expression EQUALS expression",
	"eqntype : IMPO",
	"eqntype : STOC",
	"expression : SYMBOLNAME",
	"expression : lagvariable",
	"expression : elagvariable",
	"expression : leadvariable",
	"expression : REAL",
	"expression : INTEGER",
	"expression : addition",
	"expression : subtraction",
	"expression : multiplication",
	"expression : division",
	"expression : exponentiation",
	"expression : unaryminus",
	"expression : '(' expression ')'",
	"lagvariable : LAG '(' SYMBOLNAME COMMA INTEGER ')'",
	"lagvariable : LAG '(' SYMBOLNAME ')'",
	"elagvariable : ELAG '(' SYMBOLNAME COMMA INTEGER ')'",
	"elagvariable : ELAG '(' SYMBOLNAME ')'",
	"leadvariable : LEAD '(' SYMBOLNAME COMMA INTEGER ')'",
	"leadvariable : LEAD '(' SYMBOLNAME ')'",
	"addition : expression PLUS expression",
	"subtraction : expression MINUS expression",
	"multiplication : expression MULT expression",
	"division : expression DIV expression",
	"exponentiation : expression POW expression",
	"unaryminus : MINUS expression",
};
#endif /* YYDEBUG */
# line	1 "/usr/ccs/bin/yaccpar"
/*
 * Copyright (c) 1993 by Sun Microsystems, Inc.
 */

#pragma ident	"@(#)yaccpar	6.14	97/01/16 SMI"

/*
** Skeleton parser driver for yacc output
*/

/*
** yacc user known macros and defines
*/
#define YYERROR		goto yyerrlab
#define YYACCEPT	return(0)
#define YYABORT		return(1)
#define YYBACKUP( newtoken, newvalue )\
{\
	if ( yychar >= 0 || ( yyr2[ yytmp ] >> 1 ) != 1 )\
	{\
		yyerror( "syntax error - cannot backup" );\
		goto yyerrlab;\
	}\
	yychar = newtoken;\
	yystate = *yyps;\
	yylval = newvalue;\
	goto yynewstate;\
}
#define YYRECOVERING()	(!!yyerrflag)
#define YYNEW(type)	malloc(sizeof(type) * yynewmax)
#define YYCOPY(to, from, type) \
	(type *) memcpy(to, (char *) from, yymaxdepth * sizeof (type))
#define YYENLARGE( from, type) \
	(type *) realloc((char *) from, yynewmax * sizeof(type))
#ifndef YYDEBUG
#	define YYDEBUG	1	/* make debugging available */
#endif

/*
** user known globals
*/
int yydebug;			/* set to 1 to get debugging */

/*
** driver internal defines
*/
#define YYFLAG		(-10000000)

/*
** global variables used by the parser
*/
YYSTYPE *yypv;			/* top of value stack */
int *yyps;			/* top of state stack */

int yystate;			/* current state */
int yytmp;			/* extra var (lasts between blocks) */

int yynerrs;			/* number of errors */
int yyerrflag;			/* error recovery flag */
int yychar;			/* current input token number */



#ifdef YYNMBCHARS
#define YYLEX()		yycvtok(yylex())
/*
** yycvtok - return a token if i is a wchar_t value that exceeds 255.
**	If i<255, i itself is the token.  If i>255 but the neither 
**	of the 30th or 31st bit is on, i is already a token.
*/
#if defined(__STDC__) || defined(__cplusplus)
int yycvtok(int i)
#else
int yycvtok(i) int i;
#endif
{
	int first = 0;
	int last = YYNMBCHARS - 1;
	int mid;
	wchar_t j;

	if(i&0x60000000){/*Must convert to a token. */
		if( yymbchars[last].character < i ){
			return i;/*Giving up*/
		}
		while ((last>=first)&&(first>=0)) {/*Binary search loop*/
			mid = (first+last)/2;
			j = yymbchars[mid].character;
			if( j==i ){/*Found*/ 
				return yymbchars[mid].tvalue;
			}else if( j<i ){
				first = mid + 1;
			}else{
				last = mid -1;
			}
		}
		/*No entry in the table.*/
		return i;/* Giving up.*/
	}else{/* i is already a token. */
		return i;
	}
}
#else/*!YYNMBCHARS*/
#define YYLEX()		yylex()
#endif/*!YYNMBCHARS*/

/*
** yyparse - return 0 if worked, 1 if syntax error not recovered from
*/
#if defined(__STDC__) || defined(__cplusplus)
int yyparse(void)
#else
int yyparse()
#endif
{
	register YYSTYPE *yypvt = 0;	/* top of value stack for $vars */

#if defined(__cplusplus) || defined(lint)
/*
	hacks to please C++ and lint - goto's inside
	switch should never be executed
*/
	static int __yaccpar_lint_hack__ = 0;
	switch (__yaccpar_lint_hack__)
	{
		case 1: goto yyerrlab;
		case 2: goto yynewstate;
	}
#endif

	/*
	** Initialize externals - yyparse may be called more than once
	*/
	yypv = &yyv[-1];
	yyps = &yys[-1];
	yystate = 0;
	yytmp = 0;
	yynerrs = 0;
	yyerrflag = 0;
	yychar = -1;

#if YYMAXDEPTH <= 0
	if (yymaxdepth <= 0)
	{
		if ((yymaxdepth = YYEXPAND(0)) <= 0)
		{
			yyerror("yacc initialization error");
			YYABORT;
		}
	}
#endif

	{
		register YYSTYPE *yy_pv;	/* top of value stack */
		register int *yy_ps;		/* top of state stack */
		register int yy_state;		/* current state */
		register int  yy_n;		/* internal state number info */
	goto yystack;	/* moved from 6 lines above to here to please C++ */

		/*
		** get globals into registers.
		** branch to here only if YYBACKUP was called.
		*/
	yynewstate:
		yy_pv = yypv;
		yy_ps = yyps;
		yy_state = yystate;
		goto yy_newstate;

		/*
		** get globals into registers.
		** either we just started, or we just finished a reduction
		*/
	yystack:
		yy_pv = yypv;
		yy_ps = yyps;
		yy_state = yystate;

		/*
		** top of for (;;) loop while no reductions done
		*/
	yy_stack:
		/*
		** put a state and value onto the stacks
		*/
#if YYDEBUG
		/*
		** if debugging, look up token value in list of value vs.
		** name pairs.  0 and negative (-1) are special values.
		** Note: linear search is used since time is not a real
		** consideration while debugging.
		*/
		if ( yydebug )
		{
			register int yy_i;

			printf( "State %d, token ", yy_state );
			if ( yychar == 0 )
				printf( "end-of-file\n" );
			else if ( yychar < 0 )
				printf( "-none-\n" );
			else
			{
				for ( yy_i = 0; yytoks[yy_i].t_val >= 0;
					yy_i++ )
				{
					if ( yytoks[yy_i].t_val == yychar )
						break;
				}
				printf( "%s\n", yytoks[yy_i].t_name );
			}
		}
#endif /* YYDEBUG */
		if ( ++yy_ps >= &yys[ yymaxdepth ] )	/* room on stack? */
		{
			/*
			** reallocate and recover.  Note that pointers
			** have to be reset, or bad things will happen
			*/
			int yyps_index = (yy_ps - yys);
			int yypv_index = (yy_pv - yyv);
			int yypvt_index = (yypvt - yyv);
			int yynewmax;
#ifdef YYEXPAND
			yynewmax = YYEXPAND(yymaxdepth);
#else
			yynewmax = 2 * yymaxdepth;	/* double table size */
			if (yymaxdepth == YYMAXDEPTH)	/* first time growth */
			{
				char *newyys = (char *)YYNEW(int);
				char *newyyv = (char *)YYNEW(YYSTYPE);
				if (newyys != 0 && newyyv != 0)
				{
					yys = YYCOPY(newyys, yys, int);
					yyv = YYCOPY(newyyv, yyv, YYSTYPE);
				}
				else
					yynewmax = 0;	/* failed */
			}
			else				/* not first time */
			{
				yys = YYENLARGE(yys, int);
				yyv = YYENLARGE(yyv, YYSTYPE);
				if (yys == 0 || yyv == 0)
					yynewmax = 0;	/* failed */
			}
#endif
			if (yynewmax <= yymaxdepth)	/* tables not expanded */
			{
				yyerror( "yacc stack overflow" );
				YYABORT;
			}
			yymaxdepth = yynewmax;

			yy_ps = yys + yyps_index;
			yy_pv = yyv + yypv_index;
			yypvt = yyv + yypvt_index;
		}
		*yy_ps = yy_state;
		*++yy_pv = yyval;

		/*
		** we have a new state - find out what to do
		*/
	yy_newstate:
		if ( ( yy_n = yypact[ yy_state ] ) <= YYFLAG )
			goto yydefault;		/* simple state */
#if YYDEBUG
		/*
		** if debugging, need to mark whether new token grabbed
		*/
		yytmp = yychar < 0;
#endif
		if ( ( yychar < 0 ) && ( ( yychar = YYLEX() ) < 0 ) )
			yychar = 0;		/* reached EOF */
#if YYDEBUG
		if ( yydebug && yytmp )
		{
			register int yy_i;

			printf( "Received token " );
			if ( yychar == 0 )
				printf( "end-of-file\n" );
			else if ( yychar < 0 )
				printf( "-none-\n" );
			else
			{
				for ( yy_i = 0; yytoks[yy_i].t_val >= 0;
					yy_i++ )
				{
					if ( yytoks[yy_i].t_val == yychar )
						break;
				}
				printf( "%s\n", yytoks[yy_i].t_name );
			}
		}
#endif /* YYDEBUG */
		if ( ( ( yy_n += yychar ) < 0 ) || ( yy_n >= YYLAST ) )
			goto yydefault;
		if ( yychk[ yy_n = yyact[ yy_n ] ] == yychar )	/*valid shift*/
		{
			yychar = -1;
			yyval = yylval;
			yy_state = yy_n;
			if ( yyerrflag > 0 )
				yyerrflag--;
			goto yy_stack;
		}

	yydefault:
		if ( ( yy_n = yydef[ yy_state ] ) == -2 )
		{
#if YYDEBUG
			yytmp = yychar < 0;
#endif
			if ( ( yychar < 0 ) && ( ( yychar = YYLEX() ) < 0 ) )
				yychar = 0;		/* reached EOF */
#if YYDEBUG
			if ( yydebug && yytmp )
			{
				register int yy_i;

				printf( "Received token " );
				if ( yychar == 0 )
					printf( "end-of-file\n" );
				else if ( yychar < 0 )
					printf( "-none-\n" );
				else
				{
					for ( yy_i = 0;
						yytoks[yy_i].t_val >= 0;
						yy_i++ )
					{
						if ( yytoks[yy_i].t_val
							== yychar )
						{
							break;
						}
					}
					printf( "%s\n", yytoks[yy_i].t_name );
				}
			}
#endif /* YYDEBUG */
			/*
			** look through exception table
			*/
			{
				register const int *yyxi = yyexca;

				while ( ( *yyxi != -1 ) ||
					( yyxi[1] != yy_state ) )
				{
					yyxi += 2;
				}
				while ( ( *(yyxi += 2) >= 0 ) &&
					( *yyxi != yychar ) )
					;
				if ( ( yy_n = yyxi[1] ) < 0 )
					YYACCEPT;
			}
		}

		/*
		** check for syntax error
		*/
		if ( yy_n == 0 )	/* have an error */
		{
			/* no worry about speed here! */
			switch ( yyerrflag )
			{
			case 0:		/* new error */
				yyerror( "syntax error" );
				goto skip_init;
			yyerrlab:
				/*
				** get globals into registers.
				** we have a user generated syntax type error
				*/
				yy_pv = yypv;
				yy_ps = yyps;
				yy_state = yystate;
			skip_init:
				yynerrs++;
				/* FALLTHRU */
			case 1:
			case 2:		/* incompletely recovered error */
					/* try again... */
				yyerrflag = 3;
				/*
				** find state where "error" is a legal
				** shift action
				*/
				while ( yy_ps >= yys )
				{
					yy_n = yypact[ *yy_ps ] + YYERRCODE;
					if ( yy_n >= 0 && yy_n < YYLAST &&
						yychk[yyact[yy_n]] == YYERRCODE)					{
						/*
						** simulate shift of "error"
						*/
						yy_state = yyact[ yy_n ];
						goto yy_stack;
					}
					/*
					** current state has no shift on
					** "error", pop stack
					*/
#if YYDEBUG
#	define _POP_ "Error recovery pops state %d, uncovers state %d\n"
					if ( yydebug )
						printf( _POP_, *yy_ps,
							yy_ps[-1] );
#	undef _POP_
#endif
					yy_ps--;
					yy_pv--;
				}
				/*
				** there is no state on stack with "error" as
				** a valid shift.  give up.
				*/
				YYABORT;
			case 3:		/* no shift yet; eat a token */
#if YYDEBUG
				/*
				** if debugging, look up token in list of
				** pairs.  0 and negative shouldn't occur,
				** but since timing doesn't matter when
				** debugging, it doesn't hurt to leave the
				** tests here.
				*/
				if ( yydebug )
				{
					register int yy_i;

					printf( "Error recovery discards " );
					if ( yychar == 0 )
						printf( "token end-of-file\n" );
					else if ( yychar < 0 )
						printf( "token -none-\n" );
					else
					{
						for ( yy_i = 0;
							yytoks[yy_i].t_val >= 0;
							yy_i++ )
						{
							if ( yytoks[yy_i].t_val
								== yychar )
							{
								break;
							}
						}
						printf( "token %s\n",
							yytoks[yy_i].t_name );
					}
				}
#endif /* YYDEBUG */
				if ( yychar == 0 )	/* reached EOF. quit */
					YYABORT;
				yychar = -1;
				goto yy_newstate;
			}
		}/* end if ( yy_n == 0 ) */
		/*
		** reduction by production yy_n
		** put stack tops, etc. so things right after switch
		*/
#if YYDEBUG
		/*
		** if debugging, print the string that is the user's
		** specification of the reduction which is just about
		** to be done.
		*/
		if ( yydebug )
			printf( "Reduce by (%d) \"%s\"\n",
				yy_n, yyreds[ yy_n ] );
#endif
		yytmp = yy_n;			/* value to switch over */
		yypvt = yy_pv;			/* $vars top of value stack */
		/*
		** Look in goto table for next state
		** Sorry about using yy_state here as temporary
		** register variable, but why not, if it works...
		** If yyr2[ yy_n ] doesn't have the low order bit
		** set, then there is no action to be done for
		** this reduction.  So, no saving & unsaving of
		** registers done.  The only difference between the
		** code just after the if and the body of the if is
		** the goto yy_stack in the body.  This way the test
		** can be made before the choice of what to do is needed.
		*/
		{
			/* length of production doubled with extra bit */
			register int yy_len = yyr2[ yy_n ];

			if ( !( yy_len & 01 ) )
			{
				yy_len >>= 1;
				yyval = ( yy_pv -= yy_len )[1];	/* $$ = $1 */
				yy_state = yypgo[ yy_n = yyr1[ yy_n ] ] +
					*( yy_ps -= yy_len ) + 1;
				if ( yy_state >= YYLAST ||
					yychk[ yy_state =
					yyact[ yy_state ] ] != -yy_n )
				{
					yy_state = yyact[ yypgo[ yy_n ] ];
				}
				goto yy_stack;
			}
			yy_len >>= 1;
			yyval = ( yy_pv -= yy_len )[1];	/* $$ = $1 */
			yy_state = yypgo[ yy_n = yyr1[ yy_n ] ] +
				*( yy_ps -= yy_len ) + 1;
			if ( yy_state >= YYLAST ||
				yychk[ yy_state = yyact[ yy_state ] ] != -yy_n )
			{
				yy_state = yyact[ yypgo[ yy_n ] ];
			}
		}
					/* save until reenter driver code */
		yystate = yy_state;
		yyps = yy_ps;
		yypv = yy_pv;
	}
	/*
	** code supplied by user is placed in this switch
	*/
	switch( yytmp )
	{
		
case 1:
# line 102 "parse.y"
{
		m->neq = eqnumber;
		m->nlag = maxlag;
		m->nlead = maxlead;
		m->ncoeffs = coeffnumber;
		yyval.modeltype = yypvt[-0].modeltype;
		} break;
case 2:
# line 113 "parse.y"
{
		m->modelname = yypvt[-5].stringtype;
		yyval.modeltype = m;
		} break;
case 3:
# line 121 "parse.y"
{ } break;
case 4:
# line 123 "parse.y"
{ } break;
case 5:
# line 128 "parse.y"
{
		m->endog[varnumber] = yypvt[-2].stringtype;
		m->delay[varnumber] = atoi(yypvt[-1].stringtype);
		m->vtype[varnumber] = yypvt[-0].vtypetypetype;
		varnumber++;
		} break;
case 6:
# line 135 "parse.y"
{  /* m->vtype default is DATA. */
		m->endog[varnumber] = yypvt[-1].stringtype;
		m->delay[varnumber] = atoi(yypvt[-0].stringtype);
		m->vtype[varnumber] = DATA;
		varnumber++;
		} break;
case 7:
# line 142 "parse.y"
{  /* m->delay default is 0. */
		m->endog[varnumber] = yypvt[-1].stringtype;
		m->delay[varnumber] = 0;
		m->vtype[varnumber] = yypvt[-0].vtypetypetype;
		varnumber++;
		} break;
case 8:
# line 149 "parse.y"
{  /* Handle both defaults at once. */
		m->endog[varnumber] = yypvt[-0].stringtype;
		m->delay[varnumber] = 0;
		m->vtype[varnumber] = DATA;
		varnumber++;
		} break;
case 9:
# line 159 "parse.y"
{
		yyval.vtypetypetype = DATA;
		} break;
case 10:
# line 163 "parse.y"
{
		yyval.vtypetypetype = NOTD;
		} break;
case 11:
# line 167 "parse.y"
{
		yyval.vtypetypetype = DTRM;
		} break;
case 12:
# line 175 "parse.y"
{
		m->eqname[eqnumber] = yypvt[-8].stringtype;
		m->eqtype[eqnumber] = yypvt[-5].eqtypetypetype;
		m->eqns[eqnumber].LHS = yypvt[-2].nodetype;
		m->eqns[eqnumber].RHS = yypvt[-0].nodetype;
		eqnumber++;
		} break;
case 13:
# line 183 "parse.y"
{   /* If omitted, EQTYPE> defaults to STOCH. */
		m->eqname[eqnumber] = yypvt[-5].stringtype;
		m->eqtype[eqnumber] = STOCH;
		m->eqns[eqnumber].LHS = yypvt[-2].nodetype;
		m->eqns[eqnumber].RHS = yypvt[-0].nodetype;
		eqnumber++;
		} break;
case 14:
# line 192 "parse.y"
{
		m->eqname[eqnumber] = yypvt[-8].stringtype;
		m->eqtype[eqnumber] = yypvt[-5].eqtypetypetype;
		m->eqns[eqnumber].LHS = yypvt[-2].nodetype;
		m->eqns[eqnumber].RHS = yypvt[-0].nodetype;
		eqnumber++;
		} break;
case 15:
# line 201 "parse.y"
{   /* If omitted, EQTYPE> defaults to STOCH. */
		m->eqname[eqnumber] = yypvt[-5].stringtype;
		m->eqtype[eqnumber] = STOCH;
		m->eqns[eqnumber].LHS = yypvt[-2].nodetype;
		m->eqns[eqnumber].RHS = yypvt[-0].nodetype;
		eqnumber++;
		} break;
case 16:
# line 211 "parse.y"
{
		yyval.eqtypetypetype = IMPOSED;
		} break;
case 17:
# line 215 "parse.y"
{
		yyval.eqtypetypetype = STOCH;
		} break;
case 18:
# line 221 "parse.y"
{   /* could be either variable or coefficient */
		if (find_index(m->endog, varnumber, yypvt[-0].stringtype) == -1)
		  {
		    if (find_index(m->cname, coeffnumber, yypvt[-0].stringtype) == -1)
		      m->cname[coeffnumber++] = yypvt[-0].stringtype;
		    yyval.nodetype = create_coefficient_node(yypvt[-0].stringtype);
		  }
		else
		  yyval.nodetype = create_variable_node(yypvt[-0].stringtype, 0, NO);
		} break;
case 19:
# line 232 "parse.y"
{
		yyval.nodetype = yypvt[-0].nodetype;
		} break;
case 20:
# line 236 "parse.y"
{
		yyval.nodetype = yypvt[-0].nodetype;
		} break;
case 21:
# line 240 "parse.y"
{
		yyval.nodetype = yypvt[-0].nodetype;
		} break;
case 22:
# line 244 "parse.y"
{
		yyval.nodetype = create_constant_node(atof(yypvt[-0].stringtype));
		} break;
case 23:
# line 248 "parse.y"
{
		yyval.nodetype = create_constant_node(atof(yypvt[-0].stringtype));
		} break;
case 24:
# line 252 "parse.y"
{
		yyval.nodetype = yypvt[-0].nodetype;
		} break;
case 25:
# line 256 "parse.y"
{
		yyval.nodetype = yypvt[-0].nodetype;
		} break;
case 26:
# line 260 "parse.y"
{
		yyval.nodetype = yypvt[-0].nodetype;
		} break;
case 27:
# line 264 "parse.y"
{
		yyval.nodetype = yypvt[-0].nodetype;
		} break;
case 28:
# line 268 "parse.y"
{
		yyval.nodetype = yypvt[-0].nodetype;
		} break;
case 29:
# line 272 "parse.y"
{
		yyval.nodetype = yypvt[-0].nodetype;
		} break;
case 30:
# line 276 "parse.y"
{
		yyval.nodetype = yypvt[-1].nodetype;
		} break;
case 31:
# line 283 "parse.y"
{
		int lagint;
		if (find_index(m->endog, varnumber, yypvt[-3].stringtype) == -1)
		  yyerror("First operand of LAG must be a variable.");
		lagint = atoi(yypvt[-1].stringtype);
		if (lagint <= 0)
		  yyerror("LAG must be positive.");
		if (maxlag < lagint)
		  maxlag = lagint;
		yyval.nodetype = create_variable_node(yypvt[-3].stringtype, -1 * lagint, NO);
		} break;
case 32:
# line 295 "parse.y"
{  /* The second argument to LAG defaults to 1 if omitted. */
		if (find_index(m->endog, varnumber, yypvt[-1].stringtype) == -1)
		  yyerror("First operand of LAG must be a variable.");
		if (maxlag < 1)
		  maxlag = 1;
		yyval.nodetype = create_variable_node(yypvt[-1].stringtype, -1, NO);
		} break;
case 33:
# line 306 "parse.y"
{
		int elagint;
		if (find_index(m->endog, varnumber, yypvt[-3].stringtype) == -1)
		  yyerror("First operand of ELAG must be a variable.");
		elagint = atoi(yypvt[-1].stringtype);
		if (elagint <= 0)
		  yyerror("ELAG must be positive.");
		if (maxlag < elagint)
		  maxlag = elagint;
		yyval.nodetype = create_variable_node(yypvt[-3].stringtype, -1 * elagint, YES);
		} break;
case 34:
# line 318 "parse.y"
{  /* The second argument to ELAG defaults to 1 if omitted. */
		if (find_index(m->endog, varnumber, yypvt[-1].stringtype) == -1)
		  yyerror("First operand of ELAG must be a variable.");
		if (maxlag < 1)
		  maxlag = 1;
		yyval.nodetype = create_variable_node(yypvt[-1].stringtype, -1, YES);
		} break;
case 35:
# line 329 "parse.y"
{
		int leadint;
		if (find_index(m->endog, varnumber, yypvt[-3].stringtype) == -1)
		  yyerror("First operand of LEAD must be a variable.");
		leadint = atoi(yypvt[-1].stringtype);
		if (leadint <= 0)
		  yyerror("LEAD must be positive.");
		if (maxlead < leadint)
		  maxlead = leadint;
		yyval.nodetype = create_variable_node(yypvt[-3].stringtype, leadint, NO);
		} break;
case 36:
# line 341 "parse.y"
{  /* The second argument to LEAD defaults to 1 if omitted. */
		if (find_index(m->endog, varnumber, yypvt[-1].stringtype) == -1)
		  yyerror("First operand of LEAD must be a variable.");
		if (maxlead < 1)
		  maxlead = 1;
		yyval.nodetype = create_variable_node(yypvt[-1].stringtype, 1, NO);
		} break;
case 37:
# line 352 "parse.y"
{
		yyval.nodetype = create_sum_node(yypvt[-2].nodetype, yypvt[-0].nodetype);
		} break;
case 38:
# line 359 "parse.y"
{
		n1 = create_constant_node(-1.0);
		n2 = create_product_node(n1, yypvt[-0].nodetype);
		yyval.nodetype = create_sum_node(yypvt[-2].nodetype, n2);
		} break;
case 39:
# line 368 "parse.y"
{
		yyval.nodetype = create_product_node(yypvt[-2].nodetype, yypvt[-0].nodetype);
		} break;
case 40:
# line 375 "parse.y"
{
		n1 = create_constant_node(-1.0);
		n2 = create_power_node(yypvt[-0].nodetype, n1);
		yyval.nodetype = create_product_node(yypvt[-2].nodetype, n2);
		} break;
case 41:
# line 384 "parse.y"
{
		yyval.nodetype = create_power_node(yypvt[-2].nodetype, yypvt[-0].nodetype);
		} break;
case 42:
# line 391 "parse.y"
{ 
                if (yypvt[-0].nodetype->type == CONSTANT)
                  {
		    yyval.nodetype = create_constant_node(-1.0 * yypvt[-0].nodetype->info.cons.value);
		    free(yypvt[-0].nodetype);
		  }
                else
                  {
		    n1 = create_constant_node(-1.0);
		    yyval.nodetype = create_product_node(n1, yypvt[-0].nodetype);
		  }
		} break;
# line	531 "/usr/ccs/bin/yaccpar"
	}
	goto yystack;		/* reset registers in driver code */
}

