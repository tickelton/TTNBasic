%{
#include "ttn_basic.tab.h"
%}

%option noyywrap

%%

[ \t]+		;
[0-9]+		{ yylval.digit = atoi(yytext); return LINE; }
\"[^\"\n]*\"	{ yylval.s = strdup(yytext); return STRING; }
PRINT		{ return PRINT; }
RUN		{ return RUN; }
\n		{ return ENDL; }

%%
