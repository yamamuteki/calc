%%
"+" return ADD;
"-" return SUB;
"*" return MUL;
"/" return DIV;
"\n" return NL;
"(" return BS;
")" return BE;

([1-9][0-9]*)|0|([0-9]+\.[0-9]*) {
  yylval.double_value = atof(yytext);
  return NUM;
};

[ \t] ;

. {
  fprintf(stderr, "lexical error.\n");
  exit(1);
}
%%

