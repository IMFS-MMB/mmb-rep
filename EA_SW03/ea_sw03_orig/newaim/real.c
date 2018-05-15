

#include <stdlib.h>

void make_aim_arrays(int np, double *p, char ***param, char **modname,
                     int *neq, int *nlag, int *nlead, char ***eqname,
                     int **eqtype, char ***endog, int **delay,
                     int **vtype, double **g, double **h)
{
  double DF1, ALPHAP, ALPHAPI,
         ALPHADPI, CRHO, RHOBAR,
         MU;
  int i;

  *eqname = (char **) calloc(11, sizeof(char*));
  *param = (char **) calloc(7, sizeof(char*));
  *endog = (char **) calloc(11, sizeof(char*));
  *delay = (int *) calloc(11, sizeof(int));
  *vtype = (int *) calloc(11, sizeof(int));
  *eqtype = (int *) calloc(11, sizeof(int));
  *g = (double *) calloc(363, sizeof(double));
  *h = (double *) calloc(484, sizeof(double));

  *modname = "REALC2";
  *neq = 11;
  *nlag = 2;
  *nlead = 1;

  (*eqname)[0] = "PI";
  (*eqname)[1] = "F";
  (*eqname)[2] = "CONTR";
  (*eqname)[3] = "INDEX";
  (*eqname)[4] = "REALC";
  (*eqname)[5] = "CSHOCK";
  (*eqname)[6] = "FSHOCK";
  (*eqname)[7] = "PISTAR";
  (*eqname)[8] = "PISHOCK";
  (*eqname)[9] = "RHO";
  (*eqname)[10] = "ONE";

  (*eqtype)[0] = 1;     (*eqtype)[1] = 1;     (*eqtype)[2] = 1;   
  (*eqtype)[3] = 1;     (*eqtype)[4] = 1;     (*eqtype)[5] = 0;   
  (*eqtype)[6] = 0;     (*eqtype)[7] = 1;     (*eqtype)[8] = 1;   
  (*eqtype)[9] = 1;     (*eqtype)[10] = 1;   
  (*param)[0] = "DF1";
  (*param)[1] = "ALPHAP";
  (*param)[2] = "ALPHAPI";
  (*param)[3] = "ALPHADPI";
  (*param)[4] = "CRHO";
  (*param)[5] = "RHOBAR";
  (*param)[6] = "MU";

  (*endog)[0] = "PI";
  (*endog)[1] = "F";
  (*endog)[2] = "REALC";
  (*endog)[3] = "CONTR";
  (*endog)[4] = "CSHOCK";
  (*endog)[5] = "INDEX";
  (*endog)[6] = "FSHOCK";
  (*endog)[7] = "PISTAR";
  (*endog)[8] = "PISHOCK";
  (*endog)[9] = "RHO";
  (*endog)[10] = "ONE";

  (*delay)[0] = 0;     (*delay)[1] = 0;     (*delay)[2] = 0;   
  (*delay)[3] = 0;     (*delay)[4] = 0;     (*delay)[5] = 0;   
  (*delay)[6] = 0;     (*delay)[7] = 0;     (*delay)[8] = 0;   
  (*delay)[9] = 0;     (*delay)[10] = 0;   
  (*vtype)[0] = 0;     (*vtype)[1] = 0;     (*vtype)[2] = 1;   
  (*vtype)[3] = 1;     (*vtype)[4] = 1;     (*vtype)[5] = 1;   
  (*vtype)[6] = 1;     (*vtype)[7] = 1;     (*vtype)[8] = 1;   
  (*vtype)[9] = 1;     (*vtype)[10] = 2;   
  DF1 = p[0];
  ALPHAP = p[1];
  ALPHAPI = p[2];
  ALPHADPI = p[3];
  CRHO = p[4];
  RHOBAR = p[5];
  MU = p[6];

  for (i = 0; i < 363; i++)
    (*g)[i] = 0.0;

  for (i = 0; i < 484; i++)
    (*h)[i] = 0.0;

  (*g)[22] = (*g)[22] + 1;
  (*g)[27] = (*g)[27] - 1;
  (*g)[16] = (*g)[16] - (-1.000*1);
  (*g)[56] = (*g)[56] + 1;
  (*g)[45] = (*g)[45] + (-1.000*1);
  (*g)[45] = (*g)[45] - (DF1*1);
  (*g)[34] = (*g)[34] - (DF1*(-1.000*1));
  (*g)[60] = (*g)[60] - (ALPHAP*1);
  (*g)[55] = (*g)[55] - (ALPHAPI*1);
  (*g)[62] = (*g)[62] - (ALPHAPI*(-1.000*1));
  (*g)[55] = (*g)[55] - (ALPHADPI*1);
  (*g)[44] = (*g)[44] - (ALPHADPI*(-1.000*1));
  (*g)[61] = (*g)[61] - 1;
  (*g)[90] = (*g)[90] + 1;
  (*g)[91] = (*g)[91] - 1;
  (*g)[93] = (*g)[93] - (-1.000*1);
  (*g)[126] = (*g)[126] + 1;
  (*g)[124] = (*g)[124] - (0.500*1);
  (*g)[113] = (*g)[113] - (0.500*1);
  (*g)[157] = (*g)[157] + 1;
  (*g)[159] = (*g)[159] + (-1.000*1);
  (*g)[146] = (*g)[146] - (0.500*1);
  (*g)[148] = (*g)[148] - (0.500*(-1.000*1));
  (*g)[163] = (*g)[163] - (-1.000*(CRHO*1));
  (*g)[164] = (*g)[164] - (-1.000*(CRHO*(-1.000*(RHOBAR*1))));
  (*g)[158] = (*g)[158] - 1;
  (*h)[212] = (*h)[212] - (0.500*1);
  (*h)[214] = (*h)[214] - (0.500*(-1.000*1));
  (*g)[191] = (*g)[191] + 1;
  (*g)[197] = (*g)[197] - (0.000*1);
  (*g)[226] = (*g)[226] + 1;
  (*g)[230] = (*g)[230] - (0.000*1);
  (*g)[260] = (*g)[260] + 1;
  (*g)[249] = (*g)[249] - 1;
  (*g)[261] = (*g)[261] - 1;
  (*g)[294] = (*g)[294] + 1;
  (*g)[296] = (*g)[296] - (0.000*1);
  (*g)[328] = (*g)[328] + 1;
  (*g)[320] = (*g)[320] - (MU*1);
  (*h)[438] = (*h)[438] - (1.000*1);
  (*h)[438] = (*h)[438] - ((-1.000*MU)*1);
  (*h)[429] = (*h)[429] - (MU*(-1.000*1));
  (*g)[362] = (*g)[362] + 1;
  (*g)[351] = (*g)[351] - 1;
}
