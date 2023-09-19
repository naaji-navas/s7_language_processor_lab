#include <stdio.h>
// create a DFA that accepts strings that contain the substring 00

int main(){
  // accept the sttring that contain 00 as a substring together wiith no other character in the middle of  00
  char str[100];
  printf("Enter the string: ");
  scanf("%s", str);
  int state = 0;
  int i = 0;
  while(str[i] != '\0'){
    if(state == 0 && str[i] == '0'){
      state = 1;
    }
    else if(state == 1 && str[i] == '0'){
      state = 2;
    }
    else if(state == 2 && str[i] == '0'){
      state = 2;
    }
    else{
      state = 0;
    }
    i++;
  }
  if(state == 2){
    printf("Accepted\n");
  }
  else{
    printf("Not Accepted\n");
  }
  return 0;

}