#ifndef ENCODINGUFVISITOR_H
#define ENCODINGUFVISITOR_H

#include <vector>
#include <map>
#include <memory>
#include <string>
#include <fstream>
#include <sstream>
#include <algorithm>

#include "timer.h"
#include "encoderVisitor.h"
#include "thing.h"
#include "functor.h"
#include "parameter.h"
#include "predicate.h"
#include "function.h"
#include "action.h"

/*! 
 * Aquesta classe no s'hauria d'instanciar ... 
 */

class encodingUFVisitor : public encoderVisitor {

    public:
        //encodingUFVisitor();
        encodingUFVisitor(string incomp, string par);
        virtual ~encodingUFVisitor();

        bool needsFlattening();

        // Visitors
        void visitParameter( std::shared_ptr<Parameter> ptr);
        void visitFunctor( std::shared_ptr<Functor> ptr);
        void visitPredicate( std::shared_ptr<Predicate> ptr);
        void visitFunction( std::shared_ptr<Function> ptr);
        void visitAction( std::shared_ptr<Action> ptr);
        void visitConstraint( std::shared_ptr<Constraint> ptr);

        // sets
        void setInits(std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p);
        void setSolver(std::shared_ptr<Solver> solv);
        void setObjective(std::shared_ptr<Thing> obj);
        void setObjects(std::shared_ptr < std::map< std::string, std::string > > ptr);
        void setTypes(std::shared_ptr<std::map< std::string, std::vector< std::string> > > ptr);
        void setDeletedFunctions(std::shared_ptr<std::set< std::string > > ptr);
        void setDeletedActions(std::shared_ptr<std::set< std::string > > ptr);

        // encoding
        void encodeTheRestPlease();
        std::pair<int,int> computeIntDomain(string type);
        virtual void generateDefinitions(shared_ptr<Functor> ptr) = 0;
        void generate1();
        void generate2();
        void generate4();

        void encodeParallelism();
        void generateEX1();
        void syntacticIncompatibilities();
        void semanticIncompatibilities();
        void existsStep();

    protected:
        int random_not_so_random;
        string incompatibilities; // si sintactiques (o) o semantiques (n)
        string parallelism; // tipus de paralelisme: lineal (l) exists-step (e)

        // Metodes interns
        // ===============================
        std::shared_ptr<vector<string> > getAllSubtypes(string typeName);
        std::shared_ptr<vector<string> > getAllSupertypes(string typeName);
        std::string getObjectType(string obj);

        void searchAndReplaceNames(
                shared_ptr<vector<string> > names,
                shared_ptr< vector<string> > parameters,
                shared_ptr<Thing> tree);
        std::string getRandomName(std::string str = "");

        // Estructures que ens passa el PDDLProblem que poguem necessitar
        // ===============================
        std::shared_ptr<Thing> objective;
        std::shared_ptr<std::map< std::string, std::vector< std::string> > > types;
        std::shared_ptr<std::map< std::string, std::vector< std::string> > > inv_types;
        std::shared_ptr < std::map< std::string, std::string > > objects;
        std::map< std::string, std::vector< std::string> > objects_by_type;
        std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p_inits;

        // dades de l'encoding
        // ===============================
        std::vector<std::string> s_inits;           
        std::vector<shared_ptr<Predicate> > predicates;
        std::vector<shared_ptr<Predicate> > grounded_predicates;
        std::vector<shared_ptr<Function> > functions;
        std::vector<shared_ptr<Function> > grounded_functions;
        std::vector<shared_ptr<Action> > actions;
        std::vector<shared_ptr<Action> > grounded_actions;

        
        // indexa els predicats/funcions que apareixen modificats als efectes
        // de les accions.  Serveix per generar la codificacio de:
        // a /\ not(a) ->  .... 
        //
        // te la forma seguent:
        //
        // nom \/ not(nom) -> < ptr_predicate, [ <ptr_accio,fd,[parametres]>,
        // <ptr_accio,fd,[parametres]>, ... ] >
        //
        // [parametres] es una llista d'enters, on , cada posició del vector
        // indica a quin parametre de l'acció correspon. Per ex: [1,3]
        // indicaria que el primer parametre del predicat concorda amb el
        // primer parametre de l'accio, i el segon parametre del predicat
        // concorda amb el tercer parametre de l'accio. esta indexat amb base
        // 0, per poder-ho fer servir directament amb ->getParam(x).  Un -1 com
        // a valor vol dir que no es un T_VARIABLE, per exemple T_CONSTANT o
        // T_UNKNOWN!
        //
        // l'int de la tupla, indica a quin F->D correspon
        std::map<string,std::pair<
            std::shared_ptr<Predicate>,
            std::vector<std::tuple<std::shared_ptr<Action>,int,std::vector<int> > > > > idx_eff_predicates;

        std::map<string,std::pair<
            std::shared_ptr<Function>,
            std::vector<std::tuple<std::shared_ptr<Action>,int,std::vector<int> > > > > idx_eff_functions;

        std::map<string, std::shared_ptr<Parameter> > encoded_vars; // encoded var definition - name - type
        std::map<string,string> encoded_functions;
        std::vector<string> encoded_constraints;
        
        std::map<string, std::pair<int,int> > type_domain; // tipus1 -> [0,5] , tipus2 -> [6,7] , etc ...
        int max_type_domain; // variable temporal per no haver de buscar el maxim cada cop que es busca

        // Objectes externs 
        // ===============================
        // el solver que farem anar per assertar les constraints
        std::shared_ptr<Solver> solver;
        int max_steps;
};

#endif
