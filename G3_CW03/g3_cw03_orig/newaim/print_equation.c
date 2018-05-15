
#include "header.h"

/*******************************************************************
  print_equation() prints out equation pointed to by its argument.
********************************************************************/

void print_equation(e)
     struct equation *e;
{
  print_subtree(e->LHS);
  printf(" =\n         ");
  print_subtree(e->RHS);
  printf("\n\n");
}
