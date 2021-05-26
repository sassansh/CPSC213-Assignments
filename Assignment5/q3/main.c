#include <stdlib.h>
#include <stdio.h>
#include "integer.h"
#include "set.h"
#include "stack.h"
#include "helper.h"

int main(int argc, char** argv) {
  helper_process_input(argc, argv);
  set_print();
  printf("stack: ");
  while (!stack_is_empty())
    stack_pop_and_print();
  printf("\n");
  set_print();
  set_empty();
}
