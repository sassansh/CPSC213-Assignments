
// My solution to Q1 Part 2 of CS-213 A8
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "list.h"

void convertInt(element_t* rv, element_t av) {
    //cast rv to int**
    int **result = (int**) rv;

    //initialize variables for strtol
    char *str = av;
    char *endptr;
    int base = 0;

    //allocate memory for int pointer
    *result = malloc(sizeof(int*));

    //call strtol to convert string to number
    **result = strtol (str, &endptr, 0);

    //if no number found, set value of result to -1
    if (*endptr){
        **result = -1;
    }
}

void negativeToNull(element_t* rv, element_t sv, element_t iv) {
    //cast rv to char**
    char **result = (char**) rv;

    char *s = sv;
    int  *i  = iv;

    if (*i < 0) {
        *result = s;
    } else {
        *result = 0;
    }
}

int nonNegative(element_t iv) {
    int* i = iv;
 
    return *i >= 0;
}

int nonNull(element_t s) {
    return s != NULL;
}

void truncate(element_t* rv, element_t sv, element_t iv) {
    char **result = (char**) rv;
    char *s = sv;
    int *i = iv;

    //duplicate string to result
    *result = strdup(s);

    if (strlen(*result) > *i) {
        (*result) [*i] = 0;
    }
}

void printer(element_t sv) {
  char* s = sv;

  if (s != NULL) {
      printf ("%s\n", s);
  } else {
      printf ("%s\n", "NULL");
  }

  printf ("%s\n", s? s : "NULL");
}

void longestString (element_t* rv, element_t av, element_t bv) {
    int **result = (int**) rv;
    int *a = av;
    int *b = bv;


    if (*a > *b) {
        **result = *a;
    } else {
        **result = *b;
    }
}

void concatenate(element_t* rv, element_t av, element_t bv) {
    //setup
    char **result = (char**) rv;
    char *b = bv;

    //allocate room for word
    *result = realloc(*result, strlen(*result) + strlen(b) + 2);

    //add space
    if (strlen(*result)) {
        strcat(*result, " ");
    }

    //add word
    strcat(*result, b);
}

int main (int argc, char** argv) {
    //Initialize lists
    struct list* listOne = list_create();
    struct list* listTwo = list_create();
    struct list* listThree = list_create();
    struct list* listFour = list_create();
    struct list* listFive = list_create();
    struct list* listSix = list_create();

    //Add elements from argv into listOne
    for (int i=1; i<argc; i++) {
        list_append (listOne, argv [i]);
    }
    //Using list_map1, convert strings to integers and store in ListTwo
    //-1 if not a number
    list_map1 (convertInt, listTwo, listOne);

    //using list_map2, NULL value for every string that is a number
    list_map2 (negativeToNull, listThree, listOne, listTwo);

    //using list_filter, create a list of numbers
    list_filter (nonNegative, listFour, listTwo);

    //using list_filter, create a raw list of words
    list_filter (nonNull, listFive, listThree);

    //using list_map2, truncate the words
    list_map2 (truncate, listSix, listFive, listFour);

    //using list_foreach, print list of truncated words
    list_foreach (printer, listSix);

    //building and printing concatenated words
    char* s = malloc(1);
    *s = 0;
    list_foldl (concatenate, (element_t*) &s, listSix);
    printf ("%s\n", s); //print string
    free (s); //deallocate memory for s
    

    //calculate maximum string length
    int v = -1;
    int *vp = &v;
    list_foldl (longestString, (element_t*) &vp, listFour);
    
    printf ("%d\n", v);
    
    //free all memory
    list_foreach (free, listTwo);
    list_foreach (free, listSix);
    list_destroy (listOne);
    list_destroy (listTwo);
    list_destroy (listThree);
    list_destroy (listFour);
    list_destroy (listFive);
    list_destroy (listSix);
}