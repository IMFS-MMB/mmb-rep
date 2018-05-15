
#include "header.h"


/***************************************************************
  This file contains the following functions:
       error_check()
       power_error_check()
       product_error_check()
****************************************************************/

int error_check(m)
     struct model *m;
{

/****************************************************************
  error_check() checks for: 
       No variables inside of base or exponent.
       Exactly one variable per term (no additive constants or
       products of variables are permitted).
  If an error is found error_check() returns a nonzero value.     
*****************************************************************/

  int i;
  int error_found = 0;

  fprintf(stderr, "Checking for errors......\n");

  for (i = 0; i < m->neq; i++)
    {
      if ((power_error_check(m->eqns[i].LHS) > 0) ||
	  (power_error_check(m->eqns[i].RHS) > 0))
	{
	  fprintf(stderr, "Error in equation #%d: ", i+1);
	  fprintf(stderr, "Variables cannot be raised to a power nor ");
	  fprintf(stderr, "appear\n                    in an exponent");
	  fprintf(stderr, " or denominator.\n");
	  error_found++;
	}

      if ((product_error_check(m->eqns[i].LHS) > 1) ||
	  (product_error_check(m->eqns[i].RHS) > 1))
	{
	  fprintf(stderr, "Error in equation #%d: ", i+1);
	  fprintf(stderr, "Equation has additive constant or is nonlinear\n");
	  fprintf(stderr, "                    in its variables.\n");
	  error_found++;
	}
    }
  return error_found;
}


int power_error_check(n)
     struct node *n;
{

/*******************************************************************
  power_error_check() returns the number of instances of a variable
  occurring inside of the base or exponent of a POWER node in the 
  subtree rooted at *n.
********************************************************************/

  switch (n->type) {
  case CONSTANT: case COEFFICIENT: case VARIABLE: 
    return 0;
    break;
  case SUM:
    return (power_error_check(n->info.sum.summand1) +
	    power_error_check(n->info.sum.summand2));
    break;
  case PRODUCT:
    return (power_error_check(n->info.prod.multiplicand1) +
	    power_error_check(n->info.prod.multiplicand2));
    break;
  case POWER:
    return (count_variables(n->info.power.base) +
	    count_variables(n->info.power.exponent));
    break;
  default:
    fprintf(stderr, "In power_error_check:");
    error(INVALID_NODE_TYPE);
  }
}

int product_error_check(n)
     struct node *n;
{

/*******************************************************************
  product_error_check() checks if either of the two following types
  of errors are present: 1) two variables are multiplied together,
  or 2) there is an additive constant term. product_error_check()
  returns >1 if any such errors are detected, and 1 otherwise.
  IMPORTANT: Note that the value 1, not 0, is returned if no errors
  are found. It's not standard, but it makes it easier to write the
  function.

  To check for the first error condition, the number of variables
  in the subtree rooted at each PRODUCT node is found; if it is
  greater than 1, an error is propogated up the tree. To check for
  the second error condition, the function looks for a subtree of
  a SUM node that contains no variables.
  
  IMPORTANT: Note that this function relies on expand_subtree() 
  having been called on n, since it assumes that there is no PRODUCT 
  component above any SUM component in the subtree.
********************************************************************/

  int result1;
  int result2;

  switch (n->type) {
  case CONSTANT: case COEFFICIENT:
    return 0;
    break;
  case VARIABLE: 
    return 1;
    break;
  case SUM:
    /* If either subtree has a value of zero, then there is an
       additive constant term. In this case return 2 to assure 
       that the error is detected. Otherwise, return larger value 
       of subtree values. */
    result1 = product_error_check(n->info.sum.summand1);
    result2 = product_error_check(n->info.sum.summand2);
    if ((result1 == 0) || (result2 == 0))
      return 2;
    else if (result1 > result2)
      return result1;
    else
      return result2;
    break;
  case PRODUCT:
    /* Return sum of subtree values. */
    return (product_error_check(n->info.prod.multiplicand1) +
	    product_error_check(n->info.prod.multiplicand2));
    break;
  case POWER:
    return (count_variables(n->info.power.base) +
	    count_variables(n->info.power.exponent));
    break;
  default:
    fprintf(stderr, "In product_error_check:");
    error(INVALID_NODE_TYPE);
  }
}

