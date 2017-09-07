/******************************************************************
  This file contains a sample calling program for make_aim_arrays.
*******************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <math.h>

void make_aim_arrays(double*, char***, int*, char**, int*, int*, int*, 
		     char***, int**, char***, int**, int**, double**, 
		     double**);


/**********************************************************************
******                                                           ******
******                   SAMPLE MAIN PROGRAM                     ******
******                                                           ******
***********************************************************************/


main() {

  int i;
  int j;

  int np;
  double *p;
  char ***param = (char ***) malloc(sizeof(char**));
  char **modname = (char **) malloc(sizeof(char*));
  int neq;
  int nlag;
  int nlead;
  char ***eqname = (char ***) malloc(sizeof(char**));
  int **eqtype = (int **) malloc(sizeof(int*));
  char ***endog = (char ***) malloc(sizeof(char**));
  int **delay = (int **) malloc(sizeof(int*));
  int **vtype = (int **) malloc(sizeof(int*));
  double **g = (double **) malloc(sizeof(double*));
  double **h = (double **) malloc(sizeof(double*));

  compute_aim_data(param, &np, modname, &neq, &nlag, &nlead, 
		   eqname, eqtype, endog, delay, vtype);

  printf("Number of parameters: %d\n", np);

  printf("Parameter names:\n");
  for (i = 0; i < np; i++)
    printf("   %s\n", (*param)[i]);
  printf("\n");

  printf("Parameter names in ASCII code:\n");
  for (i = 0; i < np; i++)
    {
      j = 0;
      while ((*param)[i][j] != NULL)
	printf("%d ", (int) (*param)[i][j++]);
      printf("\n");
    }
  printf("\n");

  /***  Change the following as needed for the particular problem  ***/
  p = (double *) calloc(np, sizeof(double));
  p[0] = 0;
  p[1] = 0;
  p[2] = 1;
  p[3] = 0;
  p[4] = 0.002;
  p[5] = 0.05;
  p[6] = 0.047619;
  /***  End of stuff to change.  ***/

  compute_aim_matrices(p, g, h);

  printf("G Matrix:\n");
  for (i = 0; i < (nlag + 1) * neq * neq; i++)
    {
      printf("%.3f  ", (*g)[i]);
      if (i % ((nlag + 1) * neq) == (nlag + 1) * neq - 1)
	printf("\n");
    }
  printf("\n\n");

  printf("H Matrix:\n");
  for (i = 0; i < (nlag + 1 + nlead) * neq * neq; i++)
    {
      printf("%.3f  ", (*h)[i]);
      if (i % ((nlag + 1 + nlead) * neq) == (nlag + 1 + nlead) * neq - 1)
	printf("\n");
    }
  printf("\n\n");

  printf("Caller has terminated normally.\n");
}
