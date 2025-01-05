%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	void yyerror();
	extern int lineno;
	extern int yylex();
%}


%token MAIN LPAREN RPAREN FUNC SHURU DHORI HOCCHE TYPE INT SOMAN JOG BIYOG K PRINT KORI SESH ID ICONST


%start code

%%

code: MAIN LPAREN RPAREN FUNC SHURU statements SESH;
statements: declaration statements | assignment statements | operation statements | visible statements | ;
declaration: DHORI ID HOCCHE TYPE INT;
assignment: ID SOMAN ICONST;
operation: ID SOMAN ICONST JOG ICONST BIYOG ID;
visible: ID K PRINT KORI;

%%

void yyerror ()
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}

int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}