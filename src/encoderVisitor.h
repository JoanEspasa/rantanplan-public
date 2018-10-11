#ifndef ENCODERVISITOR_H
#define ENCODERVISITOR_H

#include "nodeVisitor.h"

#include <cassert>
#include <memory>
#include <map>
#include <vector>
#include <set>

#include "thing.h"
#include "parameter.h"
#include "functor.h"
#include "function.h"
#include "action.h"

// fem aqui aquests includes perque els necessitaran tant les classes de UF com les de LIA a seques
// per fer els checks de incompatibilitat semantics implementats a l'article
#include "solver.h"
#include "solverInclude.h"
#include "solverActionNOP.h"

class encoderVisitor : public nodeVisitor {

  public:
    virtual bool needsFlattening() = 0;

    virtual void setInits(std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p) = 0;
    virtual void setSolver(std::shared_ptr<Solver> solv) = 0;
    virtual void setObjective(std::shared_ptr<Thing> obj) = 0;
    virtual void setObjects(std::shared_ptr < std::map< std::string, std::string > > ptr) = 0;
    virtual void setTypes(std::shared_ptr<std::map< std::string, std::vector< std::string> > > ptr) = 0;
    virtual void setDeletedFunctions(std::shared_ptr<std::set< std::string > > ptr) = 0;
    virtual void setDeletedActions(std::shared_ptr<std::set< std::string > > ptr) = 0;


    // encoding
    virtual void encodeTheRestPlease() = 0;

    // solving time!
    virtual void assertInitialState() = 0;
    virtual void assertTimeStep(int t) = 0;
    virtual void assertVarsTS(int t) = 0;
    virtual void assertConstraintsTS(int t) = 0;
    virtual long assertObjective(int t) = 0;

    virtual void debug(bool verbose) = 0;
    virtual void solve() = 0;
    virtual void solveLineal() = 0;
    virtual void solveEto() = 0;

    // funcions implementades
    virtual void searchAndReplaceValues(
        std::shared_ptr<std::vector<std::string> > values ,
        std::shared_ptr< std::vector<std::shared_ptr<Parameter> > > parameters,
        std::shared_ptr<Thing> tree);
    std::string search_and_replace(std::string s, std::string search, std::string replace);
    std::vector<std::string> str_explode(std::string s,std::string delimiter);

  protected:
    encoderVisitor(){};
};

#endif
