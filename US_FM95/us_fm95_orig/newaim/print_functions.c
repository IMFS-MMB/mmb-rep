
#include "header.h"


/* this function will convert a string into lowercase*/

int str_lower(string)
char *string;
{ 
  char ch;
  while(ch=*string)
      if(isascii(ch)&&isupper(ch))
	*string++=tolower(ch);
      else 
        *string++=ch;
}

void print_function(m)
     struct model *m;
{

/*****************************************************************
  This version of print_functions.c, called print_functions_m.c is 
  for use with Matlab and generates Matlab functions, not C functions 
  as print_functions.c does.  A slightly different version of 
  print_functions.c, for use with SPlus, is in the file 
  print_functions_splus.c.
******************************************************************/

/******************************************************************
     Changes from print_functions.c:
     Functions are printed out to two files instead of standard out.  
   Therefore file pointers are added, and printf statements are replaced 
   with fprintf statements.  The syntax of the function that is being
   printed out is chagned from C to the corresponding Matalb syntax.
     print_term, print_g_matrix, and print_h_matrix all take a file pointer
   as the last argument now.
   ******************************************************************/

/*****************************************************************
  This function prints out the two functions, compute_aim_data
  and compute_aim_matrices, in K&R 1st Edition (pre-ANSI) C.
******************************************************************/

/*****************************************************************
  First print out the function compute_aim_data(). This function 
  will return various information about the AIM model, but will 
  not compute the G and H matrices.
******************************************************************/

  FILE *fp1, *fp2;
  char lowmodname[128], file1[128], file2[128] ;
  int i;


   
  /** Get modelname and lowercase - for use later in headings **/
strcpy(lowmodname, m->modelname);

 str_lower(lowmodname);


  /** Set files to write to to have model specific names **/
  strcpy(file1, m->modelname);
  str_lower(file1);
  strcat(file1, "_aim_data.m");

  fp1 = fopen(file1, "w");

  strcpy(file2, m->modelname);
  str_lower(file2);
  strcat(file2, "_aim_matrices.m");
  fp2 = fopen(file2, "w");



  /** Begin writing function out to file **/

  fprintf(fp1, "function [param_,np,modname,neq,nlag,nlead,eqname_,eqtype_,endog_,delay_,vtype_] = ...\n");
  fprintf(fp1, "     %s_aim_data()\n\n", lowmodname);
  
  fprintf(fp1, "%s %s_aim_data()\n", "%", lowmodname);
  fprintf(fp1, "%s     This function will return various information about the AIM model,\n",
"%");
  fprintf(fp1, "%s     but will not compute the G and H matrices.\n\n", "%");

  fprintf(fp1, "  eqname = cell(%d, 1);\n", m->neq);
  fprintf(fp1, "  param = cell(%d, 1);\n", m->ncoeffs);
  fprintf(fp1, "  endog = cell(%d, 1);\n", m->neq);
  fprintf(fp1, "  delay = zeros(%d, 1);\n", m->neq);
  fprintf(fp1, "  vtype = zeros(%d, 1);\n", m->neq);
  fprintf(fp1, "  eqtype = zeros(%d, 1);\n", m->neq);
  fprintf(fp1, "\n");

  fprintf(fp1, "  modname = '%s';\n", m->modelname);
  fprintf(fp1, "  neq = %d;\n", m->neq);
  fprintf(fp1, "  np = %d;\n", m->ncoeffs);
  fprintf(fp1, "  nlag = %d;\n", m->nlag);
  fprintf(fp1, "  nlead = %d;\n", m->nlead);
  fprintf(fp1, "\n");

  for (i = 0; i < m->neq; i++)
    fprintf(fp1, "  eqname(%d) = cellstr('%s');\n", i+1, m->eqname[i]);
  fprintf(fp1, "  eqname_ = char(eqname);\n");
  fprintf(fp1, "\n");

  for (i = 0; i < m->neq; i++)
    {
      fprintf(fp1, "  eqtype(%d) = %d;   ", i+1, m->eqtype[i]);
      if (i % 3 == 2)
                    fprintf(fp1, "\n");
    }
  if (i % 3 != 1)
    fprintf(fp1, "\n");
  fprintf(fp1,  "  eqtype_ = eqtype;\n");
  fprintf(fp1, "\n");
  
  for (i = 0; i < m->ncoeffs; i++)
    fprintf(fp1, "  param(%d) = cellstr('%s');\n", i+1, m->cname[i]);
     fprintf(fp1, "  param_ = char(param);\n");
     fprintf(fp1, "\n");

  for (i = 0; i < m->neq; i++)
    fprintf(fp1, "  endog(%d) = cellstr('%s');\n", i+1, m->endog[i]);
  fprintf(fp1, "  endog_ = char(endog);\n");
  fprintf(fp1, "\n");

  for (i = 0; i < m->neq; i++)
    {
      fprintf(fp1, "  delay(%d) = %d;   ", i+1, m->delay[i]);
      if (i % 3 == 2)
               fprintf(fp1, "\n");
    }
  if (i % 3 != 1)
    fprintf(fp1, "\n");
  fprintf(fp1, "  delay_ = delay;\n");
  fprintf(fp1, "\n");

  for (i = 0; i < m->neq; i++)
    {
      fprintf(fp1, "  vtype(%d) = %d;   ", i+1, m->vtype[i]);
      if (i % 3 == 2)
                    fprintf(fp1, "\n");
    }
  if (i % 3 != 1)
    fprintf(fp1, "\n");
  fprintf(fp1, "  vtype_ = vtype;\n");
  fprintf(fp1, "\n");

  fprintf(fp1, "\n\n");
     

/*****************************************************************
  Now print out the function compute_aim_matrices(). This function
  will compute the G and H matrices.  Actually this is a script not
  a function.  It is easier to deal with the parameters in Matlab if
  this part is a script since you don't have to declare them globals
  or reassign them inside the fucntion.
******************************************************************/

  /**fprintf(fp2, "function [cofg,cofh] = %s_aim_matrices()\n\n", m->lowmodname);**/

  fprintf(fp2, "%s %s_aim_matrices()\n", "%", lowmodname);
  fprintf(fp2, "%s     This script will compute the G and H matrices.\n\n", "%");

  /*fprintf(fp2, "  global");
/*  //for (i = 0; i < m->ncoeffs; i++) {
/*  //  fprintf(fp2, " %s", m->cname[i]);
/*  //  if (i % 7 == 6 && i+1 < m->ncoeffs)
/*  //           fprintf(fp2, " ...\n ");
/*  //}
/*  //fprintf(fp2, "\n\n"); */

  fprintf(fp2, "  g = zeros(%d, %d);\n", m->neq,
       (m->nlag + 1) * m->neq);
  fprintf(fp2, "  h = zeros(%d, %d);\n", m->neq,
       (m->nlag + 1 + m->nlead) * m->neq);
  fprintf(fp2, "\n");

  for (i = 0; i < m->neq; i++)
     {
      print_g_matrix_entries(m->eqns[i].LHS, m, i, LEFT_SIDE, fp2);
      print_g_matrix_entries(m->eqns[i].RHS, m, i, RIGHT_SIDE, fp2);
      print_h_matrix_entries(m->eqns[i].LHS, m, i, LEFT_SIDE, fp2);
      print_h_matrix_entries(m->eqns[i].RHS, m, i, RIGHT_SIDE, fp2);
    }

  fprintf(fp2, "\n");
  fprintf(fp2, "  cofg = g;\n");
  fprintf(fp2, "  cofh = h;\n");

  fclose(fp1);
  fclose(fp2); 
}




