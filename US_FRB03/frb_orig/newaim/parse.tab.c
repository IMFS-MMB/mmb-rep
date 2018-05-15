
/*  A Bison parser, made from parse.y
 by  GNU Bison version 1.25
  */

#define YYBISON 1  /* Identify Bison output.  */

#define	MODEL	258
#define	EQUATION	259
#define	EQ	260
#define	EQTYPE	261
#define	ENDOG	262
#define	PROMPT	263
#define	_DATA	264
#define	_NOTD	265
#define	_DTRM	266
#define	IMPO	267
#define	STOC	268
#define	LAG	269
#define	ELAG	270
#define	LEAD	271
#define	END	272
#define	EQUALS	273
#define	COMMA	274
#define	POW	275
#define	DIV	276
#define	PLUS	277
#define	MULT	278
#define	MINUS	279
#define	NEG	280
#define	SYMBOLNAME	281
#define	REAL	282
#define	INTEGER	283

#line 6 "parse.y"


#include "header.h"

extern struct model *m;
struct node *n1;
struct node *n2;

int eqnumber = 0;
int maxlag = 0;  
int maxlead = 0; 
int varnumber = 0;
int coeffnumber = 0;


#line 88 "parse.y"
typedef union {
	char *stringtype;
	struct model *modeltype;
	enum vtypetype vtypetypetype;
	enum eqtypetype eqtypetypetype;
	struct node *nodetype;
	struct equation *equationtype;
	int inumber;
	double dnumber;
	} YYSTYPE;
#include <stdio.h>

#ifndef __cplusplus
#ifndef __STDC__
#define const
#endif
#endif



#define	YYFINAL		103
#define	YYFLAG		-32768
#define	YYNTBASE	31

#define YYTRANSLATE(x) ((unsigned)(x) <= 283 ? yytranslate[x] : 48)

static const char yytranslate[] = {     0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,    20,
    21,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     1,     2,     3,     4,     5,
     6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
    16,    17,    18,    19,    22,    23,    24,    25,    26,    27,
    28,    29,    30
};

#if YYDEBUG != 0
static const short yyprhs[] = {     0,
     0,     2,    11,    13,    16,    20,    23,    26,    28,    30,
    32,    34,    46,    55,    68,    78,    80,    82,    84,    86,
    88,    90,    92,    94,    96,    98,   100,   102,   104,   106,
   110,   117,   122,   129,   134,   141,   146,   150,   154,   158,
   162,   166
};

static const short yyrhs[] = {    32,
     0,     3,     8,    28,     7,     8,    33,    36,    17,     0,
    34,     0,    33,    34,     0,    28,    30,    35,     0,    28,
    30,     0,    28,    35,     0,    28,     0,     9,     0,    10,
     0,    11,     0,     4,     8,    28,     6,     8,    37,     5,
     8,    38,    18,    38,     0,     4,     8,    28,     5,     8,
    38,    18,    38,     0,    36,     4,     8,    28,     6,     8,
    37,     5,     8,    38,    18,    38,     0,    36,     4,     8,
    28,     5,     8,    38,    18,    38,     0,    12,     0,    13,
     0,    28,     0,    39,     0,    40,     0,    41,     0,    29,
     0,    30,     0,    42,     0,    43,     0,    44,     0,    45,
     0,    46,     0,    47,     0,    20,    38,    21,     0,    14,
    20,    28,    19,    30,    21,     0,    14,    20,    28,    21,
     0,    15,    20,    28,    19,    30,    21,     0,    15,    20,
    28,    21,     0,    16,    20,    28,    19,    30,    21,     0,
    16,    20,    28,    21,     0,    38,    24,    38,     0,    38,
    26,    38,     0,    38,    25,    38,     0,    38,    23,    38,
     0,    38,    22,    38,     0,    26,    38,     0
};

#endif

#if YYDEBUG != 0
static const short yyrline[] = { 0,
   101,   112,   120,   122,   127,   134,   141,   148,   158,   162,
   166,   173,   182,   190,   199,   210,   214,   220,   231,   235,
   239,   243,   247,   251,   255,   259,   263,   267,   271,   275,
   282,   294,   305,   317,   328,   340,   351,   358,   367,   374,
   383,   390
};
#endif


#if YYDEBUG != 0 || defined (YYERROR_VERBOSE)

static const char * const yytname[] = {   "$","error","$undefined.","MODEL",
"EQUATION","EQ","EQTYPE","ENDOG","PROMPT","_DATA","_NOTD","_DTRM","IMPO","STOC",
"LAG","ELAG","LEAD","END","EQUALS","COMMA","'('","')'","POW","DIV","PLUS","MULT",
"MINUS","NEG","SYMBOLNAME","REAL","INTEGER","finished","mdl","variablelist",
"variabledef","variabletype","eqnlist","eqntype","expression","lagvariable",
"elagvariable","leadvariable","addition","subtraction","multiplication","division",
"exponentiation","unaryminus", NULL
};
#endif

static const short yyr1[] = {     0,
    31,    32,    33,    33,    34,    34,    34,    34,    35,    35,
    35,    36,    36,    36,    36,    37,    37,    38,    38,    38,
    38,    38,    38,    38,    38,    38,    38,    38,    38,    38,
    39,    39,    40,    40,    41,    41,    42,    43,    44,    45,
    46,    47
};

static const short yyr2[] = {     0,
     1,     8,     1,     2,     3,     2,     2,     1,     1,     1,
     1,    11,     8,    12,     9,     1,     1,     1,     1,     1,
     1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
     6,     4,     6,     4,     6,     4,     3,     3,     3,     3,
     3,     2
};

static const short yydefact[] = {     0,
     0,     1,     0,     0,     0,     0,     8,     0,     3,     9,
    10,    11,     6,     7,     0,     4,     0,     5,     0,     0,
     2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,    18,    22,    23,     0,    19,
    20,    21,    24,    25,    26,    27,    28,    29,    16,    17,
     0,     0,     0,     0,     0,     0,     0,    42,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    30,    13,    41,    40,    37,    39,    38,     0,     0,     0,
     0,    32,     0,    34,     0,    36,     0,    15,     0,     0,
     0,     0,     0,     0,    31,    33,    35,    12,     0,    14,
     0,     0,     0
};

static const short yydefgoto[] = {   101,
     2,     8,     9,    14,    17,    51,    39,    40,    41,    42,
    43,    44,    45,    46,    47,    48
};

static const short yypact[] = {     5,
     8,-32768,    -4,    31,    34,    19,    -7,     3,-32768,-32768,
-32768,-32768,    11,-32768,    44,-32768,     2,-32768,    26,    61,
-32768,    27,    49,    70,    87,    52,    20,    55,    88,    89,
    56,    78,    79,    20,    20,-32768,-32768,-32768,   -13,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
    95,    20,    55,    73,    74,    75,    63,-32768,    20,    20,
    20,    20,    20,    20,    96,    38,   100,    18,    22,    32,
-32768,    68,    84,    84,    -8,    84,    -8,    20,    20,    99,
    80,-32768,    81,-32768,    82,-32768,    48,    68,    20,    92,
    93,    94,    20,    57,-32768,-32768,-32768,    68,    20,    68,
   108,   109,-32768
};

static const short yypgoto[] = {-32768,
-32768,-32768,   110,   103,-32768,    64,   -34,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,-32768
};


#define	YYLAST		118


static const short yytable[] = {    57,
    58,    10,    11,    12,    59,    20,    15,     1,    60,    61,
    62,    63,    64,    60,    61,     3,    63,    66,    21,    10,
    11,    12,    13,     4,    72,    73,    74,    75,    76,    77,
     7,    24,    25,    31,    32,    33,    81,     5,    82,    34,
    83,     6,    84,    87,    88,    35,     7,    36,    37,    38,
    85,    19,    86,    22,    94,    79,    29,    30,    98,    60,
    61,    62,    63,    64,   100,    93,    49,    50,    23,    60,
    61,    62,    63,    64,    99,    54,    26,    27,    60,    61,
    62,    63,    64,    71,    60,    61,    62,    63,    64,    60,
    61,    62,    63,    64,    28,    52,    53,    55,    56,    65,
    68,    69,    70,    78,    80,    60,    89,   102,   103,    90,
    91,    92,    95,    96,    97,    18,    67,    16
};

static const short yycheck[] = {    34,
    35,     9,    10,    11,    18,     4,     4,     3,    22,    23,
    24,    25,    26,    22,    23,     8,    25,    52,    17,     9,
    10,    11,    30,    28,    59,    60,    61,    62,    63,    64,
    28,     5,     6,    14,    15,    16,    19,     7,    21,    20,
    19,     8,    21,    78,    79,    26,    28,    28,    29,    30,
    19,     8,    21,    28,    89,    18,     5,     6,    93,    22,
    23,    24,    25,    26,    99,    18,    12,    13,     8,    22,
    23,    24,    25,    26,    18,    20,    28,     8,    22,    23,
    24,    25,    26,    21,    22,    23,    24,    25,    26,    22,
    23,    24,    25,    26,     8,     8,     8,    20,    20,     5,
    28,    28,    28,     8,     5,    22,     8,     0,     0,    30,
    30,    30,    21,    21,    21,    13,    53,     8
};
/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */
#line 3 "/usr/share/bison.simple"

/* Skeleton output parser for bison,
   Copyright (C) 1984, 1989, 1990 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

#ifndef alloca
#ifdef __GNUC__
#define alloca __builtin_alloca
#else /* not GNU C.  */
#if (!defined (__STDC__) && defined (sparc)) || defined (__sparc__) || defined (__sparc) || defined (__sgi)
#include <alloca.h>
#else /* not sparc */
#if defined (MSDOS) && !defined (__TURBOC__)
#include <malloc.h>
#else /* not MSDOS, or __TURBOC__ */
#if defined(_AIX)
#include <malloc.h>
 #pragma alloca
#else /* not MSDOS, __TURBOC__, or _AIX */
#ifdef __hpux
#ifdef __cplusplus
extern "C" {
void *alloca (unsigned int);
};
#else /* not __cplusplus */
void *alloca ();
#endif /* not __cplusplus */
#endif /* __hpux */
#endif /* not _AIX */
#endif /* not MSDOS, or __TURBOC__ */
#endif /* not sparc.  */
#endif /* not GNU C.  */
#endif /* alloca not defined.  */

/* This is the parser code that is written into each bison parser
  when the %semantic_parser declaration is not specified in the grammar.
  It was written by Richard Stallman by simplifying the hairy parser
  used when %semantic_parser is specified.  */

/* Note: there must be only one dollar sign in this file.
   It is replaced by the list of actions, each action
   as one case of the switch.  */

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0
#define YYACCEPT	return(0)
#define YYABORT 	return(1)
#define YYERROR		goto yyerrlab1
/* Like YYERROR except do call yyerror.
   This remains here temporarily to ease the
   transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */
#define YYFAIL		goto yyerrlab
#define YYRECOVERING()  (!!yyerrstatus)
#define YYBACKUP(token, value) \
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    { yychar = (token), yylval = (value);			\
      yychar1 = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { yyerror ("syntax error: cannot back up"); YYERROR; }	\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

#ifndef YYPURE
#define YYLEX		yylex()
#endif

#ifdef YYPURE
#ifdef YYLSP_NEEDED
#ifdef YYLEX_PARAM
#define YYLEX		yylex(&yylval, &yylloc, YYLEX_PARAM)
#else
#define YYLEX		yylex(&yylval, &yylloc)
#endif
#else /* not YYLSP_NEEDED */
#ifdef YYLEX_PARAM
#define YYLEX		yylex(&yylval, YYLEX_PARAM)
#else
#define YYLEX		yylex(&yylval)
#endif
#endif /* not YYLSP_NEEDED */
#endif

/* If nonreentrant, generate the variables here */

#ifndef YYPURE

int	yychar;			/*  the lookahead symbol		*/
YYSTYPE	yylval;			/*  the semantic value of the		*/
				/*  lookahead symbol			*/

#ifdef YYLSP_NEEDED
YYLTYPE yylloc;			/*  location data for the lookahead	*/
				/*  symbol				*/
#endif

int yynerrs;			/*  number of parse errors so far       */
#endif  /* not YYPURE */

#if YYDEBUG != 0
int yydebug;			/*  nonzero means print parse trace	*/
/* Since this is uninitialized, it does not stop multiple parsers
   from coexisting.  */
#endif

/*  YYINITDEPTH indicates the initial size of the parser's stacks	*/

#ifndef	YYINITDEPTH
#define YYINITDEPTH 200
#endif

/*  YYMAXDEPTH is the maximum size the stacks can grow to
    (effective only if the built-in stack extension method is used).  */

#if YYMAXDEPTH == 0
#undef YYMAXDEPTH
#endif

#ifndef YYMAXDEPTH
#define YYMAXDEPTH 10000
#endif

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
int yyparse (void);
#endif

#if __GNUC__ > 1		/* GNU C and GNU C++ define this.  */
#define __yy_memcpy(TO,FROM,COUNT)	__builtin_memcpy(TO,FROM,COUNT)
#else				/* not GNU C or C++ */
#ifndef __cplusplus

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (to, from, count)
     char *to;
     char *from;
     int count;
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
    *t++ = *f++;
}

#else /* __cplusplus */

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (char *to, char *from, int count)
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
    *t++ = *f++;
}

#endif
#endif

#line 196 "/usr/share/bison.simple"

/* The user can define YYPARSE_PARAM as the name of an argument to be passed
   into yyparse.  The argument should have type void *.
   It should actually point to an object.
   Grammar actions can access the variable by casting it
   to the proper pointer type.  */

#ifdef YYPARSE_PARAM
#ifdef __cplusplus
#define YYPARSE_PARAM_ARG void *YYPARSE_PARAM
#define YYPARSE_PARAM_DECL
#else /* not __cplusplus */
#define YYPARSE_PARAM_ARG YYPARSE_PARAM
#define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
#endif /* not __cplusplus */
#else /* not YYPARSE_PARAM */
#define YYPARSE_PARAM_ARG
#define YYPARSE_PARAM_DECL
#endif /* not YYPARSE_PARAM */

int
yyparse(YYPARSE_PARAM_ARG)
     YYPARSE_PARAM_DECL
{
  register int yystate;
  register int yyn;
  register short *yyssp;
  register YYSTYPE *yyvsp;
  int yyerrstatus;	/*  number of tokens to shift before error messages enabled */
  int yychar1 = 0;		/*  lookahead token as an internal (translated) token number */

  short	yyssa[YYINITDEPTH];	/*  the state stack			*/
  YYSTYPE yyvsa[YYINITDEPTH];	/*  the semantic value stack		*/

  short *yyss = yyssa;		/*  refer to the stacks thru separate pointers */
  YYSTYPE *yyvs = yyvsa;	/*  to allow yyoverflow to reallocate them elsewhere */

#ifdef YYLSP_NEEDED
  YYLTYPE yylsa[YYINITDEPTH];	/*  the location stack			*/
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;

#define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)
#else
#define YYPOPSTACK   (yyvsp--, yyssp--)
#endif

  int yystacksize = YYINITDEPTH;

#ifdef YYPURE
  int yychar;
  YYSTYPE yylval;
  int yynerrs;
#ifdef YYLSP_NEEDED
  YYLTYPE yylloc;
#endif
#endif

  YYSTYPE yyval;		/*  the variable used to return		*/
				/*  semantic values from the action	*/
				/*  routines				*/

  int yylen;

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Starting parse\n");
#endif

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss - 1;
  yyvsp = yyvs;
#ifdef YYLSP_NEEDED
  yylsp = yyls;
#endif

/* Push a new state, which is found in  yystate  .  */
/* In all cases, when you get here, the value and location stacks
   have just been pushed. so pushing a state here evens the stacks.  */
yynewstate:

  *++yyssp = yystate;

  if (yyssp >= yyss + yystacksize - 1)
    {
      /* Give user a chance to reallocate the stack */
      /* Use copies of these so that the &'s don't force the real ones into memory. */
      YYSTYPE *yyvs1 = yyvs;
      short *yyss1 = yyss;
#ifdef YYLSP_NEEDED
      YYLTYPE *yyls1 = yyls;
#endif

      /* Get the current used size of the three stacks, in elements.  */
      int size = yyssp - yyss + 1;

#ifdef yyoverflow
      /* Each stack pointer address is followed by the size of
	 the data in use in that stack, in bytes.  */
#ifdef YYLSP_NEEDED
      /* This used to be a conditional around just the two extra args,
	 but that might be undefined if yyoverflow is a macro.  */
      yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yyls1, size * sizeof (*yylsp),
		 &yystacksize);
#else
      yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yystacksize);
#endif

      yyss = yyss1; yyvs = yyvs1;
#ifdef YYLSP_NEEDED
      yyls = yyls1;
#endif
#else /* no yyoverflow */
      /* Extend the stack our own way.  */
      if (yystacksize >= YYMAXDEPTH)
	{
	  yyerror("parser stack overflow");
	  return 2;
	}
      yystacksize *= 2;
      if (yystacksize > YYMAXDEPTH)
	yystacksize = YYMAXDEPTH;
      yyss = (short *) alloca (yystacksize * sizeof (*yyssp));
      __yy_memcpy ((char *)yyss, (char *)yyss1, size * sizeof (*yyssp));
      yyvs = (YYSTYPE *) alloca (yystacksize * sizeof (*yyvsp));
      __yy_memcpy ((char *)yyvs, (char *)yyvs1, size * sizeof (*yyvsp));
#ifdef YYLSP_NEEDED
      yyls = (YYLTYPE *) alloca (yystacksize * sizeof (*yylsp));
      __yy_memcpy ((char *)yyls, (char *)yyls1, size * sizeof (*yylsp));
#endif
#endif /* no yyoverflow */

      yyssp = yyss + size - 1;
      yyvsp = yyvs + size - 1;
#ifdef YYLSP_NEEDED
      yylsp = yyls + size - 1;
#endif

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Stack size increased to %d\n", yystacksize);
#endif

      if (yyssp >= yyss + yystacksize - 1)
	YYABORT;
    }

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Entering state %d\n", yystate);
#endif

  goto yybackup;
 yybackup:

/* Do appropriate processing given the current state.  */
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* yychar is either YYEMPTY or YYEOF
     or a valid token in external form.  */

  if (yychar == YYEMPTY)
    {
#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Reading a token: ");
#endif
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with */

  if (yychar <= 0)		/* This means end of input. */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more */

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Now at end of input.\n");
#endif
    }
  else
    {
      yychar1 = YYTRANSLATE(yychar);

#if YYDEBUG != 0
      if (yydebug)
	{
	  fprintf (stderr, "Next token is %d (%s", yychar, yytname[yychar1]);
	  /* Give the individual parser a way to print the precise meaning
	     of a token, for further debugging info.  */
#ifdef YYPRINT
	  YYPRINT (stderr, yychar, yylval);
#endif
	  fprintf (stderr, ")\n");
	}
#endif
    }

  yyn += yychar1;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != yychar1)
    goto yydefault;

  yyn = yytable[yyn];

  /* yyn is what to do for this token type in this state.
     Negative => reduce, -yyn is rule number.
     Positive => shift, yyn is new state.
       New state is final state => don't bother to shift,
       just return success.
     0, or most negative number => error.  */

  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrlab;

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Shift the lookahead token.  */

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Shifting token %d (%s), ", yychar, yytname[yychar1]);
#endif

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  /* count tokens shifted since error; after three, turn off error status.  */
  if (yyerrstatus) yyerrstatus--;

  yystate = yyn;
  goto yynewstate;

/* Do the default action for the current state.  */
yydefault:

  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;

/* Do a reduction.  yyn is the number of a rule to reduce with.  */
yyreduce:
  yylen = yyr2[yyn];
  if (yylen > 0)
    yyval = yyvsp[1-yylen]; /* implement default value of the action */

#if YYDEBUG != 0
  if (yydebug)
    {
      int i;

      fprintf (stderr, "Reducing via rule %d (line %d), ",
	       yyn, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (i = yyprhs[yyn]; yyrhs[i] > 0; i++)
	fprintf (stderr, "%s ", yytname[yyrhs[i]]);
      fprintf (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif


  switch (yyn) {

case 1:
#line 102 "parse.y"
{
		m->neq = eqnumber;
		m->nlag = maxlag;
		m->nlead = maxlead;
		m->ncoeffs = coeffnumber;
		yyval.modeltype = yyvsp[0].modeltype;
		;
    break;}
case 2:
#line 113 "parse.y"
{
		m->modelname = yyvsp[-5].stringtype;
		yyval.modeltype = m;
		;
    break;}
case 3:
#line 121 "parse.y"
{ ;
    break;}
case 4:
#line 123 "parse.y"
{ ;
    break;}
case 5:
#line 128 "parse.y"
{
		m->endog[varnumber] = yyvsp[-2].stringtype;
		m->delay[varnumber] = atoi(yyvsp[-1].stringtype);
		m->vtype[varnumber] = yyvsp[0].vtypetypetype;
		varnumber++;
		;
    break;}
case 6:
#line 135 "parse.y"
{  /* m->vtype default is DATA. */
		m->endog[varnumber] = yyvsp[-1].stringtype;
		m->delay[varnumber] = atoi(yyvsp[0].stringtype);
		m->vtype[varnumber] = DATA;
		varnumber++;
		;
    break;}
case 7:
#line 142 "parse.y"
{  /* m->delay default is 0. */
		m->endog[varnumber] = yyvsp[-1].stringtype;
		m->delay[varnumber] = 0;
		m->vtype[varnumber] = yyvsp[0].vtypetypetype;
		varnumber++;
		;
    break;}
case 8:
#line 149 "parse.y"
{  /* Handle both defaults at once. */
		m->endog[varnumber] = yyvsp[0].stringtype;
		m->delay[varnumber] = 0;
		m->vtype[varnumber] = DATA;
		varnumber++;
		;
    break;}
case 9:
#line 159 "parse.y"
{
		yyval.vtypetypetype = DATA;
		;
    break;}
case 10:
#line 163 "parse.y"
{
		yyval.vtypetypetype = NOTD;
		;
    break;}
case 11:
#line 167 "parse.y"
{
		yyval.vtypetypetype = DTRM;
		;
    break;}
case 12:
#line 175 "parse.y"
{
		m->eqname[eqnumber] = yyvsp[-8].stringtype;
		m->eqtype[eqnumber] = yyvsp[-5].eqtypetypetype;
		m->eqns[eqnumber].LHS = yyvsp[-2].nodetype;
		m->eqns[eqnumber].RHS = yyvsp[0].nodetype;
		eqnumber++;
		;
    break;}
case 13:
#line 183 "parse.y"
{   /* If omitted, EQTYPE> defaults to STOCH. */
		m->eqname[eqnumber] = yyvsp[-5].stringtype;
		m->eqtype[eqnumber] = STOCH;
		m->eqns[eqnumber].LHS = yyvsp[-2].nodetype;
		m->eqns[eqnumber].RHS = yyvsp[0].nodetype;
		eqnumber++;
		;
    break;}
case 14:
#line 192 "parse.y"
{
		m->eqname[eqnumber] = yyvsp[-8].stringtype;
		m->eqtype[eqnumber] = yyvsp[-5].eqtypetypetype;
		m->eqns[eqnumber].LHS = yyvsp[-2].nodetype;
		m->eqns[eqnumber].RHS = yyvsp[0].nodetype;
		eqnumber++;
		;
    break;}
case 15:
#line 201 "parse.y"
{   /* If omitted, EQTYPE> defaults to STOCH. */
		m->eqname[eqnumber] = yyvsp[-5].stringtype;
		m->eqtype[eqnumber] = STOCH;
		m->eqns[eqnumber].LHS = yyvsp[-2].nodetype;
		m->eqns[eqnumber].RHS = yyvsp[0].nodetype;
		eqnumber++;
		;
    break;}
case 16:
#line 211 "parse.y"
{
		yyval.eqtypetypetype = IMPOSED;
		;
    break;}
case 17:
#line 215 "parse.y"
{
		yyval.eqtypetypetype = STOCH;
		;
    break;}
case 18:
#line 221 "parse.y"
{   /* could be either variable or coefficient */
		if (find_index(m->endog, varnumber, yyvsp[0].stringtype) == -1)
		  {
		    if (find_index(m->cname, coeffnumber, yyvsp[0].stringtype) == -1)
		      m->cname[coeffnumber++] = yyvsp[0].stringtype;
		    yyval.nodetype = create_coefficient_node(yyvsp[0].stringtype);
		  }
		else
		  yyval.nodetype = create_variable_node(yyvsp[0].stringtype, 0, NO);
		;
    break;}
case 19:
#line 232 "parse.y"
{
		yyval.nodetype = yyvsp[0].nodetype;
		;
    break;}
case 20:
#line 236 "parse.y"
{
		yyval.nodetype = yyvsp[0].nodetype;
		;
    break;}
case 21:
#line 240 "parse.y"
{
		yyval.nodetype = yyvsp[0].nodetype;
		;
    break;}
case 22:
#line 244 "parse.y"
{
		yyval.nodetype = create_constant_node(atof(yyvsp[0].stringtype));
		;
    break;}
case 23:
#line 248 "parse.y"
{
		yyval.nodetype = create_constant_node(atof(yyvsp[0].stringtype));
		;
    break;}
case 24:
#line 252 "parse.y"
{
		yyval.nodetype = yyvsp[0].nodetype;
		;
    break;}
case 25:
#line 256 "parse.y"
{
		yyval.nodetype = yyvsp[0].nodetype;
		;
    break;}
case 26:
#line 260 "parse.y"
{
		yyval.nodetype = yyvsp[0].nodetype;
		;
    break;}
case 27:
#line 264 "parse.y"
{
		yyval.nodetype = yyvsp[0].nodetype;
		;
    break;}
case 28:
#line 268 "parse.y"
{
		yyval.nodetype = yyvsp[0].nodetype;
		;
    break;}
case 29:
#line 272 "parse.y"
{
		yyval.nodetype = yyvsp[0].nodetype;
		;
    break;}
case 30:
#line 276 "parse.y"
{
		yyval.nodetype = yyvsp[-1].nodetype;
		;
    break;}
case 31:
#line 283 "parse.y"
{
		int lagint;
		if (find_index(m->endog, varnumber, yyvsp[-3].stringtype) == -1)
		  yyerror("First operand of LAG must be a variable.");
		lagint = atoi(yyvsp[-1].stringtype);
		if (lagint <= 0)
		  yyerror("LAG must be positive.");
		if (maxlag < lagint)
		  maxlag = lagint;
		yyval.nodetype = create_variable_node(yyvsp[-3].stringtype, -1 * lagint, NO);
		;
    break;}
case 32:
#line 295 "parse.y"
{  /* The second argument to LAG defaults to 1 if omitted. */
		if (find_index(m->endog, varnumber, yyvsp[-1].stringtype) == -1)
		  yyerror("First operand of LAG must be a variable.");
		if (maxlag < 1)
		  maxlag = 1;
		yyval.nodetype = create_variable_node(yyvsp[-1].stringtype, -1, NO);
		;
    break;}
case 33:
#line 306 "parse.y"
{
		int elagint;
		if (find_index(m->endog, varnumber, yyvsp[-3].stringtype) == -1)
		  yyerror("First operand of ELAG must be a variable.");
		elagint = atoi(yyvsp[-1].stringtype);
		if (elagint <= 0)
		  yyerror("ELAG must be positive.");
		if (maxlag < elagint)
		  maxlag = elagint;
		yyval.nodetype = create_variable_node(yyvsp[-3].stringtype, -1 * elagint, YES);
		;
    break;}
case 34:
#line 318 "parse.y"
{  /* The second argument to ELAG defaults to 1 if omitted. */
		if (find_index(m->endog, varnumber, yyvsp[-1].stringtype) == -1)
		  yyerror("First operand of ELAG must be a variable.");
		if (maxlag < 1)
		  maxlag = 1;
		yyval.nodetype = create_variable_node(yyvsp[-1].stringtype, -1, YES);
		;
    break;}
case 35:
#line 329 "parse.y"
{
		int leadint;
		if (find_index(m->endog, varnumber, yyvsp[-3].stringtype) == -1)
		  yyerror("First operand of LEAD must be a variable.");
		leadint = atoi(yyvsp[-1].stringtype);
		if (leadint <= 0)
		  yyerror("LEAD must be positive.");
		if (maxlead < leadint)
		  maxlead = leadint;
		yyval.nodetype = create_variable_node(yyvsp[-3].stringtype, leadint, NO);
		;
    break;}
case 36:
#line 341 "parse.y"
{  /* The second argument to LEAD defaults to 1 if omitted. */
		if (find_index(m->endog, varnumber, yyvsp[-1].stringtype) == -1)
		  yyerror("First operand of LEAD must be a variable.");
		if (maxlead < 1)
		  maxlead = 1;
		yyval.nodetype = create_variable_node(yyvsp[-1].stringtype, 1, NO);
		;
    break;}
case 37:
#line 352 "parse.y"
{
		yyval.nodetype = create_sum_node(yyvsp[-2].nodetype, yyvsp[0].nodetype);
		;
    break;}
case 38:
#line 359 "parse.y"
{
		n1 = create_constant_node(-1.0);
		n2 = create_product_node(n1, yyvsp[0].nodetype);
		yyval.nodetype = create_sum_node(yyvsp[-2].nodetype, n2);
		;
    break;}
case 39:
#line 368 "parse.y"
{
		yyval.nodetype = create_product_node(yyvsp[-2].nodetype, yyvsp[0].nodetype);
		;
    break;}
case 40:
#line 375 "parse.y"
{
		n1 = create_constant_node(-1.0);
		n2 = create_power_node(yyvsp[0].nodetype, n1);
		yyval.nodetype = create_product_node(yyvsp[-2].nodetype, n2);
		;
    break;}
case 41:
#line 384 "parse.y"
{
		yyval.nodetype = create_power_node(yyvsp[-2].nodetype, yyvsp[0].nodetype);
		;
    break;}
case 42:
#line 391 "parse.y"
{ 
                if (yyvsp[0].nodetype->type == CONSTANT)
                  {
		    yyval.nodetype = create_constant_node(-1.0 * yyvsp[0].nodetype->info.cons.value);
		    free(yyvsp[0].nodetype);
		  }
                else
                  {
		    n1 = create_constant_node(-1.0);
		    yyval.nodetype = create_product_node(n1, yyvsp[0].nodetype);
		  }
		;
    break;}
}
   /* the action file gets copied in in place of this dollarsign */
#line 498 "/usr/share/bison.simple"

  yyvsp -= yylen;
  yyssp -= yylen;
#ifdef YYLSP_NEEDED
  yylsp -= yylen;
#endif

#if YYDEBUG != 0
  if (yydebug)
    {
      short *ssp1 = yyss - 1;
      fprintf (stderr, "state stack now");
      while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
      fprintf (stderr, "\n");
    }
#endif

  *++yyvsp = yyval;

#ifdef YYLSP_NEEDED
  yylsp++;
  if (yylen == 0)
    {
      yylsp->first_line = yylloc.first_line;
      yylsp->first_column = yylloc.first_column;
      yylsp->last_line = (yylsp-1)->last_line;
      yylsp->last_column = (yylsp-1)->last_column;
      yylsp->text = 0;
    }
  else
    {
      yylsp->last_line = (yylsp+yylen-1)->last_line;
      yylsp->last_column = (yylsp+yylen-1)->last_column;
    }
#endif

  /* Now "shift" the result of the reduction.
     Determine what state that goes to,
     based on the state we popped back to
     and the rule number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTBASE] + *yyssp;
  if (yystate >= 0 && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTBASE];

  goto yynewstate;

yyerrlab:   /* here on detecting error */

  if (! yyerrstatus)
    /* If not already recovering from an error, report this error.  */
    {
      ++yynerrs;

#ifdef YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (yyn > YYFLAG && yyn < YYLAST)
	{
	  int size = 0;
	  char *msg;
	  int x, count;

	  count = 0;
	  /* Start X at -yyn if nec to avoid negative indexes in yycheck.  */
	  for (x = (yyn < 0 ? -yyn : 0);
	       x < (sizeof(yytname) / sizeof(char *)); x++)
	    if (yycheck[x + yyn] == x)
	      size += strlen(yytname[x]) + 15, count++;
	  msg = (char *) malloc(size + 15);
	  if (msg != 0)
	    {
	      strcpy(msg, "parse error");

	      if (count < 5)
		{
		  count = 0;
		  for (x = (yyn < 0 ? -yyn : 0);
		       x < (sizeof(yytname) / sizeof(char *)); x++)
		    if (yycheck[x + yyn] == x)
		      {
			strcat(msg, count == 0 ? ", expecting `" : " or `");
			strcat(msg, yytname[x]);
			strcat(msg, "'");
			count++;
		      }
		}
	      yyerror(msg);
	      free(msg);
	    }
	  else
	    yyerror ("parse error; also virtual memory exceeded");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror("parse error");
    }

  goto yyerrlab1;
yyerrlab1:   /* here on error raised explicitly by an action */

  if (yyerrstatus == 3)
    {
      /* if just tried and failed to reuse lookahead token after an error, discard it.  */

      /* return failure if at end of input */
      if (yychar == YYEOF)
	YYABORT;

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Discarding token %d (%s).\n", yychar, yytname[yychar1]);
#endif

      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token
     after shifting the error token.  */

  yyerrstatus = 3;		/* Each real token shifted decrements this */

  goto yyerrhandle;

yyerrdefault:  /* current state does not do anything special for the error token. */

#if 0
  /* This is wrong; only states that explicitly want error tokens
     should shift them.  */
  yyn = yydefact[yystate];  /* If its default is to accept any token, ok.  Otherwise pop it.*/
  if (yyn) goto yydefault;
#endif

yyerrpop:   /* pop the current state because it cannot handle the error token */

  if (yyssp == yyss) YYABORT;
  yyvsp--;
  yystate = *--yyssp;
#ifdef YYLSP_NEEDED
  yylsp--;
#endif

#if YYDEBUG != 0
  if (yydebug)
    {
      short *ssp1 = yyss - 1;
      fprintf (stderr, "Error: state stack now");
      while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
      fprintf (stderr, "\n");
    }
#endif

yyerrhandle:

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yyerrdefault;

  yyn += YYTERROR;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != YYTERROR)
    goto yyerrdefault;

  yyn = yytable[yyn];
  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrpop;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrpop;

  if (yyn == YYFINAL)
    YYACCEPT;

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Shifting error token, ");
#endif

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  yystate = yyn;
  goto yynewstate;
}
#line 405 "parse.y"
