#ifndef ENCODINGUFVISITORZ3_H
#define ENCODINGUFVISITORZ3_H

#include "z3++.h"
#include "encodingUFVisitor.h"

class encodingUFVisitorZ3 : public encodingUFVisitor {

    public:
        encodingUFVisitorZ3(string plan_file, int alg_solv,string incomp, string par);
        virtual ~encodingUFVisitorZ3();

        virtual void generateDefinitions(shared_ptr<Functor> ptr);

        // We only change solving by filename to solving by API,
        // so we rewrite those functions.
        void assertInitialState();
        void assertInitialState(z3::context * c, z3::solver * sol);
        void assertTimeStep(int t);
        void assertTimeStep(int t, z3::context * c, z3::solver * sol);
        void assertVarsTS(int t);
        void assertVarsTS(int t, z3::context * c, z3::solver * sol);
        void assertConstraintsTS(int t);
        void assertConstraintsTS(int t, z3::context * c, z3::solver * sol);
        long assertObjective(int t);
        long assertObjective(int t, z3::context * c, z3::solver * sol);

        void dumpSolution(z3::model m, z3::context *con, int t);
        void debug(bool verbose);
        void solve();
        void solveLineal();
        void solveEto();

    protected:

        // 0 - lineal standard
        // 1 - proposat Miquel
        int solving_alg;

        // el nom del fitxer del plan que trobarem
        std::string plan_filename;

        // TODO
        // com representem els dominis de les variables del problema. Ja que son
        // els parametres de les UF, els seus dominis son finits. Te dos possibles
        // valors:
        // - els representem amb un or de valors: "or"
        // - els representem amb un rang (>= && <=) de valors : "range" 
        std::string int_domains; 

        // estructura de lookup per a un cop generat el plan,
        // passar els parametres de enters a strings 
        std::map<int,string> int2obj;

        // aquest es el vector de funcions a crear a nivell d'SMT. 
        // l'estructura es la seguent:
        // < string,          -> nom 
        //   int,             -> nombre de parametres (tots enters)
        //   string>          -> tipus de retorn
        std::vector< std::tuple<std::string,int,std::string> > smt_functions;

        // "guardem" el que hem creat amb el z3, perque no peti tot, joder
        std::map<string,z3::expr> m_var;
        std::map<string,z3::func_decl> m_func;
        std::vector<z3::expr> v_constr;

        // estructures de dades i objectes referents
        // al z3 en si
        z3::config * cfg;
        z3::context * c;
        z3::solver * s;

        z3::config * timed_cfg;
        z3::context * timed_c;
        z3::solver * timed_s;

        // necessari per a despres fer servir el Z3_parse_smtlib2_string
        std::vector<Z3_symbol> v_symbols;
        std::vector<Z3_func_decl> v_func_decl;

        // z3 helper functions
        void z3_assert_str(std::string s, z3::context * c, z3::solver * sol);

        /*
        z3::expr z3_mk_or(z3::expr_vector v);
        void z3_assert_str_demo();
        */
};

#endif
