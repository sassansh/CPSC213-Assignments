#ifndef __list_h__
#define __list_h__

struct list;

/**
 * Create new list
 */
struct list* list_new();

/**
 * Delete the list and all of the elements it contains.
 */
void list_delete (struct list* l);

/**
 * Add an element to the list.
 * Returns pointer to new element.
 */
struct element* list_add_element (struct list* l, char* value);

/**
 * Remove element from list and decrement its reference count.
 */
void list_delete_element (struct list* l, struct element* e);

/**
 * Get first element of list. 
 */
struct element* list_get_first_element (struct list* l);

#endif /* __list_h__ */
