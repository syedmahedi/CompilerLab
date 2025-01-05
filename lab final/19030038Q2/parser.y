%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "symtab.c"
    #include "CodeGen.c"
	void yyerror();
	extern int lineno;
	extern int yylex();
%}

%union
{
    char str_val[100];
    int int_val;
}


%token MAIN LPAREN RPAREN FUNC SHURU DHORI HOCCHE TYPE SOMAN JOG BIYOG K PRINT KORI SESH

%token<str_val> ID 
%token<int_val> ICONST
%token<int_val> INT


%start code

%%

code: {gen_code(START, -1);} MAIN LPAREN RPAREN FUNC SHURU statements SESH {gen_code(HALT, -1);};
statements: declaration statements | assignment statements | operation statements | visible statements | ;
declaration: DHORI ID HOCCHE TYPE INT{
		insert($2,$5);
};
assignment: ID SOMAN ICONST{
	int address1= idcheck($1);
	gen_code(LD_INT,$3);
	gen_code(STORE,address1);
}
operation: ID SOMAN ICONST JOG ICONST BIYOG ID{
	int address2= idcheck($1);
	int address3=idcheck($7);
	gen_code(LD_INT,$3);
	gen_code(LD_INT,$5);
	gen_code(ADD,-1);
	gen_code(LD_VAR,address3);
	gen_code(SUB,-1);
	gen_code(STORE,address2);

}
visible: ID K PRINT KORI{
	int address4= idcheck($1);
	gen_code(PRINT_INT_VALUE,address4);
}

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

    printf("============= INTERMEDIATE CODE===============\n");
    print_code();

    printf("============= ASM CODE===============\n");
    print_assembly();

	return 0;
}