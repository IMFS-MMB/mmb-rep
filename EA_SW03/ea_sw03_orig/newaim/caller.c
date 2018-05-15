/******************************************************************
  This file contains a sample calling program for make_aim_arrays.
*******************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <math.h>

void compute_aim_data();
void compute_aim_matrices();


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
  p = (double *) calloc(5, sizeof(double));
  p[0] = 1.0;
  p[1] = 0.02;
  p[2] = 0.05;
  p[3] = 1.0;
  p[4] = 0.03;
  /***  End of stuff to change.  ***/

  compute_aim_matrices(p, g, h);

  printf("G Matrix (transposed):\n");
  for (i = 0; i < (nlag + 1) * neq * neq; i++)
    {
      printf("%.3f  ", (*g)[i]);
      if (i % neq == neq - 1)
	printf("\n");
    }
  printf("\n\n");

  printf("H Matrix (transposed):\n");
  for (i = 0; i < (nlag + 1 + nlead) * neq * neq; i++)
    {
      printf("%.3f  ", (*h)[i]);
      if (i % neq == neq - 1)
	printf("\n");
    }
  printf("\n\n");

  printf("Caller has terminated normally.\n");
}
