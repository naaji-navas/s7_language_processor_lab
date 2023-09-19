#include <stdio.h>
// create a DFA that accepts strings that contain the substring 00

int main(){
    char str[100];
    printf("Enter a string: ");
    scanf("%s", str);
    int state = 0;
    for(int i = 0; str[i] != '\0'; i++){
        if(state == 0 && str[i] == '0'){
            state = 1;
        }
        else if(state == 1 && str[i] == '0'){
            state = 2;
        }
    }
    if(state == 2){
        printf("Accepted\n");
    }
    else{
        printf("Not Accepted\n");
    }
    return 0;
}