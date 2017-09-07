
#include "header.h"

/*******************************************************************
	This version of print_term.c, called print_term_m.c, is for use with
   print_functions_m.c.  This creates the functions for use in Matlab
   using Matlab syntax not C.  Changes:  case POWER rewritten since there
   is no pow function in Matlab.  printf changed to fprintf and a file
   pointer added to the argument list.
   *******************************************************************/

/*******************************************************************
  print_term() prints out the subtree rooted at the node pointed to 
  by its argument in a style suitable for updating the G and H
  matrices. Variables are printed out as 1's.
********************************************************************/

void print_term(n, fp)
     struct node *n; FILE *fp;
{
  switch (n->type) {
  case CONSTANT: 
    fprintf(fp, "%.8f", n->info.cons.value);
    break;
  case COEFFICIENT:
    fprintf(fp, "%s", n->info.coeff.name);
    break;
  case VARIABLE: 
    fprintf(fp, "1");
    break;
  case SUM:
    fprintf(fp, "(");
    print_term(n->info.sum.summand1, fp);
    fprintf(fp, "+");
    print_term(n->info.sum.summand2, fp);
    fprintf(fp, ")");
    break;
  case PRODUCT:
    fprintf(fp, "(");
    print_term(n->info.prod.multiplicand1, fp);
    fprintf(fp, "*");
    print_term(n->info.prod.multiplicand2, fp);
    fprintf(fp, ")");
    break;
	case POWER:
    fprintf(fp, "(");
    print_term(n->info.power.base, fp);
    fprintf(fp, "^");
    print_term(n->info.power.exponent, fp);
    fprintf(fp, ")");
    break;
  default:
    fprintf(stderr, "In print_term:");
    error(INVALID_NODE_TYPE);
  }
  return;
}

