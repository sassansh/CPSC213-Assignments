#include <stdlib.h>
#include <stdio.h>

int q2(int f, int i, int r) {
  int s;

  switch (f) {
    case 10:
      s = i + r;
      break;

    case 12:
      s = i - r;
      break;

    case 14:
      if (i > r) {
          s = 1;
      } else {
          s = 0;
      }
      break;

    case 16:
      if (i < r) {
          s = 1;
      } else {
          s = 0;
      }
      break;

    case 18:
      if (i == r) {
          s = 1;
      } else {
          s = 0;
      }
      break;

    default:
      s = 0;
  }
  return s;
}

