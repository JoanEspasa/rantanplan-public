#ifndef SIMPLIFYVISITOR_H
#define SIMPLIFYVISITOR_H

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

class simplifyVisitor : public nodeVisitor {

    public:
        simplifyVisitor();
        virtual ~simplifyVisitor();

        // Visitors
        void visitParameter( std::shared_ptr<Parameter> ptr);
        void visitFunctor( std::shared_ptr<Functor> ptr);
        void visitPredicate( std::shared_ptr<Predicate> ptr);
        void visitFunction( std::shared_ptr<Function> ptr);
        void visitAction( std::shared_ptr<Action> ptr);
        void visitConstraint( std::shared_ptr<Constraint> ptr);

        // sets
        void setInits(std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p);

    protected:
        std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p_inits;
};


#endif
