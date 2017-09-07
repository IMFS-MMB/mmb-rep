
#include "header.h"

/*******************************************************************
	This version of print_g_matrix_entries.c, 
   called print_g_matrix_entries_m.c, is for use with
   print_functions_m.c.  This creates the functions for use in Matlab
   using Matlab syntax not C.  Changes:  printf changed to fprintf and 
   a file pointer added to the argument list.  Function syntax being 
   printed out with fprintf changed from C to corresponding Matlab.
   *******************************************************************/

/*******************************************************************
  print_g_matrix_entries() prints out the g matrix entries for the 
  subtree rooted at its first argument, using the information in
  its other arguments. This function relies on the equation being
  in sum of products form.

  This version of the function prints out the matrix entries column
  by column, to be consistent with the way Fortran and MatLab store
  matrices.
********************************************************************/

void print_g_matrix_entries(n, m, eqnum, side, fp)
     struct node *n; struct model *m; int eqnum; enum sidetype side; FILE *fp;
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
	fprintf(fp, "  g(%d) = g(%d)", index+1, index+1);
	if (side == LEFT_SIDE)
	  fprintf(fp, " + 1;\n");
	else
	  fprintf(fp, " - 1;\n");
      }
    break;
  case SUM:
    print_g_matrix_entries(n->info.sum.summand1, m, eqnum, side, fp);
    print_g_matrix_entries(n->info.sum.summand2, m, eqnum, side, fp);
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
	fprintf(fp, "  g(%d) = g(%d)", index+1, index+1);	
	if (side == RIGHT_SIDE)
	  fprintf(fp, " - ");
	else
	  fprintf(fp, " + ");
	print_term(n, fp);
	fprintf(fp, ";\n");
      }
    break;
  default:
    fprintf(stderr, "In print_g_matrix_entries:");
    error(INVALID_NODE_TYPE);
  }
  return;
}

