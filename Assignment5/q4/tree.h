#ifndef __tree_h__
#define __tree_h__

#include "list.h"

struct tree;
struct node;

/**
 * Create a new, empty tree
 */

struct tree* tree_new();

/**
 * Delete tree and all of its nodes
 */
void   tree_delete (struct tree* t);

/**
 * Insert a new list element into the tree
 */
struct node* tree_insert_node (struct tree* t, struct element* e);

/**
 * Perform depth-first traversal of tree, printing the values
 * in the linked list rooted at each node.
 */
void tree_ordered_suffix_print (struct tree* t);

#endif /* __tree_h__ */
