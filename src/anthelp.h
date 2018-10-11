#ifndef ANTHELPER_H
#define ANTHELPER_H

#include <cassert>
#include <antlr3.h>
#include <memory>
#include <iostream>
#include <sstream>
#include <string>

#include "PDDLParser.h"
#include "predicate.h"
#include "function.h"
#include "action.h"
#include "functor.h"
#include "parameter.h"
#include "PDDLProblem.h"

class PDDLProblem; // dep circ

namespace anthelp {
    pANTLR3_BASE_TREE getChild(pANTLR3_BASE_TREE tree, unsigned i);
    const char* getText(pANTLR3_BASE_TREE tree);
    const char* toString(pANTLR3_BASE_TREE tree);
    const char* toStringTree(pANTLR3_BASE_TREE tree);

    std::shared_ptr<Predicate> createPredicateFromTree(pANTLR3_BASE_TREE tree);
    std::shared_ptr<Predicate> createPredicateFromAction(pANTLR3_BASE_TREE tree);
    std::shared_ptr<Function> createFunctionFromTree(pANTLR3_BASE_TREE func_name, pANTLR3_BASE_TREE type = NULL);
    std::shared_ptr<Function> createFunctionFromAction(pANTLR3_BASE_TREE func_name);
    std::shared_ptr<Action> createActionFromTree(pANTLR3_BASE_TREE action_tree, std::shared_ptr<PDDLProblem> prob);
    std::shared_ptr<Constraint> createConstraintFromTree(pANTLR3_BASE_TREE action_tree, std::shared_ptr<PDDLProblem> prob);
    std::shared_ptr<Functor> createInitFromTree(pANTLR3_BASE_TREE tree, std::shared_ptr<PDDLProblem> prob);
    void antlr3ToOwn(pANTLR3_BASE_TREE tree, std::shared_ptr<Thing> ptr, std::shared_ptr<PDDLProblem> prob, bool instanced = false);
    void searchAndReplaceValues(std::shared_ptr<std::vector<std::string> > values ,
            std::shared_ptr< std::vector<std::shared_ptr<Parameter> > > parameters,
            std::shared_ptr<Thing> tree,
            bool set_static = false);
}

#endif
