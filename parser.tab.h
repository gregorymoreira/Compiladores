/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IDENTIFICADOR = 258,
    VALUE_INT = 259,
    VALUE_FLOAT = 260,
    OP_MAIOR = 261,
    OP_MENOR = 262,
    OP_MENOR_IGUAL = 263,
    OP_MAIOR_IGUAL = 264,
    OP_IGUAL = 265,
    OP_DIFERENTE = 266,
    OP_SOMA = 267,
    OP_SUB = 268,
    OP_MULT = 269,
    OP_DIV = 270,
    OP_MOD = 271,
    OP_AND = 272,
    OP_OR = 273,
    OP_NOT = 274,
    ATRIBUICAO = 275,
    SIMB_FECHA_PARENTESES = 276,
    SIMB_ABRE_PARENTESES = 277,
    SIMB_VIRGULA = 278,
    SIMB_PONTO_VIRGULA = 279,
    SIMB_ABRE_CHAVES = 280,
    SIMB_FECHA_CHAVES = 281,
    KEYWORD_IF = 282,
    KEYWORD_ELSE = 283,
    KEYWORD_WHILE = 284,
    KEYWORD_RETURN = 285,
    KEYWORD_FLOAT = 286,
    KEYWORD_CHAR = 287,
    KEYWORD_VOID = 288,
    KEYWORD_PRNT = 289,
    KEYWORD_INT = 290,
    KEYWORD_PROC = 291,
    KEYWORD_VAR = 292
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 12 "parser.y" /* yacc.c:1909  */

    char *sval;

#line 96 "parser.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
