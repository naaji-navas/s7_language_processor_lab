%{
	#include <stdio.h>
	#include <ctype.h>
	int statements_count=0;
	int identifier_count=0;
	int assignment_count=0;
	int relational_count=0;
	int keywords_count=0;
	int integer_count=0;
%}

%%
[;]           {statements_count++;}
"auto"|"break"|"main"|"char"|"const"|"continue"|"default"|"do"|"double"|"float"|"for"|"goto"|"if"|"int"|"long"|"return"|"short"|"switch"|"while"|"printf"|"scanf" {keywords_count++;}
[%d] {identifier_count--;}
[&]* {identifier_count--;}

[a-zA-Z_][A-Za-z0-9_]* {identifier_count++;}

[=] {assignment_count++;}
"<"|">"|"<="|">=" | "==" |"!="  {relational_count++;}
[0-9]+ {integer_count++;}
. ;
	
%%


int main(int argc ,  char *argv[]){
	if(argc != 2){
		fprintf(stderr , "Usage : %s <input_file>\n",argv[0]);
		return 1;
	}
	
	FILE *inputFile = fopen(argv[1], "r");
	if(inputFile == NULL){
		perror("Error in opening the file\n");
		return 1;
	}
	yyin = inputFile;
	yylex();
	printf("Statemetns count %d\n" ,statements_count );
	printf("Identifier count %d\n" ,identifier_count-keywords_count+1 );
	printf("Assggment count %d\n" ,assignment_count );
	printf("Relational count %d\n" ,relational_count );
	printf("Keywords count %d\n" ,keywords_count );
	printf("Integer count %d\n" ,integer_count );
	
	fclose(inputFile);
	return 0;
}
