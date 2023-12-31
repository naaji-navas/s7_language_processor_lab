// Najid Navas
// CS B
// Roll no 63
// exp no 2

// program to check if a string contains substring 00


#include <stdio.h>

#define MAX 100

void main() {
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
      break;
    }

    if (state == 2) {
      printf("String accepted\n");
      return;
    }
  }

  printf("String not accepted\n");
}

/*
Enter a string to test: 101010
String not accepted
Enter a string to test: 1001
String accepted


/*/