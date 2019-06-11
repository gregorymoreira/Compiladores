%{
  #include <bits/stdc++.h>
  using namespace std;
  int yylex();
  int n_tokens = 0;
  #include "parser.tab.h"
  #include <ctype.h>
  struct token {
        string tok, lexema;
        int linha;
  };
  vector<token> simbTable;
  token aux;
  void yyerror(char *s, char *token);
  void printSimbTable();
%}

%x COMMENTS

%option noyywrap

alpha                               [a-z]([a-zA-Z_]|[0-9])*
whitespace 	                        [ \r\t\v\f ]
float                               [0-9]*,[0-9]+|[0-9]+,[0-9]*
int                                 [0-9]+      
linefeed                            \n
multilinecoment                     [**](.)*


%%

">>"                                BEGIN(COMMENTS);
<COMMENTS>[^<<\n]+
<COMMENTS>\n                        ++yylineno;
<COMMENTS><<EOF>>                   { cout << "EOF no comentario!" << endl; exit(0); }
<COMMENTS>"<<"                      BEGIN(INITIAL);
"<"                                 { n_tokens++; aux.tok = "OP_MENOR"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_MENOR; }
">"                                 { n_tokens++; aux.tok = "OP_MAIOR"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_MAIOR; }
"<="                                { n_tokens++; aux.tok = "OP_MENOR_IGUAL"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_MENOR_IGUAL; }
">="                                { n_tokens++; aux.tok = "OP_MAIOR_IGUAL"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_MAIOR_IGUAL; }
"="                                 { n_tokens++; aux.tok = "OP_IGUAL"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_IGUAL; }
"<>"                                { n_tokens++; aux.tok = "OP_DIFERENTE"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_DIFERENTE; }
"+"                                 { n_tokens++; aux.tok = "OP_SOMA"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_SOMA; }
"-"                                 { n_tokens++; aux.tok = "OP_SUB"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_SUB; }
"*"                                 { n_tokens++; aux.tok = "OP_MULT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_MULT; }
"/"                                 { n_tokens++; aux.tok = "OP_DIV"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_DIV; }
"%"                                 { n_tokens++; aux.tok = "OP_MOD"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_MOD; }
"and"                               { n_tokens++; aux.tok = "OP_AND"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_AND; }
"or"                                { n_tokens++; aux.tok = "OP_OR"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_OR; }
"not"                               { n_tokens++; aux.tok = "OP_NOT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return OP_NOT; }
":="                                { n_tokens++; aux.tok = "ATRIBUICAO"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return ATRIBUICAO; }
")"                                 { n_tokens++; aux.tok = "SIMB_FECHA_PARENTESES"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return SIMB_FECHA_PARENTESES; }
"("                                 { n_tokens++; aux.tok = "SIMB_ABRE_PARENTESES"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return SIMB_ABRE_PARENTESES; }
","                                 { n_tokens++; aux.tok = "SIMB_VIRGULA"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return SIMB_VIRGULA; }
";"                                 { n_tokens++; aux.tok = "SIMB_PONTO_VIRGULA"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return SIMB_PONTO_VIRGULA; }
"{"                                 { n_tokens++; aux.tok = "SIMB_ABRE_CHAVES"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return SIMB_ABRE_CHAVES; }
"}"                                 { n_tokens++; aux.tok = "SIMB_FECHA_CHAVES"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return SIMB_FECHA_CHAVES; }
"if"                                { n_tokens++; aux.tok = "KEYWORD_IF"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return KEYWORD_IF; }
"else"                              { n_tokens++; aux.tok = "KEYWORD_ELSE"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return KEYWORD_ELSE; }
"while"                             { n_tokens++; aux.tok = "KEYWORD_WHILE"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return KEYWORD_WHILE; }
"return"                            { n_tokens++; aux.tok = "KEYWORD_RETURN"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return KEYWORD_RETURN; }
"float"                             { n_tokens++; aux.tok = "KEYWORD_FLOAT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return KEYWORD_FLOAT; }
"char"                              { n_tokens++; aux.tok = "KEYWORD_CHAR"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return KEYWORD_CHAR; }
"void"                              { n_tokens++; aux.tok = "KEYWORD_VOID"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return KEYWORD_VOID; }
"prnt"                              { n_tokens++; aux.tok = "KEYWORD_PRNT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return KEYWORD_PRNT; }
"int"                               { n_tokens++; aux.tok = "KEYWORD_INT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return KEYWORD_INT; }
"proc"                              { n_tokens++; aux.tok = "KEYWORD_PROC"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return KEYWORD_PROC; }
"var"                               { n_tokens++; aux.tok = "KEYWORD_VAR"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return KEYWORD_VAR; }
{alpha}                             { n_tokens++;
                                      yylval.sval = strdup(yytext);
				                              strncpy(yylval.sval, yytext, strlen(yytext)); aux.tok = "IDENTIFICADOR"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return IDENTIFICADOR; } 
{int}                               { n_tokens++; 
                                      yylval.sval = strdup(yytext);
				                              strncpy(yylval.sval, yytext, strlen(yytext)); aux.tok = "VALUE_INT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return VALUE_INT;}
{float}                             { n_tokens++; 
                                      yylval.sval = strdup(yytext);
				                              strncpy(yylval.sval, yytext, strlen(yytext)); aux.tok = "VALUE_FLOAT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); 
                                        return VALUE_FLOAT; }
{whitespace}
{multilinecoment}                   { ; }    
{linefeed}	                        ++yylineno;
.                                   { yyerror("Erro lexico encontrado",yytext);}

%%

// main( int argc, char *argv[] )
// { 
//   extern FILE *yyin;
//   ++argv; --argc;
//   yyin = fopen( argv[0], "r" );
//   yylex();
//   cout << yylineno << endl << n_tokens << endl;
// }

void yyerror(char *s, char *token) {
  cout << "# Error! # Message: " << s << " # Linha: " << yylineno << " # Caracter: "<< token << endl;
}

//int yywrap(void){}

void printSimbTable(){
  cout << "\t\tTOKEN\t\tLEXEMA\t\tLINHA\n";
    for(int i=0;i<simbTable.size();i++){
      token aux2;
      aux2.tok = simbTable[i].tok;
      aux2.lexema = simbTable[i].lexema;
      aux2.linha = simbTable[i].linha;
      cout << "\t" << aux2.tok << "\t\t" << aux2.lexema << "\t\t" << aux2.linha << endl;
  }
}