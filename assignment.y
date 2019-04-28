%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE * yyin;

extern int yylineno;

void yyerror(char* msg);
%}


%token  INTEGER
%token  IDENTIFIER
%token T_Int T_Void T_Bool T_Return T_Break T_While T_If T_Else T_Le T_Ge T_Ne
%token T_Eq T_AddEq T_SubEq T_True
%token T_False

%%

start: declaration_list


declaration_list: declaration_list declaration
| declaration
;

declaration: var_declaration
| func_declaration
;

var_declaration: type_specifier var_decl_list ';'
;

var_decl_list: var_decl_list ',' var_decl_id
| var_decl_id
;

var_decl_id: IDENTIFIER
| IDENTIFIER '[' INTEGER ']'
;

type_specifier: T_Int
| T_Void
| T_Bool
;

func_declaration: type_specifier IDENTIFIER '(' params ')' statement
;

params: param_list
| /* empty */
;


param_type_list: type_specifier param_id_list
;

param_id_list: param_id_list ',' param_id
| param_id
;

param_id: IDENTIFIER
| IDENTIFIER '[' ']'
;

param_list: param_type_list
| param_list ';' param_type_list
;

statement: expression_stmt
| compound_stmt
| selection_stmt
| iteration_stmt
|return_stmt
| break_stmt
;

local_declarations: local_declarations var_declaration
| /* empty */
;

compound_stmt: '{' local_declarations statement_list '}'
;

statement_list: statement_list statement
| /* empty */
;

expression_stmt: expression ';'
|';'
;

selection_stmt: T_If '(' expression ')' statement
| T_If '(' expression ')' statement T_Else statement
;

iteration_stmt: T_While '(' expression ')' statement
;

return_stmt: T_Return ';'
| T_Return expression ';'
;

break_stmt: T_Break ';'
;

expression: var '=' expression
| var T_AddEq expression
| var T_SubEq expression
| simple_expression
;

var: IDENTIFIER | IDENTIFIER '[' expression ']'
;

simple_expression: simple_expression '|' or_expression
| or_expression
;

or_expression: or_expression '&' unary_rel_expression
| unary_rel_expression
;

unary_rel_expression: '!' unary_rel_expression
| rel_expression
;

rel_expression: add_expression relop add_expression
| add_expression
;

relop: T_Le
| '<'
| '>'
| T_Ge
| T_Eq
| T_Ne
;

add_op: '+'
| '-'
;

mulop: '*'
| '/'
|'%'
;

add_expression: add_expression add_op term
| term
;

term: term mulop unary_expression
| unary_expression
;

unary_expression: '-' unary_expression
| factor
;

factor: '(' expression ')'
| var
| call
| constant
;

constant: INTEGER
| T_True
| T_False
;

call: IDENTIFIER '(' args ')'
;

args: arg_list
| /*empty*/
;

arg_list: arg_list ',' expression
| expression
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
