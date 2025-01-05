%option noyywrap
%{

%}

letter [a-zA-Z]
digit [0-9]
delim [ \n\t]
under [_]
num {digit}{digit}*
double_num {num}*[.]{num}
string \"[^\n\"]*\"

%%
{delim} {}
{num} {printf("%s -> NUMBER\n", yytext);}
"ret" {printf("%s -> RET\n", yytext);}
"type" {printf("%s -> TYPE\n", yytext);}
"var" {printf("%s -> VAR\n", yytext);}
{string} { printf("%s -> STRING\n", yytext); }
"+" {printf("%s -> ADD\n", yytext);}
"++" {printf("%s -> INC\n", yytext);}
"-" { printf("%s -> SUBTRACT\n", yytext);}
"*" { printf("%s -> MULTIPLY\n", yytext);}
"/" { printf("%s -> DIVIDE\n", yytext);}
"%" { printf("%s -> MODULO\n", yytext);}
"int" {printf("%s -> INT\n", yytext);}
"float" {printf("%s -> FLOAT\n", yytext); }
"double" {printf("%s -> DOUBLE\n", yytext);}
"while" {printf("%s -> WHILE\n", yytext); }
"(" {printf("%s -> LP\n", yytext);}
")" {printf("%s -> RP\n", yytext);}
"{" {printf("%s -> LB\n", yytext);}
"}" {printf("%s -> RB\n", yytext);}
"=" {printf("%s -> ASSIGN\n", yytext); }
">" { printf("%s -> GREATER\n", yytext);}
">=" { printf("%s -> GREATER_EQUAL\n", yytext); }
"==" { printf("%s -> EQUAL\n", yytext);}
"<" { printf("%s -> LESS\n", yytext); }
"<=" { printf("%s -> LESS_EQUAL\n", yytext);}
"!=" { printf("%s -> NOT_EQUAL\n", yytext);}
":" { printf("%s -> COLON\n", yytext);}
";" {printf("%s -> SEMI\n", yytext);}
"if" { printf("%s -> IFF\n", yytext); }
"elif" { printf("%s -> ELIF\n", yytext); }
"else" { printf("%s -> ELSE\n", yytext); }
"print" {printf("%s -> PRINT\n", yytext);}
"input" { printf("%s -> INPUT\n", yytext); }
"dim" { printf("%s -> DIM\n", yytext);}
"as" { printf("%s -> AS\n", yytext); }
"To" { printf("%s -> TO\n", yytext); }
"For" { printf("%s -> FOR\n", yytext); }
"Next" { printf("%s -> NEXT\n", yytext); }
"function" {printf("%s -> Function\n", yytext);}
"isEven" { printf("%s -> ISEVEN\n", yytext);}
"begin" { printf("%s -> BEGIN_TOKEN\n", yytext); }
"end" { printf("%s -> END_TOKEN\n", yytext); }
"return" { printf("%s -> RETURN\n", yytext); }
"." { printf("%s -> DOT\n", yytext); }
({under}|{letter})({under}|{letter}|{digit})* {printf("%s -> ID\n", yytext);}
{double_num} {printf("%s -> DOUBLE_NUM\n", yytext);}
%%

int main()
{
yylex();
return 0;
}