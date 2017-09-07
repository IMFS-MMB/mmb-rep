
#include "header.h"

/*********************************************************************
  The function copy_subtree returns a pointer to a copy of the subtree
  rooted at the node pointed to by its argument.
**********************************************************************/

struct node *copy_subtree(n) 
     struct node *n;
{
  switch (n->type) {
  case CONSTANT: 
    return create_constant_node(n->info.cons.value);
    break;
  case COEFFICIENT: 
    return create_coefficient_node(n->info.coeff.name);
    break;
  case VARIABLE: 
    return create_variable_node(n->info.var.name, n->info.var.period,
				n->info.var.elag);
    break;
  case SUM:
    return create_sum_node(copy_subtree(n->info.sum.summand1),
			   copy_subtree(n->info.sum.summand2));
    break;
  case PRODUCT:
    return create_product_node(copy_subtree(n->info.prod.multiplicand1),
			       copy_subtree(n->info.prod.multiplicand2));
    break;
  case POWER:
    return create_power_node(copy_subtree(n->info.power.base),
			     copy_subtree(n->info.power.exponent));
    break;
  default:
    fprintf(stderr, "In copy_subtree:");
    error(INVALID_NODE_TYPE);
    return NULL;
  }
}


