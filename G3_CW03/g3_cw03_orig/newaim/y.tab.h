
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
extern YYSTYPE yylval;
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
