%{
#include <stdio.h>

static void
yyerror(const char *s)
{
  fprintf(stderr, "%s\n", s);
}

static int
yywrap(void)
{
  return 1;
}

%}

%union {
  double double_value;
}

%type <double_value> expr
%type <double_value> term
%type <double_value> fact
%token <double_value> NUM
%token ADD SUB MUL DIV NL BS BE

%%

program : statement
        | program statement
        ;

statement : expr NL
            {
              fprintf(stdout, "%g\n", $1);
            }
          ;

expr : term
     | expr ADD term
       {
         $$ = $1 + $3;
       }
     | expr SUB term
       {
         $$ = $1 - $3;
       }
     ;

term : fact
     | term MUL fact
       {
         $$ = $1 * $3;
       }
     | term DIV fact
       {
         $$ = $1 / $3;
       }
     ;

fact : NUM
     | BS expr BE
      {
        $$ = $2;
      }
     ;
%%

#include "lex.yy.c"

int
main()
{
  yyparse();
}

