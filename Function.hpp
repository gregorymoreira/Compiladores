#pragma once
#include "SyntaxTree.hpp"
#include <iostream>

namespace compiler
{
	class Function : public SyntaxTree
	{
	public:

		Function(SyntaxTree *name, SyntaxTree *statements)
		{
			children.push_back(name);
			children.push_back(statements);
		}

		virtual ~Function()
		{

		}

		virtual std::string toCode() const
		{
			std::string code;
			
			code += "#include <bits/stdc++.h>\n";
			code += "int main() {";
			for(SyntaxTree *node : children)
			{
				if(node  != nullptr)
				{
					//std::cout << "Function child " << node << std::endl;
					code += node->toCode();
				}
			}
			code += "std::cout << std::endl;";
			code += "}";
			return code;
		}

	};
}