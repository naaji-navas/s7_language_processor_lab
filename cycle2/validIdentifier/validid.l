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
