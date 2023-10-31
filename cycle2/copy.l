/*Najid Navas
20220064
lex program to copy contents of a file*/

%{
#include <stdio.h>
%}

%%
\{ { fprintf(yyout,"begin"); }
\} { fprintf(yyout,"end"); }
. { fprintf(yyout, "%s", yytext); }

%%

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s input_file output_file\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    FILE *output_file = fopen(argv[2], "w");

    if (!input_file || !output_file) {
        perror("File opening failed");
        return 1;
    }

    yyin = input_file;
    yyout = output_file;

    yylex();

    fclose(input_file);
    fclose(output_file);

    return 0;
}

/*OUTPUT

__input.c__

#include <stdio.h>

int main()
{
	printf("hello world");
}

__output.c__

#include <stdio.h>

int main()
begin
	printf("hello world");
end

*/
