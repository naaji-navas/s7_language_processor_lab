// c program to implement a dfa for testing whether an input string is a valid identifier or not

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX 100

void main(){
  char str[MAX];
  int i, state = 0;
  // arrray to store all the keyworkd
  char keywords[32][10] = {"auto", "break", "case", "char", "const", "continue", "default",
                           "do", "double", "else", "enum", "extern", "float", "for", "goto",
                           "if", "int", "long", "register", "return", "short", "signed",
                           "sizeof", "static", "struct", "switch", "typedef", "union",
                           "unsigned", "void", "volatile", "while"};
  printf("Enter a string to test: ");
  scanf("%s", str);
  for (i = 0; str[i] != '\0'; i++) {
    switch (state) {
    case 0:
      if (isalpha(str[i]) || str[i] == '_') state = 1;
      else state = -1;
      break;
      
    case 1:
      if (isalpha(str[i]) || str[i] == '_' || isdigit(str[i])) state = 1;
      else state = -1;
      break;
    case -1:
      break;
    }
    
}
  if(state==-1){
    printf("String not accepted\n");
        
    return;
  }else if(state==1){
    for(int i=0;i<32;i++){
      if(strcmp(str,keywords[i])==0){
        printf("String not accepted\n");
        return;
      }
    }
    printf("String accepted\n");
    return;
  }
}