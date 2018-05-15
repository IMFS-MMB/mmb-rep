
#include "header.h"

/*******************************************************************
  print_subtree() prints out the subtree rooted at the node pointed
  to by its argument.
********************************************************************/

void print_subtree(n)
     struct node *n;
{
  switch (n->type) {
  case CONSTANT: 
    if (n->info.cons.value < 0)
      printf("(");
    printf("%.8f", n->info.cons.value);
    if (n->info.cons.value < 0)
      printf(")");
    break;
  case COEFFICIENT: 
    printf("%s", n->info.coeff.name);
    break;
  case VARIABLE: 
    if (n->info.var.elag == YES)
      printf("ELAG(%s,%d)", n->info.var.name, 
	      -1 * n->info.var.period);
    else if (n->info.var.period > 0)
      printf("LEAD(%s,%d)", n->info.var.name, n->info.var.period);
    else if (n->info.var.period < 0)
      printf("LAG(%s,%d)", n->info.var.name, 
	      -1 * n->info.var.period);
    else
      printf("%s", n->info.var.name);
    break;
  case SUM:
    printf("(");
    print_subtree(n->info.sum.summand1);
    printf(" +\n            ");
    print_subtree(n->info.sum.summand2);
    printf(")");
    break;
  case PRODUCT:
    printf("(");
    print_subtree(n->info.prod.multiplicand1);
    printf(" * ");
    print_subtree(n->info.prod.multiplicand2);
    printf(")");
    break;
  case POWER:
    print_subtree(n->info.power.base);
    printf("^(");
    print_subtree(n->info.power.exponent);
    printf(")");
    break;
  default:
    fprintf(stderr, "In print_subtree:");
    error(INVALID_NODE_TYPE);
  }
}

