#include <stdlib.h>

void compute_aim_data(char ***param, int *np, char **modname,
                      int *neq, int *nlag, int *nlead, char ***eqname,
                      int **eqtype, char ***endog, int **delay,
                      int **vtype)
{
  *eqname = (char **) calloc(6, sizeof(char*));
  *param = (char **) calloc(5, sizeof(char*));
  *endog = (char **) calloc(6, sizeof(char*));
  *delay = (int *) calloc(6, sizeof(int));
  *vtype = (int *) calloc(6, sizeof(int));
  *eqtype = (int *) calloc(6, sizeof(int));

  *modname = "JEFFMOD";
  *neq = 6;
  *np = 5;
  *nlag = 1;
  *nlead = 1;

  (*eqname)[0] = "CONST";
  (*eqname)[1] = "PIDEF";
  (*eqname)[2] = "WAGINFL";
  (*eqname)[3] = "REALR";
  (*eqname)[4] = "RELCP";
  (*eqname)[5] = "REACTION";

  (*eqtype)[0] = 1;     (*eqtype)[1] = 1;     (*eqtype)[2] = 0;   
  (*eqtype)[3] = 1;     (*eqtype)[4] = 1;     (*eqtype)[5] = 0;   

  (*param)[0] = "LAMBDA";
  (*param)[1] = "CRHO";
  (*param)[2] = "RHOBAR";
  (*param)[3] = "ALPHAPI";
  (*param)[4] = "PIBAR";

  (*endog)[0] = "PI";
  (*endog)[1] = "WDOT";
  (*endog)[2] = "RHO";
  (*endog)[3] = "V";
  (*endog)[4] = "F";
  (*endog)[5] = "ONE";

  (*delay)[0] = 1;     (*delay)[1] = 1;     (*delay)[2] = 0;   
  (*delay)[3] = 1;     (*delay)[4] = 0;     (*delay)[5] = 1;   

  (*vtype)[0] = 0;     (*vtype)[1] = 1;     (*vtype)[2] = 1;   
  (*vtype)[3] = 1;     (*vtype)[4] = 0;     (*vtype)[5] = 2;   

}


void compute_aim_matrices(double *p, double **g, double **h)
{
  double LAMBDA, CRHO, RHOBAR,
         ALPHAPI, PIBAR;
  int i;

  *g = (double *) calloc(72, sizeof(double));
  *h = (double *) calloc(108, sizeof(double));

  LAMBDA = p[0];
  CRHO = p[1];
  RHOBAR = p[2];
  ALPHAPI = p[3];
  PIBAR = p[4];

  for (i = 0; i < 72; i++)
    (*g)[i] = 0.0;

  for (i = 0; i < 108; i++)
    (*h)[i] = 0.0;

  (*g)[11] = (*g)[11] + 1;
  (*g)[5] = (*g)[5] - 1;
  (*g)[18] = (*g)[18] + 1;
  (*g)[12] = (*g)[12] - (1.000*1);
  (*g)[12] = (*g)[12] - ((-1.000*LAMBDA)*1);
  (*g)[19] = (*g)[19] - (LAMBDA*1);
  (*g)[31] = (*g)[31] + 1;
  (*g)[30] = (*g)[30] - (LAMBDA*1);
  (*g)[32] = (*g)[32] - (LAMBDA*(-1.000*(CRHO*1)));
  (*g)[35] = (*g)[35] - (LAMBDA*(-1.000*(CRHO*(-1.000*(RHOBAR*1)))));
  (*h)[49] = (*h)[49] - (1.000*1);
  (*h)[49] = (*h)[49] - ((-1.000*LAMBDA)*1);
  (*g)[44] = (*g)[44] + (-1.000*1);
  (*g)[44] = (*g)[44] - (RHOBAR*1);
  (*g)[46] = (*g)[46] - (RHOBAR*(-1.000*1));
  (*h)[68] = (*h)[68] + 1;
  (*h)[66] = (*h)[66] - (RHOBAR*1);
  (*g)[57] = (*g)[57] + (-1.000*1);
  (*g)[57] = (*g)[57] - (RHOBAR*1);
  (*g)[58] = (*g)[58] - (-1.000*1);
  (*g)[59] = (*g)[59] - (-1.000*(-1.000*(RHOBAR*1)));
  (*h)[87] = (*h)[87] + 1;
  (*h)[84] = (*h)[84] - (-1.000*(-1.000*1));
  (*g)[70] = (*g)[70] + 1;
  (*g)[64] = (*g)[64] + (-1.000*1);
  (*g)[71] = (*g)[71] - (ALPHAPI*(-1.000*(PIBAR*1)));
  (*h)[90] = (*h)[90] - (ALPHAPI*1);
}
