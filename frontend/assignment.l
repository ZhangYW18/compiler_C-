%{
#define YYSTYPE char*
#define YYSTYPE_IS_DECLARED 1
#include <stdlib.h>
#include "y.tab.h"
%}

%option yylineno

%%

"int"                 { yylval = strdup(yytext); return T_Int; }
"void"              { yylval = strdup(yytext); return T_Void; }
"return"            { return T_Return; }
"while"             { return T_While; }
"if"                { return T_If; }
"else"              { return T_Else; }
"break"             { return T_Break; }
"continue"  { return T_Continue; }
"<="                { return T_Le; }
">="                { return T_Ge; }
"=="                { return T_Eq; }
"!="                { return T_Ne; }
"+="                { return T_AddEq; }
"-="                { return T_SubEq; }

[A-Za-z]([A-Za-z]|[0-9])*		{
								yylval = strdup(yytext);
								return IDENTIFIER;
							}

[0-9]+	{
		yylval = strdup(yytext);
		return INTEGER;
		}

"+"|"-"|"*"|"/"|"("|")"|"="|">"|"<"|"%"|"&"|"|"|"!"|"{"|"}"|";"|"," {
	return *yytext;
}

[ \t\r\n]

.	{
		printf("lexical error: line %d\n", yylineno);
		exit(0);
	}

%%

int yywrap()
{
	return 1;
}
