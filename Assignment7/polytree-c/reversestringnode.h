#ifndef __REVERSESTRINGNODE_H__
#define __REVERSESTRINGNODE_H__

/**
 * struct definition of class and external definition of class table
 */
struct ReverseStringNode_class {
  // TODO add function pointers
};
extern struct ReverseStringNode_class ReverseStringNode_class_table;

/**
 * struct definition of object
 */
struct ReverseStringNode;
struct ReverseStringNode {
  // TODO add class pointer and 
  // variables that are stored in instances of this class (including those introduced by super class)
};

/**
 * definition of methods implemented by this class
 */
int ReverseStringNode_compareTo(void*, void*);

/**
 * definition of new for class
 */
void* new_ReverseStringNode(char*);

#endif /*__REVERSESTRINGNODE_H__*/
