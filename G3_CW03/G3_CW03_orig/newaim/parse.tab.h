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


extern YYSTYPE yylval;
