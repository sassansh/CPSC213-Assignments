#include <stdlib.h>
#include <stdio.h>

/*
 * Class A
 */

struct A_class {
  void (* ping ) (void*);
  void (* pong ) (void*);
};

struct A {
  struct A_class* class;
  int    i;
};

void A_ctor(void* thisv, int i) {
  struct A* this = thisv;
  this->i = i;
}

void A_ping (void* thisv) {
  struct A* this = thisv;
  printf ("A_ping %d\n", this->i);
}

void A_pong (void* thisv) {
  struct A* this = thisv;
  printf ("A_pong %d\n", this->i);
}

struct A_class A_class = {A_ping, A_pong};

void* new_A(int i) {
  struct A* obj = malloc (sizeof (struct A));
  obj->class = &A_class;
  A_ctor(obj, i);
  return obj;
}


/*
 * Class B extends A
 */

struct B_class {
  void (* ping ) (void*);
  void (* pong ) (void*);
  void (* wiff ) (void*);
};

struct B {
  struct B_class* class;
  int    i;
};

void B_ping (void* thisv) {
  struct B* this = thisv;
  printf ("B_ping %d\n", this->i);
}
void B_wiff (void* thisv) {
  struct B* this = thisv;
  printf ("B_wiff %d\n", this->i);
}

struct B_class B_class = {B_ping, A_pong, B_wiff};

void* new_B(i) {
  struct B* obj = malloc (sizeof (struct B));
  obj->class = &B_class;
  A_ctor(obj, i);
  return obj;
}


/*
 * Class C extends B
 */

struct C_class {
  void (* ping ) (void*);
  void (* pong ) (void*);
  void (* wiff ) (void*);
};

struct C {
  struct C_class* class;
  int    i;
  int    id;
};

void C_ctor (void* thisv, int i, int id) {
  struct C* this = thisv;
  A_ctor (this, i);
  this->id = id;
}

void C_ping (void* thisv) {
  struct C* this = thisv;
  printf ("C_ping (%d,%d) calls ", this->i, this->id);
  B_ping (this);
}

struct C_class C_class = {C_ping, A_pong, B_wiff};

void* new_C (int i, int id) {
  struct C* obj = malloc (sizeof (struct C));
  obj->class = &C_class;
  C_ctor(obj, i, id);
  return obj;
}


/*
 * Main
 */

void foo (void* av) {
  struct A* a = av;
  a->class->ping (a);
  a->class->pong (a);
}

void bar() {
  foo (new_A(10));
  foo (new_B(20));
  foo (new_C(30, 100));
}

int main (int argc, char** argv) {
  bar();
}
