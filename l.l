%{
  #include <bits/stdc++.h>
  using namespace std;
    struct token {
        string tok, lexema;
        int linha;
    };
    vector<token> simbTable;
    token aux;    
    int n_tokens = 0;
    void yyerror(char *s, char *token);
%}

%option noyywrap

%x COMMENTS


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
                                        aux.linha = yylineno; simbTable.push_back(aux); }
">"                                 { n_tokens++; aux.tok = "OP_MAIOR"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"<="                                { n_tokens++; aux.tok = "OP_MENOR_IGUAL"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
">="                                { n_tokens++; aux.tok = "OP_MAIOR_IGUAL"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"="                                 { n_tokens++; aux.tok = "OP_IGUAL"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"<>"                                { n_tokens++; aux.tok = "OP_DIFERENTE"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"+"                                 { n_tokens++; aux.tok = "OP_SOMA"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"-"                                 { n_tokens++; aux.tok = "OP_SUB"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"*"                                 { n_tokens++; aux.tok = "OP_MULT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"/"                                 { n_tokens++; aux.tok = "OP_DIV"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"%"                                 { n_tokens++; aux.tok = "OP_MOD"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"and"                               { n_tokens++; aux.tok = "KEYWORD_AND"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"or"                                { n_tokens++; aux.tok = "KEYWORD_OR"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"not"                               { n_tokens++; aux.tok = "KEYWORD_NOT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
":="                                { n_tokens++; aux.tok = "ATRIBUICAO"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
")"                                 { n_tokens++; aux.tok = "SIM_FECHA_PARENTESES"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"("                                 { n_tokens++; aux.tok = "SIMB_ABRE_PARENTESES"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
","                                 { n_tokens++; aux.tok = "SIMB_VIRGULA"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
";"                                 { n_tokens++; aux.tok = "SIMB_PONTO_VIRGULA"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"{"                                 { n_tokens++; aux.tok = "SIMB_ABRE_CHAVES"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"}"                                 { n_tokens++; aux.tok = "SIMB_FECHA_CHAVES"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"if"                                { n_tokens++; aux.tok = "KEYWORD_IF"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux);  }
"else"                              { n_tokens++; aux.tok = "KEYWORD_ELSE"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"while"                             { n_tokens++; aux.tok = "KEYWORD_WHILE"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"return"                            { n_tokens++; aux.tok = "KEYWORD_RETURN"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"float"                             { n_tokens++; aux.tok = "KEYWORD_FLOAT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"char"                              { n_tokens++; aux.tok = "KEYWORD_CHAR"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"void"                              { n_tokens++; aux.tok = "KEYWORD_VOID"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"prnt"                              { n_tokens++; aux.tok = "KEYWORD_PRNT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"int"                               { n_tokens++; aux.tok = "KEYWORD_INT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"proc"                              { n_tokens++; aux.tok = "KEYWORD_PROC"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
"var"                               { n_tokens++; aux.tok = "KEYWORD_VAR"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
{multilinecoment}                   { ; }                   
{alpha}                             { n_tokens++; aux.tok = "IDENTIFICADOR"; aux.lexema = yytext;
                                        aux.linha = yylineno; simbTable.push_back(aux); } 
{int}                               { n_tokens++; aux.tok = "VALUE_INT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
{float}                             { n_tokens++; aux.tok = "VALUE_FLOAT"; aux.lexema = yytext; 
                                        aux.linha = yylineno; simbTable.push_back(aux); }
{whitespace}
{linefeed}	                        ++yylineno;
.                                   { yyerror("Erro lexico encontrado",yytext); }

%%

main( int argc, char *argv[] )
{ 
  extern FILE *yyin;
  ++argv; --argc;
  yyin = fopen( argv[0], "r" );
  yylex();
  cout << "\t\tTOKEN\t\tLEXEMA\t\tLINHA\n";
  for(int i=0;i<simbTable.size();i++){
      token aux2;
      aux2.tok = simbTable[i].tok;
      aux2.lexema = simbTable[i].lexema;
      aux2.linha = simbTable[i].linha;
      cout << "\t" << aux2.tok << "\t\t" << aux2.lexema << "\t\t" << aux2.linha << endl;
  }
  cout << yylineno << endl << n_tokens << endl;
}

void yyerror(char *s, char *token) {
  cout << "# Error! # Message: " << s << " # Linha: " << yylineno << " # Caracter: "<< token << endl;
}