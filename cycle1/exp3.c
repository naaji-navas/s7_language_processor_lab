// c program for implenting a dfa for accepting the binary string ending with 00

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
      if (str[i] == '0') state = 1;
      else state = 0;
      break;

    case 1:
      if (str[i] == '0') state = 2;
      else state = 0;
      break;

    case 2:
      if (str[i] == '0') state = 2;
      else state = 0;
      break;
    }

    
    
  }
  if (state == 2) {
      printf("String accepted\n");
      return;
    }else{
      printf("String not accepted\n");
      return;}
}