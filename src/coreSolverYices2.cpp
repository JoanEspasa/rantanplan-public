#include "coreSolverYices2.h"

using namespace std;

CoreSolverYices2::CoreSolverYices2(int verb) {
    verbose = verb;

    yices_init();

    cout << "Using Yices " << yices_version << "(";
    cout << yices_build_arch << "," << yices_build_mode << ")" << endl;

    ctx_config_t *yices_conf = yices_new_config();
    yices_set_config(yices_conf,"mode","push-pop");
    yices_set_config(yices_conf,"uf-solver","none");
    yices_set_config(yices_conf,"bv-solver","none");
    yices_set_config(yices_conf,"array-solver","none");
    yices_set_config(yices_conf,"arith-solver","simplex");
    yices_set_config(yices_conf,"arith-fragment","LIA");
    ctx = yices_new_context(yices_conf); 
    yices_free_config(yices_conf);

    if(verbose >= 10) { 
        logfile = fopen ("yices.log" , "w+");
        if (logfile == NULL){
            cerr << "Error opening log file" << endl;
            abort();
        }
    }
}

CoreSolverYices2::~CoreSolverYices2() {
    yices_exit();
}

// donat el nom d'una var com a string, la setejem com a elegible abans
// que la resta de variables
void CoreSolverYices2::setDecidable(string n) {
    //auto ret_val = custom_term_set_decide_allowed(ctx,mapVar[n].expr,true);
    //cout << "setDecidable(" << n << ret_val << ")" << endl;
}

void CoreSolverYices2::addVar(string s,string t) {

    mapVar[s].val="";
    mapVar[s].decl = s;

    if (t == "int") {
        mapVar[s].expr = yices_new_uninterpreted_term(yices_int_type());
        mapVar[s].tipus = 'I';

    } else if (t == "bool") {
        mapVar[s].expr = yices_new_uninterpreted_term(yices_bool_type());
        mapVar[s].tipus = 'B';

    } else if (t == "real"){
        mapVar[s].expr = yices_new_uninterpreted_term(yices_real_type());
        mapVar[s].tipus = 'R';

    } else {
        // TODO
        mapVar[s].tipus=' ';
    }

    int32_t code = yices_set_term_name(mapVar[s].expr,s.c_str());
    if (code < 0) {
        yices_pp_term(stdout, mapVar[s].expr , 80, 20, 0); 
        cerr << "Assign of name " << s << " failed: code = " << code << ", error = " << yices_error_code() << endl;
        yices_print_error(stderr);
    }

    if(verbose>=10) { 
        yices_pp_term(stdout, mapVar[s].expr, 80, 20, 0);
        yices_pp_term(logfile, mapVar[s].expr, 80, 20, 0);
    }
}

void CoreSolverYices2::assertConstraint(string s) {

    Expression e(s);
    int i = 0;
    term_t expr = tradExpr(e,i);

    if(verbose >= 10) {
        cout << s << endl;
        yices_pp_term(stdout, expr, 80, 20, 0); 
        yices_pp_term(logfile, expr, 80, 20, 0);
        cout << endl;
    }

    int32_t code = yices_assert_formula(ctx,expr);
    if (code < 0) {
        yices_pp_term(stdout, expr, 80, 20, 0); 
        cerr << "Assert of " << s << " failed: code = " << code << ", error = " << yices_error_code() << endl;
        yices_print_error(stderr);
    }
}

// El long es mante, pero ha canviat la filosofia dels retractables
// des del Yices 1 i per aixo no sha canviat.
long CoreSolverYices2::assertRetractable(string s){

    Expression e(s);
    int i = 0;
    term_t expr=tradExpr(e,i);

    int32_t ret_val = yices_push(ctx);
    if(ret_val == -1){
        cerr << "ERR RETRACTABLE!" << ret_val << ", error = " << yices_error_code() << endl;
        yices_print_error(stdout);
    }

    int32_t code = yices_assert_formula(ctx,expr);
    if (code < 0) {
        cerr << "Assert failed: code = " << code << ", error = " << yices_error_code() << endl;
        yices_pp_term(stdout, expr, 80, 20, 0); 
        yices_print_error(stderr);
    }

    if(verbose>=10) {
        cout << s << endl;
        yices_pp_term(stdout, expr, 80, 20, 0);
        yices_pp_term(logfile, expr, 80, 20, 0);
        cout << endl;
    }
    return (long) ret_val;
}

void CoreSolverYices2::retract(long l){
    int32_t val = yices_pop(ctx);
    if(val == -1){
        cerr << "COULD NOT RETRACT (pop)!" << endl;
    }
}


int CoreSolverYices2::check(){
    switch (yices_check_context(ctx, NULL)) {
        case STATUS_SAT:
            {
                cout << "The formula is satisfiable\n";
                model_t* model = yices_get_model(ctx, true);  // get the model
                if (model == NULL) {
                    cerr << "Error in get_model\n";
                    yices_print_error(stderr);
                } else {
                    int32_t v;
                    for (map<string,infVar>::iterator it = mapVar.begin();it != mapVar.end(); ++it) {
                        switch(it->second.tipus) {
                            case 'B':
                                yices_get_bool_value(model,it->second.expr,&v);
                                it->second.val= std::to_string(v);
                                break;
                            case 'I':
                                yices_get_int32_value(model,it->second.expr,&v);
                                it->second.val = v;
                                break;
                            case 'R':
                                // TODO
                                break;
                            case ' ':
                                it->second.val="";
                                break;
                        }
                    }
                    if(verbose >= 10) {
                        yices_pp_model(stdout,model,800000,200000,0);
                    }
                    yices_free_model(model); // clean up: delete the model
                }   
                return 1;
            }
            break;

        case STATUS_UNSAT:
            cout << "The formula is not satisfiable\n";
            return 0;
            break;

        case STATUS_UNKNOWN:
            cout << "The status is unknown\n";
            return -1;
            break;

        case STATUS_IDLE:
        case STATUS_SEARCHING:
        case STATUS_INTERRUPTED:
        case STATUS_ERROR:
            cerr << "Error in check_context\n";
            yices_print_error(stderr);
            return -1;
            break;
    }
    return -2;
}

long CoreSolverYices2::modelVarInt(string s){
    return atoi(mapVar[s].val.c_str());
}

bool CoreSolverYices2::modelVarBool(string s){
    if (mapVar[s].val == "0") return false;
    return true;
}

term_t CoreSolverYices2::tradIte(Expression & e,int & i) {
    if (e.element(i) != "(") {
        cout << "error ( a ite" << endl;exit(-1);
    }

    i++;
    term_t e1=tradExpr(e,i);
    term_t e2=tradExpr(e,i);
    term_t e3=tradExpr(e,i);

    if (e.element(i) != ")") {
        cout << "error ) a ite" << endl;exit(-1);
    }

    i++;
    return yices_ite(e1,e2,e3);
}

term_t CoreSolverYices2::tradNot(Expression & e,int & i) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a not" << endl;exit(-1);}
    i++;
    term_t e1=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a not" << endl;exit(-1);}
    i++;
    return yices_not(e1);
}

term_t CoreSolverYices2::tradRel(Expression & e,int & i,string a) {

    if (e.element(i) != "(") {cout << "error ( a Rel" << endl;exit(-1);}
    i++;
    term_t e1=tradExpr(e,i);
    term_t e2=tradExpr(e,i);
    if (e.element(i) != ")") {cout << "error ) a Rel, es: " << e.element(i) << " (" << i << ") de " << e << endl;exit(-1);}


    i++;
         if (a == "=")     return yices_eq(e1,e2);
    else if (a == "!=")    return yices_neq(e1,e2);
    else if (a == "<=")    return yices_arith_leq_atom(e1,e2);
    else if (a == "<")     return yices_arith_lt_atom(e1,e2);
    else if (a == ">=")    return yices_arith_geq_atom(e1,e2);
    else if (a == ">")     return yices_arith_gt_atom(e1,e2);
    else if (a == "dimpl") return yices_iff(e1,e2);
    else if (a == "impl") {
        term_t t = yices_implies(e1,e2);
        if(t == NULL_TERM){
            cerr << "error impl = " << yices_error_code() << endl;
            yices_print_error(stderr);
        }
        return t;
        //return yices_or2(yices_not(e1),e2);
    }

    cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
    return yices_true();
}

term_t CoreSolverYices2::tradList(Expression & e,int & i,string a) {

    // traduim tota la llista
    if (e.element(i) != "(") {cout << "error ( a List" << endl;exit(-1);}
    i++;
    vector<term_t> ye;
    while (e.element(i) != ")") {
        ye.push_back(tradExpr(e,i));
    }
    if (e.element(i) != ")") {cout << "error ) a List" << endl;exit(-1);}

    // ara creem l'operacio amb la llista d'elements
    i++;
    if (ye.size() > 1) {
        if (a == "+") return yices_sum(ye.size(),&ye[0]);
        else if (a == "-") {
            term_t acc = ye[0];
            for(unsigned int c = 1; c < ye.size();c++){
                acc = yices_sub(acc,ye[c]);
            }
            return acc;
        }
        else if (a == "*") return yices_product(ye.size(),&ye[0]);
        else if (a == "or") return yices_or(ye.size(),&ye[0]);
        else if (a == "and"){
            term_t t = yices_and(ye.size(),&ye[0]);
            if(t == NULL_TERM){
                cerr << "error and = " << yices_error_code() << endl;
                yices_print_error(stderr);
            }
            return t;
        }
    } else if(ye.size() == 1){
        // poden ser ors i ands de 1 element, a causa de simplificacions 
        // per exemple
        if (a == "or") return yices_or(ye.size(),&ye[0]);
        else if (a == "and") return yices_and(ye.size(),&ye[0]);
        else {
            yices_pp_term(stdout, ye[0], 80, 20, 0);
            cout << "ERR traduint "<< a << __FILE__ << " ";
            cout <<  __LINE__ << " " << __func__ << endl;
            abort();
        }
    } else {
        cout << "ERR traduint "<< a << __FILE__ << " ";
        cout <<  __LINE__ << " " << __func__ << endl;
        abort();
    }
    return yices_true();
}

// de moment unaris nomes hi ha la negacio ...?
term_t CoreSolverYices2::tradUnari(Expression & e,int & i) {
    return yices_neg(tradExpr(e,i));
}

term_t CoreSolverYices2::tradExpr(Expression & e,int & i) {
    string a=e.element(i);
    if (a == "ite") {
        i++;
        return tradIte(e,i);

    } else if (
            a == "<"    ||
            a == "<="   ||
            a == ">"    ||
            a == ">="   ||
            a == "="    ||
            a == "!="   ||
            a == "impl" ||
            a == "dimpl") {
        i++;
        return tradRel(e,i,a);

    } else if (
            a.compare(string("-"))==0 ||
            a.compare(string("+"))==0) {
        string aux=a;
        i++;
        if (e.element(i).compare(string("("))==0){
            return tradList(e,i,a);
        } else {
            if (a.compare(string("-")) == 0){
                return tradUnari(e,i);
            } else { return tradExpr(e,i); }
        }

    } else if (
            a.compare(string("*"))==0 ||
            a.compare(string("or"))==0 ||
            a.compare(string("and"))==0) {
        i++;
        return tradList(e,i,a);
    } else  if (a.compare(string("not"))==0) {
        i++;
        return tradNot(e,i);
    } else  if (a.compare(string("true"))==0) {
        i++;
        return yices_true();
    } else  if (a.compare(string("false"))==0) {
        i++;
        return yices_false();
    } else   if (a.compare(string("EOE"))==0) {
        cout << "error in Expression" << endl;
        exit(-1);
    } else {
        if (a[0]>='0' && a[0]<='9') {
            i++;
            return yices_int32(atoi(a.c_str()));
        } else {
            i++;
            return mapVar[a].expr;
        }
    }
}
