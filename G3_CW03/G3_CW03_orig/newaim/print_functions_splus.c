
#include "header.h"


void print_function(m)
     struct model *m;
{

/*****************************************************************
  This version of print_functions() is for use with SPlus. A
  slightly different version of the function, for use with
  Matlab, is in the file print_functions.c.
******************************************************************/

/*****************************************************************
  This function prints out the two C functions, compute_aim_data
  and compute_aim_matrices, in K&R 1st Edition (pre-ANSI) C.
******************************************************************/

/*****************************************************************
  First print out the function compute_aim_data(). This function 
  will return various information about the AIM model, but will 
  not compute the G and H matrices.
******************************************************************/

  int i;

  printf("#include <stdlib.h>\n\n");
  printf("extern double pow();\n\n");

  printf("void compute_aim_data(param, np, modname, neq, nlag, nlead,\n");
  printf("                      ");
  printf("eqname, eqtype, endog, delay, vtype)\n");

  printf("     char **param, **modname, **eqname, **endog;\n");
  printf("     int *np, *neq, *nlag, *nlead, *eqtype, *delay, *vtype;\n");
  printf("{\n");

  printf("  *modname = \"%s\";\n", m->modelname);
  printf("  *neq = %d;\n", m->neq);
  printf("  *np = %d;\n", m->ncoeffs);
  printf("  *nlag = %d;\n", m->nlag);
  printf("  *nlead = %d;\n", m->nlead);
  printf("\n");

  for (i = 0; i < m->neq; i++)
    printf("  eqname[%d] = \"%s\";\n", i, m->eqname[i]);
  printf("\n");

  for (i = 0; i < m->neq; i++)
    {
      printf("  eqtype[%d] = %d;   ", i, m->eqtype[i]);
      if (i % 3 == 2)
	printf("\n");
    }
  if (i % 3 != 1)
    printf("\n");

  for (i = 0; i < m->ncoeffs; i++)
    printf("  param[%d] = \"%s\";\n", i, m->cname[i]);
  printf("\n");

  for (i = 0; i < m->neq; i++)
    printf("  endog[%d] = \"%s\";\n", i, m->endog[i]);
  printf("\n");

  for (i = 0; i < m->neq; i++)
    {
      printf("  delay[%d] = %d;   ", i, m->delay[i]);
      if (i % 3 == 2)
	printf("\n");
    }
  if (i % 3 != 1)
    printf("\n");

  for (i = 0; i < m->neq; i++)
    {
      printf("  vtype[%d] = %d;   ", i, m->vtype[i]);
      if (i % 3 == 2)
	printf("\n");
    }
  if (i % 3 != 1)
    printf("\n");

  printf("}\n\n\n");


/*****************************************************************
  Now print out the function compute_aim_matrices(). This function
  will compute the G and H matrices.
******************************************************************/

  printf("void compute_aim_matrices(p, g, h)\n");
  printf("     double *p, *g, *h;\n");
  printf("{\n");
  if (m->ncoeffs > 0)
    {
      printf("  double ");
      for (i = 0; i < m->ncoeffs; i++)
	{
	  printf("%s", m->cname[i]);
	  if (i == m->ncoeffs - 1)
	    printf(";\n");
	  else if (i % 3 == 2)
	    printf(",\n         ");
	  else
	    printf(", ");
	}
    }
  
  printf("  int i;\n");
  printf("\n");

  for (i = 0; i < m->ncoeffs; i++)
    printf("  %s = p[%d];\n", m->cname[i], i);
  printf("\n");

  printf("  for (i = 0; i < %d; i++)\n",
	  (m->nlag + 1) * m->neq * m->neq);
  printf("    g[i] = 0.0;\n");
  printf("\n");

  printf("  for (i = 0; i < %d; i++)\n",
	  (m->nlag + 1 + m->nlead) * m->neq * m->neq);
  printf("    h[i] = 0.0;\n");
  printf("\n");

  for (i = 0; i < m->neq; i++)
    {
      print_g_matrix_entries(m->eqns[i].LHS, m, i, LEFT_SIDE);
      print_g_matrix_entries(m->eqns[i].RHS, m, i, RIGHT_SIDE);
      print_h_matrix_entries(m->eqns[i].LHS, m, i, LEFT_SIDE);
      print_h_matrix_entries(m->eqns[i].RHS, m, i, RIGHT_SIDE);
    }

  printf("}\n");
}




