all:
	$(MAKE) grammar
	$(MAKE) lex
	g++ -std=gnu++11 -c grammar.tab.c lex.yy.c
	ar rvs lexgram.a grammar.tab.o lex.yy.o
	g++ -std=gnu++11 -Wall -Wextra main.cpp lexgram.a

grammar:
	bison -d grammar.y

lex:
	flex lex.l

run:
	$(MAKE) all
	./a.out < enter.code > compiled.cpp
	g++ compiled.cpp -o compiled.exe
	./compiled.exe