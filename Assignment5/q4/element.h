#ifndef __element_h__
#define __element_h__

struct element;

/**
 * Create an element
 */
struct element* element_create (char* value);

/**
 * Get element's value
 */
char* element_get_value (struct element* e);

/**
 * Set element's value
 */
void element_set_value (struct element* e, char* value);

/**
 * Get prev element of list.
 */
struct element* element_get_prev (struct element* e);

/**
 * Set prev element of list.
 */
void element_set_prev (struct element* e, struct element* prev);

/**
 * Get next element of list.
 */
struct element* element_get_next (struct element* e);

/**
 * Set next element of list.
 */
void element_set_next (struct element* e, struct element* next);

/**
 * Increment element's reference count.
 */
void element_keep_ref (struct element* e);

/**
 * Decrement element's reference count and free element when count goes to 0.
 */
void element_free_ref (struct element* e);

#endif /* __element_h__ */