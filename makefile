all:
	clear
	bison -d parser.y
	flex lexico.l
	g++ parser.tab.c lex.yy.c -lfl -o compilar