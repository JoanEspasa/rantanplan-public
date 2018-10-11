#ifndef ENCODINGUFVISITORFILE_H
#define ENCODINGUFVISITORFILE_H

#include "encodingUFVisitor.h"

/*! 
 * 
 * 
 */

class encodingUFVisitorFile : public encodingUFVisitor { 

    public:
        encodingUFVisitorFile(string plan_file, int alg_solv,string incomp,string par);
        virtual ~encodingUFVisitorFile();

        virtual void generateDefinitions(shared_ptr<Functor> ptr);

        void assertInitialState();
        void assertTimeStep(int t);
        void assertVarsTS(int t);
        void assertConstraintsTS(int t);
        long assertObjective(int t);

        void addVar(string s);
        void addGetValue(string s);
        void addConstraint(string s);
        int assertRetractable(string s);
        int check_sat(int timeout = 0);
        int retract(int p);

        void dumpSolution(int t);
        void debug(bool verbose);

        void solve();
        void solveLineal();
        void solveEto();

    protected:
        string plan_filename;
        int timestep_file;
        int solving_alg;
        std::vector<std::string> v_vars;
        std::vector<std::string> v_getvalues;
        std::vector<std::string> v_constraints;


        std::vector<std::string> vs_plan;
};

#endif
