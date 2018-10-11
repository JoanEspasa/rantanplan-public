#ifndef NODEVISITOR_H
#define NODEVISITOR_H

#include "solver.h"

#include <memory>

class Parameter;
class Predicate;
class Functor;
class Function;
class Action;
class Constraint;
class Thing;

class nodeVisitor {

    public:
        virtual void visitParameter( std::shared_ptr<Parameter> ptr) = 0;
        virtual void visitFunctor( std::shared_ptr<Functor> ptr) = 0;
        virtual void visitPredicate( std::shared_ptr<Predicate> ptr) = 0;
        virtual void visitFunction( std::shared_ptr<Function> ptr) = 0;
        virtual void visitAction( std::shared_ptr<Action> ptr) = 0;
        virtual void visitConstraint( std::shared_ptr<Constraint> ptr) = 0;

    protected:
        nodeVisitor(){};
};

#endif
