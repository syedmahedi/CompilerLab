%option noyywrap

%{
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
"integer"	{return INT;}
"soman"		{return SOMAN;}
"jog"		{return JOG;}
"biyog"		{return BIYOG;}
"k"			{return K;}
"print"		{return PRINT;}
"kori"		{return KORI;}
"end"		{return SESH;}

{ID}        {return ID;}
{ICONST}    {return ICONST;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
%%