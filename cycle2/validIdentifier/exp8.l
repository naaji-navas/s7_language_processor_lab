// Najid Navas
// CS B
// Roll no 63

// Write a lex program to check whether the given identifier is valid or not.


%{
#include<stdio.h>
%}

%%
auto|break|char|const|continue|default|do|double|float|for|goto|if|int|long|return|short|switch|while { 
	printf("Invalid Identifier\n");
	exit(0);
}

[a-zA-Z_][A-Za-z0-9_]* { 
	printf("Valid Identifier\n"); 
	exit(0);
	}
	
. { printf("Invalid Identifier\n");
	exit(0);
	}
%%

int main(){
	printf("Enter the identifer: ");
	yylex();
	return 0;
}

// sample input and output
// Enter the identifer: 123
// Invalid Identifier

// Enter the identifer: 123abc
// Invalid Identifier

// Enter the identifer: abc123
// Valid Identifier

// Enter the identifer: abc_123
// Valid Identifier

