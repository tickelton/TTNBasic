%{
#include <stdio.h>

void yyerror(char *s, ...);
int yylex();
FILE *yyin;
%}

%union {
	int digit;
	char *s;
}

%token PRINT
%token RUN
%token ENDL

%token <digit> LINE
%token <s> STRING

%%

input:
	/* empty */
	| input line
	;

line:
    	ENDL
	| statement ENDL
	;

statement:
	LINE program		{ printf("> line %d\n", $1); }
	| RUN			{ printf("> running...\n"); }
	;

program:
	PRINT STRING		{ printf(">\tPRINT %s\n", $2); }
	;

%%

int main()
{
	do {
		yyparse();
	} while(!feof(yyin));

	return 0;
}

void yyerror(char *s, ...)
{
	printf("%s\n", s);
}



	

