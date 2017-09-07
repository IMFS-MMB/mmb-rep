
#include "header.h"


/*******************************************************************
  find_index returns the index of the character string in table
  that matches the character string s. If there is no match,
  find_index returns -1.
********************************************************************/

int find_index(table, size, s)
     char *table[]; int size; char *s;
{
  int i = 0;

  while ((i < size) && (strcmp(table[i], s) != 0))
    i++;
  if (i < size)
    return i;
  else
    return -1;
}

