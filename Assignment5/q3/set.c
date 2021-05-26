#include <stdlib.h>
#include <stdio.h>
#include "integer.h"
#include "set.h"
#include "refcount.h"

#define SIZE 997

struct integer* set[SIZE];

int hash(int key) {
  return key % SIZE;
}

void set_add(struct integer* integer) {
  if (set[hash(integer_value(integer))] == NULL){
    set[hash(integer_value(integer))] = integer;
    rc_keep_ref(integer);
  }

}

void set_print() {
  printf("set: ");
  for (int i=0; i<SIZE; i++)
    if (set[i] != NULL)
      printf("%d ", integer_value(set[i]));
  printf("\n");
}

void set_empty() {
  for (int i=0; i<SIZE; i++){
    if (set[i] != NULL) {
      rc_free_ref(set[i]);
      set[i] = NULL;
    }
  }
}
