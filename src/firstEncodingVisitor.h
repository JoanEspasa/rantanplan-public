#ifndef FIRSTENCODINGVISITOR_H
#define FIRSTENCODINGVISITOR_H

// TODO: Passar els strings de BOOLEAN a INTEGER a una case class
#include "timer.h"

#include "encoderVisitor.h"
#include "parameter.h"
#include "predicate.h"
#include "functor.h"
#include "function.h"
#include "action.h"
#include "constraint.h"


// per tindre el getpid
#include <sys/types.h>
#include <unistd.h>

#include <queue>
#include <list>
#include <stack>
#include <bitset>
#include <limits.h>
#include <algorithm>
#include <tuple>
#include <vector>
#include <map>
#include <math.h>
#include <unordered_map>
#include <set>
#include <memory>
#include <string>
#include <sstream>
#include <fstream>

class firstEncodingVisitor : public encoderVisitor {

    public:
        firstEncodingVisitor(string parallelism, string exists_order, string exists_enc, string int_incompat_type, string plan_file, std::string int_func_dom, int alg_solv, int cycles_flag, int mutex_flag,int sorting_network,int decide_flag);
        virtual ~firstEncodingVisitor();

        bool needsFlattening();

        // Visitors
        virtual void visitParameter( std::shared_ptr<Parameter> ptr);
        virtual void visitFunctor( std::shared_ptr<Functor> ptr);
        virtual void visitPredicate( std::shared_ptr<Predicate> ptr);
        virtual void visitFunction( std::shared_ptr<Function> ptr);
        virtual void visitAction( std::shared_ptr<Action> ptr);
        virtual void visitConstraint( std::shared_ptr<Constraint> ptr);

        // sets
        void setInits(std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p);
        void setSolver(std::shared_ptr<Solver> solv);
        void setObjective(std::shared_ptr<Thing> obj);
        void setObjects(std::shared_ptr < std::map< std::string, std::string > > ptr);
        void setTypes(std::shared_ptr<std::map< std::string, std::vector< std::string> > > ptr);
        void setDeletedActions(std::shared_ptr<std::set< std::string > > ptr);
        void setDeletedFunctions(std::shared_ptr<std::set< std::string > > ptr);

        // encoding
        void generate4();
        void debug(bool verbose);

        virtual void encodeParallelism();

        void encodeExactlyOneAction();
        void naiveExactlyOneEncoding();
        void binaryEncoding();

        void forallStep();
        void existsStep();
        void booleanIncompatibilities();
        void classicalIntegerIncompatibilities();
        virtual void newIncompatibilities(bool permissiveThird);
        virtual void semanticIncompatibilities(bool only_check1);

        void affectationGraph();
        std::map<std::string,int> communitiesOrdering();
        std::map<std::string,int> relaxedOrdering();
        void encodeObjects();
        void encodeTheRestPlease();
        void addSorterNetwork();

        // solving time!
        void assertInitialState();
        void assertTimeStep(int t);
        void assertDifferentState(int t);
        void assertVarsTS(int t);
        void assertConstraintsTS(int t);
        long assertObjective(int t);

        void solve();
        void solveLineal();
        void solveEto();

        // solving RELAXED time!
        void r_assertInitialState();
        void r_assertTimeStep(int t);
        void r_assertVarsTS(int t);
        void r_assertConstraintsTS(int t);
        long r_assertObjective(int t);
        std::vector<std::vector<string > > r_solveLineal();
        void r_dumpSolution(int t);

        virtual std::vector< std::vector<string> > sequentializeActions(std::vector< std::vector<string> > accions_t);


        // auxiliars
        std::string getRandomName(std::string str = "");
        std::vector<string> explode(std::string inputstring,std::string delimiter);

        void dumpSolution(int t);

    protected:
        std::string exists_ordering;
        std::string exists_encoding;
        std::string parallelism_model;
        std::string plan_filename;
        std::string int_incompat;
        std::string int_func_domains;
        int solving_alg;
        int cut_cycles;
        int add_mutexes;
        bool decidable_actions;
        bool different_states;

        // vector necessari per despres comprovar que els frame actions enters
        // es creen tots. Es pot donar el cas de que una funcio rebi un arbre de
        // tipus com a parametre i que alguns tipus siguin estatics i alguns no.
        std::vector<std::shared_ptr<Function> > vec_functions;

        // Estructures de suport a l'encoding
        // -----------------------------------
        std::shared_ptr<vector<string> > getAllSubtypes(std::string typeName);
        std::shared_ptr<vector<string> > getAllSupertypes(std::string typeName);
        // afegim el filtrat de les eliminades
        std::shared_ptr<std::vector<std::shared_ptr<Functor> > > encodeFunctor(std::shared_ptr<Functor> f);


        // indexos i similars :
        //efecte -> ( (o_1, EPC_efecte(o_1)) ...
        std::map<std::string,
            std::vector<std::pair<std::shared_ptr<Action>,std::shared_ptr<Thing> > > > bool_epcs;
        //efecte -> ( (o_1, precond, efecte) ...
        std::map<std::string,
            std::vector<std::tuple<std::shared_ptr<Action>, std::shared_ptr<Thing>,std::shared_ptr<Thing> > > > int_epcs;

        // idx per fer la constraint 4 (frame enter)
        // str_var_int_modificada -> <action, precond, var>
        std::map<std::string,std::vector<
            std::tuple< std::shared_ptr<Action>, std::shared_ptr<Thing>, std::shared_ptr<Thing> > > > int_modif;
        

        // resta estructures per l'encoding general
        std::vector<std::shared_ptr<Thing> > pred_A;
        std::vector<std::shared_ptr<Thing> > bool_A;
        std::vector<std::shared_ptr<Thing> > int_A;

        std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p_inits;
        std::shared_ptr<Thing> objective;



        // es fa anar per incompatibilitats booleanes
        std::map< std::string , std::set<std::shared_ptr<Action> > > boolean_preconditions;

        // es fan anar per incompatibilitats enteres
        std::vector< std::shared_ptr<Action> > raw_actions;
        std::map< std::string , std::set<std::shared_ptr<Action> > > integer_preconditions;
        std::map< std::string , std::set<std::pair<int,std::shared_ptr<Action> > > > integer_fd_preconditions;
        std::map< std::string , std::set<std::pair<int,std::shared_ptr<Action> > > > integer_fd_effects;
        std::shared_ptr<std::map< std::string, std::vector< std::string> > > types;
        std::shared_ptr<std::map< std::string, std::vector< std::string> > > inv_types;

        std::shared_ptr<std::set< std::string > > deleted_actions;
        std::shared_ptr<std::set< std::string > > deleted_functions;

        std::shared_ptr < std::map< std::string, std::string > > objects;
        std::map< std::string, std::vector< std::string> > objects_by_type;
        std::map< std::string, int > objects_to_int;
        std::map< std::string, std::pair<int,int> > type_ranges;

        // graf d'incompatibilitats
        //
        // id -> [ <why,id>, <why,id>, ... ]
        std::map<std::string,std::set< std::pair<std::string,std::string> > > graph_inc;

        // graf d'incompatibilitats per fer l'encoding d'en rintanen
        // reason -> [ <orig,dest>, <orig,dest>, ... ]
        //
        std::map<std::string,std::set< std::pair<std::string,std::string> > > inc_rintanen;

        // id -> 0xDEADBEEF (Action)
        std::map<std::string,std::shared_ptr<Action> > graph_id_lookup;

        // Graf afectacions i ordres 
        // ///////////////////////////////
        // numeros del recorregut del dfs.
        std::map<string,int> dfsnum;
        std::map<string,int> comp_num;
        // DFScuts encoding
        std::vector< std::pair<string,string> >  DFScuts;
        // Ordre per l'encoding lineal
        std::map<string,int> num_arestes_entrants;

        // map de int a conjunt d'strings, que mapeja una ID de SCC cap a el conjunt d'accions que 
        // la formen. Nomes s'emplenara en cas d'executarse com a existential step.
        // (vector ordenat per ordre donat de les accions)
        std::map<int,std::vector<string> > SCC;

        // Strings que representen directament l'encoding
        // ----------------------------------------------
        std::vector<std::string> s_inits;           
        std::vector<std::string> one;           
        std::vector<std::string> two;
        std::vector<std::string> three;
        std::vector<std::string> four;
        std::vector<std::string> act_per_step;

        std::set<std::string> different_state;

        std::vector<std::string> O_vars;
        std::vector<std::shared_ptr<Action> > pO_vars;

        // Strings per l'encoding relaxat
        // ------------------------------
        std::vector<std::string> relaxed_one;           
        std::vector<std::string> relaxed_two;
        std::vector<std::string> relaxed_three;
        std::vector<std::shared_ptr<Thing> > relaxed_bool_A;
        std::vector<std::string> relaxed_act_per_step;

        // Auxiliars
        // ===============================
        // es un contador incremental per a posar diferents noms a vars temporals que crearem
        //
        int random_not_so_random;
        int sorting_network_size;

        // Objectes externs 
        // ===============================
        // el solver que farem anar per assertar les constraints
        //
        std::shared_ptr<Solver> solver;
        std::shared_ptr<Solver> r_solver;
        int max_steps;
};


#endif
