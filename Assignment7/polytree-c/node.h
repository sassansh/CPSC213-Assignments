#ifndef __NODE_H__
#define __NODE_H__

/**
 * struct definition of class and external definition of class table
 */
struct Node_class {
  int  (*compareTo) (void*, void*);
  void (*printNode) (void*);
  void (*insert)    (void*, void*);
  void (*print)     (void*);
};
extern struct Node_class Node_class_table;


/**
 * struct definition of object
 */
struct Node;
struct Node {
  struct Node_class* class;

  // instance variables defined in this class
  struct Node* left;
  struct Node* right;
};

/**
 * definition of methods implemented by class
 */
void Node_ctor(void*);
void Node_insert(void*, void*);
void Node_print(void*);

#endif  /*__NODE_H__*/
