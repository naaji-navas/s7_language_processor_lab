// Najid Navas
// CS B
// Roll no 63

// Write a program to count the number of characters, words and lines in a given input file.
%{
	#include <stdio.h>
	#include <ctype.h>
	int char_count=0;
	int word_count=0;
	int line_count=0;
	int inword=0;
%}

%%
[a-zA-Z]+   { word_count++; char_count+=yyleng; inword = 1; }
\n		    { line_count++; char_count++; inword=0; }
.			{ char_count++; 
			if (!isspace(yytext[0]) && !inword) {
				word_count++;
				inword=1;
			}
}
	
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
	printf("Characters count %d\n" ,char_count );
	printf("Word count %d\n" ,word_count );
	printf("line_count %d\n" ,line_count );
	
	
	fclose(inputFile);
	return 0;
}
// sample input and output

Input: 
Hello, world!
This is a test file.
It contains three lines.

Output: 
Characters count 50
Word count 9
line_count 3
