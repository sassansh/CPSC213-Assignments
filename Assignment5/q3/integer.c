#include <stdlib.h>
#include "integer.h"
#include "refcount.h"

struct integer {
  int value;
};

struct integer* integer_create(int value) {
  struct integer* i = rc_malloc(sizeof(*i));
  i->value = value;
  return i;
}

int integer_value(struct integer* integer) {
  return integer->value;
}
