%{
#define YYSTYPE char *
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int ii = 0, itop = -1, istack[100];
int ww = 0, wtop = -1, wstack[100];

#define _BEG_IF     {istack[++itop] = ++ii;}
#define _END_IF     {itop--;}
#define _i          (istack[itop])

#define _BEG_WHILE  {wstack[++wtop] = ++ww;}
#define _END_WHILE  {wtop--;}
#define _w          (wstack[wtop])

FILE * yyin;

extern int yylineno;

void yyerror(char* msg);
%}


%token  INTEGER
%token  IDENTIFIER
%token T_Int T_Void T_Bool T_Return T_Break T_While T_If T_Else T_Le T_Ge T_Ne
%token T_Eq T_AddEq T_SubEq T_True
%token T_False T_Continue

%%

start: declaration_list


declaration_list: declaration_list declaration
| declaration
;

declaration: var_declaration
| func_declaration
;

var_declaration: type_specifier var_decl_list ';' { printf("\n"); }
;

var_decl_list: var_decl_id { printf("\tvar %s", $1); }
| var_decl_list ',' var_decl_id { printf(", %s", $3); }
;

var_decl_id: Identifier
| Identifier '[' INTEGER ']' /* not done */
;

type_specifier: T_Int
| T_Void
| T_Bool
;

func_declaration: type_specifier FuncName '(' params ')' statement
								{      printf("ENDFUNC\n\n");    }
;

FuncName:
Identifier     { printf("FUNC @%s:\n", $1); }
;

params: param_list
| /* empty */
;

param_list: param_type_list
| param_list ';' param_type_list
;

param_type_list: type_specifier param_id_list   { printf("\n "); }
;

param_id_list: param_id_list ',' param_id { printf(", %s",$3); }
| param_id { printf("\targ %s",$1); }
;

param_id: Identifier
| Identifier '[' ']'
;

local_declarations: local_declarations var_declaration
| /* empty */
;

statement_list: statement_list statement
| /* empty */
;

statement:
 expression_stmt
| compound_stmt
| selection_stmt
| iteration_stmt
| return_stmt
| break_stmt
| continue_stmt
;

compound_stmt: '{' local_declarations statement_list '}'
;

expression_stmt: expressions ';' {printf("\n");}
|';' {printf("\n");}
;

selection_stmt:
If '(' expressions ')' Then statement EndThen Else statement EndIf
| If '(' expressions ')' Then statement EndThen EndIf
;

If:
T_If            {  _BEG_IF;  printf("_begIf_%d:\n", _i); }
;

Then:
/* empty */     { printf("\tjz _elIf_%d\n", _i); }
;

EndThen:
/* empty */     { printf("\tjmp _endIf_%d\n_elIf_%d:\n", _i, _i); }
;

Else:
T_Else
;

EndIf:
/* empty */     { printf("_endIf_%d:\n\n", _i); _END_IF; }
;

iteration_stmt: While '(' expressions ')' Do statement EndWhile
;

While:
T_While
{
	_BEG_WHILE;
	printf("_begWhile_%d:\n", _w);
}
;

Do:
/* empty */     { printf("\tjz _endWhile_%d\n", _w); }
;

EndWhile:
/* empty */
{
	printf("\tjmp _begWhile_%d\n_endWhile_%d:\n\n", _w, _w);
	_END_WHILE;
}
;

break_stmt:
T_Break ';'     { printf("\tjmp _endWhile_%d\n", _w); }
;

continue_stmt:
T_Continue ';'  { printf("\tjmp _begWhile_%d\n", _w); }
;

return_stmt: T_Return ';' { printf("\tret\n\n"); }
| T_Return expressions ';' { printf("\tret ~\n\n"); }
;

expressions:
var '=' expressions
{
	printf("\tpush %s\n", $3);
	printf("\tpop %s\n", $1);
}
| var T_AddEq  expressions
{
	printf("\tpush %s\n", $3);
	printf("\tpush %s\n", $1);
	printf("\tadd\n");
	printf("\tpop %s\n", $1);
}
| var T_SubEq  expressions
{
	printf("\tpush %s\n", $3);
	printf("\tpush %s\n", $1);
	printf("\tsub\n");
	printf("\tpop %s\n", $1);
}
| expression
;

expression:
var '=' simple_expression
{
	printf("\tpop %s\n", $1);
}
| var T_AddEq  simple_expression
{
	printf("\tpush %s\n", $1);
	printf("\tadd\n");
	printf("\tpop %s\n", $1);
}
| var T_SubEq  simple_expression
{
	printf("\tpush %s\n", $1);
	printf("\tsub\n");
	printf("\tpop %s\n", $1);
}
| simple_expression
;

var: Identifier
| Identifier '[' expression ']' /* not done */
;

simple_expression:
simple_expression '|' or_expression  {  printf("\tor\n"); }
| or_expression
;

or_expression:
or_expression '&' unary_rel_expression  {  printf("\tand\n"); }
| unary_rel_expression
;

unary_rel_expression: '!' unary_rel_expression   {  printf("\tnot\n"); }
| rel_expression
;

rel_expression:
add_expression T_Le add_expression { printf("\tcmple\n"); }
| add_expression T_Ge add_expression { printf("\tcmpge\n"); }
| add_expression '<' add_expression { printf("\tcmpls\n"); }
| add_expression '>' add_expression { printf("\tcmpgt\n"); }
| add_expression T_Eq add_expression { printf("\tcmpeq\n"); }
| add_expression T_Ne add_expression { printf("\tcmpne\n"); }
| add_expression
;

add_expression:
add_expression '+' term { printf("\tadd\n"); }
| add_expression '-' term { printf("\tsub\n"); }
| term
;

term:
term '*' unary_expression { printf("\tmul\n"); }
| term '/' unary_expression { printf("\tdiv\n"); }
| term '%' unary_expression { printf("\tmod\n"); }
| unary_expression
;

unary_expression:
'-' unary_expression  {   printf("\tneg\n");  }
| factor
;

factor: '(' expression ')'
| var   {   printf("\tpush %s\n",$1);  }
| call
| constant {   printf("\tpush %s\n",$1); }
| constant_true {   printf("\tpush 1"); }
| constant_false {   printf("\tpush 0"); }
;

/* 常数 */
constant:
INTEGER
;

constant_true:
T_True
;

constant_false:
T_False
;

call: Identifier '(' args ')' { printf("\t$%s\n", $1); }
;

args: arg_list
| /*empty*/
;

/* 变量列表 */
arg_list: arg_list ',' expression
| expression
;

Identifier: IDENTIFIER
;

%%

void yyerror(char* msg)
{
	printf("%s: line %d\n", msg, yylineno);
	exit(0);
}

int main(int argc, char *argv[])
{
	if(argc!=2) {
		printf("usage: %s filename\n", argv[0]);
		exit(0);
	}

	if( (yyin=fopen(argv[1], "r")) ==NULL )
	{
		printf("open file %s failed\n", argv[1]);
		exit(0);
	}

	yyparse();

	fclose(yyin);
	return 0;
}
