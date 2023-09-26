// c program for implenting a dfa for accepting strings from the set {a,b,c} having abc as substring

#include<stdio.h>
#include<string.h>
#include<stdlib.h>


#define MAX 100

void main(){
  char str[MAX];
  int i, state = 0;
  printf("Enter a string to test: ");
  scanf("%s", str);
  for (i = 0; str[i] != '\0'; i++) {
    switch (state) {
    case 0:
      if (str[i] == 'a') state = 1;
      else state = 0;
      break;

    case 1:
      if (str[i] == 'b') state = 2;
      else if (str[i] == 'a') state = 1;
      else state = 0;
      break;

    case 2:
      if (str[i] == 'c') state = 3;
      else if (str[i] == 'a') state = 1;
      else state = 0;
      break;

    case 3:
      break;
    }

    
    
  }
  if (state == 3) printf("String accepted\n");
  else
  printf("String not accepted\n");
}