#include <stdlib.h>
#include <stdio.h>
#include "node.h"

/**
 * declaration and initialzation of class table
 */
struct Node_class Node_class_table = {
  NULL,  /* abstract compareTo */
  NULL,  /* abstract printNode* */
  Node_insert,
  Node_print,
};

/**
 * constructor
 */
void Node_ctor(void* thisv) {
  struct Node* this = thisv;
  this->left = NULL;
  this->right = NULL;
}

/**
 * insert
 */
void Node_insert(void* thisv, void* nodev) {
  struct Node* this = thisv;
  struct Node* node = nodev;
  int c = this->class->compareTo(this, node);
  if (c > 0) {
    if (this->left == NULL)
      this->left = node;
    else
      this->class->insert(this->left, node);
  } else {
    if (this->right == NULL)
      this->right = node;
    else
      this->class->insert(this->right, node);
  }
}

/**
 * print
 */
void Node_print(void* thisv) {
  struct Node* this = thisv;
  if (this->left != NULL)
    this->class->print(this->left);
  this->class->printNode(this);
  if (this->right != NULL)
    this->class->print(this->right);
}

