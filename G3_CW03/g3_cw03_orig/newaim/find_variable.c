
#include "header.h"

/*******************************************************************
  find_variable() returns a pointer to the first VARIABLE node it 
  finds in the subtree rooted at the node pointed to by its argument.
********************************************************************/

struct node *find_variable(n)
     struct node *n;
{
  struct node *tmpnode;

  switch (n->type) {
  case CONSTANT: case COEFFICIENT: case POWER:
    return NULL;
    break;
  case VARIABLE: 
    return n;
    break;
  case SUM:
    tmpnode = find_variable(n->info.sum.summand1);
    if (tmpnode != NULL)
      return tmpnode;
    else
      return find_variable(n->info.sum.summand2);
    break;
  case PRODUCT:
    tmpnode = find_variable(n->info.prod.multiplicand1);
    if (tmpnode != NULL)
      return tmpnode;
    else
      return find_variable(n->info.prod.multiplicand2);
    break;
  default:
    fprintf(stderr, "In find_variable:");
    error(INVALID_NODE_TYPE);
  }
  
}

