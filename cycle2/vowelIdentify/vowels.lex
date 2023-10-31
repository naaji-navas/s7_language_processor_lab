%{
int vowelCount = 0;
int consonantCount = 0;
%}

%%
[aeiouAEIOU] { vowelCount++; }
[a-zA-Z] { consonantCount++; }
\n { 
    
    printf("Vowels: %d\nConsonants: %d\n", vowelCount, consonantCount);
    exit(0);
}
. ;

%%
int main() {
    printf("Enter a string:\n");
    yylex();

    return 0;
}
