
#include "header.h"

/*****************************************************************
  This version of print_g_matrix_entries() is for use with SPlus.
  A slightly different version of the function, for use with
  Matlab, is in the file print_g_matrix_entries.c.
******************************************************************/

/*******************************************************************
  print_g_matrix_entries() prints out the g matrix entries for the 
  subtree rooted at its first argument, using the information in
  its other arguments. This function relies on the equation being
  in sum of products form.

  This version of the function prints out the matrix entries column
  by column, to be consistent with the way Fortran and MatLab store
  matrices.
********************************************************************/

void print_g_matrix_entries(n, m, eqnum, side)
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
    if ((n->info.var.period <= 0) && (n->info.var.elag == NO))
      {
	index = ((n->info.var.period + m->nlag) * m->neq +
		 find_index(m->endog, m->neq, n->info.var.name))
	  * m->neq + eqnum;
	printf("  g[%d] = g[%d]", index, index);
	if (side == LEFT_SIDE)
	  printf(" + 1;\n");
	else
	  printf(" - 1;\n");
      }
    break;
  case SUM:
    print_g_matrix_entries(n->info.sum.summand1, m, eqnum, side);
    print_g_matrix_entries(n->info.sum.summand2, m, eqnum, side);
    break;
  case PRODUCT:
    vterm = find_variable(n);
    if (vterm == NULL)
      {
	fprintf(stderr, "Error in equation %d: No variable in term.\n",
		eqnum + 1);
	exit(1);
      }
    if ((vterm->info.var.period <= 0) && (vterm->info.var.elag == NO))
      {
	index = ((vterm->info.var.period + m->nlag) * m->neq +
		 find_index(m->endog, m->neq, vterm->info.var.name))
	  * m->neq + eqnum;
	printf("  g[%d] = g[%d]", index, index);
	if (side == RIGHT_SIDE)
	  printf(" - ");
	else
	  printf(" + ");
	print_term(n);
	printf(";\n");
      }
    break;
  default:
    fprintf(stderr, "In print_g_matrix_entries:");
    error(INVALID_NODE_TYPE);
  }
  return;
}

