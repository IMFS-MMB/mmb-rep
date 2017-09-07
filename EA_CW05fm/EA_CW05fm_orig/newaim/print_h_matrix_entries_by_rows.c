
#include "header.h"

/*******************************************************************
  print_h_matrix_entries() prints out the h matrix entries for the 
  subtree rooted at its first argument, using the information in
  its other arguments. This function relies on the equation being
  in sum of products form.

  This version of the function prints the matrix entries ROW BY ROW, 
  rather than column by column. Since Fortran and MatLab store matrix 
  entries column by column, the other version of this function (the 
  one in print_h_matrix_entries.c) will probably be more commonly 
  used.)
********************************************************************/

void print_h_matrix_entries(n, m, eqnum, side)
     struct node *n; struct model *m; int eqnum; enum sidetype side;
{
  int index;
  struct node *vterm;

  switch (n->type) {
  case CONSTANT: case COEFFICIENT: case POWER:
    fprintf(stderr, 
	    "Error in equation %d: Additive constants not permitted.\n",
	    eqnum + 1);
    exit(1);
    break;
  case VARIABLE: 
    if ((n->info.var.period > 0) || (n->info.var.elag == YES))
      {
	index = (eqnum + 1) * (m->neq * (m->nlag + 1 + m->nlead)) -
	  (m->nlead + 1 - n->info.var.period) * m->neq +
	    find_index(m->endog, m->neq, n->info.var.name);
	printf("  (*h)[%d] = (*h)[%d]", index, index);
	if (side == LEFT_SIDE)
	  printf(" + 1;\n");
	else
	  printf(" - 1;\n");
      }
    break;
  case SUM:
    print_h_matrix_entries(n->info.sum.summand1, m, eqnum, side);
    print_h_matrix_entries(n->info.sum.summand2, m, eqnum, side);
    break;
  case PRODUCT:
    vterm = find_variable(n);
    if (vterm == NULL)
      {
	fprintf(stderr, "Error in equation %d: No variable in term.\n",
		eqnum + 1);
	exit(1);
      }
    if ((vterm->info.var.period > 0) || (vterm->info.var.elag == YES))
      {
	index = (eqnum + 1) * (m->neq * (m->nlag + 1 + m->nlead)) -
	  (m->nlead + 1 - vterm->info.var.period) * m->neq +
	    find_index(m->endog, m->neq, vterm->info.var.name);
	printf("  (*h)[%d] = (*h)[%d]", index, index);
	if (side == RIGHT_SIDE)
	  printf(" - ");
	else
	  printf(" + ");
	print_term(n);
	printf(";\n");
      }
    break;
  default:
    fprintf(stderr, "In print_h_matrix_entries:");
    error(INVALID_NODE_TYPE);
  }
  return;
}

