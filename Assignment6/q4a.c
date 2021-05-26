#include <stdio.h>

int list[10];
int *l = list;


void add(int m, int i) {
  l[i] += m;
}

void set() {
  int x;
  int y;

  x = 1;
  y = 2;

  add(3, 4);
  
  add(x, y);
}

int main() {
  set();

  for(int i=0; i<10; i++) {
    printf ("%d\n", list[i]);
  }
}
