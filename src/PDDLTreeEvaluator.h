#ifndef	PDDLTREEEVALUATOR_H
#define PDDLTREEEVALUATOR_H

#include <map>
#include <string>
#include <iostream>
#include <memory>

#include <antlr3.h>

#include "functor.h"

#include "PDDLProblem.h"
#include "PDDLParser.h"     // per els tokens

#include "predicate.h"
#include "function.h"
#include "action.h"

#include "anthelp.h"

class PDDLTreeEvaluator 
{
	public:
		std::shared_ptr<PDDLProblem> getProblem(pANTLR3_BASE_TREE domain_tree, pANTLR3_BASE_TREE instance_tree);
		int spit(pANTLR3_BASE_TREE, int n = 0);

    private:
		void runDomain(pANTLR3_BASE_TREE, std::shared_ptr<PDDLProblem> problem);
	    void runInstance(pANTLR3_BASE_TREE, std::shared_ptr<PDDLProblem> problem);
};

#endif
