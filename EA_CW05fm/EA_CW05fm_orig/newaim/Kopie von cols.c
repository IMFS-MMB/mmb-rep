#include <stdlib.h>

void compute_aim_data(param, np, modname, neq, nlag, nlead,
                      eqname, eqtype, endog, delay, vtype)
     char ***param, **modname, ***eqname, ***endog;
     int *np, *neq, *nlag, *nlead, **eqtype, **delay, **vtype;
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


void compute_aim_matrices(p, g, h)
     double *p, **g, **h;
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

  (*g)[66] = (*g)[66] + 1;
  (*g)[30] = (*g)[30] - 1;
  (*g)[37] = (*g)[37] + 1;
  (*g)[1] = (*g)[1] - (1.000*1);
  (*g)[1] = (*g)[1] - ((-1.000*LAMBDA)*1);
  (*g)[43] = (*g)[43] - (LAMBDA*1);
  (*g)[44] = (*g)[44] + 1;
  (*g)[38] = (*g)[38] - (LAMBDA*1);
  (*g)[50] = (*g)[50] - (LAMBDA*(-1.000*(CRHO*1)));
  (*g)[68] = (*g)[68] - (LAMBDA*(-1.000*(CRHO*(-1.000*(RHOBAR*1)))));
  (*h)[80] = (*h)[80] - (1.000*1);
  (*h)[80] = (*h)[80] - ((-1.000*LAMBDA)*1);
  (*g)[51] = (*g)[51] + (-1.000*1);
  (*g)[51] = (*g)[51] - (RHOBAR*1);
  (*g)[63] = (*g)[63] - (RHOBAR*(-1.000*1));
  (*h)[87] = (*h)[87] + 1;
  (*h)[75] = (*h)[75] - (RHOBAR*1);
  (*g)[58] = (*g)[58] + (-1.000*1);
  (*g)[58] = (*g)[58] - (RHOBAR*1);
  (*g)[64] = (*g)[64] - (-1.000*1);
  (*g)[70] = (*g)[70] - (-1.000*(-1.000*(RHOBAR*1)));
  (*h)[94] = (*h)[94] + 1;
  (*h)[76] = (*h)[76] - (-1.000*(-1.000*1));
  (*g)[65] = (*g)[65] + 1;
  (*g)[29] = (*g)[29] + (-1.000*1);
  (*g)[71] = (*g)[71] - (ALPHAPI*(-1.000*(PIBAR*1)));
  (*h)[5] = (*h)[5] - (ALPHAPI*1);
}
