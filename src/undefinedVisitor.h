#ifndef UNDEFINEDVISITOR_H
#define UNDEFINEDVISITOR_H

#include <vector>
#include <map>
#include <memory>
#include <string>

#include "nodeVisitor.h"
#include "thing.h"
#include "functor.h"
#include "parameter.h"
#include "predicate.h"
#include "function.h"
#include "action.h"
#include "constraint.h"

class undefinedVisitor : public nodeVisitor {

    public:
        undefinedVisitor();
        virtual ~undefinedVisitor();

        // Visitors
        void visitParameter( std::shared_ptr<Parameter> ptr);
        void visitFunctor( std::shared_ptr<Functor> ptr);
        void visitPredicate( std::shared_ptr<Predicate> ptr);
        void visitFunction( std::shared_ptr<Function> ptr);
        void visitAction( std::shared_ptr<Action> ptr);
        void visitConstraint( std::shared_ptr<Constraint> ptr);

        // sets
        void setInits(std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p);

        // gets
        std::shared_ptr<std::vector<std::shared_ptr<Action> > > getDeletableActions();
        std::shared_ptr<std::vector<std::shared_ptr<Function> > > getDeletableFunctions();

    protected:
        std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p_inits;
        std::shared_ptr<std::vector<std::shared_ptr<Action> > > deletable_actions;
        std::shared_ptr<std::vector<std::shared_ptr<Function> > > deletable_functions;

        bool hasValue(std::shared_ptr<Thing> tree);
};


#endif
