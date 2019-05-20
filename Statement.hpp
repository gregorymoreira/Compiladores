#pragma once
#include "SyntaxTree.hpp"
#include <iostream>

namespace compiler
{
	class Statement : public SyntaxTree
	{
	public:

		Statement(SyntaxTree *tree)
		{
			children.push_back(tree);
		}

		virtual ~Statement()
		{

		}

		virtual std::string toCode() const
		{
			return "printf(\"%s\",\"" + children[0]->toCode() + "\");" ;
			//return children[0]->toCode();
		}

	};
}