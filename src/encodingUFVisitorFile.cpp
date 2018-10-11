#include "encodingUFVisitorFile.h"

using namespace std;

/*
    PLACEHOLDER 
*/


/*! 
 * Constructor de la classe. Seteja algunes variables base.
 */
encodingUFVisitorFile::encodingUFVisitorFile(string plan_file, int alg_solv,string incomp, string par) : encodingUFVisitor(incomp,par){
    solving_alg = alg_solv;
    plan_filename = plan_file;
}

/*! 
 * Destructor de la classe. No fa res :(
 */
encodingUFVisitorFile::~encodingUFVisitorFile(){
    // NOP
}

/*!
 * generateDefinitions genera l'string de declaracio a SMT de un predicat, funcio o accio.
 */
void encodingUFVisitorFile::generateDefinitions(shared_ptr<Functor> ptr){
    // a definition hi guardem l'string de com declarariem amb SMT2 la funcio
    string definition = "(declare-fun " + ptr->getName() + " (";
    for(int i = 0; i < ptr->getNParams(); i++){
        // construim les strings
        if(i == 0) { definition += "Int"; } else { definition += " Int"; }
    }

    // afegim el timestep com a ultim parametre i el valor de retorn
    if(ptr->type == functor_type::T_PREDICATE){
        definition += " Int) " + static_pointer_cast<Predicate>(ptr)->getReturnType() + ")";
    } else if(ptr->type == functor_type::T_FUNCTION){
        definition += " Int) " + static_pointer_cast<Function>(ptr)->getReturnType() + ")";
    } else if(ptr->type == functor_type::T_ACTION){
        definition += " Int) " + static_pointer_cast<Action>(ptr)->getReturnType() + ")";
    }
    encoded_functions[ptr->toString()] = definition;
}

void encodingUFVisitorFile::assertInitialState(){
    stringstream ss;

    // vars dinamiques al pas 0
    assertVarsTS(0);

    // declaracio de les funcions 
    for(const auto elem : encoded_functions){
        addVar(elem.second);
    }

    // vars estatiques
    //cout << endl << "asserting objects: " << endl;
    for(const auto foobar : objects_by_type){
        int low_ = type_domain[foobar.first].first;
        for(const auto obj : foobar.second){
            //cout << "assert obj var: " << obj << endl;
            addVar("(declare-fun "+ obj +" () Int)");
            addGetValue("(get-value ("+ obj +"))");
            
            ss << "(assert (= " << obj << " " << low_ << "))";
            //cout << ss.str() << endl;
            addConstraint(ss.str());
            ss.str(string());
            low_++;
        }
    }

    // inits de valors
    for(const auto init : *p_inits){
        //cout << "asserting init: " << search_and_replace(init->toStringUF(1),"@TS@","0") << endl;
        addConstraint("(assert " + search_and_replace(init->toStringUF(1),"@TS@","0") + ")");
    }
    
    for(const auto str_init : s_inits){
        addConstraint("(assert " + search_and_replace(str_init,"@TS@","0") + ")");
        cout << "INIT INIT: " << "(assert " + search_and_replace(str_init,"@TS@","0") + ")" << endl;
    }
    // TODO TODO TODO
    // FALTEN ELS PREDICATS EN FALSE 
    // TODO TODO TODO
}
void encodingUFVisitorFile::assertTimeStep(int t){
    if( t != 0){ assertVarsTS(t);}
    assertConstraintsTS(t);
}

void encodingUFVisitorFile::assertVarsTS(int t){
    stringstream ss;
    for(const auto elem : encoded_vars){
        addVar(search_and_replace(elem.first,"@TS@",std::to_string(t)));
        //cout << "asserting var: " << elem.first << " with name: " << search_and_replace(elem.second->toString(1),"@TS@",std::to_string(t)) << endl;

        //elem.second->type = functor_type::T_VARIABLE;
        //addGetValue("(get-value ("+ search_and_replace(elem.second->toStringUF(1),"@TS@",std::to_string(t)) +"))");

        ss << "(or "; 
        shared_ptr<vector<string> > ptr_vector = getAllSubtypes(elem.second->getObjectType());
        ptr_vector->push_back(elem.second->getObjectType());
        for(const auto type : *ptr_vector){
            string name = elem.second->toStringUF(1);
            int low     = type_domain[type].first;
            int high    = type_domain[type].second;

            if(high != 0){
                int counter = low;
                while(counter <= high){
                    ss << "(= " << name << " " << counter << ") ";
                    counter++;
                }
            }
        }
        ss << ")";
        //cout << "asserting range: " << search_and_replace(ss.str(),"@TS@",std::to_string(t)) << endl;
        addConstraint("(assert " + search_and_replace(ss.str(),"@TS@",std::to_string(t)) + ")");
        ss.str(string());
    }

}

void encodingUFVisitorFile::assertConstraintsTS(int t){
    for(const auto elem : encoded_constraints){
        string constraint;
        constraint = search_and_replace(elem,"@TS@",std::to_string(t));
        constraint = search_and_replace(constraint,"#TS#",std::to_string(t+1));
        //cout << "asserting: " << constraint << endl;
        addConstraint("(assert " + constraint + " )");
    }
}

// retorna la ID per la qual farem retract si fa falta
long encodingUFVisitorFile::assertObjective(int t){
        string constraint = "";
        constraint = search_and_replace(objective->toStringUF(1),"@TS@",std::to_string(t));
        constraint = search_and_replace(constraint,"#TS#",std::to_string(t+1));
        int id_retract = assertRetractable("(assert " + constraint + ")");

        // ara asertem tots els get-value i en ppi quan es faci retract s'eliminaran tots
        for(const auto g_p : grounded_predicates){
            addGetValue("(get-value (" + search_and_replace(g_p->toStringUF(1),"@TS@",std::to_string(t)) + " ))");
        }

        for(const auto g_f : grounded_functions){
            addGetValue("(get-value (" + search_and_replace(g_f->toStringUF(1),"@TS@",std::to_string(t)) + " ))");
        }

        for(const auto g_a : grounded_actions){
            addGetValue("(get-value (" + search_and_replace(g_a->toStringUF(1),"@TS@",std::to_string(t)) + " ))");
        }

        return id_retract;
}

/*!
 * Metode que engloba tota la cerca.
 */
void encodingUFVisitorFile::solve(){
    if(solving_alg == 0){
        solveLineal();
    } else if(solving_alg == 1){
        solveEto();
    } else {
        cerr << "ERR! ERR! ERR!" << __LINE__ << __FILE__ << endl;
    }
}

void encodingUFVisitorFile::solveEto(){
    Timer global_tim,tim;
    global_tim.start();
    tim.start();

    int timeout = 100000;

    assertInitialState();
    assertTimeStep(0);
    long step = assertObjective(0);
    cout << "retractable assert: " << step << endl;
    cout << "Time asserting: " << duration_cast<milliseconds>(tim.elapsed()).count();
    cout << " milliseconds, 0 (t) and initial state." << endl;

    if( check_sat(timeout) == 1){
        cout << "found plan at t=0!" << endl;
    }
    else {
        int t = 1;
        retract(step);
        step = assertObjective(t);
        int check = check_sat(timeout);

        while( check != 1 && t < max_steps){
            cout << "Asserting time step: " << t << endl;
            retract(step);

            tim.start();
            assertTimeStep(t);
            step  = assertObjective(t+1);
            cout << "Time asserting: " << duration_cast<milliseconds>(tim.elapsed()).count();
            cout << " milliseconds " << t << "(t)" << endl;

            tim.start();
            check = check_sat(timeout);
            cout << "Time check(): " << duration_cast<milliseconds>(tim.elapsed()).count();
            cout << " milliseconds " << t << "(t)" << endl;

            t++;
        }
        t--; // nomes hem assertat fins a t-1, per tant ...

        // 1 sat, 0 unsat, 2 unknonwn
        if(check == 0 || check == 2){
            cout << "not found :(" << endl;
            return;
        }else{
            cout << "found tentative plan at t=" << t  << ", now going backwards ... :)" << endl;
            // es sat, per tant primer de tot ens quedem amb el model
            dumpSolution(t+1);

            std::function<void(int)> prepare_problem;
            prepare_problem = [&](int t) {
                // netejem les estructures internes 
                v_vars.clear();
                v_constraints.clear();
                v_getvalues.clear();

                int current_t = 0;
                assertInitialState();
                while(current_t <= t){
                    assertTimeStep(current_t);
                    current_t++;
                }
                assertObjective(current_t);
            };

            int assert_t = t - 1;
            prepare_problem(assert_t);
            cout << "asserted second solver until t=" << t - 1 << " and objective into t=" << t << endl;

            int is_sat = 1;
            while(is_sat && assert_t > 0){
                tim.start();
                is_sat = check_sat();
                cout << "Time check(): " << duration_cast<milliseconds>(tim.elapsed()).count();
                cout << " milliseconds " << assert_t << "(t)" << endl;
                if(is_sat == 1){
                    dumpSolution(assert_t);

                    // fem assert abans de decrementar pq l'objectiu sempre va 
                    // un timestep per davant.
                    assert_t--;
                    prepare_problem(assert_t);
                } else {
                    cout << "ultima crida unsat, per tant tenim optim a l'ultim pas! t=" << assert_t + 1 << endl;
                    cout << "found plan at t=" << assert_t + 1 << " :)" << endl;
                }
            }
        }
    }

    cout << "Total time solving: " << duration_cast<milliseconds>(global_tim.elapsed()).count() << " milliseconds. " << endl;
}

void encodingUFVisitorFile::solveLineal(){
    Timer global_tim,tim;
    global_tim.start();
    tim.start();

    assertInitialState();
    assertTimeStep(0);
    long step = assertObjective(0);
    cout << "retractable assert: " << step << endl;
    cout << "Time asserting: " << duration_cast<milliseconds>(tim.elapsed()).count();
    cout << " milliseconds, 0 (t) and initial state." << endl;

    if( check_sat() == 1){
        cout << "found plan at t=0!" << endl;
    }
    else {
        int t = 1;
        retract(step);
        step = assertObjective(t);
        int check = check_sat();

        while( check != 1 && t < max_steps){
            cout << "Asserting time step: " << t << endl;
            retract(step);

            tim.start();
            assertTimeStep(t);
            step  = assertObjective(t+1);
            cout << "Time asserting: " << duration_cast<milliseconds>(tim.elapsed()).count();
            cout << " milliseconds " << t << "(t)" << endl;

            tim.start();
            check = check_sat();
            cout << "Time check(): " << duration_cast<milliseconds>(tim.elapsed()).count();
            cout << " milliseconds " << t << "(t)" << endl;

            t++;
        }
        t--; // nomes hem assertat fins a t-1, per tant ...

        if(check == 0){
            cout << "not found :(" << endl;
        }else{
            cout << "found plan at t=" << t  << " :)" << endl;
            dumpSolution(t+1);
        }
        cout << "Total time solving: " << duration_cast<milliseconds>(global_tim.elapsed()).count() << " milliseconds. " << endl;
    }
}

void encodingUFVisitorFile::dumpSolution(int t){
        // escrivim el fitxer de plan paralel
        cout << " We have a plan: " << endl << "================" << endl;
        ofstream f_sortida;
        f_sortida.open(plan_filename + ".plan", ios::trunc | ios::out);
        for(const auto plan_line : vs_plan){
            cout << plan_line << endl;
            f_sortida << plan_line << endl;
        }
        f_sortida.close();
}

void encodingUFVisitorFile::debug(bool verbose){
    if(verbose){

        cout << endl << "objects: " << endl;
        cout << "==================: " << endl;
        for(const auto foobar : objects_by_type){
            cout << "type: " << foobar.first << " objects: ";
            for(const auto obj : foobar.second){
                cout << obj << " ";
            }
            cout << endl;
        }

        cout << endl << "Var domains: " << endl;
        cout << "==================: " << endl;
        for(const auto domain : type_domain){
            cout << "type: " << domain.first << " domain: " << domain.second.first << "-" << domain.second.second << endl;
        }

        cout << endl << "Function definitions: " << endl;
        cout << "==================: " << endl;
        for(const auto func : encoded_functions){
            cout << func.second << endl;
        }

        cout << endl <<  "idx_eff_predicates: " << endl;
        cout << "==================: " << endl;
        for(const auto foo : idx_eff_predicates){
            cout << foo.first << " : " << foo.second.first->toStringUF(1) << " :::" << endl;
            for(const auto bar : foo.second.second){
                cout << "\t" << std::get<0>(bar)->toStringUF() << "|" << std::get<1>(bar) << " -> ";
                for(const auto enter : std::get<2>(bar)){
                    cout << enter << ", ";
                } cout << endl;
            } cout << endl;
        }

        cout << endl <<  "idx_eff_functions: " << endl;
        cout << "==================: " << endl;
        for(const auto foo : idx_eff_functions){
            cout << foo.first << " : " << foo.second.first->toStringUF(1) << " :::" << endl;
            for(const auto bar : foo.second.second){
                cout << "\t" << std::get<0>(bar)->toStringUF() << "|" << std::get<1>(bar) << " -> ";
                for(const auto enter : std::get<2>(bar)){
                    cout << enter << ", ";
                } cout << endl;
            } cout << endl;
        }

        cout << endl <<  "inits: " << endl;
        cout << "==================: " << endl;
        for(const auto init : *p_inits){
            cout << init->toStringUF(1) << endl;
        }


        cout << endl <<  "vars : " << endl;
        cout << "==================: " << endl;
        for(const auto elem: encoded_vars){
            cout << "var: " << elem.first << "type: " << elem.second->getObjectType() << endl;
        }

        cout << endl <<  "functions : " << endl;
        cout << "==================: " << endl;
        for(const auto elem: encoded_functions){
            cout << "func: " << elem.first << " def: " << elem.second << endl;
        }

        cout << endl <<  "constraints: " << endl;
        cout << "==================: " << endl;
        for(const auto elem: encoded_constraints){
            cout << "const: " << elem << endl;
        }
    }
}

/* =========================================================================================
 * helper functions
 * =========================================================================================
 */
void encodingUFVisitorFile::addVar(string s){
    v_vars.push_back(s);
}

void encodingUFVisitorFile::addGetValue(string s){
    v_getvalues.push_back(s);
}

void encodingUFVisitorFile::addConstraint(string s){
    v_constraints.push_back(s);
}

int encodingUFVisitorFile::assertRetractable(string s){
    v_constraints.push_back(s);
    return v_constraints.size() - 1;
}

int encodingUFVisitorFile::retract(int p){
    v_constraints.erase(v_constraints.begin()+p,v_constraints.end());
    return 0;
}

int encodingUFVisitorFile::check_sat(int timeout){
    string filename = "/tmp/foobar.txt";
    string temp_file = filename +"."+std::to_string(timestep_file);
    vector<string> plan;

     // dumpejem el contingut al fitxer
     ofstream f_sortida;
     f_sortida.open(temp_file, ios::trunc | ios::out);

     f_sortida << "(set-option :produce-models true)" << endl;
     f_sortida << "(set-logic QF_UFLIA)" << endl;

     for(const auto& line : v_vars){ f_sortida << line << endl; }
     for(const auto& line : v_constraints){ f_sortida << line << endl; }
     f_sortida << "(check-sat)" << endl;
     for(const auto& line : v_getvalues){ f_sortida << line << endl; }
     f_sortida.close();

     // si es volgues passar per STDIN es podria implementar aixi
     // http://jineshkj.wordpress.com/2006/12/22/how-to-capture-stdin-stdout-and-stderr-of-child-program/
     FILE *in;
     char buff[512];
     //"./cvc4-2015-06-17-x86_64-linux-opt-proofs --lang=smt2 "+ temp_file).c_str(), "r")));
     // DIFERENT SOLVERS
     //"./yices-smt2 --verbosity=0 --stats "+ temp_file).c_str(), "r")));
     //"./cvc4-1.4-x86_64-linux-opt --stats --condense-function-values --lang=smt2 "+ temp_file).c_str(), "r")));
     //"./cvc4-1.4-x86_64-linux-opt --stats --lang=smt2 "+ temp_file).c_str(), "r")));
    string solver_cmd = "";
    string grep = " | grep -v \"model is not available\"";
     if(timeout == 0){
          solver_cmd = "z3 -smt2 -st "+ temp_file + grep;
     }else {
          solver_cmd = "z3 -t:" + std::to_string(timeout) + " -smt2 -st "+ temp_file + grep;
     }

     // **** executem el solver ****
     if(!(in = popen(solver_cmd.c_str(), "r"))){
         return 1;
     }

     // per cada lina de l'output
     bool is_sat = false;
     while(fgets(buff, sizeof(buff), in)!=NULL){

         string linia = string(buff);

         // identifiquem si la linia de output esta parlant d'una accio
         bool is_action = false;
         int i = 0;
         while( i < actions.size() && !is_action){
             if(linia.find("(" + actions[i]->getName() + " ") != string::npos &&
                 linia.find("true") != string::npos){
                 is_action = true;
                 //cout << linia << " ESTA PARLANT D?UNA ACCIO"<< endl << endl;
             }
             i++;
         }

         // eliminem els errors
         if(linia == "(error \"can't build a model. Call (check-sat) first\"\n)"){ // treiem caca
             // NOP
         } else if(linia == "(error \"the context is unsatisfiable\")\n"){ // treiem caca
             // NOP
         } else if(is_action){

             // netejem i tractem la linia
             //
             //
            // treiem els dos parentesis inicials
            linia = linia.substr(2,linia.length());
            // treiem la palla del final del " true))"
            linia = linia.substr(0,linia.find_last_of(" "));
            // recuperem el timestep
            string ts_ = linia.substr(linia.find_last_of(" ")+1,linia.length());
            ts_ = ts_.substr(0,ts_.length()-1);

            linia = linia.substr(0,linia.find_last_of(" "));
            linia = ts_ + ": " + linia + ") [1]";

             plan.push_back(linia);
             cout << linia << endl;

         } else if ( string(buff) == "sat\n"){ // detectem el SAT
             cout << "found: " << buff << " !!!!" << endl;
             is_sat = true;
         } else {
             cout << buff;
         }
     }
     pclose(in);
     timestep_file++;

    if( is_sat ) {
        vs_plan.clear();
        for(const auto plan_line : plan){
            vs_plan.push_back(plan_line);
        }
        return 1;
    } else {
        return 0;
    }
}

