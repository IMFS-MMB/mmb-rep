
#include "header.h"

/*********************************************************************
  expand_subtree expands the subtree pointed to by n into sum of 
  products form, and returns a pointer to the resulting subtree.
  Note that the base and exponent subtrees of a POWER node will 
  not be expanded into sum of products form, which is fine since
  they can't contain variables anyway, so they can't cause any
  nonlinearity.
**********************************************************************/

struct node *expand_subtree(n)
     struct node *n;
{
  struct node *sumnode1;
  struct node *sumnode2;
  struct node *sumnode3;
  struct node *prodnode1;
  struct node *prodnode2;
  struct node *prodnode3;
  struct node *prodnode4;
  struct node *left;
  struct node *right;

  switch (n->type) {
  case CONSTANT: case COEFFICIENT: case VARIABLE: 
    return n;
    break;
  case SUM:
    n->info.sum.summand1 = expand_subtree(n->info.sum.summand1);
    n->info.sum.summand2 = expand_subtree(n->info.sum.summand2);
    return n;
    break;
  case PRODUCT:
    n->info.prod.multiplicand1 = expand_subtree(n->info.prod.multiplicand1);
    n->info.prod.multiplicand2 = expand_subtree(n->info.prod.multiplicand2);
    left = n->info.prod.multiplicand1;
    right = n->info.prod.multiplicand2;

    if ((left->type == SUM) && (right->type != SUM))
      {
	prodnode1 = create_product_node(left->info.sum.summand1, right);
	prodnode2 = create_product_node(left->info.sum.summand2, 
					copy_subtree(right));
	prodnode1 = expand_subtree(prodnode1);
	prodnode2 = expand_subtree(prodnode2);
	sumnode1 = create_sum_node(prodnode1, prodnode2);
	free(left);
	free(n);
	return sumnode1;
      }
    else if ((left->type != SUM) && (right->type == SUM))
      {
	prodnode1 = create_product_node(left, right->info.sum.summand1);
	prodnode2 = create_product_node(copy_subtree(left), 
					right->info.sum.summand2);
	prodnode1 = expand_subtree(prodnode1);
	prodnode2 = expand_subtree(prodnode2);
	sumnode1 = create_sum_node(prodnode1, prodnode2);
	free(right);
	free(n);
	return sumnode1;
      }
    else if ((left->type == SUM) && (right->type == SUM))
      {
	prodnode1 = create_product_node(left->info.sum.summand1, 
					right->info.sum.summand1);
	prodnode2 = 
	  create_product_node(copy_subtree(left->info.sum.summand1), 
			      right->info.sum.summand2);
	prodnode3 = 
	  create_product_node(left->info.sum.summand2,
			      copy_subtree(right->info.sum.summand1));
	prodnode4 = 
	  create_product_node(copy_subtree(left->info.sum.summand2), 
			      copy_subtree(right->info.sum.summand2));
	sumnode1 = create_sum_node(prodnode1, prodnode2);
	sumnode2 = create_sum_node(prodnode3, prodnode4);
	sumnode1 = expand_subtree(sumnode1);
	sumnode2 = expand_subtree(sumnode2);
	sumnode3 = create_sum_node(sumnode1, sumnode2);
	free(left);
	free(right);
	free(n);
	return sumnode3;
      }
    else  /* neither *left nor *right is a SUM node */
      {
	n->info.prod.multiplicand1 = 
	  expand_subtree(n->info.prod.multiplicand1);
	n->info.prod.multiplicand2 = 
	  expand_subtree(n->info.prod.multiplicand2);
	return n;
      }
    break;
  case POWER:
    return n;
    break;
  default:
    fprintf(stderr, "In expand_subtree:");
    error(INVALID_NODE_TYPE);
    return NULL;
  }
  
}


