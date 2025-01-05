%option noyywrap

%{
	#define INT_TYPE 1
	#define REAL_TYPE 2
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"

	int lineno = 1; // initialize to 1
	void yyerror();
%}

alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*
FCONST    {digit}*"."{digit}+
CCONST    (\'{print}\')

%%

"//".*        { } 

"main"		{return MAIN;}
"("			{return LPAREN;}
")"			{return RPAREN;}
"function"	{return FUNC;}
"begin" 	{return SHURU;}
"monekori"	{return DHORI;}
"hocche" 	{return HOCCHE;}
"type"		{return TYPE;}
"integer"	{yylval.int_val=INT_TYPE; return INT;}
"soman"		{return SOMAN;}
"jog"		{return JOG;}
"biyog"		{return BIYOG;}
"k"			{return K;}
"print"		{return PRINT;}
"kori"		{return KORI;}
"end"		{return SESH;}

{ID}        {strcpy(yylval.str_val, yytext); return ID;}
{ICONST}    {yylval.int_val = atoi(yytext); return ICONST;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
%%