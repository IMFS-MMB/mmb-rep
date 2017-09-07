/**********************************************************************
  This file contains the Main program of the Aim parser. It takes one
  command line argument, the name of the model file.
***********************************************************************/

#include "header.h"


/**********************************************************************
******                                                           ******
******                      MAIN PROGRAM                         ******
******                                                           ******
***********************************************************************/

int yyparse();

FILE *yyin;
struct model *m;

main(argc, argv)
     int argc; char **argv;
{
  int i;
  int errcount;

  char *pathnam;
  char *orig_pathnam;
  int counter, strind;

  pathnam = calloc(1, strlen(argv[1]) + 1);
  orig_pathnam = pathnam;

  strcpy(pathnam,argv[1]);
  printf("Pathnam=%s",pathnam);

  strind=strlen(pathnam);
  counter=0;

   while ( strind > 0 && pathnam[strind-1] != '/' && pathnam[strind-1] != '\\') { 
         counter++;
         strind--;
   } 

   if (strind > 0)
     {
       pathnam += strind;
     }

  m = (struct model *) malloc(sizeof(struct model));
  if (m == NULL) 
    {
      error(CANNOT_ALLOCATE_MEMORY);
      exit(1);
    }

  if (argc != 2) {
    fprintf(stderr, "You must supply the filename of the model.\n");
    exit(1);
  }
  if ((yyin = fopen(argv[1],"r")) == NULL) {
    fprintf(stderr, "Can't open file %s.\n", argv[1]);
    exit(1);
  }
  
  if (yyparse())
    {
      fprintf(stderr, "Model didn't parse.\n");
      exit(1);
    }

/****** DEBUG
  for (i = 0; i < m->neq; i++)
    print_equation(&(m->eqns[i]));
*************/

  for (i = 0; i < m->neq; i++)
    {
      m->eqns[i].LHS = expand_subtree(m->eqns[i].LHS);
      m->eqns[i].RHS = expand_subtree(m->eqns[i].RHS);
    }

  errcount = error_check(m);

  if (errcount == 0)
    fprintf(stderr, "No errors found.\n");
  else
    {
      fprintf(stderr, "%d error", errcount);
      if (errcount > 1)
	fprintf(stderr, "s");
      fprintf(stderr, " found.\n", errcount);
      exit(1);
    }
  
/***** DEBUG
  for (i = 0; i < m->neq; i++)
    print_equation(&(m->eqns[i]));
******/
  m->modelname=pathnam;

  print_function(m);

  free(m);
  free(orig_pathnam);
  fprintf(stderr, "\nMain has finished running.\n");
  exit(0);
}

