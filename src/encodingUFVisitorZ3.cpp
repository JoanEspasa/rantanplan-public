#include "encodingUFVisitorZ3.h"
//#include <numeric> // per el fold, o std::accumulate

//using namespace std;
using namespace z3;

/*
    PLACEHOLDER 
*/

encodingUFVisitorZ3::encodingUFVisitorZ3(string plan_file, int alg_solv,string incomp, string par) : encodingUFVisitor(incomp,par) {

    max_steps = 100;
    solving_alg = alg_solv;
    plan_filename = plan_file;
    int_domains = "or"; // "range"

    Z3_global_param_set("verbose", "10");
    Z3_enable_trace("decide_detail");

    cfg = new z3::config(); 
    cfg->set("auto_config", true);
    c = new z3::context(*cfg);
    s = new z3::solver(*c);
/*
    s = new z3::solver(*c,(
                            //tactic(*c, "qflia") & // nope, va com el putu cul!
                            tactic(*c, "propagate-values") &
                            tactic(*c, "solve-eqs") &
                            tactic(*c, "elim-uncnstr") &
                            tactic(*c, "elim-and") &
                            tactic(*c, "simplify") &
                            tactic(*c, "reduce-args") &
                            tactic(*c, "symmetry-reduce") &
                            tactic(*c, "ctx-solver-simplify") &
                            tactic(*c, "smt")
                          ).mk_solver());
*/

    // 61 $ z3 -smt2 -v:100 -st -tr:decide_detail -tr:mk_bool_var -tr:mk_enode -tr:dyn_ack -tr:internalize_uninterpreted foobar.txt.14 2>&1
    //set_param("smt.dack",0);


    // nomes 
    if(solving_alg == 1){
        timed_cfg = new z3::config(); 
        timed_cfg->set("auto_config", true);
        // son milisegons.
        timed_cfg->set("timeout", 100000);
        timed_c = new z3::context(*timed_cfg);
        timed_s = new z3::solver(*timed_c,(tactic(*timed_c, "smt")).mk_solver());
        //timed_s = new z3::solver(*timed_c);
    }

}

/*! 
 * Destructor de la classe. No fa res :(
 */
encodingUFVisitorZ3::~encodingUFVisitorZ3(){
    // NOP
}

/*!
 * generateDefinitions genera l'string de declaracio a SMT de un predicat, funcio o accio.
 */
void encodingUFVisitorZ3::generateDefinitions(shared_ptr<Functor> ptr){
    // afegim el timestep com a ultim parametre i el valor de retorn
    if(ptr->type == functor_type::T_PREDICATE){
        smt_functions.push_back(std::make_tuple( ptr->getName(), ptr->getNParams(),
                    static_pointer_cast<Predicate>(ptr)->getReturnType()));
    } else if(ptr->type == functor_type::T_FUNCTION){
        smt_functions.push_back(std::make_tuple( ptr->getName(), ptr->getNParams(),
                    static_pointer_cast<Function>(ptr)->getReturnType()));
    } else if(ptr->type == functor_type::T_ACTION){
        smt_functions.push_back(std::make_tuple( ptr->getName(), ptr->getNParams(),
                    static_pointer_cast<Action>(ptr)->getReturnType()));
    }
}

/*! 
 * Afegeix al context l'estat inicial del problema.
 */
void encodingUFVisitorZ3::assertInitialState(){ assertInitialState(c,s); }
void encodingUFVisitorZ3::assertInitialState(z3::context * con, z3::solver * sol){
    stringstream ss;

    z3::sort z3_int_sort = con->int_sort();
    z3::sort z3_bool_sort = con->bool_sort();
    // declaracio de les funcions 
    for(const auto elem : smt_functions){
        string func_name = std::get<0>(elem);
        sort_vector sort_vec(*con);

        // hem de tindre en compte el temps
        for(int i = 0; i < std::get<1>(elem) + 1; i++){
            sort_vec.push_back(z3_int_sort);
        }

        if(std::get<2>(elem) == "Bool"){
            func_decl f = con->function((std::get<0>(elem)).c_str(), sort_vec, z3_bool_sort);
            v_symbols.push_back(f.name());
            v_func_decl.push_back(f);
            m_func.insert(std::pair<string,z3::func_decl>(std::get<0>(elem),f)); 
        } else if(std::get<2>(elem) == "Int"){
            func_decl f = con->function((std::get<0>(elem)).c_str(), sort_vec, z3_int_sort);
            v_symbols.push_back(f.name());
            v_func_decl.push_back(f);
            m_func.insert(std::pair<string,z3::func_decl>(std::get<0>(elem),f)); 
        } else {
            cerr << "ERR! ERR! ERR! " << __LINE__ << __FILE__ << endl;
        }
    }

    // vars estatiques
    //cout << endl << "asserting objects: " << endl;
    for(const auto foobar : objects_by_type){
        int int_obj = type_domain[foobar.first].first;
        for(const auto obj : foobar.second){
            //cout << "assert obj var: " << obj << "|" << endl;
            int2obj[int_obj] = obj;

            expr var_object = con->int_const(obj.c_str());
            v_symbols.push_back(Z3_mk_string_symbol(*con, obj.c_str()));
            v_func_decl.push_back(var_object.decl());
            m_var.insert(std::pair<string,z3::expr>(obj,var_object));

            z3_assert_str("(assert (= " + obj + " " + std::to_string(int_obj) + "))",con,sol);
            int_obj++;
        }
    }

    // inits de valors
    for(const auto init : *p_inits){
        string constraint = search_and_replace(init->toStringUF(1),"@TS@","0");
        z3_assert_str("(assert " + constraint + ")",con,sol);
    }
    
    for(const auto str_init : s_inits){
        string constraint = search_and_replace(str_init,"@TS@","0");
        z3_assert_str("(assert " + constraint + ")",con,sol);
    }

    // vars dinamiques al pas 0
    assertVarsTS(0,con,sol);
}

/*!
 * Asserta al context tot el que fa falta a un timestep concret.
 */
void encodingUFVisitorZ3::assertTimeStep(int t){ assertTimeStep(t,c,s); }
void encodingUFVisitorZ3::assertTimeStep(int t, z3::context * con, z3::solver * sol){
    if( t != 0){ assertVarsTS(t,con,sol);}
    assertConstraintsTS(t,con,sol);
}

/*! 
 * Asserta al context les variables del timestep donat
 *
 * Compte! aixo no te en compte les UF, nomes les variables!!!
 * TODO: posar ranges a les funcions!!!
 */
void encodingUFVisitorZ3::assertVarsTS(int t){ assertVarsTS(t,c,s); } 
void encodingUFVisitorZ3::assertVarsTS(int t, z3::context * con, z3::solver * sol){
    cout << "asserting vars t=" << t << endl;
    stringstream ss;

    // encoded vars nomes seran ints, ja que son els parametres de les 
    // UF, tant de les "functions" com de les dels "predicates"
    for(const auto elem : encoded_vars){
        // stringstream ss;
          
        string var_name = search_and_replace(elem.second->toStringUF(1),"@TS@",std::to_string(t));
        expr var = con->int_const(var_name.c_str());
        v_symbols.push_back(Z3_mk_string_symbol(*con, var_name.c_str()));
        v_func_decl.push_back(var.decl());
        m_var.insert(std::pair<string,z3::expr>(var_name,var));

        if(int_domains == "or"){
        ss << "(or"; 
        // domini
        shared_ptr<vector<string> > ptr_vector = getAllSubtypes(elem.second->getObjectType());
        ptr_vector->push_back(elem.second->getObjectType());


        for(const auto type : *ptr_vector){
            string name = elem.second->toStringUF(1);
            int low     = type_domain[type].first;
            int high    = type_domain[type].second;

            if(high != 0){
                int counter = low;
                while(counter <= high){
                    ss << " (= " << name << " " << counter << ")";
                    counter++;
                }
            }
        }
        ss << ")";
        z3_assert_str("(assert " + search_and_replace(ss.str(),"@TS@",std::to_string(t)) + ")",con,sol);
        ss.str(string());

        } else if(int_domains == "range"){
            // NOP
            cout << "ERR! " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
        } else {
            cout << "ERR! " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
        }
    }
}


/*! 
 * Asserta al context les constraints necessaries donat un timestep
 */
void encodingUFVisitorZ3::assertConstraintsTS(int t){ assertConstraintsTS(t,c,s); } 
void encodingUFVisitorZ3::assertConstraintsTS(int t, z3::context * con, z3::solver * sol){
    cout << "asserting constr t=" << t << endl;
    for(const auto elem : encoded_constraints){

        // primer li donem els indexos del time step que toca.
        string constraint;
        constraint = search_and_replace(elem,"@TS@",std::to_string(t));
        constraint = search_and_replace(constraint,"#TS#",std::to_string(t+1));
        //cout << "asserting: " << constraint << endl;

        // ara ho passem al z3
        z3_assert_str("(assert "+constraint+")",con,sol);
    }
}

/*! 
 * Asserta l'objectiu al context donat un time step
 * Retorna la ID del retract per si l'hem de fer
 */
long encodingUFVisitorZ3::assertObjective(int t){ assertObjective(t,c,s); return 0; } 
long encodingUFVisitorZ3::assertObjective(int t, z3::context * con, z3::solver * sol){
        cout << "asserting obj t=" << t << endl;
        string constraint = "";
        constraint = search_and_replace(objective->toStringUF(1),"@TS@",std::to_string(t));
        constraint = search_and_replace(constraint,"#TS#",std::to_string(t+1));

        z3_assert_str("(assert "+constraint+")",con,sol);
        // amb el z3 no el necessitem ... 
        return 0;
}

/*!
 * Metode que engloba tota la cerca.
 */
void encodingUFVisitorZ3::solve(){
    if(solving_alg == 0){
        solveLineal();
    } else if(solving_alg == 1){
        solveEto();
    } else {
        cerr << "ERR! ERR! ERR!" << __LINE__ << __FILE__ << endl;
    }
}

/*!
 * Metode proposat per en Miquel, 
 */
void encodingUFVisitorZ3::solveEto(){
    Timer global_tim,tim;
    global_tim.start();
    tim.start();

    assertInitialState(timed_c,timed_s);
    assertTimeStep(0,timed_c,timed_s);

    timed_s->push();
    assertObjective(0,timed_c,timed_s);
    cout << "Time asserting: " << duration_cast<milliseconds>(tim.elapsed()).count();
    cout << " milliseconds, 0 (t) and initial state." << endl;

    if( timed_s->check() == sat){
        cout << "found plan at t=0!" << endl;
    }
    else {
        int t = 1;
        timed_s->pop();
        timed_s->push();
        assertObjective(t,timed_c,timed_s);
        int check = timed_s->check();

        while( check != sat && t < max_steps){
            cout << "Asserting time step: " << t << endl;
            timed_s->pop();

            tim.start();
            assertTimeStep(t,timed_c,timed_s);
            timed_s->push();
            assertObjective(t+1,timed_c,timed_s);
            cout << "Time asserting: " << duration_cast<milliseconds>(tim.elapsed()).count();
            cout << " milliseconds " << t << "(t)" << endl;

            tim.start();
            check = timed_s->check();
            cout << "Time check(): " << duration_cast<milliseconds>(tim.elapsed()).count();
            cout << " milliseconds " << t << "(t)" << endl;

            t++;
        }
        t--; // nomes hem assertat fins a t-1, per tant ...

        if(check == unsat || check == unknown){
            cout << "not found :(" << endl;
            return;
        }else{
            cout << "found tentative plan at t=" << t  << ", now going backwards ... :)" << endl;
            // es sat, per tant primer de tot ens quedem amb el model
            dumpSolution(timed_s->get_model(),timed_c,t+1);

            // ara netejem les estructures internes 
            v_symbols.clear();
            v_func_decl.clear();
            m_var.clear();
            m_func.clear();
            v_constr.clear();

            // assertem tot el problema a l'altre solver
            // amb els push entre mig per a poder anar fent la cerca
            // de darrere cap a davant                       
            int assert_t = 0;                               
            assertInitialState(c,s);
            while(assert_t < t){
                assertTimeStep(assert_t,c,s);
                s->push();
                assert_t++;
            }
            // ja te el +1 de l'iteracio
            assertObjective(assert_t,c,s);
            s->push();
            cout << "asserted second solver until t=" << assert_t - 1 << " and objective into t=" << assert_t << endl;


            bool is_sat = true;
            while(is_sat && assert_t > 0){

                int res = s->check();
                is_sat = (res == sat);
                if(is_sat){
                    dumpSolution(s->get_model(),c,assert_t);
                    s->pop(); // pop de l'objectiu
                    s->pop(); // pop de l'ultim timestep

                    // fem assert abans de decrementar pq l'objectiu sempre va 
                    // un timestep per davant.
                    assert_t--;
                    assertObjective(assert_t,c,s); 
                    s->push();
                } else {
                    cout << "ultima crida unsat, per tant tenim optim a l'ultim pas! t=" << assert_t << endl;
                    cout << "found plan at t=" << assert_t  << " :)" << endl;
                }

            }
        }
    }

    cout << "Total time solving: " << duration_cast<milliseconds>(global_tim.elapsed()).count() << " milliseconds. " << endl;
}

/*!
 * Metode naive de cerca, de 0 a t fins a la primera crida SAT
 */
void encodingUFVisitorZ3::solveLineal(){
    Timer global_tim,tim;
    global_tim.start();
    tim.start();

    assertInitialState(c,s);
    assertTimeStep(0,c,s);

    s->push();
    assertObjective(0,c,s);
    cout << "Time asserting: " << duration_cast<milliseconds>(tim.elapsed()).count();
    cout << " milliseconds, 0 (t) and initial state." << endl;

    if( s->check() == sat){
        cout << "found plan at t=0!" << endl;
    }
    else {
        int t = 1;
        s->pop();
        s->push();
        assertObjective(t,c,s);
        int check = s->check();

        while( check != sat && t < max_steps){
            cout << "Asserting time step: " << t << endl;
            s->pop();

            tim.start();
            assertTimeStep(t,c,s);
            s->push();
            assertObjective(t+1,c,s);
            cout << "Time asserting: " << duration_cast<milliseconds>(tim.elapsed()).count();
            cout << " milliseconds " << t << "(t)" << endl;

            tim.start();
            check = s->check();
            cout << "Time check(): " << duration_cast<milliseconds>(tim.elapsed()).count();
            cout << " milliseconds " << t << "(t)" << endl;

            t++;
        }
        t--; // nomes hem assertat fins a t-1, per tant ...

        if(check == unsat || check == unknown){
            cout << "not found :(" << endl;
        }else{

            cout << "found plan at t=" << t  << " :)" << endl;
            model m = s->get_model();
            //cout << m;
            dumpSolution(m,c,t+1);
        }
        cout << "Total time solving: " << duration_cast<milliseconds>(global_tim.elapsed()).count() << " milliseconds. " << endl;
    }
}

/*! 
 * Dumpeja la solucio al fitxer i per stdout
 */
void encodingUFVisitorZ3::dumpSolution(z3::model m, z3::context * con, int t){

    std::set<std::string> noms_accio; 
    for(const auto action : actions){
        noms_accio.insert(action->getName());
    }

   // creem el buffer per a capturar la sortida i fer el fitxer de plan
   vector<string> v_plan_str(t);
   std::stringstream buffer;
   std::stringstream buffer2;

    for (unsigned int i = 0; i < m.num_funcs(); i++) {
        func_decl fdecl   = m.get_func_decl(i);
        func_interp fintp = m.get_func_interp(fdecl);
        symbol name       = fdecl.name();

        // si es una accio, l'imprimim
        if(noms_accio.count(name.str()) != 0){
            for (unsigned int j = 0; j < fintp.num_entries(); j++) {

                    buffer << "(" << symbol(*con, name) << " ";

                    for (unsigned int k = 0; k < fintp.entry(j).num_args(); k++) {

                        // si es l'ultim parametre, es el time step, per tant 
                        // no el guardem perque no el necessitem per a mostrar
                        // el plan o validarlo amb el VAL
                        if(k == fintp.entry(j).num_args() - 1){
                            // NOP
                        } else {
                            if (k > 0) { buffer << " "; }
                            // busquem a quin objecte pertany aquest enter
                            // i treurem el nom de l'objecte enlloc de l'enter
                            buffer2 << fintp.entry(j).arg(k);
                            int idx = std::stoi(buffer2.str());
                            buffer2.str("");

                            buffer << int2obj[idx];
                        }
                    }
                      
                    //buffer << fintp.entry(j).value();
                    buffer << ") [1] ";

                // guardem l'accio
                if(eq(fintp.entry(j).value(),con->bool_val(true))){
                    // agafem l'ultim parametre, que sera el temps
                        buffer2 << fintp.entry(j).arg(fintp.entry(j).num_args() - 1);
                        int idx = std::stoi(buffer2.str());
                        buffer2.str("");

                        // guardem l'execucio i buidem el buffer
                        v_plan_str[idx] =  buffer.str();
                }

                //if (fintp.num_entries() > 0) { 
                //    cout << ", ";
                //}
                //cout << "(else|->";
                //cout << fintp.else_value();
                //cout << ")}" << endl;
                buffer.str("");
            }
        }
    }   
 
    // escrivim el fitxer de plan paralel
    ofstream f_sortida;
    int t_step = 0;
    f_sortida.open(plan_filename + ".plan", ios::trunc | ios::out);
    for(const auto acc_str : v_plan_str){
        f_sortida << t_step << ": " << acc_str << endl;
        cout << t_step << ": " << acc_str << endl;
        t_step++;
    }
    f_sortida.close();
}

void encodingUFVisitorZ3::debug(bool verbose){
}


void encodingUFVisitorZ3::z3_assert_str(std::string constraint, z3::context * con, z3::solver * sol) {

    assert(v_symbols.size() == v_func_decl.size());

    try {
        Z3_ast ast = Z3_parse_smtlib2_string(*con, constraint.c_str(),
                0, 0, 0,
                v_symbols.size(),
                &v_symbols[0],
                &v_func_decl[0]);

        //char const* ast_str = Z3_ast_to_string(*con, ast);
        //cout << "Translated : " << constraint << endl << "To: " << ast_str << endl << endl;

        sol->add(to_expr(*con, ast));

    } catch (z3::exception ex) {
        std::cout << "Error trying to parse : " << constraint << endl;
        std::cout << "failed: " << ex << "\n";
    }   
}

    /*
    cout << "declared symbols: "; for(const auto & foo : v_symbols){ cout <<  symbol(*c, foo) << endl; } cout << endl;
    cout << "declared func_decl: "; for(const auto & foo : v_func_decl){ cout << Z3_func_decl_to_string(*c,foo) << endl; } cout << endl;
    */
 
/*
void encodingUFVisitorZ3::z3_assert_str_demo() {
    z3::context c2;
    z3::solver s2(c2);

    std::vector<Z3_symbol> v_s;
    std::vector<Z3_func_decl> v_f;

    string obj;

    obj = "x";
    expr var_object1 = c2.int_const(obj.c_str());
    v_s.push_back(Z3_mk_string_symbol(c2, obj.c_str()));
    v_f.push_back(var_object1.decl());

    obj = "y";
    expr var_object2 = c2.int_const(obj.c_str());
    v_s.push_back(Z3_mk_string_symbol(c2, obj.c_str()));
    v_f.push_back(var_object2.decl());

    string fun = "f";
    sort_vector sort_vec(c2);
    sort_vec.push_back(c2.int_sort());
    func_decl f = c2.function(fun.c_str(), sort_vec, c2.bool_sort());
    v_s.push_back(f.name());
    v_f.push_back(f);

    cout << "declared symbols: ";
    for(const auto & foo : v_s){
        cout <<  symbol(*c, foo) << endl;
    } cout << endl;
    cout << "declared func_decl: ";
    for(const auto & foo : v_f){
        cout << Z3_func_decl_to_string(*c,foo) << endl;
    } cout << endl;

    string constr = "(assert (> x 0))";
    try {
        Z3_ast ast = Z3_parse_smtlib2_string(c2,constr.c_str(),
                0, 0, 0,
                v_s.size(),
                &v_s[0],
                &v_f[0]);

        char const* ast_str = Z3_ast_to_string(c2, ast);
        cout << "Translated : " << constr<< endl << "To: " << ast_str << endl << endl;

        s2.add(to_expr(c2, ast));

    } catch (z3::exception ex) {
        std::cout << "Error trying to parse : " << constr<< endl;
        std::cout << "failed: " << ex << "\n";
    }

    constr = "(assert (f x))";
    try {
        Z3_ast ast = Z3_parse_smtlib2_string(c2,constr.c_str(),
                0, 0, 0,
                v_s.size(),
                &v_s[0],
                &v_f[0]);

        char const* ast_str = Z3_ast_to_string(c2, ast);
        cout << "Translated : " << constr<< endl << "To: " << ast_str << endl << endl;

        s2.add(to_expr(c2, ast));

    } catch (z3::exception ex) {
        std::cout << "Error trying to parse : " << constr<< endl;
        std::cout << "failed: " << ex << "\n";
    }

    std::cout << s2.check() << "\n";

    model m = s2.get_model();
    cout << m << endl;
}

Z3_ast Z3_API Z3_parse_smtlib2_string(Z3_context c, Z3_string str,
unsigned num_sorts,           --> el nombre de sorts
Z3_symbol const sort_names[], --> els noms dels sorts
Z3_sort const sorts[],        --> els sorts custom
unsigned num_decls,           --> nombre de les funcions
Z3_symbol const decl_names[], --> noms de les funcions
Z3_func_decl const decls[])   --> les funcions


    z3::context& ctx;
    std::vector<std::string>   names;
    std::vector<z3::sort>      sorts;
    std::vector<z3::func_decl> funs;
    std::vector<z3::expr>      todo;
    std::set<unsigned>         seen_ids;
    unsigned                   m_formula_id;
    unsigned                   m_node_number;
    std::map<unsigned, unsigned>            m_proof_ids;
    std::map<unsigned, std::set<unsigned> > m_proof_hypotheses;
    std::map<unsigned, unsigned>            m_axiom_ids;
    named_formulas*                         m_named_formulas;

void collect_decls(z3::expr e) {
    todo.push_back(e);
    while (!todo.empty()) {
        z3::expr e = todo.back();
        todo.pop_back();
        unsigned id = Z3_get_ast_id(ctx, e);
        if (contains_id(id)) {
            continue;
        }
        seen_ids.insert(id);
        if (e.is_app()) {
            collect_fun(e.decl());
            unsigned sz = e.num_args();
            for (unsigned i = 0; i < sz; ++i) {
                todo.push_back(e.arg(i));
            }
        }
        else if (e.is_quantifier()) {
            unsigned nb = Z3_get_quantifier_num_bound(e.ctx(), e);
            for (unsigned i = 0; i < nb; ++i) {
                z3::sort srt(ctx, Z3_get_quantifier_bound_sort(e.ctx(), e, i));
                collect_sort(srt);
            }
            todo.push_back(e.body());
        }
        else if (e.is_var()) {
            collect_sort(e.get_sort());
        }
    }
}


 Z3_ast mk_int_var(Z3_context ctx, const char * name)
 Z3_sort ty = Z3_mk_int_sort(ctx);
 return mk_var(ctx, name, ty)

Z3_ast v
Z3_app app = Z3_to_app(c, v);
Z3_func_decl d = Z3_get_app_decl(c, app);
*/

/*
expr encodingUFVisitorZ3::z3_mk_or(expr_vector v) {
    std::vector<Z3_ast> array;

    for (unsigned int i = 0; i < v.size(); i++)
        array.push_back(v[i]);
    return to_expr(v.ctx(), Z3_mk_or(v.ctx(), array.size(), &(array[0])));
}
*/
