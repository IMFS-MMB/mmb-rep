%{
/*********************************************************************
                         LEX file for Aim parser
**********************************************************************/

#include "header.h"
#include "y.tab.h"

#define token(x)  x
#define MAX_STRING_LENGTH 25
%}


exponent    [Ee][-+]?[0-9]+

%%
"MODEL"			        { return token(MODEL); }
"EQUATION"                      { return token(EQUATION); }
"EQ"                            { return token(EQ); }
"EQTYPE"                        { return token(EQTYPE); }
"ENDOG"                         { return token(ENDOG); }
">"                             { return token(PROMPT); }

"_DATA"                         { return token(_DATA); }
"_NOTD"                         { return token(_NOTD); }
"_DTRM"                         { return token(_DTRM); }

"IMPOSED"                       { return token(IMPO); }
"STOCH"                         { return token(STOC); }

"LAG"                           { return token(LAG); }
"ELAG"                          { return token(ELAG); }
"LEAD"                          { return token(LEAD); }

"END"                           { return token(END); }

"="				{ return token(EQUALS); }

","                             { return token(COMMA); }
\(                              { return token('('); }
\)                              { return token(')'); }

"^"				{ return token(POW); }
"**"				{ return token(POW); }
"\/"				{ return token(DIV); }
"+"				{ return token(PLUS); }
"*"				{ return token(MULT); }
"-"				{ return token(MINUS); }

[a-zA-Z_][a-zA-Z0-9_\.]*        { 
				  yylval.stringtype = 
				    (char *) calloc(strlen(yytext)+1, 
				                    sizeof(char));
				  strcpy(yylval.stringtype, yytext);
				  return token(SYMBOLNAME); 
				}

[-]?[0-9]+                      { 
				  yylval.stringtype = 
				    (char *) calloc(strlen(yytext)+1, 
				                    sizeof(char));
				  strcpy(yylval.stringtype, yytext);
				  return token(INTEGER);
				}

[-]?[0-9]+"."[0-9]*({exponent})? |
[-]?[0-9]*"."[0-9]+({exponent})? | 
[-]?[0-9]+({exponent})           { 
				  yylval.stringtype = 
				    (char *) calloc(strlen(yytext)+1, 
				                    sizeof(char));
				  strcpy(yylval.stringtype, yytext);
				  return token(REAL);
				}

[ \t\n]+                        { }

%%


