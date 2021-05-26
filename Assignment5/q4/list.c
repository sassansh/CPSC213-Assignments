#include <stdlib.h>
#include <stdio.h>
#include "element.h"
#include "list.h"

struct list {
  struct element* head;
  struct element* tail;
};


/**
 * Create new list
 */
struct list* list_new() {
  struct list* l = malloc (sizeof (*l));
  l->head = l->tail = NULL;
  return l;
}

/**
 * Delete the list (including its elements).
 */
void list_delete (struct list* l) {
  for (struct element *e = l->head, *n; e != NULL; e = n) {
    n = element_get_next (e);
    list_delete_element (l, e);
  }
  free (l);
}

/**
 * Add an element to the list.
 * Returns pointer to newly added element.
 */
struct element* list_add_element (struct list* l, char* value) {
  struct element* e = element_create (value);
  if (l->head == NULL)
    l->head = e;
  else {
    element_set_next (l->tail, e);
    element_set_prev (e, l->tail);
  }
  l->tail = e;
  return e;
}

/**
 * Remove element from list and free it
 */
void list_delete_element (struct list* l, struct element* e) {
  if (e == l->head)
    l->head = element_get_next (e);
  else
    element_set_next (element_get_prev (e), element_get_next (e));
  if (e == l->tail)
    l->tail = element_get_prev (e);
  else
    element_set_prev (element_get_next (e), element_get_prev (e));

  element_set_prev (e, NULL);
  element_set_next (e, NULL);
  element_free_ref(e);
}

/**
 * Get first element of list.
 */
struct element* list_get_first_element (struct list* l) {
  return l->head;
}
