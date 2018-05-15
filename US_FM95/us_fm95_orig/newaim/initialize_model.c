
#include "header.h"


void initialize_model(m)
     struct model *m;
{

/***************************************************************
  initialize_model initializes the test model.
****************************************************************/

  struct node *nvar1;
  struct node *nvar2;
  struct node *nvar3;
  struct node *nvar4;
  struct node *ncoeff1;
  struct node *ncoeff2;
  struct node *ncoeff3;
  struct node *ncoeff4;
  struct node *nconst1;
  struct node *nconst2;
  struct node *nconst3;
  struct node *nconst4;
  struct node *ntimes1;
  struct node *ntimes2;
  struct node *ntimes3;
  struct node *ntimes4;
  struct node *ntimes5;
  struct node *ntimes6;
  struct node *ntimes7;
  struct node *ntimes8;
  struct node *ntimes9;
  struct node *nplus1;
  struct node *nplus2;
  struct node *nplus3;
  struct node *nplus4;
  struct node *nplus5;
  struct node *nplus6;
  struct node *nplus7;
  struct node *nplus8;
  struct node *nexp1;
  
  struct node *A, *B, *C, *D, *E, *F, *G, *H, *I, *J, *K, *L, *M, *N,
              *O, *P, *Q, *R;

  m->ncoeffs = 5;

  m->cname[0] = "LAMBDA";
  m->cname[1] = "CRHO";
  m->cname[2] = "RHOBAR";
  m->cname[3] = "ALPHAPI";
  m->cname[4] = "PIBAR";

  /* Equation "CONST" */
  nvar1 = create_variable_node("ONE", 0, NO);
  m->eqns[0].LHS = nvar1;
  nvar1 = create_variable_node("ONE", -1, NO);
  m->eqns[0].RHS = nvar1;

  /* Equation "PIDEF" */
  nvar1 = create_variable_node("PI", 0, NO);
  m->eqns[1].LHS = nvar1;
  nconst1 = create_constant_node(1.0);
  ncoeff1 = create_coefficient_node("LAMBDA");
  nconst2 = create_constant_node(-1);
  ntimes1 = create_product_node(nconst2, ncoeff1);    /* -LAMBDA */
  nplus1 = create_sum_node(nconst1, ntimes1);        /* 1 + -LAMBDA */
  nvar1 = create_variable_node("PI", -1, NO);
  ntimes2 = create_product_node(nplus1, nvar1); /* (1 - LAMBDA)*LAG(PI,1) */
  ncoeff2 = create_coefficient_node("LAMBDA");
  nvar2 = create_variable_node("WDOT", 0, NO);
  ntimes3 = create_product_node(ncoeff2, nvar2);    /* LAMBDA*WDOT */
  nplus2 = create_sum_node(ntimes2, ntimes3);
  m->eqns[1].RHS = nplus2;

  /* Equation "WAGINFL" */
  nvar1 = create_variable_node("WDOT", 0, NO);
  m->eqns[2].LHS = nvar1;
  nconst1 = create_constant_node(1.0);
  nconst2 = create_constant_node(-1);
  ncoeff1 = create_coefficient_node("LAMBDA");
  ntimes1 = create_product_node(nconst2, ncoeff1);  /* -LAMBDA */
  nplus1 = create_sum_node(nconst1, ntimes1);       /* 1 + -LAMBDA */
  nvar1 = create_variable_node("WDOT", 1, NO);
  ntimes2 = create_product_node(nplus1, nvar1); /* (1-LAMBDA)*LEAD(WDOT,1) */
  ncoeff2 = create_coefficient_node("LAMBDA");
  nvar2 = create_variable_node("PI", 0, NO);
  ncoeff3 = create_coefficient_node("CRHO");
  ncoeff4 = create_coefficient_node("RHOBAR");
  nvar4 = create_variable_node("ONE", 0, NO);
  ntimes3 = create_product_node(ncoeff4, nvar4);     /* RHOBAR*ONE */
  nvar3 = create_variable_node("RHO", 0, NO);

  nconst3 = create_constant_node(-1);
  ntimes4 = create_product_node(nconst3, ntimes3);   /* -1*RHOBAR*ONE */
  nplus2 = create_sum_node(nvar3, ntimes4);       /* RHO-RHOBAR*ONE */
  ntimes5 = create_product_node(ncoeff3, nplus2); /* CRHO*(RHO-RHOBAR*ONE) */
  nconst4 = create_constant_node(-1);
  ntimes6 = 
    create_product_node(nconst4, ntimes5); /* -CRHO*(RHO-RHOBAR*ONE) */
  nplus3 = create_sum_node(nvar2, ntimes6); /* PI-CRHO*(RHO-RHOBAR*ONE) */
  ntimes5 = 
    create_product_node(ncoeff2, 
			nplus3); /* LAMBDA*(PI-CRHO*(RHO-RHOBAR*ONE)) */
  nplus4 = create_sum_node(ntimes2, ntimes5);
  m->eqns[2].RHS = nplus4;

  /* Equation "REALR" */
  nvar1 = create_variable_node("RHO", 1, NO);
  nconst1 = create_constant_node(-1);
  nvar2 = create_variable_node("RHO", 0, NO);
  ntimes1 = create_product_node(nconst1, nvar2);  /* -RHO */
  nplus1 = create_sum_node(nvar1, ntimes1);   /* LEAD(RHO,1) - RHO */
  m->eqns[3].LHS = nplus1;
  ncoeff1 = create_coefficient_node("RHOBAR");
  nvar1 = create_variable_node("RHO", 0, NO);
  nvar2 = create_variable_node("F", 0, NO);
  nconst1 = create_constant_node(-1);
  ntimes1 = create_product_node(nconst1, nvar2);  /* -F */
  nplus1 = create_sum_node(nvar1, ntimes1);       /* RHO - F */
  nvar3 = create_variable_node("PI", 1, NO);
  nplus2 = create_sum_node(nplus1, nvar3);     /* RHO-F+LEAD(PI,1) */
  ntimes2 = 
    create_product_node(ncoeff1, nplus2);  /* RHOBAR*(RHO-F+LEAD(PI,1)) */
  m->eqns[3].RHS = ntimes2;

  /* Equation "RELCP" */
  nvar1 = create_variable_node("V", 1, NO);
  nconst1 = create_constant_node(-1);
  nvar2 = create_variable_node("V", 0, NO);
  ntimes1 = create_product_node(nconst1, nvar2);  /* -V */
  nplus1 = create_sum_node(nvar1, ntimes1);     /* LEAD(V,1) - V */
  m->eqns[4].LHS = nplus1;
  ncoeff1 = create_coefficient_node("RHOBAR");
  nvar1 = create_variable_node("V", 0, NO);
  ntimes1 = create_product_node(ncoeff1, nvar1);      /* RHOBAR*V */
  nvar2 = create_variable_node("F", 0, NO);
  nconst1 = create_constant_node(-1);
  nvar3 = create_variable_node("PI", 1, NO);
  ntimes2 = create_product_node(nconst1, nvar3);  /* -LEAD(PI,1) */
  nplus1 = create_sum_node(nvar2, ntimes2);       /* F - LEAD(PI,1) */
  ncoeff2 = create_coefficient_node("RHOBAR");
  nvar4 = create_variable_node("ONE", 0, NO);
  ntimes3 = create_product_node(ncoeff2, nvar4);   /* RHOBAR*ONE */
  nconst2 = create_constant_node(-1);
  ntimes4 = create_product_node(nconst2, ntimes3);   /* -RHOBAR*ONE */
  nplus2 = create_sum_node(nplus1, 
			   ntimes4); /* (F-LEAD(PI,1))-RHOBAR*ONE */
  nconst3 = create_constant_node(-1);
  ntimes5 = 
    create_product_node(nconst3, nplus2); /* -((F-LEAD(PI,1))-RHOBAR*ONE) */
  nplus3 = create_sum_node(ntimes1, ntimes5);
  m->eqns[4].RHS = nplus3;

  /* Equation "REACTION" */
  nvar1 = create_variable_node("F", 0, NO);
  nvar2 = create_variable_node("F", -1, NO);
  nconst1 = create_constant_node(-1);
  ntimes1 = create_product_node(nconst1, nvar2);  /* -LAG(F,1) */
  nplus1 = create_sum_node(nvar1, ntimes1);       /* F - LAG(F,1) */
  m->eqns[5].LHS = nplus1;
  ncoeff1 = create_coefficient_node("ALPHAPI");
  nvar3 = create_variable_node("PI", -1, YES);
  ncoeff2 = create_coefficient_node("PIBAR");
  nvar4 = create_variable_node("ONE", 0, NO);
  ntimes1 = create_product_node(ncoeff2, nvar4);    /* PIBAR*ONE */
  nconst1 = create_constant_node(-1);
  ntimes2 = create_product_node(nconst1, ntimes1);  /* -PIBAR*ONE */
  nplus1 = create_sum_node(nvar3, ntimes2); /* ELAG(PI,1) - PIBAR*ONE */
  ntimes3 = create_product_node(ncoeff1, nplus1);
  m->eqns[5].RHS = ntimes3;

  /********** Test model has been constructed ************/

  /*********** Equation to test expand_subtree() *********/

  A = create_variable_node("A", 0, NO);
  B = create_variable_node("B", 0, NO);
  C = create_variable_node("C", 0, NO);
  D = create_variable_node("D", 0, NO);
  E = create_variable_node("E", 0, NO);
  F = create_variable_node("F", 0, NO);
  G = create_variable_node("G", 0, NO);
  H = create_variable_node("H", 0, NO);
  I = create_variable_node("I", 0, NO);
  J = create_variable_node("J", 0, NO);
  K = create_variable_node("K", 0, NO);
  L = create_variable_node("L", 0, NO);
  M = create_variable_node("M", 0, NO);
  N = create_variable_node("N", 0, NO);
  O = create_variable_node("O", 0, NO);
  P = create_variable_node("P", 0, NO);
  Q = create_variable_node("Q", 0, NO);
  R = create_variable_node("R", 0, NO);
  nplus1 = create_sum_node(Q,R);
  ntimes1 = create_product_node(P,nplus1);
  nplus2 = create_sum_node(O,ntimes1);
  ntimes2 = create_product_node(N,nplus2);
  nplus3 = create_sum_node(M,ntimes2);
  ntimes3 = create_product_node(F,nplus3);
  nplus4 = create_sum_node(E,ntimes3);
  nplus6 = create_sum_node(J,K);
  ntimes4 = create_product_node(D,nplus4);
  nplus5 = create_sum_node(C,ntimes4);
  ntimes5 = create_product_node(B,nplus5);
  ntimes6 = create_product_node(I,nplus6);
  nconst1 = create_constant_node(2);
  nexp1 = create_power_node(ntimes6, nconst1);
  ntimes7 = create_product_node(H,nexp1);
  nplus7 = create_sum_node(ntimes7,L);
  ntimes8 = create_product_node(G,nplus7);
  nplus8 = create_sum_node(ntimes5,ntimes8);
  ntimes9 = create_product_node(A,nplus8);
  m->eqns[6].LHS = ntimes9;
  nconst2 = create_constant_node(0);
  m->eqns[6].RHS = nconst2;

  /*******************************************************/

  m->neq = 6;  /* 7 if include the equationto test expand_subtree() */
  m->nlag = 1;
  m->nlead = 1;
  m->modelname = "JEFFMOD";

  m->endog[0] = "PI";
  m->delay[0] = 1;
  m->vtype[0] = DATA;
  m->endog[1] = "WDOT";
  m->delay[1] = 1;
  m->vtype[1] = NOTD;
  m->endog[2] = "RHO";
  m->delay[2] = 0;
  m->vtype[2] = NOTD;
  m->endog[3] = "V";
  m->delay[3] = 1;
  m->vtype[3] = NOTD;
  m->endog[4] = "F";
  m->delay[4] = 0;
  m->vtype[4] = DATA;
  m->endog[5] = "ONE";
  m->delay[5] = 1;
  m->vtype[5] = DTRM;

  m->eqtype[0] = IMPOSED;
  m->eqtype[1] = IMPOSED;
  m->eqtype[2] = STOCH;
  m->eqtype[3] = IMPOSED;
  m->eqtype[4] = IMPOSED;
  m->eqtype[5] = STOCH;

  m->eqname[0] = "CONST";
  m->eqname[1] = "PIDEF";
  m->eqname[2] = "WAGINFL";
  m->eqname[3] = "REALR";
  m->eqname[4] = "RELCP";
  m->eqname[5] = "REACTION";

}

