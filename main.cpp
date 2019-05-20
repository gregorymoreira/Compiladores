#include <iostream>
#include <memory>
#include "SyntaxTree.hpp"

extern int yyparse();
extern int yylineno;
extern std::unique_ptr<compiler::SyntaxTree> root;

int main()
{
	int result = yyparse();
	// if(result == 0)
	// {
	// 	std::cout << "The input is valid." << std::endl;
	// }
	// else
	// {
	// 	std::cout << "The input is invalid." << std::endl;
	// }
	// std::cout << "Linhas no input: " << yylineno << std::endl;
	
	std::cout << root->toCode() << std::endl;

	return result;
}