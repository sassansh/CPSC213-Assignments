#include <stdio.h>

int x[8] = {1, 2, 3, -1, -2, 0, 184, 340057058};
int y[8];

int f(int i) {
  int j = 0;

  while(i) {
    if(i & 0x80000000) {
      j++;
    }

    i = i << 1;
  }

  return j;
}

int main() {
  int i = 8;

  while(i) {
    i--;
    y[i] = f(x[i]);
  }

  for (int i=0; i<8; i++) {
    printf ("%d\n", x[i]);
  }

  for (int i=0; i<8; i++) {
    printf ("%d\n", y[i]);
  }
}
