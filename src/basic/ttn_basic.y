%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ttn_basic.h"

void yyerror(char *s, ...);
int yylex();
extern FILE *yyin;
%}

%union {
	int digit;
	char *s;
}

%token PRINT
%token RUN
%token ENDL
%token LIST

%token <digit> LINE
%token <s> STRING

%type <s> program

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
	LINE program		{ add($1, $2); }
	| RUN			{ execute(); }
	| LIST			{ list(); }
	;

program:
	PRINT STRING		{
					size_t len = strlen("PRINT")+strlen($2)+2;
					char *p = malloc(len);
					memset(p, 0, len);
					snprintf(p, len, "PRINT %s", $2);
					$$ = p;
				}
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



	

