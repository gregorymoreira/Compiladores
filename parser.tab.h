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
    VALUE_CHAR = 261,
    OP_MAIOR = 262,
    OP_MENOR = 263,
    OP_MENOR_IGUAL = 264,
    OP_MAIOR_IGUAL = 265,
    OP_IGUAL = 266,
    OP_DIFERENTE = 267,
    OP_SOMA = 268,
    OP_SUB = 269,
    OP_MULT = 270,
    OP_DIV = 271,
    OP_MOD = 272,
    OP_AND = 273,
    OP_OR = 274,
    OP_NOT = 275,
    ATRIBUICAO = 276,
    SIMB_FECHA_PARENTESES = 277,
    SIMB_ABRE_PARENTESES = 278,
    SIMB_VIRGULA = 279,
    SIMB_PONTO_VIRGULA = 280,
    SIMB_ABRE_CHAVES = 281,
    SIMB_FECHA_CHAVES = 282,
    KEYWORD_IF = 283,
    KEYWORD_ELSE = 284,
    KEYWORD_WHILE = 285,
    KEYWORD_RETURN = 286,
    KEYWORD_FLOAT = 287,
    KEYWORD_CHAR = 288,
    KEYWORD_VOID = 289,
    KEYWORD_PRNT = 290,
    KEYWORD_INT = 291,
    KEYWORD_PROC = 292,
    KEYWORD_VAR = 293
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 12 "parser.y" /* yacc.c:1909  */

    char *sval;

#line 97 "parser.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
