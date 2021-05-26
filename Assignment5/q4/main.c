#include <stdio.h>
#include "element.h"
#include "list.h"
#include "tree.h"

/**
 * Your solution cannot depend in any way on the implemenation of this function.
 * That is, your program must work with any arbitrary selection function.
 */
int includeElement() {
  static int count=0;
  return (++count) % 2;
}

int main (int argc, char** argv) {
  struct tree* t = tree_new();
  struct list* l = list_new();
  
  for (int i=0; i<argc-1; i++)
    list_add_element (l, argv[i+1]);
  
  int j=0;
  for (struct element* e = list_get_first_element (l); e != NULL; e = element_get_next (e)) {
    if (includeElement())
      tree_insert_node (t, e);
  }
  printf ("Before deleting list:\n");
  tree_ordered_suffix_print (t);
  list_delete (l);
  printf ("After deleting list:\n");
  tree_ordered_suffix_print (t);
  tree_delete (t);
}
