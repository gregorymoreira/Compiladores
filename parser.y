%{
    #include <bits/stdc++.h>
    using namespace std;
    extern int yylex();
    extern void yyerror(char *s);
    extern int n_tokens;
    extern int yylineno;
    extern void printSimbTable();

%}

%union{
    char *sval;
};

%token <sval> IDENTIFICADOR VALUE_INT VALUE_FLOAT VALUE_CHAR
%token OP_MAIOR OP_MENOR OP_MENOR_IGUAL OP_MAIOR_IGUAL OP_IGUAL OP_DIFERENTE
%token OP_SOMA OP_SUB OP_MULT OP_DIV OP_MOD OP_AND OP_OR OP_NOT
%token ATRIBUICAO
%token SIMB_FECHA_PARENTESES SIMB_ABRE_PARENTESES SIMB_VIRGULA SIMB_PONTO_VIRGULA SIMB_ABRE_CHAVES SIMB_FECHA_CHAVES
%token KEYWORD_IF KEYWORD_ELSE KEYWORD_WHILE KEYWORD_RETURN KEYWORD_FLOAT KEYWORD_CHAR
%token KEYWORD_VOID KEYWORD_PRNT KEYWORD_INT KEYWORD_PROC KEYWORD_VAR

%left OP_OR OP_AND
%left OP_SOMA OP_SUB
%left OP_MULT OP_DIV OP_MOD
%left OP_DIFERENTE OP_MAIOR_IGUAL OP_MENOR_IGUAL OP_MENOR OP_IGUAL SIMB_ABRE_PARENTESES
%left OP_NOT

%start programa

%% 

programa:
        decl_global
        | %empty
        ;
decl_global:
        decl_funcao
        | decl_variavel
        | decl_global decl_funcao
        | decl_global decl_variavel
        ;
decl_variavel:
        KEYWORD_VAR lista_idents OP_SUB tipo SIMB_PONTO_VIRGULA
        ;
lista_idents:
        IDENTIFICADOR
        | lista_idents SIMB_VIRGULA IDENTIFICADOR
        ;
tipo:
        KEYWORD_INT
        | KEYWORD_CHAR
        | KEYWORD_FLOAT
        ;
decl_funcao: 
        KEYWORD_PROC nome_args OP_SUB tipo bloco
        | KEYWORD_PROC nome_args bloco
        ;
nome_args:
        IDENTIFICADOR SIMB_ABRE_PARENTESES param_formais SIMB_FECHA_PARENTESES
        | nome_args IDENTIFICADOR SIMB_ABRE_PARENTESES param_formais SIMB_FECHA_PARENTESES
        | IDENTIFICADOR SIMB_ABRE_PARENTESES SIMB_FECHA_PARENTESES
        | nome_args IDENTIFICADOR SIMB_ABRE_PARENTESES SIMB_FECHA_PARENTESES
        ;
param_formais:
        IDENTIFICADOR OP_SUB tipo
        | param_formais SIMB_VIRGULA IDENTIFICADOR OP_SUB tipo
        | %empty
        ;
bloco:
        SIMB_ABRE_CHAVES lista_comandos SIMB_FECHA_CHAVES
        ;
lista_comandos:
        comando
        | lista_comandos comando
        ;
comando:
        decl_variavel
        | atribuicao
        | iteracao
        | decisao
        | escrita
        | retorno
        | bloco
        | chamada_func_cmd
        ;
atribuicao:
        IDENTIFICADOR ATRIBUICAO expressao SIMB_PONTO_VIRGULA
        ;
iteracao:
        KEYWORD_WHILE SIMB_ABRE_PARENTESES expressao SIMB_FECHA_PARENTESES comando
        ;
decisao:
        KEYWORD_IF SIMB_ABRE_PARENTESES expressao SIMB_FECHA_PARENTESES comando KEYWORD_ELSE comando
        | KEYWORD_IF SIMB_ABRE_PARENTESES expressao SIMB_FECHA_PARENTESES comando
        ;
escrita:
        KEYWORD_PRNT SIMB_ABRE_PARENTESES lista_exprs SIMB_FECHA_PARENTESES SIMB_PONTO_VIRGULA
        |KEYWORD_PRNT SIMB_ABRE_PARENTESES SIMB_FECHA_PARENTESES SIMB_PONTO_VIRGULA
        ;
chamada_func_cmd:
        chamada_func SIMB_PONTO_VIRGULA
        ;
retorno:
        KEYWORD_RETURN expressao SIMB_PONTO_VIRGULA
        ;
chamada_func:
        IDENTIFICADOR SIMB_ABRE_PARENTESES lista_exprs SIMB_FECHA_PARENTESES
        | chamada_func IDENTIFICADOR SIMB_ABRE_PARENTESES lista_exprs SIMB_FECHA_PARENTESES
        | IDENTIFICADOR SIMB_ABRE_PARENTESES SIMB_FECHA_PARENTESES
        | chamada_func IDENTIFICADOR SIMB_ABRE_PARENTESES SIMB_FECHA_PARENTESES
        ;
lista_exprs:
        lista_exprs SIMB_VIRGULA expressao
        | expressao
        ;
expressao:
        expressao OP_SOMA expressao                     
        | expressao OP_SUB expressao                    
        | expressao OP_MULT expressao                   
        | expressao OP_DIV expressao                    
        | expressao OP_MOD expressao                    
        | expressao OP_AND expressao                    
        | expressao OP_OR expressao                     
        | expressao OP_IGUAL expressao                    
        | expressao OP_DIFERENTE expressao                    
        | expressao OP_MENOR expressao                    
        | expressao OP_MENOR_IGUAL expressao                    
        | expressao OP_MAIOR expressao                    
        | expressao OP_MAIOR_IGUAL expressao                    
        | expr_basica
        ;
expr_basica:
        SIMB_ABRE_PARENTESES expressao SIMB_FECHA_PARENTESES
        | OP_NOT expr_basica
        | OP_SUB expr_basica
        | VALUE_INT                                       
        | VALUE_FLOAT
        | VALUE_CHAR                                       
        | IDENTIFICADOR                                     
        | chamada_func
        ;

%%

main( int argc, char *argv[] )
{ 
    extern FILE *yyin;
    ++argv; --argc;
    yyin = fopen( argv[0], "r" );
    yyparse ();
    printSimbTable();
  cout << "N de linhas no arquivo: " << yylineno << endl << "N de lexemas encontrados: " << n_tokens << endl;
}

void yyerror(char *s) {
  cout << "Error! # Message: " << s << " linha: " << yylineno << endl;
}
