
#include "header.h"

/*******************************************************************
  count_variables() returns the number of occurrences of VARIABLE 
  nodes it finds in the subtree rooted at n.
********************************************************************/

int count_variables(n)
     struct node *n;
{
  switch (n->type) {
  case CONSTANT: case COEFFICIENT: 
    return 0;
    break;
  case VARIABLE: 
    return 1;
    break;
  case SUM:
    return (count_variables(n->info.sum.summand1) +
	    count_variables(n->info.sum.summand2));
    break;
  case PRODUCT:
    return (count_variables(n->info.prod.multiplicand1) +
	    count_variables(n->info.prod.multiplicand2));
    break;
  case POWER:
    return count_variables(n->info.power.base);
    break;
  default:
    fprintf(stderr, "In count_variables:");
    error(INVALID_NODE_TYPE);
  }
}

