
#include "header.h"

/***************************************************************
  This file contains the functions error and yyerror.

  error prints out an appropriate error message based on the 
  errorcode it is passed.

  yyerror is an error-handling routine for yacc.

****************************************************************/

void error(code)
     enum errorcode code;
{
  fprintf(stderr, "ERROR: ");
  switch (code) {
  case WRONG_NODE_TYPE:
    fprintf(stderr, "Wrong node type.");
    break;
  case INVALID_NODE_TYPE:
    fprintf(stderr, "Invalid node type.");
    break;
  case CANNOT_ALLOCATE_MEMORY:
    fprintf(stderr, "Cannot allocate memory.");
    break;
  default:
    fprintf(stderr, "Erroneous error.");
    break;
  }
  fprintf(stderr, "\n");
}


void yyerror(s)
     char *s;
{
  extern int yynerrs;
  fprintf(stderr, "[Error %d] ", ++yynerrs);
  fprintf(stderr, "%s\n", s);
  exit(1);
}

