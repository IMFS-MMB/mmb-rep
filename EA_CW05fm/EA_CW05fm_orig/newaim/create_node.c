
#include "header.h"

/******************************************************************
  This file contains the following functions:

  create_constant_node()
  create_coefficient_node()
  create_variable_node()
  create_sum_node()
  create_difference_node()
  create_product_node()
  create_quotient_node()
  create_power_node()

  Each of these functions creates a node of the appropriate type,
  using the information contained in its argument list, and returns
  a pointer to the new node. These functions can be used like 
  constructors in C++
*******************************************************************/
  
struct node *create_constant_node(v)
     double v;
{
  struct node *n = (struct node *) malloc(sizeof(struct node));
  if (n == NULL) 
    {
      error(CANNOT_ALLOCATE_MEMORY);
      exit(1);
    }
  n->type = CONSTANT;
  n->info.cons.value = v;
  return n;
}

struct node *create_coefficient_node(s)
     char *s;
{
  struct node *n = (struct node *) malloc(sizeof(struct node));
  if (n == NULL) 
    {
      error(CANNOT_ALLOCATE_MEMORY);
      exit(1);
    }
  n->type = COEFFICIENT;
  n->info.coeff.name = (char *) calloc(strlen(s)+1, sizeof(char));
  strcpy(n->info.coeff.name, s);
  return n;
}

struct node *create_variable_node(s, p, e)
     char *s; int p; enum yesornotype e;
{
  struct node *n = (struct node *) malloc(sizeof(struct node));
  if (n == NULL) 
    {
      error(CANNOT_ALLOCATE_MEMORY);
      exit(1);
    }
  n->type = VARIABLE;
  n->info.var.name = (char *) calloc(strlen(s)+1, sizeof(char));
  strcpy(n->info.var.name, s);
  n->info.var.period = p;
  n->info.var.elag = e;
  return n;
}

struct node *create_sum_node(n1, n2)
     struct node *n1; struct node *n2;
{
  struct node *n = (struct node *) malloc(sizeof(struct node));
  if (n == NULL) 
    {
      error(CANNOT_ALLOCATE_MEMORY);
      exit(1);
    }
  n->type = SUM;
  n->info.sum.summand1 = n1;
  n->info.sum.summand2 = n2;
  return n;
}

struct node *create_product_node(n1, n2)
     struct node *n1; struct node *n2;
{
  struct node *n = (struct node *) malloc(sizeof(struct node));
  if (n == NULL) 
    {
      error(CANNOT_ALLOCATE_MEMORY);
      exit(1);
    }
  n->type = PRODUCT;
  n->info.prod.multiplicand1 = n1;
  n->info.prod.multiplicand2 = n2;
  return n;
}

struct node *create_power_node(b, e)
     struct node *b; struct node *e;
{
  struct node *n = (struct node *) malloc(sizeof(struct node));
  if (n == NULL) 
    {
      error(CANNOT_ALLOCATE_MEMORY);
      exit(1);
    }
  n->type = POWER;
  n->info.power.base = b;
  n->info.power.exponent = e;
  return n;
}

