%{
/*********************************************************************
                         LEX file for Aim parser
**********************************************************************/

#include "header.h"
#include "y.tab.h"

#define token(x)  x
#define MAX_STRING_LENGTH 25
#define TOSTDERR fprintf(stderr, "%s", yytext)

%}


exponent    [Ee][-+]?[0-9]+

%%
"MODEL"			        { TOSTDERR; return token(MODEL); }
"EQUATION"                      { TOSTDERR; return token(EQUATION); }
"EQ"                            { TOSTDERR; return token(EQ); }
"EQTYPE"                        { TOSTDERR; return token(EQTYPE); }
"ENDOG"                         { TOSTDERR; return token(ENDOG); }
">"                             { TOSTDERR; return token(PROMPT); }

"_DATA"                         { TOSTDERR; return token(_DATA); }
"_NOTD"                         { TOSTDERR; return token(_NOTD); }
"_DTRM"                         { TOSTDERR; return token(_DTRM); }

"IMPOSED"                       { TOSTDERR; return token(IMPO); }
"STOCH"                         { TOSTDERR; return token(STOC); }

"LAG"                           { TOSTDERR; return token(LAG); }
"ELAG"                          { TOSTDERR; return token(ELAG); }
"LEAD"                          { TOSTDERR; return token(LEAD); }

"END"                           { TOSTDERR; return token(END); }

"="				{ TOSTDERR; return token(EQUALS); }

","                             { TOSTDERR; return token(COMMA); }
\(                              { TOSTDERR; return token('('); }
\)                              { TOSTDERR; return token(')'); }

"^"				{ TOSTDERR; return token(POW); }
"**"				{ TOSTDERR; return token(POW); }
"\/"				{ TOSTDERR; return token(DIV); }
"+"				{ TOSTDERR; return token(PLUS); }
"*"				{ TOSTDERR; return token(MULT); }
"-"				{ TOSTDERR; return token(MINUS); }

[a-zA-Z_][a-zA-Z0-9_\.]*        { 
				  TOSTDERR; yylval.stringtype = 
				    (char *) calloc(strlen(yytext)+1, 
				                    sizeof(char));
				  strcpy(yylval.stringtype, yytext);
				  return token(SYMBOLNAME); 
				}

[0-9]+                         { 
				  TOSTDERR; yylval.stringtype = 
				    (char *) calloc(strlen(yytext)+1, 
				                    sizeof(char));
				  strcpy(yylval.stringtype, yytext);
				  return token(INTEGER);
				}

[0-9]+"."[0-9]*({exponent})?     |
[0-9]*"."[0-9]+({exponent})?     | 
[0-9]+({exponent})              { 
				  TOSTDERR; yylval.stringtype = 
				    (char *) calloc(strlen(yytext)+1, 
				                    sizeof(char));
				  strcpy(yylval.stringtype, yytext);
				  return token(REAL);
				}

[ \t\n]+                        { TOSTDERR; }

%%


