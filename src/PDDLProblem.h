#ifndef	PDDLPROBLEM_H
#define PDDLPROBLEM_H

#include <map>
#include <unordered_map>
#include <set>
#include <vector>
#include <iostream>
#include <fstream>
#include <memory>
#include <string>
#include <sstream>
#include <algorithm>
#include <bitset>

#include <antlr3.h>

#include "predicate.h"
#include "function.h"
#include "action.h"
#include "functor.h"

#include "sym_register.h"

#include "PDDLParser.h"
#include "anthelp.h"
#include "timer.h"
#include "solver.h"

#include "undefinedVisitor.h"
#include "simplifyVisitor.h"
#include "firstEncodingVisitor.h"

class PDDLProblem
{

    private:
        // per controlar el tipatge necessito saber per cada supertipus tots els seus tipus, i
        // si un tipus es un supertipus tambe doncs tots els seus tipus, etc ....
        // la semantica del map es: "Key" es "vector de valors"
        // p ex:                    "ship" es "location, object, movable"
        // enlloc de un vector podria ser un set... ja que no ens
        // importa l'ordre
        //
        std::shared_ptr < std::map< std::string, std::vector< std::string> > > types;
        std::shared_ptr < std::map< std::string, std::vector< std::string> > > inv_types;

        // com que el mes normal que necessiti saber es el nombre d'objectes de cada tipus, esta enmagatzemat
        // com a "tipus" - llista de noms , de moment no val la pena crear una classe objecte
        //
        std::map< std::string, std::vector< std::string> > objects_by_type;
        std::shared_ptr < std::map< std::string, std::string > > objects;

        // La taula de simbols amb tots els predicats, funcions i accions del problema.
        //
        std::map< std::string, std::shared_ptr<sym_register> > sym_table;

        // Les inicialitzacions del problema. Están totes en forma de (= X Y)
        // on X es el que inicialitzem i Y el valor.
        //
        std::shared_ptr< std::vector<std::shared_ptr<Functor> > > inits;

        // objectiu (expresio a aconseguir)
        //
        std::shared_ptr<Thing> objective;

        // si minimitzem o maximitzem, i el que
        //
        std::shared_ptr<Thing> metric;

        // Objectes externs 
        // ===============================
        // el solver que farem anar per assertar les constraints
        //
        std::shared_ptr<Solver> solver;
        std::shared_ptr<encoderVisitor> encoder;

    public:
        PDDLProblem();
        ~PDDLProblem();

        // funcions per als tipus
        void addType(std::string typeName, std::string baseType);
        std::shared_ptr<vector<string> > getAllSupertypes(std::string typeName);
        std::shared_ptr<std::vector<std::string>> getAllSubtypes(std::string typeName);

        void addSymbol(std::shared_ptr<Thing> t); 
        void deleteSymbol(std::string t); 
        std::shared_ptr<sym_register> getSymbol(std::string name);
        std::shared_ptr<sym_register> getRawSymbol(std::string name);
        bool hasSymbol(std::string s);

        std::shared_ptr<Predicate> getPredicateByKey(std::string name);
        std::shared_ptr<Predicate> getRawPredicate(std::string name);
        std::shared_ptr<Function> getFunctionByKey(std::string name);
        std::shared_ptr<Function> getRawFunction(std::string name);
        std::shared_ptr<Action> getActionByKey(std::string name);
        std::shared_ptr<Action> getRawAction(std::string name);

        // funcions per les instancies
        void addObject(std::string name, std::string type);
        std::vector<std::string> getObjectsByType(std::string type);
        std::string getObjectTypeByName(std::string name);
        void addRawObjective(std::shared_ptr<Thing> ptr);
        void addMetricToOptimize(std::shared_ptr<Thing> ptr);

        void addInit(std::shared_ptr<Functor> ptr);
        void checkAndSetStaticFunctors();
        void simplifyProblem();
        void solveUndefined();

        void addNOP();
        void encodeProblem();
        std::shared_ptr<std::vector<std::shared_ptr<Functor> > > encodeFunctor(std::shared_ptr<Functor> Functor);

        void encodePredicate(std::shared_ptr<sym_register> pred);
        void encodeFunction(std::shared_ptr<sym_register> func);
        void encodeAction(std::shared_ptr<sym_register> act);
        void encodeConstraint(std::shared_ptr<sym_register> con);

        void expandForalls(std::shared_ptr<Action> act);

        void addEncoder(std::shared_ptr<encoderVisitor> vis);
        void addSolver(std::shared_ptr<Solver> solv);

        void dump();
        void solve();
};

#endif
