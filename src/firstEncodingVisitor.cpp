#include "firstEncodingVisitor.h"

using namespace std;

firstEncodingVisitor::firstEncodingVisitor(string parallelism, string exists_order, string exists_enc, string int_incompat_type, string plan_file, string int_func_dom, int alg_solv,int cycles_flag, int mutex_flag,int sorting_network, int decide_flag) {
    random_not_so_random = 0;
    max_steps = 1000;

    inv_types = std::shared_ptr<std::map< std::string, std::vector< std::string> > >(
            new std::map< std::string, std::vector< std::string> >()); 

    parallelism_model = parallelism;
    exists_ordering = exists_order;
    exists_encoding = exists_enc;
    plan_filename = plan_file;
    int_incompat = int_incompat_type;
    int_func_domains = int_func_dom;
    solving_alg = alg_solv;
    cut_cycles = cycles_flag;
    add_mutexes = mutex_flag;
    sorting_network_size = sorting_network;
    decidable_actions = decide_flag;
    different_states = true;
}

firstEncodingVisitor::~firstEncodingVisitor(){
}

bool firstEncodingVisitor::needsFlattening(){
    return true;
}

void firstEncodingVisitor::visitParameter( shared_ptr<Parameter> ptr){
    //NOP
}

void firstEncodingVisitor::visitFunctor( shared_ptr<Functor> ptr){
}

void firstEncodingVisitor::visitPredicate( shared_ptr<Predicate> ptr){
    if(ptr->isInstanced()){
        bool_A.push_back(shared_ptr<Predicate>(ptr));
        pred_A.push_back(shared_ptr<Predicate>(ptr));

        // generem les inicialitzacions ( nomes hi han predicats, = i nots )
        bool found = false;

        for(const auto & init : *p_inits){
            if(init->type == functor_type::T_OPERATION &&
                    init->getName() == "not" &&
                    static_pointer_cast<Functor>(init->getParam(0))->toString() == ptr->toString()){

                s_inits.push_back("=("+ init->getParam(0)->toString(1) + ",false)");
                found = true;

            } else if(init->type == functor_type::T_PREDICATE &&
                    static_pointer_cast<Functor>(init)->toString() == ptr->toString()){
                s_inits.push_back("=("+ init->toString(1) + ",true)");
                found = true;
            }
        }
        if(!found){
            s_inits.push_back("=("+ ptr->toString(1) + ",false)");
        }
    }
}

void firstEncodingVisitor::visitFunction( shared_ptr<Function> ptr){
    if(ptr->isInstanced()){
        // l'afegim com a var entera a generar
        int_A.push_back(shared_ptr<Functor>(ptr));

        //  l'afegim al vector de funcions per despres comprovar que es generen
        //  totes les constraints de frame action
        vec_functions.push_back(ptr);

        // TODO TODO **** hardcoded que undefined mapeja a 0
        // TODO TODO posar en una macro o #DEFINE o algo aixi ...
        if(ptr->getReturnType() != "number"){
            stringstream ss;
            int lb = type_ranges[ptr->getReturnType()].first;
            int ub = type_ranges[ptr->getReturnType()].second;

            if(int_func_domains == "range"){
                //cout << ptr->toString(1) << " - " << ptr->getReturnType() << " BY RANGE: " << endl;

                ss << "or(=(" << ptr->toString(1) << ",0),and(";
                ss << ">=(" << ptr->toString(1) << "," << std::to_string(lb) << "),";
                ss << "<=(" << ptr->toString(1) << "," << std::to_string(ub) << ")))";
                //cout << ss.str() << endl;
                act_per_step.push_back(ss.str());

            } else if(int_func_domains == "or"){
                //cout << ptr->toString(1) << " - " << ptr->getReturnType() << " BY ENUMERATION: " << endl;
                ss << "or(";
                for(int i = lb; i < ub; i++){
                    ss << "=(" << ptr->toString(1) << "," << i << "),";
                }
                ss << "=(" << ptr->toString(1) << ",0),";
                ss << "=(" << ptr->toString(1) << "," << ub << "))";
                //cout << ss.str() << endl;
                act_per_step.push_back(ss.str());
            } else if(int_func_domains == "none"){
                // NOOP :P
            }
            ss.str(string());
        }

        bool found = false;
        // generem les inicialitzacions ( nomes hi han predicats, = i nots )
        for(const auto & init : *p_inits){
            if(init->type == functor_type::T_OPERATION &&
                    init->getName() == "=" &&
                    static_pointer_cast<Functor>(init->getParam(0))->toString() == ptr->toString()){
                s_inits.push_back("=("+ init->getParam(0)->toString(1) + "," +  init->getParam(1)->toString(1) + ")");
                found = true;
            }
        }
        if(!found){
            // si no tenim una funcio inicialitzada pot ser que la liem ...
            cout << "ERR? : Int not initialized! Initializing to 0: " << ptr->toString();
            cout << " " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
            s_inits.push_back("=("+ ptr->toString(1) + ",0)");
            //exit(1);
        }
    } 
}

void firstEncodingVisitor::visitAction( shared_ptr<Action> ptr){
    if(ptr->isInstanced()){
        cout << endl << "visitem " << ptr->toString(1) << endl;
        // afegim les vars que toquen a on toquen
        bool_A.push_back(shared_ptr<Action>(ptr));
        O_vars.push_back(ptr->toString(1));
        pO_vars.push_back(ptr);

        stringstream ss;

        string element = ptr->toString(1);

        // 1 - o_t -> p_t 
        string o_t = ptr->getRawPrecondition()->toString(1);
        ss << "impl(" << element << "," << o_t << ")"; 
        one.push_back(ss.str());
        ss.str(string());

        for(int i = 0; i < ptr->getNFDs(); i++){
            auto fid = ptr->getFD(i);
            auto precond = fid.first;
            auto efect   = fid.second;

            // 2 - (o_t /\ f_t) -> d_t+1
            ss << "impl(and(" << element << "," << precond->toString(1) << ")," << efect->toString(2) << ")";
            two.push_back(ss.str());
            ss.str(string());

            std::vector< std::shared_ptr<Thing> > elem_a_tractar;

            // estem tractant amb un efecte compost?. En cas que si
            // agafem tots els subefectes i els empilem per a tractar,
            // en cas que no el tractem sol
            if(efect->type == functor_type::T_OPERATION &&
                    efect->getName() == "and"){
                auto efect_f = static_pointer_cast<Functor>(efect);
                for(int j = 0; j < efect_f->getNParams(); j++){
                    elem_a_tractar.push_back(efect_f->getParam(j));
                }
            } else {
                elem_a_tractar.push_back(efect);
            }

            // per cada efecte a tractar, l'afegim als indexos corresponents
            for(const auto efecte : elem_a_tractar){
                // generem els EPCs
                if(efecte->type == functor_type::T_OPERATION){
                    auto efecte_op = static_pointer_cast<Functor>(efecte);
                    //cout << "Efecte: " << efecte_op->toString(1) << endl;
                    if(efecte_op->getName() == "increase" ||
                            efecte_op->getName() == "decrease" ||
                            efecte_op->getName() == "assign" ){

                        //cout << "+b epc [" << efecte_op->toString(2) << "] = ";
                        //cout << precond->toString() << endl;
                        int_epcs[efecte_op->toString(2)].push_back(
                                make_tuple(ptr,precond,efecte));
                        int_modif[efecte_op->getParam(0)->toString(1)].push_back(
                                make_tuple(ptr,precond,efecte_op->getParam(0)));

                    } else if( efecte_op->getName() == "not" ){
                        bool_epcs[efecte_op->toString(2)].push_back(make_pair(ptr,precond));
                        //cout << "+b epc [" << efecte_op->toString(2) << "] = ";
                        //cout << precond->toString() << endl;
                    } else {
                        cout << "ERR? " << efecte_op->toString(2) << __FILE__ << " ";
                        cout <<  __LINE__ << " " << __func__ << endl;
                    }
                } else if(efecte->type == functor_type::T_PREDICATE){
                    bool_epcs[efecte->toString(2)].push_back(make_pair(ptr,precond));
                    //cout << "+b epc [" << efecte->toString(2) << "] = "
                    //cout << precond->toString() << endl;
                }
            }
        }

        // emplenem l'index de boolean_preconditions per a poder despres
        // generar incompatibilitats. Ens interesen: predicats, i els not()
        // de les precondicions.
        std::function<void(shared_ptr<Thing>)> bool_recur;
        bool_recur = [&](shared_ptr<Thing> tree) {
            // NOMES es fa anar on se sap que es un functor!
            shared_ptr<Functor> f_tree;
            if( tree->type == functor_type::T_OPERATION ||
                    tree->type == functor_type::T_PREDICATE){
                f_tree = static_pointer_cast<Functor>(tree);
                switch(tree->type) {
                    case functor_type::T_OPERATION:
                        {
                            if(f_tree->getName() == "when"){ // mirem la part de l'efecte
                                bool_recur(f_tree->getParam(1));
                            } else if(f_tree->getName() == "not"){
                                boolean_preconditions[f_tree->toString(2)].insert(ptr);
                            } else{
                                for(int i = 0; i < f_tree->getNParams(); i++){
                                    bool_recur(f_tree->getParam(i));
                                }
                            }
                        }
                        break;
                    case functor_type::T_PREDICATE:
                        {
                            boolean_preconditions[f_tree->toString(2)].insert(ptr);
                        }
                        break;
                    default:
                        cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
                        break;
                }
            } else {
                // herpderp, es una constant, placeholder o whatever
            }
        };
        bool_recur(ptr->getRawPrecondition());

        // emplenem les index de integer_preconditions i integer_fd_preconditions,
        // per a poder despres generara incompatibilitats. ens interesen: nomes 
        // els enters que es consulten
        std::function<void(shared_ptr<Thing>,int,bool)> int_recur;
        int_recur = [&](shared_ptr<Thing> tree,int fd_id,bool is_fd) {
            // NOMES es fa anar on se sap que es un functor!
            shared_ptr<Functor> f_tree;
            if( tree->type == functor_type::T_OPERATION ||
                    tree->type == functor_type::T_FUNCTION){
                f_tree = static_pointer_cast<Functor>(tree);
                switch(tree->type) {
                    case functor_type::T_OPERATION:
                        {
                            for(int i = 0; i < f_tree->getNParams(); i++){
                                int_recur(f_tree->getParam(i),fd_id,is_fd);
                            }
                        }
                        break;
                    case functor_type::T_FUNCTION:
                        {
                            // si es estatica no es modifica, per tant no la considerem
                            if(!static_pointer_cast<Function>(tree)->getStatic()){
                                if(is_fd){
                                    integer_fd_preconditions[f_tree->toString()].insert(
                                            std::make_pair(fd_id,ptr));
                                } else {
                                    integer_preconditions[f_tree->toString()].insert(ptr);
                                }
                            }
                        }
                        break;
                    default:
                        cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " ";
                        cout << __func__ << endl;
                        break;
                }
            } else {
                // herpderp, es una constant, placeholder o whatever
            }
        };
        for(int i = 0;i < ptr->getNFDs(); i++){ int_recur(ptr->getFD(i).first,i,true); }
        int_recur(ptr->getRawPrecondition(),0,false);
    }
    else {
        // es una raw action
        raw_actions.push_back(ptr);
    }
}

void firstEncodingVisitor::visitConstraint( shared_ptr<Constraint> ptr){
    if(ptr->isInstanced()){
        cout << "visitem " << ptr->toString(1) << endl;
        //cout << *ptr << endl;
        string o_t = ptr->getRawCondition()->toString(1);
        cout << o_t << endl;
        act_per_step.push_back(o_t);
    }
}

void firstEncodingVisitor::generate4(){
    stringstream ss;

    // frame boolea:
    for(unsigned int i = 0; i < pred_A.size(); i++){
        string _a;
        string _not_a;

        _a = pred_A[i]->toString(1);
        _not_a = "not(" + pred_A[i]->toString(2) + ")";
        ss << "impl(and(" << _a << "," << _not_a << "),or(";

        if(bool_epcs.find(_not_a) != bool_epcs.end()){
            for(unsigned int j = 0; j < bool_epcs[_not_a].size(); j++){
                ss << "and(";
                ss << bool_epcs[_not_a][j].first->toString(1)  << ",";
                ss << bool_epcs[_not_a][j].second->toString(1) << ")";
                if(j != bool_epcs[_not_a].size() -1){ ss << ","; }
            }
        } else {
            ss << "false";
        }
        ss << "))";
        three.push_back(ss.str());
        ss.str(string());

        _not_a = "not(" + pred_A[i]->toString(1) + ")";
        _a = pred_A[i]->toString(2);
        ss << "impl(and(" << _not_a << "," << _a << "),or(";
        if(bool_epcs.find(_a) != bool_epcs.end()){
            for(unsigned int j = 0; j < bool_epcs[_a].size(); j++){
                ss << "and(";
                ss << bool_epcs[_a][j].first->toString(1)  << ",";
                ss << bool_epcs[_a][j].second->toString(1) << ")";
                if(j != bool_epcs[_a].size() -1){ ss << ","; }
            }
        } else { 
            ss << "false";
        }
        ss << "))";
        three.push_back(ss.str());
        ss.str(string());
    }


    // frame enter: 
    // (4) not(o1) \/ ((o1 /\ not(EPC(o1)) /\ ... -> X_t+1 = X_t 
    for(const auto fun : vec_functions){
        if( int_modif.find(fun->toString(1)) == int_modif.end() ){
            //cout << " VAR NO MODIFICADA: " << fun->toString(1) << endl;
            ss << "impl(true,=(" << fun->toString(1) << "," << fun->toString(2) << "))";
            four.push_back(ss.str());
            //cout << ss.str() << endl;
            ss.str(string());
        } else {
            //cout << " VAR MODIFICADA: " << fun->toString(1) << endl;
            // str_var_int_modificada -> <action, precond, var>
            auto eff_var = static_pointer_cast<Functor>(
                    std::get<2>(int_modif[fun->toString(1)].at(0)));

            ss << "impl(and(";
            // comencem amb la constraint
            for(unsigned int i = 0; i < int_modif[fun->toString(1)].size(); i++){
                ss << "or(not(" << std::get<0>(
                                int_modif[fun->toString(1)][i])->toString(1) << "),not(";
                ss << std::get<1>(int_modif[fun->toString(1)][i])->toString(1) << "))";
                if(i != int_modif[fun->toString(1)].size() - 1){ ss << ","; }
            }
            ss << "),=(" << eff_var->toString(1) << "," << eff_var->toString(2) << "))";
            four.push_back(ss.str());
            ss.str(string());
        }
    }
    /*
    for(const auto it : int_modif){
        auto data = it.second;

        // str_var_int_modificada -> <action, precond, var>
        auto eff_var = static_pointer_cast<Functor>(std::get<2>(data.at(0)));

        ss << "impl(and(";
        // comencem amb la constraint
        for(unsigned int i = 0; i < data.size(); i++){
            ss << "or(not(" << std::get<0>(data[i])->toString(1) << "),not(";
            ss << std::get<1>(data[i])->toString(1) << "))";
            if(i != data.size() - 1){ ss << ","; }
        }
        ss << "),=(" << eff_var->toString(1) << "," << eff_var->toString(2) << "))";
        four.push_back(ss.str());
        ss.str(string());
    }*/
}

void firstEncodingVisitor::encodeExactlyOneAction(){

    //naiveExactlyOneEncoding();
    binaryEncoding();
}

// fer anar sizeof(unsigned long) * CHAR_BIT ES MALGASTAR memoria, no se si
// seria millor fer-ho en un vector<bool> o no ...  maleides templates .. xD 
void firstEncodingVisitor::binaryEncoding(){
    stringstream ss; 

    const unsigned int real_num_bits = ceil(log(O_vars.size()) / log(2)); // log amb base 2 de vars->size()
    const unsigned int num_bits = sizeof(unsigned long) * CHAR_BIT;
    //cout << "size: " << vars->size() << " , necessitem " << real_num_bits << " bits" << endl;

    // array de bitsets que directament l'iniciem a la 
    // mida que toca i posem els numeros a l'array de 0 a n_vars
    vector<bitset<num_bits> > binary_values(O_vars.size());
    for(unsigned int i = 0; i < O_vars.size(); i++){
        binary_values[i] = bitset<num_bits>(i);
    }

    // vector on tenim les variables booleanes temporals
    vector<string> boolean_vars;
    for(unsigned int i = 0; i < real_num_bits; i++){
        shared_ptr<Predicate> counter = std::make_shared<Predicate>(getRandomName("binary_enc"));
        string temp_var_str = counter->toString(1);
        boolean_vars.push_back(temp_var_str);
        bool_A.push_back(counter);
    }

    for(unsigned int i = 0; i < O_vars.size(); i++){
        for(unsigned int j = 0; j < real_num_bits ; j++){
            // fem realnumbits - j  perque hem de comencar per el final sempre
            if(binary_values[i].test(real_num_bits-j-1)){      
                ss << "or(not(" + O_vars[i] + ")," + boolean_vars[j] + "))";
            } else {
                ss << "or(not(" + O_vars[i] + "),not(" + boolean_vars[j] + ")))";
            }
            act_per_step.push_back(ss.str());
            ss.str(string());
        }
    }

    // i al final fem un or() de tot per aconseguir l'exactly-one enlloc del at-most-one
    ss << "or(";
    for(unsigned int i = 0; i < O_vars.size(); i++){
        ss << O_vars[i];
        if( i != O_vars.size() -1 ){ ss << ","; }
    }
    ss << ")";
    act_per_step.push_back(ss.str());
    ss.str(string());
}

void firstEncodingVisitor::naiveExactlyOneEncoding(){
    stringstream ss_or; 

    ss_or << "or("; 
    for(const auto& str : O_vars){
        ss_or << str << ",";
    }
    string s_or1 = ss_or.str();
    // treiem lultima coma i posem el parentesis del final
    s_or1.erase(s_or1.length()-1);
    s_or1.push_back(')'); 
    act_per_step.push_back(s_or1);
    ss_or.str(string());

    for(unsigned int i = 0; i < O_vars.size(); i++){
        for(unsigned int j = i; j < O_vars.size(); j++){
            if(i != j){
                ss_or << "or(not(" << O_vars[i] << "),not(" << O_vars[j] << "))";
                act_per_step.push_back(ss_or.str());
                ss_or.str(string());
            }
        }
    }
}

// assigna a cada objecte un enter, a partir de 1 ("undefined" es el 0)
// i assigna a cada tipus el rang que li correspon. Afegeix el que toca a les
// estructures int_A i s_inits.
// PRE: se suposa que ens han donat ja la llista de objectes (setObjects())
void firstEncodingVisitor::encodeObjects(){
    // per les funcions que tornen objectes
    // object - type
    /*
    int tmp_lb  = 1;
    int tmp_val = 1;
    for(const auto lobj : objects_by_type){
        for(const auto obj : lobj.second){
            shared_ptr<Parameter> param(new Parameter());
            param->setName(obj);
            param->setStatic(true);
            param->setType(functor_type::T_FUNCTION);

            int_A.push_back(param);
            objects_to_int[obj] = tmp_val;
            s_inits.push_back("=("+ param->toString(1) + "," + std::to_string(tmp_val) + ")");

            tmp_val++;
        }

        type_ranges[lobj.first] = std::make_pair(tmp_lb,tmp_val-1);
        tmp_lb = tmp_val;
    }
    */
    /*
    std::function<void(string,shared_ptr<set<string> >)> getAllSubt;
    getAllSubt = [&](string t,shared_ptr<set<string> > conj) {
        conj->insert(t);
        if(types->count(t) > 0){
            for(const auto tip : (*types)[t]){ getAllSubt(tip,conj); }
        } else { }
    };

    std::function<void(string,shared_ptr<set<string> >)> getAllSubObjects;
    getAllSubObjects = [&](string t, shared_ptr<set<string> > objs) {

        if(objects_by_type.find(t) != objects_by_type.end()){
            objs->insert(objects_by_type[t].begin(),objects_by_type[t].end());
        }
        if(types->count(t) > 0){
            for(const auto tip : (*types)[t]){ getAllSubObjects(tip,objs); }
        } else { }
    };

    auto conjunt = make_shared<set<string> >();
    auto objectes = make_shared<set<string> >();

    getAllSubt("objects",conjunt);
    cout << "subtipus de location: " << endl;
    for(const auto type : *conjunt){
        cout << "\t - " << type << endl;
    }

    getAllSubObjects("objects",objectes);
    cout << "objectes de location: " << endl;
    for(const auto type : *objectes){
        cout << "\t - " << type << endl;
    }

    cout << "NULL te " << countSubObjects("NULL") << " objectes" << endl;
    cout << "object te " << countSubObjects("object") << " objectes" << endl;
    cout << "ship te " << countSubObjects("ship") << " objectes" << endl;
    cout << "platform te " << countSubObjects("platform") << " objectes" << endl;
    */

    std::function<int(string)> countSubObjects;
    countSubObjects = [&](string t)->int {
        int count = 0;
        if(types->count(t) > 0){
            for(const auto tip : (*types)[t]){ count += countSubObjects(tip); }
        } else { }

        if(objects_by_type.find(t) != objects_by_type.end()){
            return objects_by_type[t].size() + count;
        } else { return count; }
    };

    // com que son grups petits no cachejem el contatge de objectes ...
    std::function<void(string,int)> labelRangeTypes;
    labelRangeTypes = [&](string t,int lb) {

        if(types->count(t) > 0){
            for(const auto tip : (*types)[t]){
                int quants = countSubObjects(tip);
                if(quants == 0){
                    type_ranges[tip] = std::make_pair(lb,lb);
                    //cout << tip << " - <" << lb << "," << lb << ">" << endl;
                } else {
                    type_ranges[tip] = std::make_pair(lb,lb+quants-1);
                    //cout << tip << " - <" << lb << "," << lb+quants-1 << ">" << endl;
                }
                labelRangeTypes(tip,lb);
                lb += quants;
            }
        } else { }
    };

    // calculem els rangs de tipus 
    labelRangeTypes("NULL",1);

    // i assignem valors a cada objecte 
    for(const auto ot : objects_by_type){
        int lb = type_ranges[ot.first].first;
        for(const auto obj : ot.second){
            shared_ptr<Parameter> param = std::make_shared<Parameter>();
            param->setName(obj);
            param->setStatic(true);
            param->setType(functor_type::T_FUNCTION);

            int_A.push_back(param);
            objects_to_int[obj] = lb;
            //cout << "=("+ param->toString(1) + "," + std::to_string(lb) + ")" << endl;
            s_inits.push_back("=("+ param->toString(1) + "," + std::to_string(lb) + ")");

            lb++;
        }
    }
}

void firstEncodingVisitor::encodeTheRestPlease(){
    //generate3();
    generate4();

    encodeParallelism();
    debug(false);
}

/* La idea es que afegint un at most k sobre les variables 
 * booleanes que representen les accions, li sera mes facil
 * refutar i per tant anar mes rapid. 
 */
// TODO passar la creacio de la sorting network a una classe externa ...
void firstEncodingVisitor::addSorterNetwork(){

    int nVars = 0;
    int d = O_vars.size();

      std::function<void(string,string,string,string)> twoComparator;
      twoComparator = [&](string x1, string x2, string y1, string y2)->void {
          //2-comparator
          act_per_step.push_back("or(not(" + x1 + ")," + y1 + ")");
          act_per_step.push_back("or(not(" + x2 + ")," + y1 + ")");
          act_per_step.push_back("or(not(" + x1 + "),not(" + x2 + ")," + y2 + ")");

          act_per_step.push_back("or(" + x1 + ",not(" + y2 + "))");
          act_per_step.push_back("or(" + x2 + ",not(" + y2 + "))");
          act_per_step.push_back("or(" + x1 + "," + x2 + ",not(" + y1 + "))");
/*
          */

          // per fer un at most k = top three
          // per fer un at least k = bottom three
          // per fer un exactly k = totes
      };

      //Create a array of 'nNewVars' new variables
      std::function<vector<string>(int)> varArray;
      varArray = [&](int nNewVars)->vector<string>{
      //cout << "creem " << nNewVars << " noves variables " << endl;
          vector<string> newVars;
          for(int i = 0; i < nNewVars; i++){
              string nom = "z"+ std::to_string(i+nVars+1);
              shared_ptr<Predicate> new_var = std::make_shared<Predicate>(nom);
              bool_A.push_back(new_var);
              newVars.push_back(new_var->toString(1));
                //cout << "afegim var " << new_var->toString(1) << endl;
          }

          nVars += nNewVars;
          return newVars;
      };

      std::function<void(vector<string>,vector<string>,vector<string>,int)> merge;
      merge = [&](vector<string> x1, vector<string> x2, vector<string> y, int n)->void {
          if(n==1)
              twoComparator(x1[0],x2[0],y[0],y[1]);
          else{
              vector<string> z = varArray(2*n - 2);
              vector<string> x1Aux(n/2);
              vector<string> x2Aux(n/2);
              vector<string> zAux(n);

              //Even
              for(int i = 0; i < n/2; i++){
                  x1Aux[i] = x1[2*i];
                  x2Aux[i] = x2[2*i];
              }
              zAux[0] = y[0];
              for(int i = 1; i < n; i++)
                  zAux[i] = z[2*i-2];

              merge(x1Aux,x2Aux,zAux,n/2);

              //Odd
              for(int i = 0; i < n/2; i++){
                  x1Aux[i] = x1[2*i+1];
                  x2Aux[i] = x2[2*i+1];
              }
              for(int i = 0; i < n-1; i++)
                  zAux[i] = z[2*i+1];
              zAux[n-1] = y[2*n-1];

              merge(x1Aux,x2Aux,zAux,n/2);

              for(int i = 0; i < 2*n-2; i+=2)
                  twoComparator(z[i],z[i+1],y[i+1],y[i+2]);

              /*delete [] x1Aux;
              delete [] x2Aux;
              delete [] zAux;
              delete [] z;*/
          }
      };

      std::function<void(vector<string>,vector<string>,int)> sorting;
      sorting = [&](vector<string> x,vector<string> y, int n)->void {
        //Implementation of sorting network sort(x)=y
            if(n==2)
                twoComparator(x[0],x[1],y[0],y[1]);
            else{
                vector<string> z = varArray(n);
                vector<string> x2 = vector<string>(x.begin() + n/2,x.end());
                vector<string> z2 = vector<string>(z.begin() + n/2,z.end());
                //cout << "mida vector x2 i z2: [" << x2.size() << "," << z2.size() << "]" << endl;

                sorting(x,z,n/2);
                sorting(x2,z2,n/2);
                merge(z,z2,y,n/2);
            }
        };


    //cout << "---------------------" << endl;
    //cout << "START sorting Network" << endl;
    // crea un array de variables de mida 2^d
    //cout << "Tenim " << d << " variables per definir execucions de accions" << endl;

    // busquem la seguent potencia de dos a partir del nombre de vars
    // booleanes que ens representen les execucions de les accions
    int power = 1; while(power < d) power*=2;
    vector<string> sortedIsNOR = varArray(power);
    //cout << "La proxima potencia de 2 es " << power << " i per tant posem" << endl;
    //cout << power - d << " variables a fals" << endl;

    for(int i = 0; i < power - d; i++){
        // creem noves vars fins a la potencia de dos mes proxima cap amunt.
        string nom = "z"+ std::to_string(i+nVars+1);
        shared_ptr<Predicate> new_var = std::make_shared<Predicate>(nom);
        // afegim a les estructures "standard"
        bool_A.push_back(new_var);
        O_vars.push_back(new_var->toString(1));
        //cout << "afegim var " << new_var->toString(1) << endl;
        //pO_vars.push_back(new_var);

        // aquesta var al ser dummy pq la xarxa necessita una potencia de dos
        // quedara sempre a fals.
        act_per_step.push_back("not(" + new_var->toString(1) + ")");
    }
    nVars += power - d; // actualitzem el contador que fem anar per el nom de les vars

    // crea i afegeix la sorting network
    //cout << "sorting start" << endl;
    sorting(O_vars,sortedIsNOR,power);

    // afegeix la k del "at most k"
    cout << "Sorting network encoding an at_most_k(" << sorting_network_size << ")" << endl;
    act_per_step.push_back("not(" + sortedIsNOR[sorting_network_size] + ")");

    //cout << "-------------------" << endl;
    //cout << "END sorting Network" << endl;
}

void firstEncodingVisitor::encodeParallelism(){


    // inicialitzem el graf per tindre tots els nodes
    for(const auto acc: raw_actions){
        graph_inc[acc->toString(1)] = *(new set<pair<string,string> >());
    }

    // calculem incompatibilitats
    if(int_incompat == "o"){
        booleanIncompatibilities();
        classicalIntegerIncompatibilities();
    } else if(int_incompat == "n"){
        newIncompatibilities(false);
    } else if(int_incompat == "u"){
        newIncompatibilities(true);
    } else if(int_incompat == "s"){
        semanticIncompatibilities(false);
    } else if(int_incompat == "h"){
        semanticIncompatibilities(true);
    } else if(int_incompat == "c"){
        // NOOP
    } 

    // i codifiquem el paralelisme
    if(parallelism_model == "l"){
        encodeExactlyOneAction();
    }else if(parallelism_model == "f"){
        affectationGraph();
        forallStep();
        // afegim un at most k per a ajudar a la refutacio ...
        if(sorting_network_size != 0 ){ addSorterNetwork(); }
    } else if(parallelism_model == "e"){
        affectationGraph();
        existsStep();
        if(sorting_network_size != 0 ){ addSorterNetwork(); }
    } else {
        cout << "Error! Model de paralelisme no reconegut!" << endl;
        //exit(-1);
    }

    int arestes = 0;
    for(const auto row : graph_inc){ arestes += row.second.size(); }
    cout << "arestes incompat_graph:" << arestes << endl; 

#ifdef DEBUG_VERSION
    // DEBUG , sortida del graf a fitxer ------------------------
    ofstream f_sortida;
    f_sortida.open("incompat_graph.dot", ios::trunc | ios::out);
    f_sortida << "digraph graphname {" << endl;
    // debug
    for(const auto row : graph_inc){
        if(row.second.size() > 0){
            for(const auto col : row.second){
                f_sortida << search_and_replace(row.first,"@","t") << " -> " << search_and_replace(col.second,"@","t");
                f_sortida << " [label=\"" << col.first << "\",color=\"";

                if(col.first == "boolean"){ f_sortida << "blue"; }
                else if(col.first == "integer"){ f_sortida << "red"; }
                else { f_sortida << "green"; }

                f_sortida << "\"];" << endl;
            }
        } else {
            f_sortida << "//" << row.first << ";" << endl;
        }
    }
    f_sortida << " } " << endl;
    f_sortida.close();
#endif
    // ----------------------------------------------------------
}

// TODO check diagonalitat!
void firstEncodingVisitor::forallStep(){
    stringstream ss;

    for(const auto row : graph_inc){
        for(const auto col : row.second){
            ss << "or(not(" << row.first << "),not(" << col.second << "))";
            act_per_step.push_back(ss.str());
            ss.str(string());
        }
    }
}
void firstEncodingVisitor::affectationGraph(){
    stringstream ss;

    // https://en.wikipedia.org/wiki/Path-based_strong_component_algorithm

    // The algorithm performs a depth-first search of the given graph G,
    // maintaining as it does two stacks S and P.  Stack S contains all the
    // vertices that have not yet been assigned to a strongly connected
    // component, in the order in which the depth-first search reaches the
    // vertices.  

    // https://people.mpi-inf.mpg.de/~mehlhorn/ftp/LEDAbook/Master.pdf Pag 316
    // aprox

    // grafs de proves per comprovar que funciona be 
    /*
       graph_inc.clear();
       graph_inc["u"].insert(make_pair("foo","dos")); graph_inc["u"].insert(make_pair("foo","tres"));
       graph_inc["dos"].insert(make_pair("foo","tres")); graph_inc["dos"].insert(make_pair("foo","quatre"));
       graph_inc["tres"] = *(new set<pair<string, string> >()); graph_inc["quatre"].insert(make_pair("foo","cinc"));
       graph_inc["quatre"].insert(make_pair("foo","tres")); graph_inc["cinc"].insert(make_pair("foo","dos"));
       graph_inc["cinc"].insert(make_pair("foo","sis")); graph_inc["sis"].insert(make_pair("foo","quatre"));
       graph_inc["sis"].insert(make_pair("foo","tres"));
       auto foo_ptr_it = graph_id_lookup.begin();
       shared_ptr<Action> foo_ptr = (*foo_ptr_it).second;
       graph_id_lookup.clear();
       graph_id_lookup["u"] = foo_ptr; graph_id_lookup["dos"] = foo_ptr;
       graph_id_lookup["tres"] = foo_ptr; graph_id_lookup["quatre"] = foo_ptr;
       graph_id_lookup["cinc"] = foo_ptr; graph_id_lookup["sis"] = foo_ptr;
    */
    /*
    graph_inc.clear();
    graph_inc["a"].insert(make_pair("foo","b")); graph_inc["b"].insert(make_pair("foo","c"));
    graph_inc["c"].insert(make_pair("foo","a")); graph_inc["d"].insert(make_pair("foo","a"));
    graph_inc["d"].insert(make_pair("foo","e")); graph_inc["e"].insert(make_pair("foo","f"));
    graph_inc["f"].insert(make_pair("foo","g")); graph_inc["g"].insert(make_pair("foo","h"));
    graph_inc["h"].insert(make_pair("foo","d")); graph_inc["h"].insert(make_pair("foo","f"));
    auto foo_ptr_it = graph_id_lookup.begin();
    shared_ptr<Action> foo_ptr = (*foo_ptr_it).second;
    graph_id_lookup.clear();
    graph_id_lookup["a"] = foo_ptr; graph_id_lookup["b"] = foo_ptr;
    graph_id_lookup["c"] = foo_ptr; graph_id_lookup["d"] = foo_ptr;
    graph_id_lookup["e"] = foo_ptr; graph_id_lookup["f"] = foo_ptr;
    graph_id_lookup["g"] = foo_ptr; graph_id_lookup["h"] = foo_ptr;
    */
    /*
    graph_inc.clear();
    graph_inc["A"].insert(make_pair("foo","B")); 
    graph_inc["B"].insert(make_pair("foo","C"));
    graph_inc["C"].insert(make_pair("foo","B"));
    graph_inc["C"].insert(make_pair("foo","D"));
    auto foo_ptr_it = graph_id_lookup.begin();
    shared_ptr<Action> foo_ptr = (*foo_ptr_it).second;
    graph_id_lookup.clear();
    graph_id_lookup["A"] = foo_ptr;
    graph_id_lookup["B"] = foo_ptr;
    graph_id_lookup["C"] = foo_ptr;
    graph_id_lookup["D"] = foo_ptr;
    */

    // stacks i estructures per el DFS =====================================
    // =====================================================================
    std::stack<string> unfinished; 
    std::stack<string> roots;

    int dfscount   = 0;
    int comp_count = 0;

    // PBSCC function -----------------------
    std::function<void(string)> PBSCC;
    PBSCC = [&](string v) {
        dfscount++;
        //cout << "dfsnum[" << v << "] = " << dfscount<< endl;
        dfsnum[v] = dfscount;

        // make v a tentative scc of its own
        unfinished.push(v);
        roots.push(v);

        string w;
        for(const auto w_pair: graph_inc[v]){
            w = w_pair.second;

            //////////////////////////////////
            // ja que hem de recorrer el graf complet per trobar les SCCs, aprofitem
            // aqui per afegir contatge d'arestes entrants, i tindre un ordre per 
            // l'encoding lineal
            //cout << v << " ---> " << w_pair.first << " --- " << w_pair.second << endl;
            if(num_arestes_entrants.find(v) != num_arestes_entrants.end()){
                num_arestes_entrants[v]++;
            } else { num_arestes_entrants[v] = 1; }
            ////////////////

            if(dfsnum[w] == -1){
                PBSCC(w);
            } else {

                // xtra ////////
                DFScuts.push_back(std::make_pair(v,w));
                ////////////////

                if(comp_num[w] == -1){ 
                    while(dfsnum[roots.top()] > dfsnum[w]){
                        roots.pop();
                    }
                }
            }
        }
        if(v == roots.top()){
            do {
                w = unfinished.top(); unfinished.pop();

                // l'afegim a les dos estructures
                comp_num[w] = comp_count;
                SCC[comp_count].push_back(w);
            } while (w != v);
            comp_count++;
            roots.pop();
        }
    };

    // tallem els cicles de dos
    // =========================================================================================
    if(cut_cycles == 1){
        std::map<std::string,std::set< std::string> > arestes_eliminades;
        for(const auto v_pair: graph_inc){
            for(const auto edge: v_pair.second){
                // aresta de v_pair.first a edge.second
                // comprovem si existeix al reves
                auto int_pair  = make_pair("integer",v_pair.first);
                auto bool_pair = make_pair("boolean",v_pair.first);
                auto it_graph  = graph_inc.find(edge.second);
                if(it_graph != graph_inc.end()){
                    if(graph_inc[edge.second].count(int_pair) > 0){
                        arestes_eliminades[edge.second].insert(v_pair.first); 
                        //graph_inc[edge.second].erase(int_pair);
                    }
                    if(graph_inc[edge.second].count(bool_pair) > 0){
                        arestes_eliminades[edge.second].insert(v_pair.first);
                        //graph_inc[edge.second].erase(bool_pair);
                    }
                }
            }
        }
        int n_elim = 0;
        for(const auto orig : arestes_eliminades){
            for(const auto dest : orig.second){
                arestes_eliminades[dest].erase(orig.first); // eliminem l'altre, perque sabem que es un cicle de 2 segur

                // ara eliminem les dos del graf original
                auto int_pair  = make_pair("integer",orig.first);
                auto bool_pair = make_pair("boolean",orig.first);
                n_elim += graph_inc[dest].erase(int_pair);
                n_elim += graph_inc[dest].erase(bool_pair);
                int_pair.second = dest;
                bool_pair.second = dest;
                n_elim += graph_inc[orig.first].erase(int_pair);
                n_elim += graph_inc[orig.first].erase(bool_pair);

                // i afegim la constraint
                ss << "or(not(" << orig.first << "),not(" << dest << "))";
                act_per_step.push_back(ss.str());
                ss.str(string());
            }
        }
        cout << "arestes eliminades per tallar cicles de dos: " << n_elim << endl;
    }
    // =========================================================================================

    // emplenem indexos i inicialitzem 
    for(const auto v_pair: graph_id_lookup){
        string v = v_pair.first;
        comp_num[v] = -1;
        dfsnum[v]  = -1;
    }

    //  ORDENACIO SEGONS NUM ARESTES ENTRANTS
    // ordenem els nodes per arestes entrants
    map<string,int> num_edges_entrants;
    // inicialitzem el map amb tot a zeros
    for(const auto elem: graph_id_lookup){ num_edges_entrants[elem.first] = 0; }
    // calculem el nombre d'arestes entrants de cada node
    for(const auto v_pair: graph_inc){
        for(const auto edge: v_pair.second){
            // no fa falta que comprovem si esta inicialitzat pq ja ho hem fet abans
            num_edges_entrants[edge.second]++; } }
    // dumpejem el map a un vector per a ordernar-lo
    vector<pair<string,int>> v_pairs(num_edges_entrants.begin(), num_edges_entrants.end());
    // i l'ordenem ... visca les lambdas xD
    std::sort(v_pairs.begin(), v_pairs.end(),
            [](const std::pair<string,int> &left, const std::pair<string,int> &right) {
                return left.second < right.second;
    });

	// explorem el graf segons l'ordre de num arestes entrants calculat a sobre
    for(const auto v_pair: v_pairs){
    // si ho volguessim fer aleatori: for(const auto v_pair: graph_inc){
        auto v = v_pair.first; 
        if(dfsnum[v] == -1){ PBSCC(v); }
    }

    // Ens assegurem de tindre un ordre total:
    for(const auto elem: O_vars){ 
        if(dfsnum.count(elem) == 0){ // si no hi es al map<string,int> l'afegim
            dfscount++; dfsnum[elem] = dfscount;  
        }
    }

    std::vector<string> ordre(dfsnum.size());
    // passem del map a un vector, on la posicio dona l'ordre implicit v[0] < v[1] ...
    for(const auto mapping : dfsnum){ ordre[mapping.second-1] = mapping.first; }
    // POSSIBLES ORDRES: 
    // ----------------------------------------------------------------
    if(exists_ordering == "rdfs"){ // revers del dfs
        std::reverse(ordre.begin(),ordre.end());
    } else if(exists_ordering == "random"){ // random!
        std::random_shuffle (ordre.begin(), ordre.end() );
    } else if(exists_ordering == "dfs"){ // no fem res, tal com ve del dfs
        // NOOP
    } else if(exists_ordering == "lex"){ // lexicographically
        std::sort(ordre.begin(), ordre.end());
    } else if(exists_ordering == "rlex"){
        std::sort(ordre.begin(), ordre.end());
        std::reverse(ordre.begin(),ordre.end());
    } else if(exists_ordering == "comm"){ // communities 
        std::map<std::string,int> lifted_order = communitiesOrdering();
        std::sort(ordre.begin(),ordre.end(),
                [&](std::string const & lhs, std::string const & rhs){
                string n_lhs = str_explode(lhs,"__")[0];
                string n_rhs = str_explode(rhs,"__")[0];
                return lifted_order[n_lhs] < lifted_order[n_rhs];
        });
    } else if(exists_ordering == "rcomm"){ // reverse communities 
        std::map<std::string,int> lifted_order = communitiesOrdering();
        std::sort(ordre.begin(),ordre.end(),
                [&](std::string const & lhs, std::string const & rhs){
                string n_lhs = str_explode(lhs,"__")[0];
                string n_rhs = str_explode(rhs,"__")[0];
                return lifted_order[n_lhs] > lifted_order[n_rhs];
        });

    } else if(exists_ordering == "relaxed"){ // relaxed problem
        std::map<std::string,int> relaxed_order = relaxedOrdering();
        // ----------------------------------------- //
        // --- MAKE BABY JESUS CRY ----------------- //
        // ----------------------------------------- //
        extern int kill_after_order_flag;
        extern string order_file;
        if(kill_after_order_flag == 1){
            ofstream f_ordre;
            f_ordre.open(order_file,ios::trunc | ios::out);
            for(const auto elem : relaxed_order){
                f_ordre << elem.first << "," << elem.second << endl;
                cout << " SAVING " << elem.first << " - " << elem.second << endl;
            }
            f_ordre.close();
            // Hem de fer 2 execucions!! la seguent amb fromfile
            exit(0);
        }
    } else {
        cout << "WHAT ORDER IS THIS, HUMAN?" << endl;
        assert(false);
    }

    extern string order_file;
    if(order_file != ""){ // read informed order from file
        // ----------------------------------------- //
        // --- MAKE BABY JESUS CRY ----------------- //
        // ----------------------------------------- //
        std::map<std::string,int> relaxed_order;
        ifstream f_ordre(order_file);
        for( std::string line; getline( f_ordre, line );){
            // ens petem el newline
            std::vector<string> elems = str_explode(line,",");
            cout << "read from file: " << elems[0] << "," << stoi(elems[1]) << endl;
            relaxed_order[elems[0]] = stoi(elems[1]);
        }
        f_ordre.close();
        // ----------------------------------------- //
        // ----------------------------------------- //
        auto needsToBeSorted = [&](std::string const &s) { return relaxed_order.count(s) > 0; };
        std::vector<string> sub_ordre; std::vector<int> posicions;
        for(int i = 0; i < ordre.size(); i++){
            if(needsToBeSorted(ordre[i])){
                sub_ordre.push_back(ordre[i]);
                posicions.push_back(i); } else {
                }
        }
        std::sort(sub_ordre.begin(),sub_ordre.end(),
                [&](std::string const & lhs, std::string const & rhs){
                return relaxed_order[lhs] < relaxed_order[rhs]; });
        cout << sub_ordre.size() << " de " << dfsnum.size() << " accions a ordenar " << endl;
        for(int i = 0; i < sub_ordre.size(); i++){
            ordre[posicions[i]] = sub_ordre[i];
        }
    }
    
    // un cop establert l'ordre, el guardem.
    for(int i = 0; i < ordre.size(); i++){
        dfsnum[ordre[i]] = i; 
    }



   // i tornem a posar el dfsnum al vector de ordre
   for(const auto mapping : dfsnum){ ordre[mapping.second] = mapping.first; }

    // DEBUG --------------------------------------------------------------------
       cout << "SCCs! -------------------------" << endl;
//       for(const auto mapping: dfsnum){
//       cout << mapping.first << " ord " << mapping.second << endl; }
//       for(const auto mapping: comp_num){
//       cout << mapping.first << " ---> " << mapping.second << endl; }

       int total_elements_in_sccs = 0;
       for(const auto elem : SCC){
           if(elem.second.size() > 1){ // no considerem SCC de mida 1, duh
               cout << "SCC num: " << elem.first << " size: " << elem.second.size() << endl;
               total_elements_in_sccs += elem.second.size(); } }

       cout << "total number of actions in problem: " << O_vars.size() << endl;
       cout << " sum of actions in SCCs (size>1) : " << total_elements_in_sccs << endl;
       cout << "END SCCs! -------------------------" << endl << endl;

       cout << "ORDRE: " << endl;
       cout << "----------------------" << endl;
       for(int i = 0; i < ordre.size(); i++){ cout << i << ": " << ordre[i] << endl; }
       cout << endl;
       /*
	   cout << "Fletxes vermelles -------------------------" << endl;
	   int vermelles = 0;  
	   for(int i = 0; i < ordre.size(); i++){
		   for(int j = i; i < ordre.size(); i++){
				auto int_pair  = make_pair("integer",ordre[j]);
				auto bool_pair = make_pair("boolean",ordre[j]);
			   if( graph_inc[ordre[i]].count(int_pair) > 0 || graph_inc[ordre[i]].count(bool_pair) > 0){                   vermelles++;
				   cout << ordre[i] << " afecta " << ordre[j] << endl;
			   }
		   }
	   }   
	   cout << vermelles << " ARESTES VERMELLES" << endl;
	   cout << "END vermelles -------------------------" << endl;*/
}

std::map<string,int> firstEncodingVisitor::relaxedOrdering(){
	stringstream ss;
	// calculem incompatibilitats entre accions per fer el problema
    // relaxat paralel
	// get inverse agafa una string, i si fa match amb "not(.*)" retorna una copia amb
	// nomes el contingut del not, en cas contrari retorna una copia i l'envolta amb "not()".
	auto get_inverse = [&](string name) {
		string prefix = "not(";
		auto resultat = std::mismatch(prefix.begin(), prefix.end(), name.begin()); 
		if (resultat.first == prefix.end()) { return name.substr(4,name.length()-5);
		} else { return "not("+name+")"; }
		return name;
	};

	std::map<std::string,std::set< std::pair<std::string,std::string> > > g_incompat;
	// aixo es la part que comprova si pot impedir l'execucio d altre accio	
	for(const auto b_effect : bool_epcs){
		string s_effect = b_effect.first;
		auto it_prec = boolean_preconditions.find(get_inverse(s_effect));
		if(it_prec != boolean_preconditions.end()){
			for(const auto acc_prec : (*it_prec).second){
				for(const auto acc_eff : b_effect.second){
					if(acc_prec->toString() != acc_eff.first->toString()){

						g_incompat[acc_eff.first->toString(1)].insert(
								std::make_pair("boolean",acc_prec->toString(1)));
						graph_id_lookup[acc_prec->toString(1)] = acc_prec;
						graph_id_lookup[acc_eff.first->toString(1)] = acc_eff.first;
					}
				}
			}
		}
	}

    std::stack<string> r_unfinished;
    std::stack<string> r_roots;
    int r_dfscount   = 0;
    int r_comp_count = 0;
    std::map<string,int> r_dfsnum;
    std::map<string,int> r_comp_num;
	std::map<int,std::vector<string> > r_SCC;

    // PBSCC function -----------------------
    std::function<void(string)> PBSCC;
    PBSCC = [&](string v) { 
        r_dfscount++;
        r_dfsnum[v] = r_dfscount;

        // make v a tentative scc of its own
        r_unfinished.push(v);
        r_roots.push(v);

        string w;
        for(const auto w_pair: g_incompat[v]){
          w = w_pair.second;
          if(r_dfsnum[w] == -1){ PBSCC(w); } else {
            if(r_comp_num[w] == -1){ 
              while(r_dfsnum[r_roots.top()] > r_dfsnum[w]){ r_roots.pop(); } } }
        }
        if(v == r_roots.top()){
            do {
                w = r_unfinished.top(); r_unfinished.pop();
                r_comp_num[w] = r_comp_count;
                r_SCC[r_comp_count].push_back(w);
            } while (w != v);
            r_comp_count++;
            r_roots.pop();
        }
    };   

    // emplenem indexos i inicialitzem 
    for(const auto v_pair: graph_id_lookup){
        string v = v_pair.first;
        r_comp_num[v] = -1;
        r_dfsnum[v]  = -1; 
    }

    //  ORDENACIO SEGONS NUM ARESTES ENTRANTS
    // ordenem els nodes per arestes entrants
    map<string,int> num_edges_entrants;
    // inicialitzem el map amb tot a zeros
    for(const auto elem: graph_id_lookup){ num_edges_entrants[elem.first] = 0; } 
    // calculem el nombre d'arestes entrants de cada node
    for(const auto v_pair: graph_inc){
        for(const auto edge: v_pair.second){
            // no fa falta que comprovem si esta inicialitzat pq ja ho hem fet abans
            num_edges_entrants[edge.second]++; } }
    // dumpejem el map a un vector per a ordernar-lo
    vector<pair<string,int>> v_pairs(num_edges_entrants.begin(), num_edges_entrants.end());
    // i l'ordenem ... visca les lambdas xD
    std::sort(v_pairs.begin(), v_pairs.end(),
            [](const std::pair<string,int> &left, const std::pair<string,int> &right) {
                return left.second < right.second;
    });  

    // explorem el graf segons l'ordre de num arestes entrants calculat a sobre
    for(const auto v_pair: v_pairs){
    // explorem el graf segons l'ordre de num arestes entrants calculat a sobre
    //for(const auto v_pair: g_incompat){
        auto v = v_pair.first; 
        if(r_dfsnum[v] == -1){ PBSCC(v); }
    }    

    // Ens assegurem de tindre un ordre total:
    for(const auto elem: O_vars){ 
        if(r_dfsnum.count(elem) == 0){ // si no hi es al map<string,int> l'afegim
            r_dfscount++; r_dfsnum[elem] = r_dfscount;  
        }
    }  

     //
    // DEBUG --------------------------------------------------------------------
    // cout << "SCCs! -------------------------" << endl;
    // for(const auto mapping: r_dfsnum){
    // cout << mapping.first << " ord " << mapping.second << endl; }
    // for(const auto mapping: r_comp_num){
    // cout << mapping.first << " ---> " << mapping.second << endl; }

    // int total_elements_in_sccs = 0; 
    // for(const auto elem : r_SCC){
    //     if(elem.second.size() > 1){ // no considerem SCC de mida 1, duh
    //         cout << "SCC num: " << elem.first << " size: " << elem.second.size() << endl;
    //         total_elements_in_sccs += elem.second.size(); } }

    // cout << "total number of actions in problem: " << O_vars.size() << endl;
    // cout << " sum of actions in SCCs (size>1) : " << total_elements_in_sccs << endl;
    // cout << "END SCCs! -------------------------" << endl << endl;
    //

	for(const auto row : g_incompat){
		for(const auto col : row.second){
			if((r_dfsnum[row.first] < r_dfsnum[col.second]) &&
					(r_comp_num[row.first] == r_comp_num[col.second])){
				ss << "or(not(" << row.first << "),not(" << col.second << "))";
				relaxed_act_per_step.push_back(ss.str());
				ss.str(string());
			}
		}
	}

    /*
  cout << "CONSTRAINTS PROBLEMA RELAXAT:" << endl;
  cout << "-----------------------------" << endl;
  for(const auto it : relaxed_one){ cout << "1: " << it << endl; }
  for(const auto it : relaxed_two){ cout << "2: " << it;  }
  for(const auto it : relaxed_three){ cout << "3: " << it << endl; }
  for(const auto it : relaxed_bool_A){ cout << "bools extres: " << it << endl; }
  for(const auto it : relaxed_act_per_step){ cout << "P: " << it << endl; }
  */

    // creem un solver temporal per resoldre el problema relaxat
    r_solver = std::shared_ptr<SolverStandard>(new SolverStandard(new CoreSolverZ3(0),new SolverActionNOP()));
    std::vector<std::vector< string> > accions_t = r_solveLineal();
    
    cout << "size vector actions from solve: " << accions_t.size() << endl;
    int t = accions_t.size() - 1;
    // linealitzem les accions
    // ----------------------------
    // per cada instant de temps, si hi tenim varies accions, fem el graf parcial d'afectacio
    // només amb les accions que s'executen en aquell instant de temps. Amb aquest graf, l'ordre
    // correcte sera el topological order al revés.
    // (http://en.wikipedia.org/wiki/Topological_sorting)
    for(int i = 0; i <= t; i++){
        // si tenim 2 o mes accions val la pena buscar un ordre
        if(accions_t[i].size() > 1){
            std::map<string,int> nom_idx; std::map<int,string> idx_nom;
            std::vector< std::vector< bool > > graph(accions_t[i].size(), std::vector<bool>(accions_t[i].size(),false));

            // lliguem idx dels vectors amb nom de les accions
            int idx_tmp = 0;
            for(const auto nom : accions_t[i]){
                nom_idx[nom] = idx_tmp; idx_nom[idx_tmp] = nom; idx_tmp++; }

            // enlloc de recorrer despres tota la matriu per saber nodes que no tenen 
            // arestes entrants, les considerem primerament totes com a que tenen arestes no entrants
            // i despres a mesura que migrem el graf les anem eliminant segons afegim arestes.
            std::vector<int> pre_S(accions_t[i].size(),0);

            // emplenem la matriu
            for(const auto acc1 : accions_t[i]){
                for(const auto acc2 : accions_t[i]){
                    if(acc1 != acc2){ // si no es la mateixa accio
                        // netejem
                        string cacc1,cacc2;

                        vector<string> exploded = explode(acc1,"__");
                        for(unsigned int it = 0; it < exploded.size() - 1; it++){
                            cacc1 += exploded[it] + "__";
                        } cacc1 += "@";

                        exploded = explode(acc2,"__");
                        for(unsigned int it = 0; it < exploded.size() - 1; it++){
                            cacc2 += exploded[it] + "__";
                        } cacc2 += "@";

                        // i si tenen conexio afegim
                        if(g_incompat[cacc1].count(std::make_pair("integer",cacc2)) >= 1 || 
                                g_incompat[cacc1].count(std::make_pair("boolean",cacc2)) >= 1){
                            //cout << cacc1 << " afecta a " << cacc2 << " , afegim a matriu " << endl;
                            graph[nom_idx[acc1]][nom_idx[acc2]] = true;
                            pre_S[nom_idx[acc2]] += 1;
                        }
                    }
                }
            }

            // aqui fem el topological order!
            std::vector<string> L; // Empty list that will contain the sorted elements
            std::vector<string> S; // Set of all nodes with no incoming edges
            // S l'emplenem de les columnes buides, osigui, dels nodes que no tenen arestes entrants
            for(unsigned int i = 0; i < pre_S.size(); i++){
                if(pre_S[i] == 0){
                    S.push_back(idx_nom[i]); } }

            while(S.size() > 0) {
                string n = S.back(); S.pop_back(); L.push_back(n); 
                for(unsigned int j = 0; j < graph.size(); j++){
                    if(graph[nom_idx[n]][j]){
                        string m = idx_nom[j];
                        graph[nom_idx[n]][j] = false;
                        pre_S[j] -= 1;

                        if(pre_S[j] == 0){
                            S.push_back(m); } } } }
            std::reverse(L.begin(),L.end()); 
            accions_t[i] = L;
        }
    }
	// ja tenim les accions linealitzades a accions_t
    // -----------------------------------------------

    // ara el pla es el seguent: de cada accio, n'eliminem el time step on
    // apareix, creant duplicats en el cas de que una mateixa accio aparegui en
    // diferents time steps.
    // A partir d'aqui, crearem un problema soft, on trobarem un ordre que
    // minimitzi el nombre de violacions de A < B, en el cas de que A aparegui
    // abans que B en el pla amb repetits. Aixo ens servira per evitar
    // incongruencies de l'estil: A,B,A -> A < B? B < A? i resoldreles
    // elegantment. A partir d'aqui tindrem un ordre total entre elles, i per
    // tant podrem ordenar el vector total d'accions.
    cout << "ACCIONS LINEALITZADES " << endl;
	std::vector<string> pla_lineal;
    for(const auto el1: accions_t){
        for(const auto el2: el1){
            string cacc2;
            vector<string> exploded = explode(el2,"__");
            for(unsigned int it = 0; it < exploded.size() - 1; it++){
                cacc2 += exploded[it] + "__";
            } cacc2 += "@";
            pla_lineal.push_back(cacc2);
            cout << cacc2 << endl;
        }
    }

    Timer opt_tim;
    opt_tim.start();
    // dump SMT2 problem
    auto core_solver = new
    CoreSolverFileZ3Opt("rordre_"+std::to_string(::getpid())+"_"+getRandomName()+".smt2",0);
    core_solver->model = true;
    solver = shared_ptr<SolverStandard>(new SolverStandard(core_solver,new SolverActionNOP()));
    // afegim totes les vars al problema
    for(int i = 0; i < pla_lineal.size();i++){
        core_solver->addVar(pla_lineal[i],"int");
        core_solver->assertConstraint(">(" + pla_lineal[i] + ",0)");
    }
    // i assertem les constraints 
    for(int i = 0; i < pla_lineal.size();i++){
        for(int j = i; j < pla_lineal.size();j++){
            // penalitzem la violacio de la constraint de i < j
            core_solver->assertSoftConstraint("<(" + pla_lineal[i] + "," + pla_lineal[j] + ")",1);
        }
    }
    cout << "time assert : " << duration_cast<milliseconds>(opt_tim.elapsed()).count() << " milliseconds. " << endl;
    int check = solver->check();
    if(check == 0){ cout << "?????" << endl; } else { cout << "Yay!" << endl; }
    cout << "Total time optimizing order: " << duration_cast<milliseconds>(opt_tim.elapsed()).count() << " milliseconds. " << endl;
    std::map<string,int> ordre;
    for(const auto elem : core_solver->mapVar){
        ordre[elem.first] = std::stoi(elem.second.second);
        cout << elem.first << " = " << std::stoi(elem.second.second) << endl;
    }
    return ordre;
}


std::map<string,int> firstEncodingVisitor::communitiesOrdering(){

    std::map<std::string,int> name_to_int; // mapping de nom a posicio 
    std::map<int,std::string> int_to_name; 
    std::vector< std::vector<int> > weights(raw_actions.size(), std::vector<int>(raw_actions.size(), 0));; // graf expresat com a matriu adjacencia

    int i = 0;
    for(const auto action : raw_actions){
        string name = str_explode(action->toString(1),"__")[0];
        name_to_int[name] = i;
        int_to_name[i] = name;
        i++;
    }

    // recorrem el graf normal i emplenem el "weighted reduced graph"
    for(const auto row : graph_inc){
        for(const auto col : row.second){
            string orig = row.first;
            string dest = col.second;
            string name1 = str_explode(row.first,"__")[0];
            string name2 = str_explode(col.second,"__")[0];
            weights[name_to_int[name1]][name_to_int[name2]]++;
        }
    }

    /* DEBUG */
    cout << "Raw actions:" << endl;
    for(const auto elem : name_to_int){
        cout << elem.first << " --> " << elem.second << endl;
    }
    cout << endl;
    for(int i = 0; i < weights.size();i++){
        for(int j = 0; j < weights.size();j++){
            cout << "hi han " << weights[i][j] << " arestes de " << int_to_name[i] << " a " << int_to_name[j] << endl;
            //cout << weights[i][j] << "\t";
        }
        cout << endl;
    }
    cout << endl;
    /* DEBUG */

    /*
       Aqui cridarem el z3, per a optimitzar l'ordre total entre accions. Aixo voldra 
       dir que donat un graf d'afectacions, trobarem un ordre tal que minimitzi el nombre
       de fletxes cap endavant:
       */
    Timer opt_tim;
    opt_tim.start();
    // dump SMT2 problem
    auto core_solver = new
    CoreSolverFileZ3Opt("ordre_"+std::to_string(::getpid())+"_"+getRandomName()+".smt2",0);
    core_solver->model = true;
    solver = shared_ptr<SolverStandard>(new SolverStandard(core_solver,new SolverActionNOP()));
    // afegim totes les vars al problema
    for(int i = 0; i < weights.size();i++){
        core_solver->addVar(int_to_name[i],"int"); 
        core_solver->assertConstraint(">(" + int_to_name[i] + ",0)");
    }
    // i assertem el graf weighted
    for(int i = 0; i < weights.size();i++){
        for(int j = 0; j < weights.size();j++){
            cout << "hi han " << weights[i][j] << " arestes de " << int_to_name[i] << " a " << int_to_name[j] << endl;
            // penalitzem la violacio de la constraint de i < j en w, ja que hi han w arestes de i a j
            core_solver->assertSoftConstraint(">(" + int_to_name[i] + "," + int_to_name[j] + ")",weights[i][j]);
        }
    }
    cout << "time assert : " << duration_cast<milliseconds>(opt_tim.elapsed()).count() << " milliseconds. " << endl;
    int check = solver->check();
    if(check == 0){ cout << "?????" << endl; } else { cout << "Yay!" << endl; }
    cout << "Total time optimizing order: " << duration_cast<milliseconds>(opt_tim.elapsed()).count() << " milliseconds. " << endl;
    std::map<string,int> ordre;
    for(const auto elem : core_solver->mapVar){
        ordre[elem.first] = std::stoi(elem.second.second);
    }

    return ordre;
}

void firstEncodingVisitor::existsStep(){
    stringstream ss;
    // ===========================================
    // Encodings =================================
    // ===========================================

    // Encoding quadratic, tipic
    if(exists_encoding == "quadratic"){

        // i afegim les constraints INCONDICIONALS
        for(const auto row : graph_inc){
            for(const auto col : row.second){
                if(int_incompat == "h"){
                    //
                    // NOOP, aqui nomes hem calculat els checks1 per a
                    // tindre en compte a l'hora de buscar un ordre
                    //
                } else { //if(exists_ordering == "dfs"){
                    if((dfsnum[row.first] < dfsnum[col.second]) && 
                            (comp_num[row.first] == comp_num[col.second])){ 
                        ss << "or(not(" << row.first << "),not(" << col.second << "))";
                        act_per_step.push_back(ss.str());
                        ss.str(string());
                    }
                }
            }
        }

    // Encoding lineal, rintanen, per cada SCC
    // Planning as satisfiability: parallel plans and algorithms for plan search (2006) 
    // chain( ... )
    } else if (exists_encoding == "lineal"){

            /*
              cout << "INC RINTANEN: " << endl; for(const auto incompat_group : inc_rintanen){ cout << "Key: " << incompat_group.first << " : " << endl;
                for(const auto in : incompat_group.second){ cout << "<" << in.first << "," << in.second << ">, " << endl; } cout << endl; }
            */

            for(const auto component : SCC){ // per cada SCC
                
                // vector ordenat de parelles amb el num d'arestes entrants,
                // i el nom del node. Ens servira per tindre un ordre mig correcte ...
                std::priority_queue< pair<int,string>,
                                     std::vector<pair<int,string> >,
                                     std::greater<pair<int,string> > > cua_ordenada_nodes;
                for(const auto elem : component.second){
                    //cout << "Pushing:" <<elem<<", "<< num_arestes_entrants[elem] << endl; 
                    cua_ordenada_nodes.push(std::make_pair(
                                num_arestes_entrants[elem],elem));
                }

                map<string,int> act_ord;
                map<int,string> ord_act;

                // Warning! ha de ser en el rang de 0..n ja que l'ordre
                // es fa anar per la posicio de vectors posteriorment
                int order_id = 0;
                if(exists_ordering == "dfs"){
                    for(const auto w : component.second){
                        act_ord[w] = order_id;
                        ord_act[order_id] = w;
                        order_id++;
                    }
                } else {
                    while(cua_ordenada_nodes.size() > 0){
                        auto w = cua_ordenada_nodes.top().second;
                        act_ord[w] = order_id;
                        ord_act[order_id] = w;
                        order_id++;
                        cua_ordenada_nodes.pop();
                    }
                }

                for(const auto incompat_group : inc_rintanen){
                    /*
                    cout << "rintanen graf per la incompat : " << incompat_group.first << " num parelles : " << incompat_group.second.size() << endl;
                    for(const auto w : ord_act){ cout << "ord_act[" << w.first << "]=" << w.second << endl; }
                    */


                    // vars auxiliars per 
                    std::vector< shared_ptr<Predicate> > vars_aux_ptr(
                            component.second.size(),NULL);
                    std::vector<string> vars_aux(vars_aux_ptr.size(),"NULL");
                    // les de les o_t^i fins a a_t^j
                    std::vector<std::pair<int,int> > implications; 

                    ///
                    for(const auto w : incompat_group.second){
                            // setejem la variable com a que s'ha de crear
                            vars_aux[act_ord[w.second]] = w.second; 
                    }
                    ///
                    // 1 ===================
                    for(unsigned int i = 0; i < ord_act.size(); i++){

                        // we start to check per la seguent
                        bool trobat = false;
                        unsigned int j = i + 1;

                        // mentre no trobem una accio amb que sigui incompatible
                        // i seguent ( aqui ja tenim en compte l'ordre! )
                        while(j < ord_act.size() && !trobat){
                            if(incompat_group.second.count(
                                        make_pair(ord_act[i],ord_act[j])) > 0){
                            //cout << "trobat <" << i << "," << j << "> - <";
                            //cout << ord_act[i] << "," << ord_act[j] << ">" << endl;
                                trobat = true;
                            } else{
                                j++;
                            }
                        }
                        if(trobat){
                            implications.push_back(std::make_pair(i,j));
                        }
                    }

                    // afegim les vars auxiliars de l'encoding al problema
                    for(unsigned int i = 0; i < vars_aux.size(); i++){
                        if(vars_aux[i] != "NULL"){
                            shared_ptr<Predicate> counter = std::make_shared<Predicate>(getRandomName("e_enc_" + std::to_string(i) + "_"));
                            bool_A.push_back(counter);
                            //cout << "new var: " << counter->toString(1) << endl;
                            vars_aux_ptr[i] = counter;
                        }
                    }

                    // (1)
                    for(const auto parell : implications){
                        ss << "impl(" << ord_act[parell.first] << ",";
                        ss <<  vars_aux_ptr[parell.second]->toString(1) << ")";
                        //cout << "(1) " << ss.str() << endl;
                        act_per_step.push_back(ss.str());
                        ss.str(string());
                    }


                    //  2 ===================
                    unsigned int i = 0;
                    while(i < vars_aux.size()){
                        if(vars_aux[i] != "NULL"){

                            unsigned int j = i + 1;
                            bool trobat = false;
                            while(j < vars_aux.size() && !trobat ){
                                if(vars_aux[j] != "NULL"){ 
                                    trobat = true;
                                }
                                else{
                                    j++;
                                }
                            }

                            // (2)
                            if(trobat){ // si no hem topat amb el final
                                ss << "impl(" << vars_aux_ptr[i]->toString(1) << ",";
                                ss << vars_aux_ptr[j]->toString(1) << ")";
                                //cout << "(2) " << ss.str() << endl;
                                act_per_step.push_back(ss.str());
                                ss.str(string());
                            }

                        }
                        i++;
                    }

                    //  3 =================== 
                    for(unsigned int k = 0; k < vars_aux.size(); k++){
                        if(vars_aux[k] != "NULL"){
                            ss << "impl(" << vars_aux_ptr[k]->toString(1) << ",not(";
                            ss << vars_aux[k] << "))";
                            //cout << "(3) " << ss.str() << endl;
                            act_per_step.push_back(ss.str());
                            ss.str(string());
                        }
                    }

                }
            }

        }else if(exists_encoding == "dfscuts") {
            for(const auto parella : DFScuts){
                ss << "or(not(" << parella.first << "),not(" << parella.second << "))";
                act_per_step.push_back(ss.str());
                ss.str(string());
            }
        } else {
            cout << "Encoding no reconegut. Err!" << endl;
            assert(false);
        }
    }

    void firstEncodingVisitor::booleanIncompatibilities(){
        // get inverse agafa una string, i si fa match amb "not(.*)" retorna una copia amb
        // nomes el contingut del not, en cas contrari retorna una copia i l'envolta amb "not()".
        auto get_inverse = [&](string name) {
            string prefix = "not(";
            auto resultat = std::mismatch(prefix.begin(), prefix.end(), name.begin()); 
            if (resultat.first == prefix.end()) { return name.substr(4,name.length()-5);
            } else { return "not("+name+")"; }
            return name;
        };   

        // aixo es la part que comprova si pot impedir l'execucio de una altre accio, falta mirar
        // la de canviar els efectes todo todo todo todo
        for(const auto b_effect : bool_epcs){
            string s_effect = b_effect.first;
            auto it_prec = boolean_preconditions.find(get_inverse(s_effect));
            if(it_prec != boolean_preconditions.end()){
                for(const auto acc_prec : (*it_prec).second){
                    for(const auto acc_eff : b_effect.second){
                        if(acc_prec->toString() != acc_eff.first->toString()){

                            graph_inc[acc_eff.first->toString(1)].insert(
                                    std::make_pair("boolean",acc_prec->toString(1)));

                            //cout << "Bool rint: " << s_effect << " : <" << acc_eff.first->toString(1);
                            //cout << "," << acc_prec->toString(1) << ">" << endl;
                            inc_rintanen[s_effect].insert(
                                    std::make_pair(acc_eff.first->toString(1),acc_prec->toString(1)));
                            graph_id_lookup[acc_prec->toString(1)] = acc_prec;
                            graph_id_lookup[acc_eff.first->toString(1)] = acc_eff.first;
                        }
                    }
                }
            }
        }

    }

void firstEncodingVisitor::classicalIntegerIncompatibilities(){
    // aixo es la part que comprova si pot impedir l'execucio de una altre accio, falta mirar
    // la de canviar els efectes todo todo todo todo

    // per a evitar que dos accions que modifiquen la mateixa variable s'executin en paralel, fem un index
    // que mapeja de string(la var) a un conjunt d'accions, l'emplenem i els prohibim
    //

    // afegim les incompatibilitats, com a cicle
    for(const auto elem : int_modif){
        for(const auto var1 : elem.second){
            for(const auto var2 : elem.second){
                auto acc1 = std::get<0>(var1);
                auto acc2 = std::get<0>(var2);
                if(acc1->toString(1) != acc2->toString(1)){

                    graph_inc[acc1->toString(1)].insert(std::make_pair("integer",acc2->toString(1)));
                    graph_inc[acc2->toString(1)].insert(std::make_pair("integer",acc1->toString(1)));

                    //cout << "Int rint: " << elem.first << " : <" << acc1->toString(1);
                    //cout << "," << acc2->toString(1) << ">" << endl;
                    inc_rintanen[elem.first].insert(
                            std::make_pair(acc1->toString(1),acc2->toString(1)));
                    if(graph_id_lookup.count(acc1->toString(1)) == 0){
                        graph_id_lookup[acc1->toString(1)] = acc1;}
                    if(graph_id_lookup.count(acc2->toString(1)) == 0){
                        graph_id_lookup[acc2->toString(1)] = acc2;}
                }
            }
        }
    }

    for(const auto i_effect : int_epcs){
        shared_ptr<Thing> var_modificada = static_pointer_cast<Functor>(get<2>(i_effect.second.at(0)))->getParam(0);
        auto it_prec = integer_preconditions.find(var_modificada->toString());
        if(it_prec != integer_preconditions.end()){
            for(const auto acc_prec : (*it_prec).second){
                for(const auto acc_eff : i_effect.second){
                    if(acc_prec->toString() != get<0>(acc_eff)->toString()){

                        graph_inc[get<0>(acc_eff)->toString(1)].insert(
                                std::make_pair("integer",acc_prec->toString(1)));

                        inc_rintanen[var_modificada->toString(1)].insert(
                                std::make_pair(acc_prec->toString(1),get<0>(acc_eff)->toString(1)));
                        if(graph_id_lookup.count(acc_prec->toString(1)) == 0){
                            graph_id_lookup[acc_prec->toString(1)] = acc_prec;}
                        if(graph_id_lookup.count(get<0>(acc_eff)->toString(1)) == 0){
                            graph_id_lookup[get<0>(acc_eff)->toString(1)] = get<0>(acc_eff);}
                    }
                }
            }
        }
    }
}

/* El metode correcte formalment 
 *
 *  Si trobem un efecte de (increase x y) o (decrease x y) podem fer un mutex
 *  condicional en el cas de que exactament:
 *
 *  El check 1: pre_a /\ pre_b /\ not( pre_a subst_a ) fa servir tots els
 *  efectes de l'accio a, i hem de determinar si realment l'afectacio es nomes
 *  a causa de l'efecte enter. Per tant suposo que lo mes practic seria fer un
 *  check per cada efecte enter i despres un de total en cas de que no fos SAT.
 *
 *  Per exemple: En cas de tindre tres efectes a l'accio o : (increase x 10),
 *  (assign y 3), (closed z),
 *
 *  i l'accio o' ... hauriem de fer varis checks:
 *  1 - pre_a /\ pre_b /\ not( pre_a subst_a )  
 *  per comprovar si s'afecten. En cas de que si ...
 *  2 - pre_a /\ pre_b /\ not( pre_a subst(tots els eff menys increase x 10) ) 
 *  per comprovar si es exactament l'efecte de (increase x 10) el que fa
 *  l'afectacio.
 *
 *  Potser es pot fer incremental individualment per cada efecte i aixi es poden anar treient?
 *  O demanar l'unsat core per saber si fa referencia a la variable que s'esta substituint?
 *
 *
 *  En cas de volguerho aproximat, es pot afegir independentment i aixi no 
 *  s'han de fer checks adicionals.
 *
 *  si tenim (increase x y):
 *      trobem : 
 *          * (x >  z) : x + y <= z -> not(a) /\ not(b)
 *          * (x >= z) : x + y < z -> not(a) /\ not(b)
 *          * (x <  z) : x + y >= z -> not(a) /\ not(b)
 *          * (x <= z) : x + y > z -> not(a) /\ not(b)
 *          * (x =  z) : x + y != z -> not(a) /\ not(b)
 *
 *  si tenim (decrease x y):
 *     trobem : 
 *          * (x >  z) : x - y <= z -> not(a) /\ not(b)
 *          * (x >= z) : x - y < z -> not(a) /\ not(b)
 *          * (x <  z) : x - y >= z -> not(a) /\ not(b)
 *          * (x <= z) : x - y > z -> not(a) /\ not(b)
 *          * (x =  z) : x - y != z -> not(a) /\ not(b)
 */
void firstEncodingVisitor::semanticIncompatibilities(bool only_check1){

  // el shiftat es necessari perque sino es podia liar al calcular les
  // incompatibilitats noves (via SMT), ja que predicats que acceptessin un 
  // supertipus de dos parametres diferents ho podriem arribar a codificar com a si
  // parlessin del mateix:
  //  (at ?x - locatable) - city 
  //  :parameters (?p - person ?a - aircraft ?c - city)
  //  :parameters (?a - aircraft ?c1 ?c2 - city)
  //  22                  (= (at ?p) ?c)                | 22             =(at__1__@,1),
  //  23                  (= (at ?a) ?c)                | 23             =(at__1__@,1),
  //
  std::function<void(shared_ptr<vector <vector<int> > >,int,int)> generate_combinations;
  generate_combinations = [&generate_combinations](
      shared_ptr<vector <vector<int> > > total, int n, int shiftat)->void {
    assert(n > 0);
    vector<int> kappa(n);
    vector<int> M(n);

    // based on Michael Orlov: Efficient Generation of Set Partitions.
    // "https://www.cs.bgu.ac.il/~orlovm/papers/"
    std::function<bool()> generator;
    generator =  [&]()->bool{

      for (int i = n-1; i > 0; --i){
        if (kappa[i] <= M[i-1]) {
          ++kappa[i];

          const unsigned new_max = std::max(M[i], kappa[i]);
          M[i] = new_max;
          for (int j = i + 1; j < n; ++j) {
            kappa[j] = 0;
            M[j] = new_max;
          }
          return true;
        }   
      }
      return false;
    };

    // pas inicial
    vector<int> tmp_v(kappa);
    for(unsigned idx = 0; idx < tmp_v.size(); idx++){ tmp_v[idx] += shiftat; }
    total->push_back(tmp_v);

    // resta de passos
    while(generator()){
      tmp_v = vector<int>(kappa);
      for(unsigned idx = 0; idx < tmp_v.size(); idx++){ tmp_v[idx] += shiftat; }
      total->push_back(tmp_v);
    }
  };

  // TODO TODO passar aixo com a un punter, i per tant estalviem copies de memoria
  // TODO TODO passar aixo com a un punter, i per tant estalviem copies de memoria
  typedef pair<
    map<string,
    vector<tuple<shared_ptr<Action>,shared_ptr<Parameter>,int> > >,
    map<string,
    shared_ptr<vector<vector<int> > > > > 
      MADNESS;

  // combinem els parametres de dos accions que passem com a punters, i
  // agrupant-los per supertipus
  std::function<MADNESS(shared_ptr<Action>,shared_ptr<Action>)> combine_parameters;
  combine_parameters = [&](shared_ptr<Action> acc1,shared_ptr<Action> acc2)->MADNESS{

    // ajumtem els parametres per tipus, per fer les combinacions de iguals i diferents.
    //  tipus -> [ <sail, ?sh>, < , > .... ]
    map<string ,vector< tuple<shared_ptr<Action>,shared_ptr<Parameter>,int> > > grups_parametres; 

    // PRESUPOSEM que com que son accions, tots els parametres
    //  serán punters a objectes de tipus Parameter.
    //  Si un tipus de variable te supertipus, l'hem d'afegir al grup del supertipus
    for(int i = 0; i < acc1->getNParams(); i++){
      auto ptr_param = static_pointer_cast<Parameter>(acc1->getParam(i));
      assert(ptr_param->getObjectType() != "unknown");
      grups_parametres[ptr_param->getObjectType()].push_back(make_tuple(acc1,ptr_param,1));
    }
    for(int i = 0; i < acc2->getNParams(); i++){
      auto ptr_param = static_pointer_cast<Parameter>(acc2->getParam(i));
      assert(ptr_param->getObjectType() != "unknown");
      grups_parametres[ptr_param->getObjectType()].push_back(make_tuple(acc2,ptr_param,2));
    }

    // agafem el grups_parametres i ajuntem els subtipus amb els seus supertipus. Per ex:
    // Si tenim:
    //(1) grup de tipus:location amb 2 elements
    //(1) grup de tipus:port amb 1 elements
    //(1) grup de tipus:ship amb 2 elements
    //
    //port es un subtipus de location i per tant els ajuntem, obtenint:
    //
    //(2) grup de tipus:location amb 3 elements
    //(2) grup de tipus:ship amb 2 elements
    vector<string> operations;
    for(const auto grup : grups_parametres){
      auto group_type = grup.first;
      auto group_supertypes = *(getAllSupertypes(group_type));

      for(const auto type : group_supertypes){
        // TODO Hem d'agafar l'ultim! (o el tipus mes general)
        auto it_g_p = grups_parametres.find(type);
        if(it_g_p != grups_parametres.end()){
          //cout << group_type << " es un subtipus de ";
          //cout << (*it_g_p).first << " i per tant els ajuntem! " << endl;
          operations.push_back(group_type);
          operations.push_back((*it_g_p).first);
        }
      }
    }

    // per a no liarla amb els iteradors, empilem al for d'abans les operacions a efectuar
    // i aqui ajuntem els grups que toquin
    assert(operations.size() % 2 == 0);
    while(operations.size() > 0){
      string supertipus = operations.back(); operations.pop_back();
      string subtipus   = operations.back(); operations.pop_back();
      grups_parametres[supertipus].insert(grups_parametres[supertipus].end(),
          grups_parametres[subtipus].begin(),grups_parametres[subtipus].end());
      grups_parametres.erase(subtipus);
    }

    // per cada tipus ( corresponent a l'estructura grups_parametres,
    // guardem la llista de combinacions amb enters
    map<string, shared_ptr<vector<vector<int> > > > grups_strings;
    int shift = 0;
    for(const auto grup : grups_parametres){
      string tipus                                                           = grup.first;
      vector< tuple<shared_ptr<Action>,shared_ptr<Parameter>,int> > elements = grup.second;
      shared_ptr<vector <vector<int> > > combinacions = std::make_shared<vector<vector<int> > >();

      generate_combinations(combinacions,elements.size(),shift);
      shift += combinacions->size();
      grups_strings[tipus] = combinacions;
    }
    return make_pair(grups_parametres,grups_strings);
  };


  // donades dos accions, retorna el producte dels parametres i el produce de les combinacions.
  //
  // El primer es un vector de tuples, on cada una te una accio, un parametre i un enter. Per cada parametre 
  // d'aquesta tupla, l'accio denota a quina accio pertany i l'enter si es a la primera o a la segona.
  //
  // El segon es una matriu de enters, que diu tots els sets partitions passats a enters corresponents
  // al parell d'accions donats.
  std::function<pair<
    vector< tuple< shared_ptr<Action>, shared_ptr<Parameter>, int > >, vector<vector<int> >
    >(shared_ptr<Action>,shared_ptr<Action>)> curate_combinations;
  curate_combinations = [&](shared_ptr<Action> acc1,shared_ptr<Action> acc2)->pair<
    vector< tuple< shared_ptr<Action>, shared_ptr<Parameter>, int > >, vector<vector<int> > >{
      // per cada parell d'accions generem les combinacions, fem el producte cartesia entre les 
      // combinacions de parametres agrupats per tipus i mirem si una afecta les vars de l'altre.
      vector< tuple< shared_ptr<Action>, shared_ptr<Parameter>, int > > producte_parametres;
      vector<vector<int> > producte_combinacions;

      auto comb = combine_parameters(acc1,acc2);

      // producte cartesia de tots els grups
      map<string, vector<tuple<
        shared_ptr<Action>,
        shared_ptr<Parameter>,
        int > > >::iterator primer_grup = comb.first.begin();

      //TODO CHECK 
      while(primer_grup != comb.first.end() && (*primer_grup).second.size() < 1){
        primer_grup++;
      }

      if(primer_grup == comb.first.end()){
        // tots els grups son de 1 element o menys ... :/
        cout << "ERR? " << __LINE__ << " " << __FILE__ << " " << __func__ << endl;
      } else {
        // tenim el primer grup valid, a partir d'aqui afegim tots els seguents
        //  que tinguin mida > 1
        //
        //  primer_grup : iterador que sempre apunta al primer grup, a partir
        //  del qual operarem i on quedara el resultat final
        //  it_grups : iterador que es mou per tots els grups.
        auto it_grups = primer_grup;

        producte_combinacions.insert(producte_combinacions.end(),
            comb.second.at((*it_grups).first)->begin(),
            comb.second.at((*it_grups).first)->end());

        producte_parametres.insert(
            producte_parametres.end(),
            (*it_grups).second.begin(),
            (*it_grups).second.end());

        it_grups++; // comencem a tractar el seguent grup, ja que hem iniciat les
        // estructures de dades amb les dades del primer grup valid que trobem. 
        // Podem fer ++ amb seguretat pq sabem que no es end()

        while(it_grups != comb.first.end()){
          producte_parametres.insert(
              producte_parametres.end(),
              (*it_grups).second.begin(),
              (*it_grups).second.end());

          // mirem quants elements te el conjunt de combinacions, inicialment.
          // Per cada element, el sumarem amb cada un del grup actual (el que 
          // apunta it_grups) i l'afegirem al contenidor producte_combinacions
          //
          int iterations = producte_combinacions.size();
          while( iterations > 0 ){
            auto back_elem = producte_combinacions.back();
            producte_combinacions.pop_back();
            for(const auto comb_in : *(comb.second.at((*it_grups).first))){
              auto new_vector = back_elem;
              new_vector.insert( new_vector.end(), comb_in.begin(), comb_in.end());
              producte_combinacions.insert(
                  producte_combinacions.begin(),
                  new_vector);
            }
            iterations--;
          }
          it_grups++;
        }
      }
      return make_pair(producte_parametres,producte_combinacions);
    };



  // donat un arbre de Things, extreu en un vector de Functors tots els T_CONSTANT o T_FUNCTIONs, i en 
  // l'altre tots els T_PREDICATEs. Vamos, que extreu totes les variables numeriques i booleanes.
  std::function<void(shared_ptr<Thing>, shared_ptr<vector<shared_ptr<Functor> > >, 
      shared_ptr<vector<shared_ptr<Functor> > >)> extract_all_var;
  extract_all_var = [&](shared_ptr<Thing> tree, shared_ptr<vector<shared_ptr<Functor> > > int_v,
      shared_ptr<vector<shared_ptr<Functor> > > bool_v) {

    shared_ptr<Functor> f_tree;
    if( tree->type == functor_type::T_FUNCTION || tree->type == functor_type::T_OPERATION ||
        tree->type == functor_type::T_CONSTANT || tree->type == functor_type::T_PREDICATE){
      f_tree = static_pointer_cast<Functor>(tree);
      switch(tree->type) {
        case functor_type::T_CONSTANT:
          if(this->objects->count(f_tree->toString(1)) > 0 ){
            // es un objecte, per tant el considerem
            int_v->push_back(static_pointer_cast<Function>(f_tree));
          }
          break;
        case functor_type::T_FUNCTION:
          int_v->push_back(static_pointer_cast<Function>(f_tree));
          break;
          // agafem el primer fill d'aquestes pq tenen la forma: (operacio (sobreque) (enquan))
        case functor_type::T_OPERATION: 
          for(int i = 0; i < f_tree->getNParams(); i++){
            extract_all_var(f_tree->getParam(i),int_v,bool_v);
          }
          break;
        case functor_type::T_PREDICATE:
          bool_v->push_back(static_pointer_cast<Predicate>(f_tree));
          break;
        default:
          cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
          break;
      }
    } 
  };

  // ****** TYPEDEFS ********
  // typedef per a no escriure el mateix i passar mil parametres a les tres funcions
  // que implementen els checks de incompatibilitat entre accions
  typedef pair<
    pair< shared_ptr< vector< shared_ptr<Parameter> > >, shared_ptr< vector< string> > > ,
    pair< shared_ptr< vector< shared_ptr<Parameter> > >, shared_ptr< vector< string> > >
      > t_assignacions;
  // tipus que defineix una substitucio:
  // <que substituim, per a que> , per ex: < x , x + 1 >, que seria un increase(x,1)
  typedef pair<string,string> t_substitution;
  // ****** TYPEDEFS ********

  std::function<void(shared_ptr<vector<shared_ptr<Functor> > >,
      shared_ptr<vector<shared_ptr<Functor> > >, shared_ptr<Solver>)> setBaseProblem;
  setBaseProblem = [&](shared_ptr<vector<shared_ptr<Functor> > > num_vars,
      shared_ptr<vector<shared_ptr<Functor> > > bool_vars, shared_ptr<Solver> temp_solver)->void {
    std::set<string> unique_str;

    for(const auto var : *bool_vars){
      if(unique_str.find(var->toString()) == unique_str.end() ){
        unique_str.insert(var->toString());
        temp_solver->addVar(var->toString(0),"bool");
      } 
    }    

    for(const auto var : *num_vars){
      if(unique_str.find(var->toString()) == unique_str.end() ){
        unique_str.insert(var->toString());
        temp_solver->addVar(var->toString(0),"real");
        // si es estatica no canviara en tot el problema, per tant tot i que no sabem de quina 
        // estarem parlant exactament si que li podem donar els limits superior i inferior a la
        // var. P ex, si estem parlant de distàncies, i van de la mes curta de 30 a la mes 
        // larga de 200, podem ajudar al solver diguent que aquestes mai tindran valors com per 
        // exemple -500, cosa que ens pot estalviar alguna incompatibilitat.
        if(var->getStatic()){
          int lb = INT_MAX;
          int ub = -INT_MAX;
          for(const auto init : *p_inits){
            if(init->type == functor_type::T_OPERATION && init->getName() == "=" && 
                var->getName() == static_pointer_cast<Functor>(init->getParam(0))->getName()){
              int value = stoi(static_pointer_cast<Parameter>(init->getParam(1))->getValue());
              if(value > ub) { ub = value; }
              if(value < lb){ lb = value; }
            }
          }
          temp_solver->addConstraint(">=(" + var->toString(0) + "," + std::to_string(lb) + ")",0);
          temp_solver->addConstraint("<=(" + var->toString(0) + "," + std::to_string(ub) + ")",0);
        } else {
          temp_solver->addVar(var->toString(2),"real");
        }
      }
    }    
    // afegim les constants aquestes xungues (falta el "object"?)
    temp_solver->addVar("undefined","int");
    temp_solver->addConstraint("=(undefined,0)",0);
  };

  // es una funcio que rep un arbre i emplena un vector
  // de substitucions que apareixen en aquell arbre
  std::function<void(shared_ptr<vector<t_substitution> >, shared_ptr<Thing>)> treeToSubstitution;
  treeToSubstitution = [&](shared_ptr<vector<t_substitution> > v_subst,shared_ptr<Thing> tree)->void{
    switch(tree->type) {
      case functor_type::T_OPERATION:    
        {
          shared_ptr<Functor> f = static_pointer_cast<Functor>(tree);
          if(f->getName() == "and"){
            for(int i = 0; i < f->getNParams(); i++){
              treeToSubstitution(v_subst,f->getParam(i));
            }
          } else if(f->getName() == "increase"){
            v_subst->push_back(make_pair(f->getParam(0)->toString(),"+(" + f->getParam(0)->toString() + "," + f->getParam(1)->toString() + ")"));
          } else if(f->getName() == "decrease"){
            v_subst->push_back(make_pair(f->getParam(0)->toString(),"-(" + f->getParam(0)->toString() + "," + f->getParam(1)->toString() + ")"));
          } else if(f->getName() == "assign"){
            v_subst->push_back(make_pair(f->getParam(0)->toString(),f->getParam(1)->toString()));
          } else if(f->getName() == "not"){
            v_subst->push_back(make_pair(f->getParam(0)->toString(),"false"));
            //v_subst->push_back(make_pair(f->getParam(0)->toString(),"not(" + f->getParam(0)->toString() + ")"));
          }
        }
        break;
      case functor_type::T_PREDICATE: 
        { // assignem a cert
          shared_ptr<Functor> f = static_pointer_cast<Functor>(tree);
          //v_subst->push_back(make_pair(f->toString(),f->toString()));
          v_subst->push_back(make_pair(f->toString(),"true"));
        }
        break;
      case functor_type::T_FUNCTION:     
      case functor_type::T_ACTION:     
      case functor_type::T_VARIABLE:     
      case functor_type::T_CONSTANT:     
        break;
      default:
        cout << "ERR? " << tree->toString() << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
        break;
    }
   //cout << tree->toString() << " --> <" << v_subst->back().first << "," << v_subst->back().second << ">" << endl;

  };

  std::function<string(string, shared_ptr<vector<t_substitution> >)> applySubstitutions;
  applySubstitutions = [&](string constraint, shared_ptr< vector< t_substitution > > subs)->string{
    for(const auto sub : *subs){ constraint = search_and_replace(constraint,sub.first,sub.second); }
    return constraint;
  };

  // check 1 - pre_a /\ pre_b /\ not( pre_a subst_a )
  std::function<bool(shared_ptr<Action>,shared_ptr<Action>, t_assignacions)> check1;
  check1 = [&](shared_ptr<Action> acc1,shared_ptr<Action> acc2, t_assignacions assigs)->bool{

    // recuperem les estructures de valors
    auto par_acc1 = assigs.first.first; auto val_acc1 = assigs.first.second;
    auto par_acc2 = assigs.second.first; auto val_acc2 = assigs.second.second;

    // ens copiem les precondicions en forma d'arbre
    shared_ptr<Thing> acc1_p = acc1->getRawPrecondition()->duplicate();
    shared_ptr<Thing> acc2_p = acc2->getRawPrecondition()->duplicate();

    // TODO  es una suposicio
    // com que no tindrem dos assignacions a la mateixa variable, podem
    // ajuntar totes les assignacions sense por
    shared_ptr<Functor> wrapper_a1(new Functor("and")); wrapper_a1->setType(functor_type::T_OPERATION);
    for(int j = 0;j < acc1->getNFDs(); j++){ wrapper_a1->addParam(acc1->getFD(j).second->duplicate()); }

    // i hi posem els valors de la combinacio de enters 
    searchAndReplaceValues(val_acc1,par_acc1,acc1_p);
    searchAndReplaceValues(val_acc1,par_acc1,wrapper_a1);
    searchAndReplaceValues(val_acc2,par_acc2,acc2_p);

    // creem un solver
    shared_ptr<Solver> temp_solver(new SolverStandard(new CoreSolverZ3(0),new SolverActionNOP()));

    // extraiem totes les vars 
    shared_ptr<vector<shared_ptr<Functor> > > num_vars  = std::make_shared<vector<shared_ptr<Functor> > >();
    shared_ptr<vector<shared_ptr<Functor> > > bool_vars = std::make_shared<vector<shared_ptr<Functor> > >();
    extract_all_var(acc1_p,num_vars,bool_vars);
    extract_all_var(acc2_p,num_vars,bool_vars);
    extract_all_var(wrapper_a1,num_vars,bool_vars);

    setBaseProblem(num_vars,bool_vars,temp_solver);

    // creem un vector de substitucions i l'emplenem, traduint els efectes 
    // de l'accio a_1 a "substitucions"
    auto v_subst = make_shared< vector<t_substitution> >();
    treeToSubstitution(v_subst, wrapper_a1);

    // DEBUG
    /*cout << "de " << wrapper_a1->toString() << " nhem tret:" << endl;
      for(const auto subst : *v_subst){
      cout << subst.first << " , " << subst.second << endl;
      } */

    stringstream ss;
    // ara hem de comprovar si es SAT o no
    ss << "and(" << acc1_p->toString() << "," << acc2_p->toString() << ",not(" << applySubstitutions(acc2_p->toString(),v_subst) << "))";

    temp_solver->addConstraint(ss.str(),0);
    if( temp_solver->check() == 1){
#ifdef DEBUG_VERSION
        
      cout << ss.str() << endl;
      cout << "check1: " << acc1->getName() << "("; 
      for(int i = 0; i < par_acc1->size(); i++){
        cout << (*par_acc1)[i]->toString() << " = " << (*val_acc1)[i] << ", ";
      } 
      cout << ") i " << acc2->getName() << "(";
      for(int i = 0; i < par_acc2->size(); i++){
        cout << (*par_acc2)[i]->toString() << " = " << (*val_acc2)[i] << ", ";
      }
      cout << ") SAT!" << endl;
      
#endif
      return true;
    } else { //cout << "UNSAT!" << endl;
      return false;
    }  
  };

  // check 2 - a i b no son simply commuting
  std::function<bool(shared_ptr<Action>,shared_ptr<Action>,t_assignacions)> check2;
  check2 = [&](shared_ptr<Action> acc1,shared_ptr<Action> acc2, t_assignacions assigs)->bool{

    // recuperem les estructures de valors
    auto par_acc1 = assigs.first.first; auto val_acc1 = assigs.first.second;
    auto par_acc2 = assigs.second.first; auto val_acc2 = assigs.second.second;

    // com que no tindrem dos assignacions a la mateixa variable, podem
    // ajuntar totes les assignacions sense por
    shared_ptr<Functor> wrapper_a1(new Functor("and")); wrapper_a1->setType(functor_type::T_OPERATION);
    for(int j = 0;j < acc1->getNFDs(); j++){ wrapper_a1->addParam(acc1->getFD(j).second->duplicate()); }
    shared_ptr<Functor> wrapper_a2(new Functor("and")); wrapper_a2->setType(functor_type::T_OPERATION);
    for(int j = 0;j < acc2->getNFDs(); j++){ wrapper_a2->addParam(acc2->getFD(j).second->duplicate()); }

    // i hi posem els valors de la combinacio de enters 
    searchAndReplaceValues(val_acc1,par_acc1,wrapper_a1);
    searchAndReplaceValues(val_acc2,par_acc2,wrapper_a2);

    // extraiem totes les vars 
    shared_ptr<vector<shared_ptr<Functor> > > num_vars  = std::make_shared<vector<shared_ptr<Functor> > >();
    shared_ptr<vector<shared_ptr<Functor> > > bool_vars = std::make_shared<vector<shared_ptr<Functor> > >();
    extract_all_var(wrapper_a1,num_vars,bool_vars);
    extract_all_var(wrapper_a2,num_vars,bool_vars);

    // creem un vector de substitucions i l'emplenem, traduint els efectes de les accions
    auto v_subst1 = make_shared< vector<t_substitution> >();
    auto v_subst2 = make_shared< vector<t_substitution> >();
    treeToSubstitution(v_subst1, wrapper_a1);
    treeToSubstitution(v_subst2, wrapper_a2);

    // --------------------------
    //  AQUI PER IMPLEMENTAR ELS EFECTES CONDICIONALS,
    //  CAL SEPARAR ELS EFECTES A CADA VARIABLE EN DOS CONJUNTS, EL DE L'ACCIO 1 I EL DE L'ACCIO 2
    //  I COMPROVARLOS ENTRE ELLS
    //  Per exemple: 
    //      a1: p -> x + 1, q -> x +2 , a2: true -> x + 3 
    //
    //  Caldrà comprovar x + 1 amb x + 3, i x + 2 amb x + 3
    // ------------------------------------
    // basicament vol dir separar idx_substitucions en 2, un per la acc1 i l'altre per l'acc2, i comprovar per cada x
    // de idx_1 totes les x de idx_2
    // ------------------------------------
    // les agrupem per variable a substituir. 
    std::map<string,vector< pair<t_substitution,int> > > idx_substitutions;
    for(const auto subst : *v_subst1){
        idx_substitutions[subst.first].push_back(make_pair(subst,1));
        //cout << "idx_substitutions[" << subst.first << "].push_back(make_pair(<" << subst.first << "," << subst.second << ",1))" << endl;
    }
    for(const auto subst : *v_subst2){ 
        idx_substitutions[subst.first].push_back(make_pair(subst,2)); 
        //cout << "idx_substitutions[" << subst.first << "].push_back(make_pair(<" << subst.first << "," << subst.second << ",2))" << endl;
    }

    // fem els checks
    for(const auto parella : idx_substitutions){
        if(parella.second.size() > 1){
            //cout << "cal check de simply commuting, var: " << parella.first << " size: " << parella.second.size() << endl;
            // per comprovar si son simply commuting neguem exp2@o_1 == exp1@o_2 i preguntem si es SAT, aixi
            // sabrem si hi ha algun model que ho invalidi, i per tant deixi de ser una tautologia
            //Creem un vector per poderles passar a la 
            // funcio i comprovem si es SAT
            //
            for(int i = 0; i < parella.second.size(); i++){
                for( int j = i; j < parella.second.size(); j++){
                    // si no es el mateix efecte (xD) i provenen de diferents accions ...
                    if(i != j && parella.second[i].second != parella.second[j].second )
                    {
                        auto v_subst1 = make_shared< vector<t_substitution> >();
                        auto v_subst2 = make_shared< vector<t_substitution> >();
                        v_subst1->push_back(parella.second[0].first);
                        v_subst2->push_back(parella.second[1].first);

                        string exp_1 = (parella.second)[0].first.second;
                        string exp_2 = (parella.second)[1].first.second;

                        stringstream ss;
                        // ara hem de comprovar si es SAT o no

                        // creem un solver
                        shared_ptr<Solver> temp_solver(new SolverStandard(new CoreSolverZ3(0),new SolverActionNOP()));
                        setBaseProblem(num_vars,bool_vars,temp_solver);
                        ss << "not(=(" << applySubstitutions(exp_2,v_subst1) << "," << applySubstitutions(exp_1,v_subst2) << "))";
                        //cout << "check:" << ss.str() << " es SAT?" << endl;
                        temp_solver->addConstraint(ss.str(),0);
                        if( temp_solver->check() == 1){
                            cout << "SAT, no son simply commuting!" << endl;
#ifdef DEBUG_VERSION

                            cout << ss.str() << endl;
                            cout << "check2: " << acc1->getName() << "("; 
                            for(int i = 0; i < par_acc1->size(); i++){
                                cout << (*par_acc1)[i]->toString() << " = " << (*val_acc1)[i] << ", ";
                            } 
                            cout << ") i " << acc2->getName() << "(";
                            for(int i = 0; i < par_acc2->size(); i++){
                                cout << (*par_acc2)[i]->toString() << " = " << (*val_acc2)[i] << ", ";
                            }
                            cout << ") SAT!" << endl;

#endif
                            return true;
                        } else {
                            //cout << "UNSAT, son simply commuting!" << endl;
                        }
                    }
                }
            }
        }

    }
    return false;
  };

  // check 3 - pre_a /\ pre_b /\ not( x subst(h(a,b) == x subst_a subst_b ) , per tot x
  std::function<bool(shared_ptr<Action>,shared_ptr<Action>, t_assignacions)> check3;
  check3 = [&](shared_ptr<Action> acc1,shared_ptr<Action> acc2, t_assignacions assigs)->bool{

    // recuperem les estructures de valors
    auto par_acc1 = assigs.first.first; auto val_acc1 = assigs.first.second;
    auto par_acc2 = assigs.second.first; auto val_acc2 = assigs.second.second;

    // ens copiem les precondicions en forma d'arbre
    shared_ptr<Thing> acc1_p = acc1->getRawPrecondition()->duplicate();
    shared_ptr<Thing> acc2_p = acc2->getRawPrecondition()->duplicate();

    // TODO  es una suposicio
    // com que no tindrem dos assignacions a la mateixa variable, podem
    // ajuntar totes les assignacions sense por
    shared_ptr<Functor> wrapper_a1(new Functor("and")); wrapper_a1->setType(functor_type::T_OPERATION);
    for(int j = 0;j < acc1->getNFDs(); j++){ wrapper_a1->addParam(acc1->getFD(j).second->duplicate()); }
    shared_ptr<Functor> wrapper_a2(new Functor("and")); wrapper_a2->setType(functor_type::T_OPERATION);
    for(int j = 0;j < acc2->getNFDs(); j++){ wrapper_a2->addParam(acc2->getFD(j).second->duplicate()); }

    // i hi posem els valors de la combinacio de enters 
    searchAndReplaceValues(val_acc1,par_acc1,acc1_p);
    searchAndReplaceValues(val_acc2,par_acc2,acc2_p);
    searchAndReplaceValues(val_acc1,par_acc1,wrapper_a1);
    searchAndReplaceValues(val_acc2,par_acc2,wrapper_a2);

    // extraiem totes les vars 
    shared_ptr<vector<shared_ptr<Functor> > > num_vars  = std::make_shared<vector<shared_ptr<Functor> > >();
    shared_ptr<vector<shared_ptr<Functor> > > bool_vars = std::make_shared<vector<shared_ptr<Functor> > >();
    extract_all_var(acc1_p,num_vars,bool_vars);
    extract_all_var(acc2_p,num_vars,bool_vars);
    extract_all_var(wrapper_a1,num_vars,bool_vars);
    extract_all_var(wrapper_a2,num_vars,bool_vars);

    // creem un vector de substitucions i l'emplenem, traduint els efectes de les accions
    auto v_subst1 = make_shared< vector<t_substitution> >();
    auto v_subst2 = make_shared< vector<t_substitution> >();
    treeToSubstitution(v_subst1, wrapper_a1);
    treeToSubstitution(v_subst2, wrapper_a2);

    // les agrupem per variable a substituir. 
    std::map<string,vector< pair<t_substitution,int> > > idx_substitutions;
    for(const auto subst : *v_subst1){ idx_substitutions[subst.first].push_back(make_pair(subst,1)); }
    for(const auto subst : *v_subst2){ idx_substitutions[subst.first].push_back(make_pair(subst,2)); }

    // ara calcularem els happenings
    std::map<string,t_substitution> happening;

    // per cada variable modificada als efectes de les accions
    for(const auto parella : idx_substitutions){
      // si de les dos accions nomes hi ha una modificacio a la variable, el happening per aquella
      // variable sera simplement aquella modificacio
      if(parella.second.size() == 1){
        happening[parella.first] = parella.second[0].first;
      } else { // == 2
        // si hi ha mes d'un efecte, vol dir que en tindrem dos, ja que nomes hi pot haver una assignacio 
        // a una variable als efectes de cada accio.
        auto v_subst = make_shared< vector<t_substitution> >();
        // agafem la substitucio que fa el segon efecte
        v_subst->push_back(parella.second[1].first); 
        // i l'apliquem sobre la substitucio del primer efecte, aixi els combinem
        string exp_1 = parella.second[0].first.second;
        string eff_happening = applySubstitutions(exp_1,v_subst);

        happening[parella.first] = make_pair(parella.first,eff_happening);
      }
    }

    //DEBUG 
    /* cout << "happenings: " << endl;
       for(const auto foo : happening){ cout << "< " << foo.first << "," << foo.second.second << " >" << endl; }*/

    // ara hem de comprovar si es SAT o no
    for(const auto parella : happening){
      // creem un solver
      stringstream ss;
      shared_ptr<Solver> temp_solver(new SolverStandard(new CoreSolverZ3(0),new SolverActionNOP()));
      setBaseProblem(num_vars,bool_vars,temp_solver);

      //ss << "and(" << acc1_p->toString() << "," << acc2_p->toString();
      // fem un vector amb 1 element, que es el happening combinat
      auto v_happening = make_shared< vector<t_substitution> >(); v_happening->push_back(parella.second);
      //ss << ",not(=(" << applySubstitutions(parella.first,v_happening) << ",";
      //ss << applySubstitutions(applySubstitutions(parella.first,v_subst2),v_subst1)<< ")))";
      ss << "not(=(" << applySubstitutions(parella.first,v_happening) << ",";
      ss << applySubstitutions(applySubstitutions(parella.first,v_subst2),v_subst1)<< "))";

      //cout << "check 3: " << ss.str() << endl;
      temp_solver->addConstraint(ss.str(),0);
      if( temp_solver->check() == 1){
        //cout << "SAT!, s'afecten al 3!" << endl;
#ifdef DEBUG_VERSION
        cout << ss.str() << endl;
        cout << "check3: " << acc1->getName() << "("; 
        for(int i = 0; i < par_acc1->size(); i++){
          cout << (*par_acc1)[i]->toString() << " = " << (*val_acc1)[i] << ", ";
        } 
        cout << ") i " << acc2->getName() << "(";
        for(int i = 0; i < par_acc2->size(); i++){
          cout << (*par_acc2)[i]->toString() << " = " << (*val_acc2)[i] << ", ";
        }
        cout << ") SAT!" << endl;
#endif
        return true;
      } else {
        //cout << "UNSAT! no s'afecten al 3!" << endl;
      } 
    }
    return false;
  };

  // ----------------------------------------------------
  // start check foo
  // ----------------------------------------------------
  map<string, shared_ptr<vector<shared_ptr<Functor> > > > encoded_cache; 
  for(const auto acc1 : raw_actions){
    for(const auto acc2 : raw_actions){

      cout << "checking " << acc1->toString() << " i " << acc2->toString() << endl;
      auto foobar = curate_combinations(acc1,acc2);
      auto prod_parametres   = foobar.first;
      auto prod_combinacions = foobar.second;

      // DEBUG
      /*
      cout << "suma de " << acc1->toString() << " i " << acc2->toString() << " :" << endl;
      for(const auto param : prod_parametres){ 
        cout << get<1>(param)->toString() << " - " << get<1>(param)->getObjectType() << ", "; }
      cout << endl;
      for(const auto param : prod_combinacions){
        for(const auto num: param){ cout << num << ", "; }
        cout << endl; 
      } cout << endl;
      cout << "check:" << acc1->toString() << " i " << acc2->toString() << " amb ";
      cout << prod_combinacions.size() << " combinacions" << endl;
       */

      unsigned int i = 0;
      while(i < prod_combinacions.size()){
        auto set_values = prod_combinacions.at(i);
        assert(set_values.size() == prod_parametres.size());

        // ------ 
        // generem el parell de vectors amb parametres i valors. Ens serviran a
        // l'hora d'anar fent checks, pq el que haurem de fer es anar duplicant trossos
        // d'arbre de les accions i substituint els valors de les combinacions als arbres
        // duplicats.
        // ------ 
        shared_ptr< vector< shared_ptr<Parameter> > > par_acc1;
        shared_ptr< vector< string> >                 val_acc1;
        shared_ptr< vector< shared_ptr<Parameter> > > par_acc2;
        shared_ptr< vector< string> >                 val_acc2;

        par_acc1 = std::make_shared<vector< shared_ptr<Parameter> > >();
        par_acc2 = std::make_shared<vector< shared_ptr<Parameter> > >();
        val_acc1 = std::make_shared<vector<string> >();
        val_acc2 = std::make_shared<vector<string> >();

        // adaptem les dades a la funcio que ja tenim
        int position = 0;
        for(const auto param : prod_parametres){
          if(std::get<2>(param) == 1){
            par_acc1->push_back(std::get<1>(param));
            val_acc1->push_back(std::to_string(set_values.at(position)));
          } else {
            par_acc2->push_back(std::get<1>(param));
            val_acc2->push_back(std::to_string(set_values.at(position)));
          }
          position++;
        } 

        t_assignacions assignacions = make_pair(
            make_pair(par_acc1,val_acc1),
            make_pair(par_acc2,val_acc2));

        // check 1 - pre_a /\ pre_b /\ not( pre_a subst_a )
        // check 2 - a i b no son simply commuting
        // check 3 - pre_a /\ pre_b /\ not( x subst(h(a,b) == x subst_a subst_b ) , per tot x
        bool incompat = false;

        // only check1 serveix per a en cas de que amb el relaxed-relaxed vulguis
        // un ordre una miqueta mes inteligent
        if(only_check1){
            incompat = check1(acc1,acc2,assignacions);
        } else {
            incompat = check1(acc1,acc2,assignacions) ||
                check2(acc1,acc2,assignacions) ||
                check3(acc1,acc2,assignacions);
        }
        //cout << "check:" << acc1->toString() << " i " << acc2->toString();
        //cout << " = " << incompat << endl;

        shared_ptr<Functor> var_modificada = NULL;
                          
                          
        if(incompat) {
          Timer gen_tim;
          gen_tim.start();

          shared_ptr<vector<shared_ptr<Functor> > > data1; 
          shared_ptr<vector<shared_ptr<Functor> > > data2;
          auto it_cache = encoded_cache.find(acc1->toString());
          if(it_cache != encoded_cache.end()){
            data1 = (*it_cache).second;
          } else {
            data1 = encodeFunctor(acc1);
            encoded_cache[acc1->toString()] = data1;
          }

          it_cache = encoded_cache.find(acc2->toString());
          if(it_cache != encoded_cache.end()){
            data2 = (*it_cache).second;
          } else {
            data2 = encodeFunctor(acc2);
            encoded_cache[acc2->toString()] = data2;
          }

          map< string,        // tipus d'objecte (ship, cargo, port, etc ... )
            vector< tuple< 
              shared_ptr<Action>,    // accio a la qual pertany el parametre
            shared_ptr<Parameter>, // parametre en si
            int > >                // crec que es 1 o 2 depenguent de si es la primera o segona accio
              > parametres_agrupats;
          for(unsigned int idx = 0; idx < set_values.size(); idx++){
            auto tmp_pointer = static_pointer_cast<Parameter>(get<1>(prod_parametres.at(idx))->duplicate());
            tmp_pointer->setValue(std::to_string(set_values.at(idx)));

            auto new_tuple = std::make_tuple(
                get<0>(prod_parametres.at(idx)),
                tmp_pointer,
                get<2>(prod_parametres.at(idx)));
            parametres_agrupats[tmp_pointer->getObjectType()].push_back(new_tuple);
          } // agrupem per tipus 

          // per totes les combinacions de possibles valors dels parametres de les dos accions
          // hem de comprovar si compleixen la regla d'incompatibilitat, i en cas afirmatiu 
          // afegir-ho al problema com a una incompatibilitat.
          for(const auto p_aplanat_acc1 : *data1){ 
            for(const auto p_aplanat_acc2 : *data2){
              shared_ptr<Action> aplanat_acc1 = static_pointer_cast<Action>(p_aplanat_acc1);
              shared_ptr<Action> aplanat_acc2 = static_pointer_cast<Action>(p_aplanat_acc2);

              // per comprovar si l'instanciacio de les accions correspon o no al 
              // patro abstracte que hem descobert que s'afecta.
              //
              // AC es un map de valors abstractes (combinacio que ha resultat SAT) 
              // a valors concrets ( els de l'instanciacio especifica que estem comprovant)
              // i CA al reves. 
              // Descobrim que no concorden els patrons quan a l'hora d'assignar un valor 
              // concret de uns dels dos maps ja esta definit i te un valor diferent al que anavem
              // a assignar.
              map<string,string> AC;
              map<string,string> CA;

              bool MEEEC = false;

              for(const auto param : parametres_agrupats){
                if(MEEEC){ break; }
                for(const auto prm : param.second){
                  if(MEEEC){ break; }

                  string nom_param = get<1>(prm)->getName();
                  int num_acc   = get<2>(prm);

                  string valor_abstracte = get<1>(prm)->getValue();
                  string valor_concret;

                  if(num_acc == 1){ // si pertany a la primera accio
                    valor_concret   = aplanat_acc1->getParamByName(nom_param)->getValue();
                  } else { // si pertany a la segona accio
                    valor_concret   = aplanat_acc2->getParamByName(nom_param)->getValue();
                  }

                  if(CA.count(valor_concret) > 0 && CA.at(valor_concret) != valor_abstracte) {
                    MEEEC = true;
                  } else { CA[valor_concret] = valor_abstracte; }

                  if(AC.count(valor_abstracte) > 0 && AC.at(valor_abstracte) != valor_concret) {
                    MEEEC = true;
                  } else { AC[valor_abstracte] = valor_concret; }
                }
              }                               

              if(!MEEEC){
                // tenim que comprovar que no siguin la mateixa accio amb elsmateixos parametres, sino el problema seria UNSAT
                if(aplanat_acc1->toString(1) != aplanat_acc2->toString(1)){
                  //cout << aplanat_acc1->toString() << " i " << aplanat_acc2->toString() << " compleixen per " << var_modificada->toString(1) << endl;

                  // ara instanciem amb els valors de veritat la variable modificada de l'accio 1
                  // si no venim del check 0!
                  if(var_modificada != NULL){
                    for(int num_param = 0; num_param < var_modificada->getNParams(); num_param++){
                      auto parm = static_pointer_cast<Parameter>(var_modificada->getParam(num_param));
                      bool trobat = false;
                      int idx_aplanat = 0;
                      while(!trobat && idx_aplanat < aplanat_acc1->getNParams()){
                        auto parm_aplanat = static_pointer_cast<Parameter>(aplanat_acc1->getParam(idx_aplanat));
                        if(parm_aplanat->getName() == parm->getName()){
                          trobat = true;
                          //cout << " a " << var_modificada->toString(1) << " li asignem al parametre " << parm->getName() << " el valor " << parm_aplanat->getValue() << endl;
                          parm->setValue(parm_aplanat->getValue());
                        }
                        idx_aplanat++;
                      }
                    }

                    // les incompat d'en rintanen (l'encoding lineal) nomes te sentit si tenim una variable que sigui 
                    // modificada per les dos accions, si no no fa falta ... hauriem de posar la mutex i fora
                    inc_rintanen[var_modificada->toString(1)].insert(
                        std::make_pair(aplanat_acc1->toString(1),aplanat_acc2->toString(1)));

                    graph_inc[aplanat_acc1->toString(1)].insert(std::make_pair(
                          "integer",aplanat_acc2->toString(1)));

                    graph_id_lookup[aplanat_acc1->toString(1)] = aplanat_acc1;
                    graph_id_lookup[aplanat_acc2->toString(1)] = aplanat_acc2;

                  } else {
                    // Si venim del check 0 afegim la constraint i cap aresta, burru, que si no fem el tall de dos
                    // al final ens dona ordres diferents.
                    //act_per_step.push_back("or(not(" + aplanat_acc1->toString(1) + "),not(" + aplanat_acc2->toString(1) + "))");

                    // por la patilla aquests tres
                    graph_inc[aplanat_acc1->toString(1)].insert(std::make_pair(
                          "integer",aplanat_acc2->toString(1)));
                    //cout << aplanat_acc1->toString(1) << " -> " << aplanat_acc2->toString(1)<<endl;

                    graph_id_lookup[aplanat_acc1->toString(1)] = aplanat_acc1;
                    graph_id_lookup[aplanat_acc2->toString(1)] = aplanat_acc2;

                    //graph_inc[aplanat_acc1->toString(1)].insert(std::make_pair("integer",aplanat_acc2->toString(1)));
                    //graph_inc[aplanat_acc2->toString(1)].insert(std::make_pair("integer",aplanat_acc1->toString(1)));
                  }
                  //cout << "key: " << var_modificada->toString(1) << " --- " << aplanat_acc1->toString(1) << " -> " << aplanat_acc2->toString(1)<<endl;
                }
              } else {
                //cout << aplanat_acc1->toString() << " i " << aplanat_acc2->toString() << " NO compleixen" << endl;
              }
            }
          }
        }

        i++;
      }
    }
  }

}

void firstEncodingVisitor::newIncompatibilities(bool permissiveThird){

    // ja tenim els integer_preconditions, que indexen quines variables enteres 
    // es consulten a cada precondicio de cada accio, per tant ara toca mirar
    // i fer matching amb els efectes 
    std::function<void(shared_ptr<Thing>,shared_ptr<Action>,int)> int_recur;
    int_recur = [&](shared_ptr<Thing> tree, shared_ptr<Action> act,int fd_id) {
        shared_ptr<Functor> f_tree;
        if( tree->type == functor_type::T_OPERATION ||
                tree->type == functor_type::T_FUNCTION){
            f_tree = static_pointer_cast<Functor>(tree);
            switch(tree->type) {
                case functor_type::T_OPERATION:
                    for(int i = 0; i < f_tree->getNParams(); i++){
                        int_recur(f_tree->getParam(i),act,fd_id);
                    }
                    break;
                case functor_type::T_FUNCTION:
                    // si es estatica no es modifica, per tant no la considerem
                    if(!static_pointer_cast<Function>(tree)->getStatic()){
                        integer_fd_effects[f_tree->toString()].insert(std::make_pair(fd_id,act));
                    }
                    break;
                default:
                    cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
                    break;
            }
        } else {
            // herpderp, es una constant, placeholder o whatever
        }
    };


    // el shiftat es necessari perque sino es podia liar al calcular les
    // incompatibilitats noves (via SMT), ja que predicats que acceptessin un 
    // supertipus de dos parametres diferents ho podriem arribar a codificar com a si
    // parlessin del mateix:
    //  (at ?x - locatable) - city 
    //  :parameters (?p - person ?a - aircraft ?c - city)
    //  :parameters (?a - aircraft ?c1 ?c2 - city)
    //  22                  (= (at ?p) ?c)                | 22             =(at__1__@,1),
    //  23                  (= (at ?a) ?c)                | 23             =(at__1__@,1),
    //
    std::function<void(shared_ptr<vector <vector<int> > >,int,int)> generate_combinations;
    generate_combinations = [&generate_combinations](
            shared_ptr<vector <vector<int> > > total, int n, int shiftat)->void {

        assert(n > 0);

        vector<int> kappa(n);
        vector<int> M(n);

        // based on Michael Orlov: Efficient Generation of Set Partitions.
        // "https://www.cs.bgu.ac.il/~orlovm/papers/"
        std::function<bool()> generator;
        generator =  [&]()->bool{

            for (int i = n-1; i > 0; --i){
                if (kappa[i] <= M[i-1]) {
                    ++kappa[i];

                    const unsigned new_max = std::max(M[i], kappa[i]);
                    M[i] = new_max;
                    for (int j = i + 1; j < n; ++j) {
                        kappa[j] = 0;
                        M[j] = new_max;
                    }
                    return true;
                }   
            }
            return false;
        };

        // pas inicial
        vector<int> tmp_v(kappa);
        for(unsigned idx = 0; idx < tmp_v.size(); idx++){ tmp_v[idx] += shiftat; }
        total->push_back(tmp_v);

        // resta de passos
        while(generator()){
            tmp_v = vector<int>(kappa);
            for(unsigned idx = 0; idx < tmp_v.size(); idx++){ tmp_v[idx] += shiftat; }
            total->push_back(tmp_v);
        }

    };

    // aquestes dos funcions son per recuperar les funcions de les precondicions 
    // i efectes un cop s'han substituit per les combinacions de parametres,
    // per fer despres la comparacio de *si a modifica alguna var de p*
    std::function<void(shared_ptr<Thing>, shared_ptr<vector<shared_ptr<Functor> > >)> extract_assigns;
    extract_assigns= [&extract_assigns](shared_ptr<Thing> tree, shared_ptr<vector<shared_ptr<Functor> > > int_v) { 
        shared_ptr<Functor> f_tree;
        if( tree->type == functor_type::T_OPERATION){
            f_tree = static_pointer_cast<Functor>(tree);
            switch(tree->type) {
                case functor_type::T_OPERATION: 
                    if(f_tree->getName() == "assign"){
                        int_v->push_back(static_pointer_cast<Function>(f_tree->getParam(0)));
                    } else{
                        for(int i = 0; i < f_tree->getNParams(); i++){
                            extract_assigns(f_tree->getParam(i),int_v);
                        }
                    }
                    break;
                default:
                    cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
                    break;
            }
        }
    };


    // aquestes dos funcions son per recuperar les funcions de les precondicions
    // i efectes un cop s'han substituit per les combinacions de parametres,
    // per fer despres la comparacio de *si a modifica alguna var de p*
    std::function<void(shared_ptr<Thing>, shared_ptr<vector<shared_ptr<Functor> > >)> extract_modified_ints;
    extract_modified_ints = [&extract_modified_ints](shared_ptr<Thing> tree, shared_ptr<vector<shared_ptr<Functor> > > int_v) { 
        shared_ptr<Functor> f_tree;
        if( tree->type == functor_type::T_OPERATION){
            f_tree = static_pointer_cast<Functor>(tree);
            switch(tree->type) {
                case functor_type::T_OPERATION: // agafem el primer fill d'aquestes pq tenen la forma: (operacio (sobreque) (enquan))
                    if(f_tree->getName() == "increase" ||
                            f_tree->getName() == "decrease" ||
                            f_tree->getName() == "assign"){
                        int_v->push_back(static_pointer_cast<Function>(f_tree->getParam(0))); // ens interessa com a accio en el futur!
                    } else{
                        for(int i = 0; i < f_tree->getNParams(); i++){
                            extract_modified_ints(f_tree->getParam(i),int_v);
                        }
                    }
                    break;
                default:
                    cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
                    break;
            }
        }
    };

    std::function<void(shared_ptr<Thing>, shared_ptr<vector<shared_ptr<Functor> > >)> extract_all_ints;
    extract_all_ints = [&](shared_ptr<Thing> tree, shared_ptr<vector<shared_ptr<Functor> > > int_v) {
        shared_ptr<Functor> f_tree;

        if( tree->type == functor_type::T_FUNCTION || 
                tree->type == functor_type::T_OPERATION ||
                tree->type == functor_type::T_CONSTANT){
            f_tree = static_pointer_cast<Functor>(tree);
            switch(tree->type) {
                case functor_type::T_CONSTANT:
                    if(this->objects->count(f_tree->toString(1)) > 0 ){
                        // es un objecte, per tant el considerem
                        int_v->push_back(static_pointer_cast<Function>(f_tree));
                    }
                    break;
                case functor_type::T_FUNCTION:
                    int_v->push_back(static_pointer_cast<Function>(f_tree));
                    break;
                case functor_type::T_OPERATION: // agafem el primer fill d'aquestes pq tenen la forma: (operacio (sobreque) (enquan))
                    for(int i = 0; i < f_tree->getNParams(); i++){
                        extract_all_ints(f_tree->getParam(i),int_v);
                    }
                    break;
                default:
                    cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
                    break;
            }
        }
    };

    std::function<void(shared_ptr<Thing>, shared_ptr<vector<shared_ptr<Functor> > >)> extract_all_bools;
    extract_all_bools= [&extract_all_bools](shared_ptr<Thing> tree, shared_ptr<vector<shared_ptr<Functor> > > bool_v) {
        shared_ptr<Functor> f_tree;
        if( tree->type == functor_type::T_PREDICATE || 
                tree->type == functor_type::T_OPERATION){
            f_tree = static_pointer_cast<Functor>(tree);
            switch(tree->type) {
                case functor_type::T_PREDICATE:
                    bool_v->push_back(static_pointer_cast<Predicate>(f_tree));
                    break;
                case functor_type::T_OPERATION: // agafem el primer fill d'aquestes pq tenen la forma: (operacio (sobreque) (enquan))
                    for(int i = 0; i < f_tree->getNParams(); i++){
                        extract_all_bools(f_tree->getParam(i),bool_v);
                    }
                    break;
                default:
                    cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
                    break;
            }
        }
    };

    // aquesta funcio encapsula l'extraccio de vars modificades en efectes, per
    // tant nomes hauria de rebre arbres de Things osigui, el parametre "tree"
    // que fes referencia a un efecte "a" d'una accio.
    std::function<void(shared_ptr<Thing>, shared_ptr<vector<shared_ptr<Functor> > >)> extract_modified_vars;
    extract_modified_vars = [&extract_modified_ints,&extract_all_bools](shared_ptr<Thing> tree, shared_ptr<vector<shared_ptr<Functor> > > vec_vars) { 
        extract_modified_ints(tree,vec_vars);
        extract_all_bools(tree,vec_vars);
    };

    // TODO TODO passar aixo com a un punter, i per tant estalviem copies de memoria
    // TODO TODO passar aixo com a un punter, i per tant estalviem copies de memoria
    typedef pair<
        map<string,
        vector<tuple<shared_ptr<Action>,shared_ptr<Parameter>,int> > >,
        map<string,
        shared_ptr<vector<vector<int> > > > > 
            MADNESS;

    // combinem els parametres de dos accions que passem com a punters, i
    // agrupant-los per supertipus
    std::function<MADNESS(shared_ptr<Action>,shared_ptr<Action>)> combine_parameters;
    combine_parameters = [&](shared_ptr<Action> acc1,shared_ptr<Action> acc2)->MADNESS{

        // ajumtem els parametres per tipus, per fer les combinacions de iguals i diferents.
        //  tipus -> [ <sail, ?sh>, < , > .... ]
        map<string ,vector< tuple<shared_ptr<Action>,shared_ptr<Parameter>,int> > > grups_parametres; 

        // PRESUPOSEM que com que son accions, tots els parametres
        //  serán punters a objectes de tipus Parameter.
        //  Si un tipus de variable te supertipus, l'hem d'afegir al grup del supertipus
        for(int i = 0; i < acc1->getNParams(); i++){
            auto ptr_param = static_pointer_cast<Parameter>(acc1->getParam(i));
            assert(ptr_param->getObjectType() != "unknown");
            grups_parametres[ptr_param->getObjectType()].push_back(make_tuple(acc1,ptr_param,1));
        }
        for(int i = 0; i < acc2->getNParams(); i++){
            auto ptr_param = static_pointer_cast<Parameter>(acc2->getParam(i));
            assert(ptr_param->getObjectType() != "unknown");
            grups_parametres[ptr_param->getObjectType()].push_back(make_tuple(acc2,ptr_param,2));
        }

        // agafem el grups_parametres i ajuntem els subtipus amb els seus supertipus. Per ex:
        // Si tenim:
        //(1) grup de tipus:location amb 2 elements
        //(1) grup de tipus:port amb 1 elements
        //(1) grup de tipus:ship amb 2 elements
        //
        //port es un subtipus de location i per tant els ajuntem, obtenint:
        //
        //(2) grup de tipus:location amb 3 elements
        //(2) grup de tipus:ship amb 2 elements
        vector<string> operations;
        for(const auto grup : grups_parametres){
            auto group_type = grup.first;
            auto group_supertypes = *(getAllSupertypes(group_type));

            for(const auto type : group_supertypes){
                // TODO Hem d'agafar l'ultim! (o el tipus mes general)
                auto it_g_p = grups_parametres.find(type);
                if(it_g_p != grups_parametres.end()){
                    //cout << group_type << " es un subtipus de ";
                    //cout << (*it_g_p).first << " i per tant els ajuntem! " << endl;
                    operations.push_back(group_type);
                    operations.push_back((*it_g_p).first);
                }
            }
        }

        // per a no liarla amb els iteradors, empilem al for d'abans les operacions a efectuar
        // i aqui ajuntem els grups que toquin
        assert(operations.size() % 2 == 0);
        while(operations.size() > 0){
            string supertipus = operations.back(); operations.pop_back();
            string subtipus   = operations.back(); operations.pop_back();
            grups_parametres[supertipus].insert(grups_parametres[supertipus].end(),
                    grups_parametres[subtipus].begin(),grups_parametres[subtipus].end());
            grups_parametres.erase(subtipus);
        }

        // per cada tipus ( corresponent a l'estructura grups_parametres,
        // guardem la llista de combinacions amb enters
        map<string, shared_ptr<vector<vector<int> > > > grups_strings;
        int shift = 0;
        for(const auto grup : grups_parametres){
            string tipus                                                           = grup.first;
            vector< tuple<shared_ptr<Action>,shared_ptr<Parameter>,int> > elements = grup.second;
            shared_ptr<vector <vector<int> > > combinacions = std::make_shared<vector<vector<int> > >();

            generate_combinations(combinacions,elements.size(),shift);
            shift += combinacions->size();
            grups_strings[tipus] = combinacions;
        }
        return make_pair(grups_parametres,grups_strings);
    };

    // emplenem l'index de integer_fd_effects, que diu als efectes, quines variables
    // enteres apareixen a quines accions.
    for(const auto raw_action : raw_actions){
        for(int i = 0; i < raw_action->getNFDs();i++){
            int_recur(raw_action->getFD(i).second,raw_action,i);
        }
    }

    // per cada parell d'accions generem les combinacions, fem el producte cartesia entre les 
    // combinacions de parametres agrupats per tipus i mirem si una afecta les vars enteres 
    // generades de l'altre.
      
    // cache de desplegats.
    map<string, shared_ptr<vector<shared_ptr<Functor> > > > encoded_cache; 

    unsigned int millis_check       = 0;
    unsigned int millis_total_check = 0;
    unsigned int millis_gen         = 0;
    unsigned int millis_prev        = 0;
    unsigned int num_checks         = 0;

    Timer global_tim;

    global_tim.start();
    for(const auto acc1 : raw_actions){
        for(const auto acc2 : raw_actions){

            Timer prev_tim;
            prev_tim.start();

            vector<
                tuple<
                    shared_ptr<Action>,
                    shared_ptr<Parameter>,
                    int
                >
            > producte_parametres;

            vector<vector<int> > producte_combinacions;
            auto comb = combine_parameters(acc1,acc2);
            
            // producte cartesia de tots els grups
            map<string, vector<tuple<
                shared_ptr<Action>,
                shared_ptr<Parameter>,
                int > > >::iterator primer_grup = comb.first.begin();

            //TODO CHECK 
            //while(primer_grup != comb.first.end() && (*primer_grup).second.size() <= 1)
            while(primer_grup != comb.first.end() && (*primer_grup).second.size() < 1){
                primer_grup++;
            }

            if(primer_grup == comb.first.end()){
                // tots els grups son de 1 element o menys ... :/
                cout << "ERR? " << __LINE__ << " " << __FILE__ << " " << __func__ << endl;
            } else {
                // tenim el primer grup valid, a partir d'aqui afegim tots els seguents
                //  que tinguin mida > 1
                //
                //  primer_grup : iterador que sempre apunta al primer grup, a partir
                //  del qual operarem i on quedara el resultat final
                //  it_grups : iterador que es mou per tots els grups.
                auto it_grups = primer_grup;

                producte_combinacions.insert(producte_combinacions.end(),
                        comb.second.at((*it_grups).first)->begin(),
                        comb.second.at((*it_grups).first)->end());

                producte_parametres.insert(
                        producte_parametres.end(),
                        (*it_grups).second.begin(),
                        (*it_grups).second.end());

                it_grups++; // comencem a tractar el seguent grup, ja que hem iniciat les
                // estructures de dades amb les dades del primer grup valid que trobem. 
                // Podem fer ++ amb seguretat pq sabem que no es end()

                while(it_grups != comb.first.end()){
                // TODO CHECK                    if((*it_grups).second.size() > 1){
                
                        producte_parametres.insert(
                                producte_parametres.end(),
                                (*it_grups).second.begin(),
                                (*it_grups).second.end());

                        // mirem quants elements te el conjunt de combinacions, inicialment.
                        // Per cada element, el sumarem amb cada un del grup actual (el que 
                        // apunta it_grups) i l'afegirem al contenidor producte_combinacions
                        //
                        int iterations = producte_combinacions.size();
                        while( iterations > 0 ){
                            auto back_elem = producte_combinacions.back();
                            producte_combinacions.pop_back();
                            for(const auto comb_in : *(comb.second.at((*it_grups).first))){
                                auto new_vector = back_elem;
                                new_vector.insert( new_vector.end(), comb_in.begin(), comb_in.end());
                                producte_combinacions.insert(
                                        producte_combinacions.begin(),
                                        new_vector);
                            }
                            iterations--;
                        }
                    // TODO CHECK}
                    it_grups++;
                }
            }

            millis_prev += duration_cast<milliseconds>(prev_tim.elapsed()).count();
            // DEBUG
            /*
              cout << "suma de " << acc1->toString() << " i " << acc2->toString() << " :" << endl;
              for(const auto param : producte_parametres){
                  cout << get<1>(param)->toString() << " - " << get<1>(param)->getObjectType() << ", ";
              } cout << endl;
              for(const auto param : producte_combinacions){
              for(const auto num: param){
              cout << num << ", ";
              } cout << endl;
              }cout << endl; 
            cout << "check:" << acc1->toString() << " i " << acc2->toString() << " amb ";
            cout << producte_combinacions.size() << " combinacions" << endl;
             */  

            unsigned int i = 0;
            while(i < producte_combinacions.size()){

                Timer total_check; total_check.start();

                bool incompat = false;
                auto set_values = producte_combinacions.at(i);
                // contenidor per anar guardant quina es la var que considerem
                // modificada, la necessitem per despres poder emplenar el
                // contenidor per fer l'encoding lineal d'en rintanen
                shared_ptr<Functor> var_modificada = NULL;

                assert(set_values.size() == producte_parametres.size());

                shared_ptr< vector< shared_ptr<Parameter> > > par_acc1;
                shared_ptr< vector< string> >                 val_acc1;
                shared_ptr< vector< shared_ptr<Parameter> > > par_acc2;
                shared_ptr< vector< string> >                 val_acc2;

                par_acc1 = std::make_shared<vector< shared_ptr<Parameter> > >();
                par_acc2 = std::make_shared<vector< shared_ptr<Parameter> > >();
                val_acc1 = std::make_shared<vector<string> >();
                val_acc2 = std::make_shared<vector<string> >();

                // adaptem les dades a la funcio que ja tenim
                int position = 0;
                for(const auto param : producte_parametres){
                    if(std::get<2>(param) == 1){
                        par_acc1->push_back(std::get<1>(param));
                        val_acc1->push_back(std::to_string(set_values.at(position)));
                    } else {
                        par_acc2->push_back(std::get<1>(param));
                        val_acc2->push_back(std::to_string(set_values.at(position)));
                    }
                    position++;
                } 

                // Check 0:
                // * si les precondicions de o i o' ja no deixen que s'executin mai en paralel no fa falta 
                //   que mirem res mes ...
                if(add_mutexes == 1){
                    shared_ptr<Thing> acc1_p = acc1->getRawPrecondition()->duplicate();
                    shared_ptr<Thing> acc2_p = acc2->getRawPrecondition()->duplicate();
                    searchAndReplaceValues(val_acc1,par_acc1,acc1_p);
                    searchAndReplaceValues(val_acc2,par_acc2,acc2_p);
                    shared_ptr<Solver> temp_solver(new SolverStandard(new CoreSolverZ3(0),new SolverActionNOP()));
                    shared_ptr<vector<shared_ptr<Functor> > > int_vars = std::make_shared<vector<shared_ptr<Functor> > >();
                    shared_ptr<vector<shared_ptr<Functor> > > bool_vars = std::make_shared<vector<shared_ptr<Functor> > >();
                    extract_all_ints(acc1_p,int_vars); extract_all_bools(acc1_p,bool_vars);
                    extract_all_ints(acc2_p,int_vars); extract_all_bools(acc2_p,bool_vars);
                    std::set<string> unique_str;

                    for(const auto var : *bool_vars){
                        if(unique_str.find(var->toString()) == unique_str.end() ){
                            unique_str.insert(var->toString());
                            temp_solver->addVar(var->toString(1),"bool");
                            if(var->getStatic()){ } else { temp_solver->addVar(var->toString(2),"bool");
                            }
                        } 
                    }    
                    for(const auto var : *int_vars){
                        if(unique_str.find(var->toString()) == unique_str.end() ){
                            unique_str.insert(var->toString());
                            temp_solver->addVar(var->toString(1),"real");
                            if(var->getStatic()){
                                int lb = INT_MAX;
                                int ub = -INT_MAX;
                                for(const auto init : *p_inits){
                                    if(init->type == functor_type::T_OPERATION && init->getName() == "=" && 
                                            var->getName() == static_pointer_cast<Functor>(init->getParam(0))->getName()){
                                        int value = stoi(static_pointer_cast<Parameter>(init->getParam(1))->getValue());
                                        if(value > ub) { ub = value; }
                                        if(value < lb){ lb = value; }
                                    }
                                }
                                temp_solver->addConstraint(">=(" + var->toString(1) + "," + std::to_string(lb) + ")",0);
                                temp_solver->addConstraint("<=(" + var->toString(1) + "," + std::to_string(ub) + ")",0);
                            } else {
                                temp_solver->addVar(var->toString(2),"real");
                            }
                        }
                    }    
                    // afegim les constants aquestes xungues (falta el "object"?)
                    temp_solver->addVar("undefined","int");
                    temp_solver->addConstraint("=(undefined,0)",0);

                    // p2 ∧ p1 ∧ f1 ∧ a1 ∧ ¬p2' sigui SAT per a considerarles incompat
                    string str_check = "and(" + acc2_p->toString(1) + "," + acc1_p->toString(1) + ")";
                    temp_solver->addConstraint(str_check,0);

                    // if SAT guardar formula
                    if( temp_solver->check() == 1){
                        //cout << "(0) " << acc1->toString() << " i " <<  acc2->toString() << " algun cop es podran executar en paralel" << endl;
                        //cout << str_check << endl;
                    } else {
#ifdef DEBUG_VERSION
                        cout << "(0) " << acc1->toString() << " i " <<  acc2->toString() << " MAI es podran executar en paralel" << endl;
                        cout << str_check << endl;
#endif
                        incompat = true;
                    }  
                }

                // Check 1:
                // * que o no impedeixi l'execució de o' 
                // si a modifica alguna var de p2, s'ha de complir que:
                // p2 ∧ p1 ∧ f1 ∧ a1 ∧ ¬p2' sigui SAT per a considerarles incompat
                //
                if(incompat == false){
                    for(int j = 0;j < acc1->getNFDs(); j++){

                        shared_ptr<Thing> acc1_f = acc1->getFD(j).first->duplicate();
                        shared_ptr<Thing> acc1_a = acc1->getFD(j).second->duplicate();
                        shared_ptr<Thing> acc1_p = acc1->getRawPrecondition()->duplicate();
                        shared_ptr<Thing> acc2_p = acc2->getRawPrecondition()->duplicate();

                        searchAndReplaceValues(val_acc1,par_acc1,acc1_f);
                        searchAndReplaceValues(val_acc1,par_acc1,acc1_a);
                        searchAndReplaceValues(val_acc1,par_acc1,acc1_p);
                        searchAndReplaceValues(val_acc2,par_acc2,acc2_p);

                        shared_ptr<vector<shared_ptr<Functor> > > modified_vars =
                            std::make_shared<vector<shared_ptr<Functor> > >();
                        shared_ptr<vector<shared_ptr<Functor> > > checked_vars =
                            std::make_shared<vector<shared_ptr<Functor> > >();

                        extract_modified_vars(acc1_a,modified_vars);

                        // aqui mirem si alguna de les vars que es modifica apareix a la precondicio
                        if(modified_vars->size() > 0 ){
                            extract_all_ints(acc2_p,checked_vars);
                            extract_all_bools(acc2_p,checked_vars);

                            bool found = false;
                            auto it_modified = modified_vars->begin();
                            while(it_modified != modified_vars->end() && !found){
                                auto it_checked = checked_vars->begin();
                                while(it_checked != checked_vars->end() && !found){
                                    if((*it_modified)->toString() == (*it_checked)->toString()){

                                        var_modificada = *it_modified;
                                        /*
                                           cout << (*it_modified)->toString() << " == " << (*it_checked)->toString() << endl;
                                           cout << "Modified : " << endl; for(const auto var : *modified_vars){ cout << var->toString(2) << endl; }
                                           cout << "Checked: " << endl; for(const auto var : *checked_vars){ cout << var->toString(2) << endl; } cout << endl;
                                           */

                                        found = true;
                                    }
                                    it_checked++;
                                }
                                it_modified++;
                            }

                            // -> TO SMT
                            if(found){
                                shared_ptr<Solver> temp_solver(new SolverStandard(new CoreSolverZ3(0),new SolverActionNOP()));
                                shared_ptr<vector<shared_ptr<Functor> > > int_vars = 
                                    std::make_shared<vector<shared_ptr<Functor> > >();
                                shared_ptr<vector<shared_ptr<Functor> > > bool_vars =
                                    std::make_shared<vector<shared_ptr<Functor> > >();

                                extract_all_ints(acc1_f,int_vars); extract_all_bools(acc1_f,bool_vars);
                                extract_all_ints(acc1_a,int_vars); extract_all_bools(acc1_a,bool_vars);
                                extract_all_ints(acc1_p,int_vars); extract_all_bools(acc1_p,bool_vars);
                                extract_all_ints(acc2_p,int_vars); extract_all_bools(acc2_p,bool_vars);
                                std::set<string> unique_str;

                                for(const auto var : *bool_vars){
                                    if(unique_str.find(var->toString()) == unique_str.end() ){
                                        unique_str.insert(var->toString());
                                        temp_solver->addVar(var->toString(1),"bool");
                                        if(var->getStatic()){
                                            /*************************
                                              for(const auto init : *p_inits){
                                              if(var->toString() == (init->getParam(0))->toString()){
                                            // afegir init
                                            cout << "PUTAPUTAPUTA PUTA PUTA PUTA " << init->toString(1) << endl;
                                            temp_solver->addConstraint(init->toString(1),0);
                                            break; 
                                            }
                                            }
                                             *************************/
                                        } else {
                                            temp_solver->addVar(var->toString(2),"bool");
                                        }
                                    } 
                                }    
                                for(const auto var : *int_vars){
                                    if(unique_str.find(var->toString()) == unique_str.end() ){
                                        unique_str.insert(var->toString());
                                        temp_solver->addVar(var->toString(1),"real");
                                        if(var->getStatic()){
                                            /*************************/
                                            int lb = INT_MAX;
                                            int ub = -INT_MAX;
                                            for(const auto init : *p_inits){
                                                if(init->type == functor_type::T_OPERATION && init->getName() == "=" && 
                                                        var->getName() == static_pointer_cast<Functor>(init->getParam(0))->getName()){
                                                    int value = stoi(static_pointer_cast<Parameter>(init->getParam(1))->getValue());
                                                    if(value > ub) { ub = value; }
                                                    if(value < lb){ lb = value; }
                                                }
                                            }
                                            temp_solver->addConstraint(">=(" + var->toString(1) + "," + std::to_string(lb) + ")",0);
                                            temp_solver->addConstraint("<=(" + var->toString(1) + "," + std::to_string(ub) + ")",0);
                                            /*************************/
                                        } else {
                                            temp_solver->addVar(var->toString(2),"real");
                                        }
                                    }
                                }    
                                // afegim les constants aquestes xungues (falta el "object"?)
                                temp_solver->addVar("undefined","int");
                                temp_solver->addConstraint("=(undefined,0)",0);

                                // cambiem nomes els t+1 de les vars modificades:
                                string acc2_p_str = acc2_p->toString(1);
                                for(const auto var_mod : *modified_vars){
                                    acc2_p_str = search_and_replace(acc2_p_str,var_mod->toString(1),var_mod->toString(2));
                                }

                                // p2 ∧ p1 ∧ f1 ∧ a1 ∧ ¬p2' sigui SAT per a considerarles incompat
                                string str_check = "and(" + acc2_p->toString(1) + "," + acc1_p->toString(1) +
                                    "," + acc1_f->toString(1) + "," + acc1_a->toString(2) + ",not(" + acc2_p_str + "))";
                                temp_solver->addConstraint(str_check,0);

                                Timer check_tim; check_tim.start(); num_checks++;
                                // if SAT guardar formula
                                if( temp_solver->check() == 1){
#ifdef DEBUG_VERSION
                                    cout << "(1) " << acc1->toString() << " POT impedir l'execucio de: " <<  acc2->toString() << endl;
                                    cout << str_check << endl;
#endif
                                    incompat = true;
                                    break;
                                } else {
                                    //cout << acc1->toString() << " NO POT impedir l'execucio de: " <<  acc2->toString() << endl;
                                    //cout << str_check << endl;
                                }    
                                millis_check += duration_cast<milliseconds>(check_tim.elapsed()).count();
                            }
                        }
                    }
                }

                // Check 2:
                // * que o no canvii els efectes de o' 
                // si a modifica alguna var de f2 s'ha de complir que 
                // p1 ∧ p2 ∧ f1 ∧ a1 ∧ ((f2 ∧ ¬f2') ν (¬f2 ∧ f2')) sigui SAT per a considerarles incompat
                if(incompat == false ){ // si encara no hem trobat incompatible aquesta combinacio de valors i accions ...
                    for(int j = 0;j < acc1->getNFDs(); j++){
                        
                        shared_ptr<Thing> acc1_f = acc1->getFD(j).first->duplicate();
                        shared_ptr<Thing> acc1_a = acc1->getFD(j).second->duplicate();
                        shared_ptr<Thing> acc1_p = acc1->getRawPrecondition()->duplicate();
                        shared_ptr<Thing> acc2_p = acc2->getRawPrecondition()->duplicate();
                        
                        searchAndReplaceValues(val_acc1,par_acc1,acc1_f);
                        searchAndReplaceValues(val_acc1,par_acc1,acc1_a);
                        searchAndReplaceValues(val_acc1,par_acc1,acc1_p);
                        searchAndReplaceValues(val_acc2,par_acc2,acc2_p);

                        for(int k = 0;k < acc2->getNFDs(); k++){
                            shared_ptr<Thing> acc2_f = acc2->getFD(k).first->duplicate();

                            shared_ptr<vector<shared_ptr<Functor> > > modified_vars =
                                                std::make_shared<vector<shared_ptr<Functor> > >();
                            shared_ptr<vector<shared_ptr<Functor> > > checked_vars =
                                                std::make_shared<vector<shared_ptr<Functor> > >();

                            extract_modified_ints(acc1_a,modified_vars);
                            if(modified_vars->size() > 0 ){
                                extract_all_ints(acc2_f,checked_vars);

                                bool found = false;
                                auto it_modified = modified_vars->begin();
                                while(it_modified != modified_vars->end() && !found){
                                    auto it_checked = checked_vars->begin();
                                    while(it_checked != checked_vars->end() && !found){
                                        if((*it_modified)->toString() == (*it_checked)->toString()){
                                            var_modificada = *it_modified;
                                            /*cout << (*it_modified)->toString() << " == " << (*it_checked)->toString() << endl;
                                              cout << "Modified : " << endl; for(const auto var : *modified_vars){ cout << var->toString(2) << endl; }
                                              cout << "Checked: " << endl; for(const auto var : *checked_vars){ cout << var->toString(2) << endl; } cout << endl;  */
                                            found = true;
                                        }
                                        it_checked++;
                                    }
                                    it_modified++;
                                }

                                // -> TO SMT
                                if(found){
                                    shared_ptr<Solver> temp_solver(new SolverStandard(new CoreSolverZ3(0),new SolverActionNOP()));
                                    shared_ptr<vector<shared_ptr<Functor> > > int_vars =
                                                        std::make_shared<vector<shared_ptr<Functor> > >();
                                    shared_ptr<vector<shared_ptr<Functor> > > bool_vars =
                                                        std::make_shared<vector<shared_ptr<Functor> > >();

                                    extract_all_ints(acc1_f,int_vars); extract_all_bools(acc1_f,bool_vars);
                                    extract_all_ints(acc1_a,int_vars); extract_all_bools(acc1_a,bool_vars);
                                    extract_all_ints(acc1_p,int_vars); extract_all_bools(acc1_p,bool_vars);
                                    extract_all_ints(acc2_p,int_vars); extract_all_bools(acc2_p,bool_vars);
                                    extract_all_ints(acc2_f,int_vars); extract_all_bools(acc2_f,bool_vars);
                                    std::set<string> unique_str;

                                    for(const auto var : *bool_vars){
                                        if(unique_str.find(var->toString()) == unique_str.end() ){
                                            unique_str.insert(var->toString());
                                            temp_solver->addVar(var->toString(1),"bool");
                                            if(var->getStatic()){
                                                /*for(const auto init : *p_inits){ if(var->toString() == (init->getParam(0))->toString()){
                                                // afegir init
                                                break; } }*/
                                            } else {
                                                temp_solver->addVar(var->toString(2),"bool");
                                            }
                                        } 
                                    }    
                                    for(const auto var : *int_vars){
                                        if(unique_str.find(var->toString()) == unique_str.end() ){
                                            unique_str.insert(var->toString());
                                            temp_solver->addVar(var->toString(1),"real");
                                            if(var->getStatic()){
                                                /*************************/
                                                int lb = INT_MAX;
                                                int ub = -INT_MAX;
                                                for(const auto init : *p_inits){
                                                    if(init->type == functor_type::T_OPERATION && init->getName() == "=" && 
                                                            var->getName() == static_pointer_cast<Functor>(init->getParam(0))->getName()){
                                                        int value = stoi(static_pointer_cast<Parameter>(init->getParam(1))->getValue());
                                                        if(value > ub) { ub = value; }
                                                        if(value < lb){ lb = value; }
                                                    }
                                                }
                                                temp_solver->addConstraint(">=(" + var->toString() + "," + std::to_string(lb) + ")",0);
                                                temp_solver->addConstraint("<=(" + var->toString() + "," + std::to_string(ub) + ")",0);
                                                /*************************/
                                            } else {
                                                temp_solver->addVar(var->toString(2),"real");
                                            }
                                        }
                                    }    
                                    // afegim les constants aquestes xungues (falta el "object"?
                                    temp_solver->addVar("undefined","int");
                                    temp_solver->addConstraint("=(undefined,0)",0);

                                    // cambiem nomes els t+1 de les vars modificades:
                                    string acc2_f_str = acc2_f->toString(1);
                                    string acc2_p_str = acc2_p->toString(1);

                                    for(const auto var_mod : *modified_vars){
                                        acc2_f_str = search_and_replace(acc2_f_str,var_mod->toString(1),var_mod->toString(2));
                                        acc2_p_str = search_and_replace(acc2_p_str,var_mod->toString(1),var_mod->toString(2));
                                    }

                                    // p1 ∧ p2 ∧ f1 ∧ a1 ∧ p2' ∧ ((f2 ∧ ¬f2') ν (¬f2 ∧ f2')) sigui SAT per a considerarles incompat
                                    string str_check = "and(" + acc1_p->toString(1) + "," + acc2_p->toString(1) +
                                        "," + acc1_f->toString(1) + "," + acc1_a->toString(2) + "," + acc2_p_str +
                                        ",or(and(" + acc2_f->toString(1) + ",not(" + acc2_f_str + ")),and(not(" + acc2_f->toString(1) + ")," + acc2_f_str + ")))";
                                    temp_solver->addConstraint(str_check,0);

                                    Timer check_tim; check_tim.start(); num_checks++;
                                    // if SAT guardar formula
                                    if( temp_solver->check() == 1){
#ifdef DEBUG_VERSION
                                        cout << "(2) " << acc1->toString() << " POT canviar els efectes de : " <<  acc2->toString() << endl;
                                        cout << str_check << endl;
#endif
                                        incompat = true;
                                        break;
                                    } else {
                                        //cout << acc1->toString() << " NO POT canviar els efectes de : " <<  acc2->toString() << endl;
                                        //cout << str_check << endl;
                                    }    
                                    millis_check += duration_cast<milliseconds>(check_tim.elapsed()).count();
                                }
                            }
                        }
                    }
                }

                // Check 3:
                // * que o no canvii les mateixes vars de o' 
                // p1 ∧ p2 ∧ a1 ∧ f1 ∧ p2' ∧ f2' sigui SAT per a considerarles incompat
                if(incompat == false ){ // si encara no hem trobat incompatible aquesta combinacio de valors i accions ...
                    for(int j = 0;j < acc1->getNFDs(); j++){

                        shared_ptr<Thing> acc1_f = acc1->getFD(j).first->duplicate();
                        shared_ptr<Thing> acc1_a = acc1->getFD(j).second->duplicate();
                        shared_ptr<Thing> acc1_p = acc1->getRawPrecondition()->duplicate();
                        shared_ptr<Thing> acc2_p = acc2->getRawPrecondition()->duplicate();

                        searchAndReplaceValues(val_acc1,par_acc1,acc1_f);
                        searchAndReplaceValues(val_acc1,par_acc1,acc1_a);
                        searchAndReplaceValues(val_acc1,par_acc1,acc1_p);
                        searchAndReplaceValues(val_acc2,par_acc2,acc2_p);

                        for(int k = 0;k < acc2->getNFDs(); k++){
                            shared_ptr<Thing> acc2_f = acc2->getFD(k).first->duplicate();
                            shared_ptr<Thing> acc2_a = acc2->getFD(k).second->duplicate();
                            searchAndReplaceValues(val_acc2,par_acc2,acc2_f);
                            searchAndReplaceValues(val_acc2,par_acc2,acc2_a);

                            shared_ptr<vector<shared_ptr<Functor> > > modified_vars_a1 = 
                                                std::make_shared<vector<shared_ptr<Functor> > >();
                            shared_ptr<vector<shared_ptr<Functor> > > modified_vars_a2 =
                                                std::make_shared<vector<shared_ptr<Functor> > >();

                            // aquests tres els fem anar nomes si "permissiveThird" es cert
                            shared_ptr<vector<shared_ptr<Functor> > > assig_vars_a1 =
                                                std::make_shared<vector<shared_ptr<Functor> > >();
                            shared_ptr<vector<shared_ptr<Functor> > > assig_vars_a2 =
                                                std::make_shared<vector<shared_ptr<Functor> > >();
                            std::vector<std::string> v_s_a1,v_s_a2;

                            if(permissiveThird){
                                // Considerem que les accions s'afecten nomes si hi
                                // ha una assignacio implicada, si nomes son
                                // increases i/o decreases, no s'afecten.
                                extract_assigns(acc1_a,assig_vars_a1);
                                extract_assigns(acc2_a,assig_vars_a2);
                                for(const auto elem : *assig_vars_a1){ v_s_a1.push_back(elem->toString()); }
                                for(const auto elem : *assig_vars_a2){ v_s_a2.push_back(elem->toString()); }
                            }

                            extract_modified_ints(acc1_a,modified_vars_a1);
                            extract_modified_ints(acc2_a,modified_vars_a2);
                            if(modified_vars_a1->size() > 0 ){

                                bool found = false;
                                auto it_modified = modified_vars_a1->begin();
                                while(it_modified != modified_vars_a1->end() && !found){
                                    auto it_checked = modified_vars_a2->begin();
                                    while(it_checked != modified_vars_a2->end() && !found){

                                        bool find_the_var;
                                       
                                        if(permissiveThird){
                                            find_the_var = (*it_modified)->toString() == (*it_checked)->toString() && 
                                                // comprovem si la variable ha estat assignada per alguna de les dos accions.
                                                ( (std::find(v_s_a1.begin(),v_s_a1.end(),(*it_modified)->toString()) != v_s_a1.end()) || 
                                                  (std::find(v_s_a2.begin(),v_s_a2.end(),(*it_modified)->toString())) != v_s_a2.end());
                                        } else {
                                            find_the_var = (*it_modified)->toString() == (*it_checked)->toString();
                                        }

                                        // depen de si som permisius amb el tercer check
                                        // tenim un criteri o un altre.
                                        if(find_the_var){
                                            var_modificada = *it_modified;
                                            //cout << (*it_modified)->toString() << " == " << (*it_checked)->toString() << endl;
                                            //cout << "Modified : " << endl; for(const auto var : *modified_vars){ cout << var->toString(2) << endl; }
                                            //cout << "Checked: " << endl; for(const auto var : *checked_vars){ cout << var->toString(2) << endl; } cout << endl;  
                                            found = true;
                                        }
                                        it_checked++;
                                    }
                                    it_modified++;
                                }

                                // -> TO SMT
                                if(found){
                                    shared_ptr<Solver> temp_solver(new SolverStandard(new CoreSolverZ3(0),new SolverActionNOP()));
                                    shared_ptr<vector<shared_ptr<Functor> > > int_vars =
                                                    std::make_shared<vector<shared_ptr<Functor> > >();
                                    shared_ptr<vector<shared_ptr<Functor> > > bool_vars =
                                                    std::make_shared<vector<shared_ptr<Functor> > >();

                                    extract_all_ints(acc1_f,int_vars); extract_all_bools(acc1_f,bool_vars);
                                    extract_all_ints(acc1_a,int_vars); extract_all_bools(acc1_a,bool_vars);
                                    extract_all_ints(acc1_p,int_vars); extract_all_bools(acc1_p,bool_vars);
                                    extract_all_ints(acc2_p,int_vars); extract_all_bools(acc2_p,bool_vars);
                                    extract_all_ints(acc2_f,int_vars); extract_all_bools(acc2_f,bool_vars);
                                    std::set<string> unique_str;

                                    for(const auto var : *bool_vars){
                                        if(unique_str.find(var->toString()) == unique_str.end() ){
                                            unique_str.insert(var->toString());
                                            temp_solver->addVar(var->toString(1),"bool");
                                            if(var->getStatic()){
                                                //for(const auto init : *p_inits){ if(var->toString() == (init->getParam(0))->toString()){
                                                // afegir init
                                                //break; } }
                                            } else {
                                                temp_solver->addVar(var->toString(2),"bool");
                                            }
                                        } 
                                    }    
                                    for(const auto var : *int_vars){
                                        if(unique_str.find(var->toString()) == unique_str.end() ){
                                            unique_str.insert(var->toString());
                                            temp_solver->addVar(var->toString(1),"real");
                                            if(var->getStatic()){
                                                int lb = INT_MAX;
                                                int ub = -INT_MAX;
                                                for(const auto init : *p_inits){
                                                    if(init->type == functor_type::T_OPERATION && init->getName() == "=" && 
                                                            var->getName() == static_pointer_cast<Functor>(init->getParam(0))->getName()){
                                                        int value = stoi(static_pointer_cast<Parameter>(init->getParam(1))->getValue());
                                                        if(value > ub) { ub = value; }
                                                        if(value < lb){ lb = value; }
                                                    }
                                                }
                                                temp_solver->addConstraint(">=(" + var->toString() + "," + std::to_string(lb) + ")",0);
                                                temp_solver->addConstraint("<=(" + var->toString() + "," + std::to_string(ub) + ")",0);
                                            } else {
                                                temp_solver->addVar(var->toString(2),"real");
                                            }
                                        }
                                    }    
                                    // afegim les constants aquestes xungues (falta el "object"?
                                    temp_solver->addVar("undefined","int");
                                    temp_solver->addConstraint("=(undefined,0)",0);

                                    // cambiem nomes els t+1 de les vars modificades:
                                    string acc2_f_str = acc2_f->toString(1);
                                    string acc2_p_str = acc2_p->toString(1);

                                    for(const auto var_mod : *modified_vars_a1){
                                        acc2_f_str = search_and_replace(acc2_f_str,var_mod->toString(1),var_mod->toString(2));
                                        acc2_p_str = search_and_replace(acc2_p_str,var_mod->toString(1),var_mod->toString(2));
                                    }

                                    // p1 ∧ p2 ∧ f1 ∧ a1 ∧ p2' ∧ f2' sigui SAT per a considerarles incompat
                                    string str_check = "and(" + acc1_p->toString(1) + "," + acc2_p->toString(1) + "," + acc1_f->toString(1) +
                                        "," + acc1_a->toString(2) + "," + acc2_p_str + "," + acc2_f_str + ")";
                                    temp_solver->addConstraint(str_check,0);

                                    Timer check_tim; check_tim.start(); num_checks++;
                                    // if SAT guardar formula
                                    if( temp_solver->check() == 1){
#ifdef DEBUG_VERSION
                                        cout << "(3) " << acc1->toString() << " TOQUEN les mateixes vars : " <<  acc2->toString() << endl;
                                        cout << str_check << endl;
#endif
                                        incompat = true;
                                        break;
                                    } else {
                                        //cout << acc1->toString() << " NO toquen les mateixes vars : " <<  acc2->toString() << endl;
                                        //cout << str_check << endl;
                                    }    
                                    millis_check += duration_cast<milliseconds>(check_tim.elapsed()).count();
                                }
                            }
                        }
                    }
                }

                millis_total_check += duration_cast<milliseconds>(total_check.elapsed()).count();

                if(incompat) {
                    Timer gen_tim;
                    gen_tim.start();

                    shared_ptr<vector<shared_ptr<Functor> > > data1; 
                    shared_ptr<vector<shared_ptr<Functor> > > data2;
                    auto it_cache = encoded_cache.find(acc1->toString());
                    if(it_cache != encoded_cache.end()){
                        data1 = (*it_cache).second;
                    } else {
                        data1 = encodeFunctor(acc1);
                        encoded_cache[acc1->toString()] = data1;
                    }

                    it_cache = encoded_cache.find(acc2->toString());
                    if(it_cache != encoded_cache.end()){
                        data2 = (*it_cache).second;
                    } else {
                        data2 = encodeFunctor(acc2);
                        encoded_cache[acc2->toString()] = data2;
                    }

                    map< string,        // tipus d'objecte (ship, cargo, port, etc ... )
                        vector< tuple< 
                                    shared_ptr<Action>,    // accio a la qual pertany el parametre
                                    shared_ptr<Parameter>, // parametre en si
                                    int > >                // crec que es 1 o 2 depenguent de si es la primera o segona accio
                            > parametres_agrupats;
                    for(unsigned int idx = 0; idx < set_values.size(); idx++){
                        auto tmp_pointer = static_pointer_cast<Parameter>(get<1>(producte_parametres.at(idx))->duplicate());
                        tmp_pointer->setValue(std::to_string(set_values.at(idx)));

                        auto new_tuple = std::make_tuple(
                                                get<0>(producte_parametres.at(idx)),
                                                tmp_pointer,
                                                get<2>(producte_parametres.at(idx)));
                        parametres_agrupats[tmp_pointer->getObjectType()].push_back(new_tuple);
                    } // agrupem per tipus 

                    // per totes les combinacions de possibles valors dels parametres de les dos accions
                    // hem de comprovar si compleixen la regla d'incompatibilitat, i en cas afirmatiu 
                    // afegir-ho al problema com a una incompatibilitat.
                    for(const auto p_aplanat_acc1 : *data1){ 
                        for(const auto p_aplanat_acc2 : *data2){
                            shared_ptr<Action> aplanat_acc1 = static_pointer_cast<Action>(p_aplanat_acc1);
                            shared_ptr<Action> aplanat_acc2 = static_pointer_cast<Action>(p_aplanat_acc2);

                            // per comprovar si l'instanciacio de les accions correspon o no al 
                            // patro abstracte que hem descobert que s'afecta.
                            //
                            // AC es un map de valors abstractes (combinacio que ha resultat SAT) 
                            // a valors concrets ( els de l'instanciacio especifica que estem comprovant)
                            // i CA al reves. 
                            // Descobrim que no concorden els patrons quan a l'hora d'assignar un valor 
                            // concret de uns dels dos maps ja esta definit i te un valor diferent al que anavem
                            // a assignar.
                            map<string,string> AC;
                            map<string,string> CA;

                            bool MEEEC = false;

                            for(const auto param : parametres_agrupats){
                                if(MEEEC){ break; }
                                for(const auto prm : param.second){
                                    if(MEEEC){ break; }

                                    string nom_param = get<1>(prm)->getName();
                                    int num_acc   = get<2>(prm);

                                    string valor_abstracte = get<1>(prm)->getValue();
                                    string valor_concret;

                                    if(num_acc == 1){ // si pertany a la primera accio
                                        valor_concret   = aplanat_acc1->getParamByName(nom_param)->getValue();
                                    } else { // si pertany a la segona accio
                                        valor_concret   = aplanat_acc2->getParamByName(nom_param)->getValue();
                                    }

                                    if(CA.count(valor_concret) > 0 && CA.at(valor_concret) != valor_abstracte) {
                                        MEEEC = true;
                                    } else { CA[valor_concret] = valor_abstracte; }

                                    if(AC.count(valor_abstracte) > 0 && AC.at(valor_abstracte) != valor_concret) {
                                        MEEEC = true;
                                    } else { AC[valor_abstracte] = valor_concret; }
                                }
                            }                               

                            if(!MEEEC){
                                // tenim que comprovar que no siguin la mateixa accio amb elsmateixos parametres, sino el problema seria UNSAT
                                if(aplanat_acc1->toString(1) != aplanat_acc2->toString(1)){
                                    //cout << aplanat_acc1->toString() << " i " << aplanat_acc2->toString() << " compleixen per " << var_modificada->toString(1) << endl;

                                    // ara instanciem amb els valors de veritat la variable modificada de l'accio 1
                                    // si no venim del check 0!
                                    if(var_modificada != NULL){
                                        for(int num_param = 0; num_param < var_modificada->getNParams(); num_param++){
                                            auto parm = static_pointer_cast<Parameter>(var_modificada->getParam(num_param));
                                            bool trobat = false;
                                            int idx_aplanat = 0;
                                            while(!trobat && idx_aplanat < aplanat_acc1->getNParams()){
                                                auto parm_aplanat = static_pointer_cast<Parameter>(aplanat_acc1->getParam(idx_aplanat));
                                                if(parm_aplanat->getName() == parm->getName()){
                                                    trobat = true;
                                                    //cout << " a " << var_modificada->toString(1) << " li asignem al parametre " << parm->getName() << " el valor " << parm_aplanat->getValue() << endl;
                                                    parm->setValue(parm_aplanat->getValue());
                                                }
                                                idx_aplanat++;
                                            }
                                        }

                                        // les incompat d'en rintanen (l'encoding lineal) nomes te sentit si tenim una variable que sigui 
                                        // modificada per les dos accions, si no no fa falta ... hauriem de posar la mutex i fora
                                        inc_rintanen[var_modificada->toString(1)].insert(
                                            std::make_pair(aplanat_acc1->toString(1),aplanat_acc2->toString(1)));

                                        graph_inc[aplanat_acc1->toString(1)].insert(std::make_pair(
                                                    "integer",aplanat_acc2->toString(1)));

                                        graph_id_lookup[aplanat_acc1->toString(1)] = aplanat_acc1;
                                        graph_id_lookup[aplanat_acc2->toString(1)] = aplanat_acc2;

                                    } else {
                                        // Si venim del check 0 afegim la constraint i cap aresta, burru, que si no fem el tall de dos
                                        // al final ens dona ordres diferents.
                                        act_per_step.push_back("or(not(" + aplanat_acc1->toString(1) + "),not(" + aplanat_acc2->toString(1) + "))");
                                        //graph_inc[aplanat_acc1->toString(1)].insert(std::make_pair("integer",aplanat_acc2->toString(1)));
                                        //graph_inc[aplanat_acc2->toString(1)].insert(std::make_pair("integer",aplanat_acc1->toString(1)));
                                    }

                                    //cout << "key: " << var_modificada->toString(1) << " --- " << aplanat_acc1->toString(1) << " -> " << aplanat_acc2->toString(1)<<endl;
                                }
                            } else {
                                //cout << aplanat_acc1->toString() << " i " << aplanat_acc2->toString() << " NO compleixen" << endl;
                            }
                        }
                    }

                    millis_gen += duration_cast<milliseconds>(gen_tim.elapsed()).count();
                }
                i++; // iterador prod_combinacions.size();
            }
        }
    }
    
#ifdef DEBUG_VERSION
    cout << "(Y) Total Time new incompat check: " << duration_cast<milliseconds>(global_tim.elapsed()).count() << " milliseconds" << endl;
    cout << "(Y) Total - crides check SMT     : " << duration_cast<milliseconds>(global_tim.elapsed()).count() - millis_check << " milliseconds " << endl;
    cout << endl;
    cout << "(Y) temps gastat abans de check  : " << millis_prev << " milliseconds " << endl;
    cout << "(Y) total check() (SMT+code)     : " << millis_total_check << " milliseconds per fer " << num_checks << " checks" << endl;
    cout << "(Y) Crides check() SMT           : " << millis_check << " milliseconds per fer " << num_checks << " checks" << endl;
    cout << "(Y) temps gastat un cop determinada la incompatibilitat (gen de parelles) : " << millis_gen << " milliseconds " << endl;
#endif
}

// TODO: evitar bucles infinits (fer anar un set i comprovar mida despres de insertar?)
// TODO: codi duplicat joder
std::shared_ptr<vector<string> > firstEncodingVisitor::getAllSupertypes(string typeName){
    map<string,vector<string> >::iterator it = inv_types->find(typeName);
    auto tmp_vector = make_shared< vector<string> >();

    if(it == inv_types->end()){
        return tmp_vector;
    } else {
        for(const auto tmp_val : (*it).second){ // copiem tots els valors que trobem
            tmp_vector->push_back(tmp_val);
        }
        for(unsigned int vit = 0; vit < tmp_vector->size(); vit++){  
            shared_ptr<vector<string> > foo = getAllSupertypes(tmp_vector->at(vit));
            if(foo->size() > 0){
                tmp_vector->insert(tmp_vector->end(),foo->begin(),foo->end());
            }
        } 
        return tmp_vector;
    }
}

std::shared_ptr<vector<string> > firstEncodingVisitor::getAllSubtypes(string typeName){
    map<string,vector<string> >::iterator it = types->find(typeName);
    auto tmp_vector = make_shared< vector<string> >();

    if(it == types->end() ){
        return tmp_vector;
    } else {
        for(const auto tmp_val : (*it).second){ // copiem tots els valors que trobem
            //shared_ptr<vector<string> > foobar(new vector<string>((*it).second));
            tmp_vector->push_back(tmp_val);
        }
        for(unsigned int vit = 0; vit < tmp_vector->size(); vit++){  
            shared_ptr<vector<string> > foo = getAllSubtypes(tmp_vector->at(vit));
            if(foo->size() > 0){
                tmp_vector->insert(tmp_vector->end(),foo->begin(),foo->end());
            }
        } 
        return tmp_vector;
    } 
}

// agrupat el codi comu de pred/func/act en aquesta funcio
// TODO codi duplicat, JODER
shared_ptr<vector<shared_ptr<Functor> > > firstEncodingVisitor::encodeFunctor(shared_ptr<Functor> f){

    // vector de strings que retornem
    shared_ptr<vector<shared_ptr<Functor> > > encoding = std::make_shared<vector<shared_ptr<Functor> > >();

    // vector de punters a vectors d'strings i vector de iteradors per fer hodometre
    vector<shared_ptr<vector<string> > > sets;
    vector<vector<string>::iterator> it;

    // inicialitzem els dos vectors
    if(f->getNParams() > 0) {
        for(int i=0;i < f->getNParams();i++){
            shared_ptr<vector<string>> objs = std::make_shared<vector<string> >();
            shared_ptr<Parameter> param = static_pointer_cast<Parameter>(f->getParam(i)); // TODO runtimecheck de l'atribut type ...
            // iterem per el tipus i tots els subtipus de cada parametre i recuperem
            // tots els objectes declarats per fer totes les combinacions.
            shared_ptr<vector<string> > subtypes(getAllSubtypes(param->getObjectType())); //subtipus
            subtypes->push_back(param->getObjectType());                                  // i tipus
            for( const auto& subt : *subtypes ){
                for( const auto object :  objects_by_type[subt]){
                    objs->push_back(object);
                }
            }
            sets.push_back(objs);
            it.push_back(sets[sets.size()-1]->begin());
        }

        while(it[0] != sets[0]->end()){
            shared_ptr<Functor> in = static_pointer_cast<Functor>(f->duplicate());
            for(unsigned int i = 0; i < sets.size(); i++){
                // si peta aqui es pq es un tipus buit, osigui que no te objectes instanciats del tipus!
                //in->setValue(*(it[i]),i);
                static_pointer_cast<Parameter>(in->getParam(i))->setValue(*(it[i]));
            } 

            // no l'afegim a la llista de generats si s'ha eliminat del problema abans!!
            bool descarta = (deleted_actions->count(in->toString()) > 0 || 
                             deleted_functions->count(in->toString()) > 0);
            //if(descarta){ cout << "Descartem " << in->toString() << " pq l'hem trobat!" << endl; }
            if(!descarta){ encoding->push_back(in); }

            // implementacio d'un hodometre
            // comencant pel l-ultim iterador, si es passa de voltes el resetejem i fem
            // el mateix tirant per el "digit" anterior fins arribar al primer. Cada pas 
            // fa un increment 
            ++it[sets.size()-1];
            for(int i = sets.size()-1;
                    (it[i] == sets[i]->end()) && i > 0;
                    --i){
                it[i] = sets[i]->begin();
                ++it[i-1];
            }
        }
    } else { // no params
        //shared_ptr<Functor> in(new Functor(*f));
        //encoding->push_back(in);
    }
    return encoding;
}

string firstEncodingVisitor::getRandomName(string str){
    stringstream ss;
    ss << "temp_" << str << std::to_string(random_not_so_random);
    random_not_so_random++;
    return ss.str();
}

void firstEncodingVisitor::setTypes(std::shared_ptr<std::map< std::string, std::vector< std::string> > > ptr){
    types = ptr;
    cout << "Types set" << endl;
    for(const auto subtypes : *types){
        for(const auto type : subtypes.second){
            (*inv_types)[type].push_back(subtypes.first);
        }
    }
    cout << "SuperTypes set" << endl;

    // arrelem a tot tipus que no tingui supertipus a "object", aixi passem
    // a tenir un arbre i no un bosc.
    for(const auto x : *types){
        if(inv_types->count(x.first) == 0){
            if(x.first != "NULL"){
            //cout << x.first << " NO TE PARE!" << endl;
            (*inv_types)[x.first].push_back("object");
            (*types)["object"].push_back(x.first);
            }
        }
    }
    cout << "Type tree fixed" << endl;
}

void firstEncodingVisitor::setObjects(std::shared_ptr < std::map< std::string, std::string > > ptr){
    cout << "Objects set" << endl;
    objects = ptr;
    for(const auto elem : *objects){
        objects_by_type[elem.second].push_back(elem.first);
    }
    encodeObjects();
}

void firstEncodingVisitor::setInits(std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p){
    cout << "Inits set" << endl;
    p_inits = p;
}

void firstEncodingVisitor::setSolver(std::shared_ptr<Solver> solv){
    cout << "Solver set" << endl;
    solver = solv;
}

void firstEncodingVisitor::setObjective(std::shared_ptr<Thing> obj){
    cout << "Objective set" << endl;
    objective = obj;
}

void firstEncodingVisitor::setDeletedFunctions(std::shared_ptr<std::set< std::string > > ptr){
    cout << "Deleted functions set" << endl;
    deleted_functions = ptr;
}

void firstEncodingVisitor::setDeletedActions(std::shared_ptr<std::set< std::string > > ptr){
    cout << "Deleted actions set" << endl;
    deleted_actions = ptr;
}

void firstEncodingVisitor::assertInitialState(){
    string curr_c = "@";
    string next_c = "#";
    string curr_t = std::to_string(0);
    string next_t = std::to_string(0+1);

    // vars dinamiques al pas 0
    assertVarsTS(0);

    // vars estatiques
    /*for(const auto str: int_A){
        auto foobar = static_pointer_cast<Functor>(str);
        if(foobar->getStatic()){
        cout << "STATIC addVar " << foobar->toString() << endl;
        }else{
        cout << "DYNAMIC addVar " << foobar->toString() << endl;
        }
    }*/

    for(const auto str: int_A){
        auto foobar = static_pointer_cast<Functor>(str);
        if(foobar->getStatic()){
            //cout << "addVar " << foobar->toString() << endl;
            solver->addVar(foobar->toString(),"int");
        }
    }

    for(const auto str: bool_A){
        auto foobar = static_pointer_cast<Functor>(str);
        if(foobar->getStatic()){
            //cout << "addVar " << foobar->toString() << endl;
            solver->addVar(foobar->toString(),"bool");
        }
    } 

    // inits de valors
    for(const auto init_s : s_inits){
        //cout << search_and_replace(init_s,curr_c,curr_t) << endl;
        solver->addConstraint(search_and_replace(init_s,curr_c,curr_t),0);
    }
}

void firstEncodingVisitor::r_assertInitialState(){
    string curr_c = "@";
    string next_c = "#";
    string curr_t = std::to_string(0);
    string next_t = std::to_string(0+1);

    // vars dinamiques al pas 0
    r_assertVarsTS(0);

    // vars estatiques
    /*for(const auto str: int_A){
        auto foobar = static_pointer_cast<Functor>(str);
        if(foobar->getStatic()){
        cout << "STATIC addVar " << foobar->toString() << endl;
        }else{
        cout << "DYNAMIC addVar " << foobar->toString() << endl;
        }
    }*/

    for(const auto str: int_A){
        auto foobar = static_pointer_cast<Functor>(str);
        if(foobar->getStatic()){
            //cout << "addVar " << foobar->toString() << endl;
            r_solver->addVar(foobar->toString(),"int");
        }
    }

    for(const auto str: bool_A){
        auto foobar = static_pointer_cast<Functor>(str);
        if(foobar->getStatic()){
            //cout << "addVar " << foobar->toString() << endl;
            r_solver->addVar(foobar->toString(),"bool");
        }
    } 

    // inits de valors
    for(const auto init_s : s_inits){
        //cout << search_and_replace(init_s,curr_c,curr_t) << endl;
        r_solver->addConstraint(search_and_replace(init_s,curr_c,curr_t),0);
    }
}

void firstEncodingVisitor::assertTimeStep(int t){
    assertVarsTS(t+1);
    assertConstraintsTS(t);
    // el comentem perque es estrictament pitjor
    // assertDifferentState(t); 
}

void firstEncodingVisitor::r_assertTimeStep(int t){
    r_assertVarsTS(t+1);
    r_assertConstraintsTS(t);
    // el comentem perque es estrictament pitjor
    // assertDifferentState(t); 
}

// asserts a constraint that says that the next state must be different than the previous
// so vars(S_t) != vars(S_t+1).
void firstEncodingVisitor::assertDifferentState(int t){
    stringstream ss;
    for(int i = 0; i < t+1; i++){
        for(int j = i; j < t+1; j++){
            if(i != j){
                //cout << "(" << i << "," << j << ")" << endl;
                string curr_c = "@";
                string next_c = "#";
                string curr_t = std::to_string(i);
                string next_t = std::to_string(j);

                ss << "or(";
                int idx = 0;
                while(idx < int_A.size()){
                    auto foobar = static_pointer_cast<Functor>(int_A[idx]);
                    ss << "not(=(" << foobar->toString(1) << "," << foobar->toString(2) << "))";
                    // si es ultim element o no tenim predicats, no posem la coma 
                    if(idx != int_A.size()-1 || pred_A.size() != 0){ ss << ","; } else { }

                    idx++;
                }

                idx = 0;
                while(idx < pred_A.size()){
                    auto foobar = static_pointer_cast<Functor>(pred_A[idx]);
                    ss << "not(=(" << foobar->toString(1) << "," << foobar->toString(2) << "))";
                    // si es ultim element o no tenim predicats, no posem la coma 
                    if(idx != pred_A.size()-1){ ss << ","; } else { }
                    idx++;
                }
                ss << ")";
                string constraint = search_and_replace(ss.str(),curr_c,curr_t);
                constraint = search_and_replace(constraint,next_c,next_t);
                
                different_state.insert(constraint);
                ss.str(string());
            }
        }

    }

    for(const auto str: different_state){
        solver->addConstraint(str,0);
        //cout << str << endl;
    }
}

void firstEncodingVisitor::r_assertVarsTS(int t){
    string curr_c = "@";
    string next_c = "#";
    string curr_t = std::to_string(t);
    string next_t = std::to_string(t+1);

    for(const auto str: relaxed_bool_A){
        auto foobar = static_pointer_cast<Functor>(str);
        if(!foobar->getStatic()){
            r_solver->addVar(search_and_replace(foobar->toString(1),curr_c,curr_t),"bool");
        }
    } 

    for(const auto str: bool_A){
        auto foobar = static_pointer_cast<Functor>(str);
        if(!foobar->getStatic()){
            r_solver->addVar(search_and_replace(foobar->toString(1),curr_c,curr_t),"bool");
        }
    } 

    for(const auto str: int_A){
        auto foobar = static_pointer_cast<Functor>(str);
        if(!foobar->getStatic()){
            r_solver->addVar(search_and_replace(foobar->toString(1),curr_c,curr_t),"int");

        }
    }
}

void firstEncodingVisitor::assertVarsTS(int t){
    string curr_c = "@";
    string next_c = "#";
    string curr_t = std::to_string(t);
    string next_t = std::to_string(t+1);


    for(const auto str: bool_A){
        auto foobar = static_pointer_cast<Functor>(str);
        if(!foobar->getStatic()){
            //cout << search_and_replace(foobar->toString(1),curr_c,curr_t) << endl;
            solver->addVar(search_and_replace(foobar->toString(1),curr_c,curr_t),"bool");
        }
    } 

    for(const auto str: int_A){
        auto foobar = static_pointer_cast<Functor>(str);
        if(!foobar->getStatic()){
            solver->addVar(search_and_replace(foobar->toString(1),curr_c,curr_t),"int");

        }
    }
}

void firstEncodingVisitor::r_assertConstraintsTS(int t){
    string curr_c = "@";
    string next_c = "#";
    string curr_t = std::to_string(t);
    string next_t = std::to_string(t+1);

    for(const auto str: relaxed_one){
        string foobar = search_and_replace(str,curr_c,curr_t);
        foobar = search_and_replace(foobar,next_c,next_t);
        //cout << "(1)" << foobar << endl;
        r_solver->addConstraint(foobar,0);
    } 

    for(const auto str: relaxed_two){
        string foobar = search_and_replace(str,curr_c,curr_t);
        foobar = search_and_replace(foobar,next_c,next_t);
        //cout << "(2)" << foobar << endl;
        r_solver->addConstraint(foobar,0);
    } 

    for(const auto str: relaxed_three){
        string foobar = search_and_replace(str,curr_c,curr_t);
        foobar = search_and_replace(foobar,next_c,next_t);
        //cout << "(3)" <<  foobar << endl;
        r_solver->addConstraint(foobar,0);
    } 

    for(const auto str: four){
        string foobar = search_and_replace(str,curr_c,curr_t);
        foobar = search_and_replace(foobar,next_c,next_t);
        //cout << "(4)" <<  foobar << endl;
        r_solver->addConstraint(foobar,0);
    }
/**/ 

    for(const auto str: relaxed_act_per_step){
        string foobar = search_and_replace(str,curr_c,curr_t);
        foobar = search_and_replace(foobar,next_c,next_t);
        //cout << "(I)" <<  foobar << endl;
        r_solver->addConstraint(foobar,0);
    }
}

void firstEncodingVisitor::assertConstraintsTS(int t){
    string curr_c = "@";
    string next_c = "#";
    string curr_t = std::to_string(t);
    string next_t = std::to_string(t+1);

    for(const auto str: one){
        string foobar = search_and_replace(str,curr_c,curr_t);
        foobar = search_and_replace(foobar,next_c,next_t);
        //cout << "(1)" << foobar << endl;
        solver->addConstraint(foobar,0);
    } 

    for(const auto str: two){
        string foobar = search_and_replace(str,curr_c,curr_t);
        foobar = search_and_replace(foobar,next_c,next_t);
        //cout << "(2)" << foobar << endl;
        solver->addConstraint(foobar,0);
    } 

    for(const auto str: three){
        string foobar = search_and_replace(str,curr_c,curr_t);
        foobar = search_and_replace(foobar,next_c,next_t);
        //cout << "(3)" <<  foobar << endl;
        solver->addConstraint(foobar,0);
    } 

    for(const auto str: four){
        string foobar = search_and_replace(str,curr_c,curr_t);
        foobar = search_and_replace(foobar,next_c,next_t);
        //cout << "(4)" <<  foobar << endl;
        solver->addConstraint(foobar,0);
    } 

    for(const auto str: act_per_step){
        string foobar = search_and_replace(str,curr_c,curr_t);
        foobar = search_and_replace(foobar,next_c,next_t);
        //cout << "(I)" <<  foobar << endl;
        solver->addConstraint(foobar,0);
    }

    // ho hem de fer aqui perque necessitem que les variables referent a les accions hagin sigut assertades 
    // en alguna constraint ja.
    if(decidable_actions > 0){
        for(auto var : pO_vars){
            string v = var->toString(1);
            solver->setDecidable(search_and_replace(v,curr_c,curr_t));
        }
    }
}

long firstEncodingVisitor::assertObjective(int t){
    string curr_c = "@";
    string next_c = "#";
    string curr_t = std::to_string(t);
    string next_t = std::to_string(t+1);
    string constraint = objective->toString(1);
    constraint = search_and_replace(constraint,curr_c,curr_t);
    constraint = search_and_replace(constraint,next_c,curr_t);
    cout << "OBJECTIVE: " << constraint << endl;
    return solver->assertRetractable(constraint);
    return t;
}

long firstEncodingVisitor::r_assertObjective(int t){
    string curr_c = "@";
    string next_c = "#";
    string curr_t = std::to_string(t);
    string next_t = std::to_string(t+1);
    string constraint = objective->toString(1);
    constraint = search_and_replace(constraint,curr_c,curr_t);
    constraint = search_and_replace(constraint,next_c,curr_t);
    cout << "OBJECTIVE: " << constraint << endl;
    return r_solver->assertRetractable(constraint);
    return t;
}

void firstEncodingVisitor::solve(){
    if(solving_alg == 0){
        solveLineal();
    } else if(solving_alg == 1){
        solveEto();
    } else {
        cerr << "ERR! ERR! ERR!" << __LINE__ << __FILE__ << endl;
    }
}

void firstEncodingVisitor::solveEto(){
    solveLineal();
    // encara no esta implementat pq hauria d'incorporar pthreads 
    // pq el coi de yices2 implementa timeout via linia de comandes
    // pero no via API. Ara que es codi lliure, tocaria mirar el codi font
    // i veure com activar-lo "de manera chunga"
    //
    // o instalar un signal handler, cridar:
    // __YICES_DLLSPEC__ extern void yices_stop_search(context_t *ctx);
    // quan hagi passat un temps ...
}

void firstEncodingVisitor::solveLineal(){
    Timer global_tim,tim;
    global_tim.start();
    tim.start();

    assertInitialState();
    assertTimeStep(0);
    long step = assertObjective(0);
    cout << "retractable assert: " << step << endl;
    cout << "Time asserting: " << duration_cast<milliseconds>(tim.elapsed()).count();
    cout << " milliseconds, 0 (t) and initial state." << endl;

    if( solver->check() == 1){
        cout << "found plan at t=0!" << endl;
    }
    else {
        int t = 1;
        solver->retract(step);
        step = assertObjective(t);
        int check = solver->check();

        while( check != 1 && t < max_steps){
            cout << "Asserting time step: " << t << endl;
            solver->retract(step);

            tim.start();
            assertTimeStep(t);
            step  = assertObjective(t+1);
            cout << "Time asserting: " << duration_cast<milliseconds>(tim.elapsed()).count();
            cout << " milliseconds " << t << "(t)" << endl;

            tim.start();
            check = solver->check();
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


        // TODO afegir parametre de (want to minimize)
        // i com ...
        //

        // PALLA 
        bool palla = true;
        bool unbounded = false;
        bool bounded = false; 
        if(check != 0 && palla){

            std::set<string> actions_seen;
            for(int i = 0; i <= t; i++){
                for(auto var : pO_vars){
                    string v = var->toString(1);
                    v = search_and_replace(v,"@",std::to_string(i));
                    long val = solver->modelVarInt(v);
                    if(val == 1){ actions_seen.insert(v); }
                }
            }

            Timer opt_tim;
            opt_tim.start();
            int num_accions = 0;
            // dump SMT2 problem
            auto core_solver = new
            CoreSolverFileZ3Opt("palla_"+std::to_string(::getpid())+"_"+getRandomName()+".smt2",0);
            solver = shared_ptr<SolverStandard>(new SolverStandard(core_solver,new SolverActionNOP()));
            assertInitialState();
            cout << endl;
            for(int i = 0; i < t+1; i++){
                assertTimeStep(i); 
                // posem les soft
                for(const auto var : O_vars){
                    string curr_c = "@"; string next_c = "#";
                    string curr_t = std::to_string(i); string next_t = std::to_string(i+1);
                    string constraint = var;
                    constraint = search_and_replace(constraint,curr_c,curr_t);
                    constraint = search_and_replace(constraint,next_c,curr_t);
                    num_accions++;

                    if(actions_seen.count(constraint) > 0){
                        cout << "-";
                        core_solver->assertSoftConstraint("not(" + constraint + ")",1);
                    } else {
                        core_solver->assertString("(assert (not " + constraint + "))");
                    }
                }
            }
            cout << endl;
            assertObjective(t+1);
            cout << "time assert : " << duration_cast<milliseconds>(opt_tim.elapsed()).count() << " milliseconds. " << endl;
            int check = solver->check();
            if(check == 0){ cout << "?????" << endl; } else { cout << "Yay!" << endl; }
            cout << "Total time optimizing: " << duration_cast<milliseconds>(opt_tim.elapsed()).count() << " milliseconds. " << endl;
            cout << "Total num_actions: " << num_accions << endl;
        }


        // UNBOUNDED
        if(check != 0 && unbounded){
            Timer opt_tim;
            opt_tim.start();
            int num_accions = 0;
            // dump SMT2 problem
            auto core_solver = new CoreSolverFileSimply("unbounded.smt2",0);
            solver = shared_ptr<SolverStandard>(new SolverStandard(core_solver,new SolverActionNOP()));
            assertInitialState();
            for(int i = 0; i < t+1; i++){
                assertTimeStep(i); 
                // posem les soft
                for(const auto var : O_vars){
                    string curr_c = "@"; string next_c = "#";
                    string curr_t = std::to_string(i); string next_t = std::to_string(i+1);
                    string constraint = var;
                    constraint = search_and_replace(constraint,curr_c,curr_t);
                    constraint = search_and_replace(constraint,next_c,curr_t);
                    num_accions++;
                    core_solver->assertSoftConstraint(constraint,1);
                }
            }
            assertObjective(t+1);
            cout << "time assert : " << duration_cast<milliseconds>(opt_tim.elapsed()).count() << " milliseconds. " << endl;
            int check = solver->check();
            if(check == 0){ cout << "?????" << endl; } else { cout << "Yay!" << endl; }
            cout << "Total time optimizing: " << duration_cast<milliseconds>(opt_tim.elapsed()).count() << " milliseconds. " << endl;
            cout << "Total num_actions: " << num_accions << endl;
        }

        // TODO BOUNDED
        if(check != 0 && bounded){

            // calculem upper bound
            int ub = 0;
            int lb = t+1;
            for(int i = 0; i <= t; i++){
                for(auto var : pO_vars){
                    string v = var->toString(1);
                    v = search_and_replace(v,"@",std::to_string(i));
                    long val = solver->modelVarInt(v);
                    if(val == 1){ ub++; }
                }
            }
            cout << "UB: " << ub << endl; cout << "LB: " << lb << endl;

            Timer opt_tim;
            opt_tim.start();
            int num_accions = 0;
            // dump SMT2 problem
            auto core_solver = new
            CoreSolverFileZ3Opt("bounded_"+std::to_string(::getpid())+"_"+getRandomName()+".smt2",0);
            solver = shared_ptr<SolverStandard>(new SolverStandard(core_solver,new SolverActionNOP()));
            assertInitialState();
            //core_solver->assertString("(define-fun bool_to_int ((b Bool)) Int (ite b 1 0))");
            core_solver->addVar("___limit___","int");
            core_solver->assertString("(assert (<= ___limit___ "+ std::to_string(ub) +"))");
            core_solver->assertString("(assert (>= ___limit___ "+ std::to_string(t) +"))");

            string to_minimize = "(assert (= ___limit___ (+ ";
            for(int i = 0; i < t+1; i++){
                assertTimeStep(i); 
                // posem les soft
                for(const auto var : O_vars){

                    string curr_c = "@";
                    string next_c = "#";
                    string curr_t = std::to_string(i);
                    string next_t = std::to_string(i+1);
                    string constraint = var;
                    constraint = search_and_replace(constraint,curr_c,curr_t);
                    constraint = search_and_replace(constraint,next_c,curr_t);
                    num_accions++;
                    core_solver->assertString("(declare-fun " + constraint + "_count () Int)");
                    core_solver->assertString("(assert (= (= " + constraint + "_count 1) " + constraint + " ))");
                    core_solver->assertString("(assert (= (= " + constraint + "_count 0) (not " + constraint + ")))");
                    to_minimize += constraint + "_count ";
                }
            }
            to_minimize += " 0)))";
            assertObjective(t+1);
            core_solver->assertString(to_minimize);
            core_solver->assertString("(minimize ___limit___)");
            cout << "time assert : " << duration_cast<milliseconds>(opt_tim.elapsed()).count() << " milliseconds. " << endl;
            int check = solver->check();
            if(check == 0){ cout << "?????" << endl; } else { cout << "Yay!" << endl; }
        cout << "Total time optimizing: " << duration_cast<milliseconds>(opt_tim.elapsed()).count() << " milliseconds. " << endl;
        cout << "Total num_actions: " << num_accions << endl;

        }
    }
}

std::vector<std::vector<string > > firstEncodingVisitor::r_solveLineal(){
    Timer global_tim,tim;
    global_tim.start();
    tim.start();

    std::vector<std::vector<string > > pla_paralel;

    /*auto core_solver = new CoreSolverYices2(0);
    r_solver = shared_ptr<SolverStandard>(new SolverStandard(core_solver,new SolverActionNOP()));*/

    r_assertInitialState();
    r_assertTimeStep(0);
    long step = r_assertObjective(0);
    //cout << "retractable assert: " << step << endl;
    //cout << "Time spent asserting relaxed problem: " << duration_cast<milliseconds>(tim.elapsed()).count();
    //cout << " milliseconds, 0 (t) and initial state." << endl;

    if( r_solver->check() == 1){
        cout << "found relaxed plan at t=0!" << endl;
    }
    else {
        int t = 1;
        r_solver->retract(step);
        step = r_assertObjective(t);
        int check = r_solver->check();

        while( check != 1 && t < max_steps){
            cout << "Asserting relaxed time step: " << t << endl;
            r_solver->retract(step);

            tim.start();
            r_assertTimeStep(t);
            step  = r_assertObjective(t+1);
            cout << "Time asserting relaxed: " << duration_cast<milliseconds>(tim.elapsed()).count();
            cout << " milliseconds " << t << "(t)" << endl;

            tim.start();
            check = r_solver->check();
            cout << "Time check() relaxed: " << duration_cast<milliseconds>(tim.elapsed()).count();
            cout << " milliseconds " << t << "(t)" << endl;

            t++;
        }
        t--; // nomes hem assertat fins a t-1, per tant ...

        if(check == 0){
            cout << "not found :(" << endl;
        }else{
            cout << "found relaxed plan at t=" << t  << ". " << endl;
            r_dumpSolution(t+1); // TODO TODO TODO
            pla_paralel.resize(t+1);
        }
        cout << "Total time for solving relaxed: " << duration_cast<milliseconds>(global_tim.elapsed()).count() << " milliseconds. " << endl;

        // PALLA 
        bool palla = true;
        bool unbounded = true;
        bool bounded = true; 
        std::vector<string> smt_output;
        cout << " Anem a reduir el pla relaxat... " << endl;
        if(check != 0 && palla){

            std::set<string> actions_seen;
            for(int i = 0; i <= t; i++){
                for(auto var : pO_vars){
                    string v = var->toString(1);
                    v = search_and_replace(v,"@",std::to_string(i));
                    long val = r_solver->modelVarInt(v);
                    if(val == 1){ actions_seen.insert(v); }
                }
            }

            Timer opt_tim;
            opt_tim.start();
            int num_accions = 0;
            // dump SMT2 problem
            auto core_solver = new
            CoreSolverFileZ3Opt("rpalla_"+std::to_string(::getpid())+"_"+getRandomName()+".smt2",0);
            core_solver->capture_softs = true;
            r_solver = shared_ptr<SolverStandard>(new SolverStandard(core_solver,new SolverActionNOP()));
            r_assertInitialState();
            cout << endl;
            for(int i = 0; i < t+1; i++){
                r_assertTimeStep(i); 
                // posem les soft
                for(const auto var : O_vars){
                    string curr_c = "@"; string next_c = "#";
                    string curr_t = std::to_string(i); string next_t = std::to_string(i+1);
                    string constraint = var;
                    constraint = search_and_replace(constraint,curr_c,curr_t);
                    constraint = search_and_replace(constraint,next_c,curr_t);
                    num_accions++;

                    if(actions_seen.count(constraint) > 0){
                        cout << "-";
                        core_solver->assertSoftConstraint("not(" + constraint + ")",1);
                    } else {
                        core_solver->assertString("(assert (not " + constraint + "))");
                    }
                }
            }
            //cout << endl;
            r_assertObjective(t+1);
            //cout << "time assert : " << duration_cast<milliseconds>(opt_tim.elapsed()).count() << " milliseconds. " << endl;
            int check = r_solver->check();
            if(check == 0){ cout << "?????" << endl; } else {
                cout << "Yay, found relaxed optimal plan!" << endl;
                for(const auto elem : core_solver->mapVar){
                    string primer = elem.first;
                    string segon = elem.second.second;
//                    cout << "|" << primer << "| ===== |" << segon << "| ?" << endl;
                    // posem be els not() del z3 i tota la pesca ...
//                    cout << !primer.empty() << " && " << primer.substr(0,6) << " == " << "1:(not" << endl;
                    if(!primer.empty() && primer.substr(0,6) == "1:(not"){ 
                        // estem en un not... per tant girem el valor i treiem el not
                        if(segon == "false"){
                            primer = primer.substr(6,primer.length()-7);
                            smt_output.push_back(primer);
                            //cout << primer << " ==x== " << segon << endl;
                        }
                    } else {
                        if(segon == "true"){
                            primer = primer.substr(2,primer.length()-2);
                            smt_output.push_back(primer);
                            //cout << primer << " ==x== " << segon << endl;
                        }
                    }
                }
            }
            cout << "Total time optimizing the relaxed plan: " << duration_cast<milliseconds>(opt_tim.elapsed()).count() << " milliseconds. " << endl;
            //cout << "Total num_actions: " << num_accions << endl;
            for(const auto elem : smt_output){
                std::vector<string> pieces = str_explode(elem,"__");
                int step = stoi(pieces[pieces.size()-1]);
                //cout << "afegim " << elem << " a l'step " << step << endl;
                pla_paralel[step].push_back(elem);
            }

            /*
            cout << endl;
            cout << "PLA RECUPERAT MINIMITZAT" << endl;
            int i = 0;
            for(const auto it1 : pla_paralel){
                for(const auto it2 : it1){
                    cout << i << " : " << it2 << endl;
                }
                i++;
            }
            */
        }
    }
    return pla_paralel;
}

void firstEncodingVisitor::r_dumpSolution(int t){

    // treiem per pantalla el valor de les variables enteres i booleanes

    /*
    // DEBUG
    cout << "bool_v: " << bool_A.size() << endl;
    for(int i = 0; i <= t; i++){
        for(auto var : bool_A){
            string v = var->toString(1);
            string str = search_and_replace(v,"@",std::to_string(i));
            str = search_and_replace(str,"#",std::to_string(i+1));
            cout << "bool_v:" << str << "==" << solver->modelVarBool(str) << endl;
        }    
    }    

    cout << "int_v : " << int_A.size() << endl;
    for(int i = 0; i <= t; i++){
        for(auto var : int_A){
            string v = var->toString(1);
            string str = search_and_replace(v,"@",std::to_string(i));
            str = search_and_replace(str,"#",std::to_string(i+1));
            cout << "int_v:" << str << "==" << solver->modelVarInt(str) << endl;
        }    
    }*/

    // treiem el plan en el format del VAL cap a fitxer per despres poder ser validat
    if(plan_filename != ""){ 
        std::function<vector<string>(string, string)> explode;
        explode = [&](string inputstring, string delimiter)-> vector<string> {
            vector<string> explodes;
            inputstring.append(delimiter);
            while(inputstring.find(delimiter)!=string::npos){
                explodes.push_back(inputstring.substr(0, inputstring.find(delimiter)));
                inputstring.erase(inputstring.begin(), inputstring.begin() + 
                        inputstring.find(delimiter)+delimiter.size());
            }
            return explodes;
        };

        // recuperem en un vector de conjunts les accions que s'executen a cada instant de temps
        std::vector< std::vector<string> > accions_t(t + 1);
        for(int i = 0; i <= t; i++){
            for(auto var : pO_vars){
                string v = var->toString(1);
                v = search_and_replace(v,"@",std::to_string(i));
                long val = r_solver->modelVarInt(v);
                if(val == 1){
                    vector<string> exploded = explode(v,"__");
                    int t = stoi(exploded.back());
                    accions_t[t].push_back(v);
                }
            }
        }

		cout << "Pla relaxat paralel:" << endl;
        // escrivim el fitxer de plan paralel
        for(int i = 0; i <= t; i++){
            for(const auto acc : accions_t[i]){
                cout << i << ": (";
                vector<string> exploded = explode(acc,"__");
                // fem un shiftat de 1 per evitar imprimir l'instant de temps _t
                for(unsigned int j = 0;j < exploded.size() - 1; j++){
                    cout << exploded[j] << " ";
                }
                cout << ") [1]" << endl;
            }
        }
		cout << endl;


        // linealitzem les accions, ordenant-les dins de cada TS
        accions_t = sequentializeActions(accions_t);

		cout << "Pla relaxat lineal:" << endl;
        // escrivim el fitxer de plan lineal 
        int lineal_t = 0; 
        for(int i = 0; i <= t; i++){
            for(const auto acc : accions_t[i]){
                cout << lineal_t << ": (";
                vector<string> exploded = explode(acc,"__");
                // fem un shiftat de 1 per evitar imprimir l'instant de temps _t
                for(unsigned int j = 0;j < exploded.size() - 1; j++){
                    cout << exploded[j] << " ";
                }
                cout << ") [1]" << endl;
                lineal_t++;
            }
        }
		cout << endl;
    }    
}

void firstEncodingVisitor::dumpSolution(int t){
    // treiem per pantalla el valor de les variables enteres i booleanes

    // DEBUG
    /*
    cout << "bool_v: " << bool_A.size() << endl;
    for(int i = 0; i <= t; i++){
        for(auto var : bool_A){
            string v = var->toString(1);
            string str = search_and_replace(v,"@",std::to_string(i));
            str = search_and_replace(str,"#",std::to_string(i+1));
            cout << "bool_v:" << str << "==" << solver->modelVarBool(str) << endl;
        }    
    }    

    cout << "int_v : " << int_A.size() << endl;
    for(int i = 0; i <= t; i++){
        for(auto var : int_A){
            string v = var->toString(1);
            string str = search_and_replace(v,"@",std::to_string(i));
            str = search_and_replace(str,"#",std::to_string(i+1));
            cout << "int_v:" << str << "==" << solver->modelVarInt(str) << endl;
        }    
    }
    */

    // treiem el plan en el format del VAL cap a fitxer per despres poder ser validat
    if(plan_filename != ""){ 
        std::function<vector<string>(string, string)> explode;
        explode = [&](string inputstring, string delimiter)-> vector<string> {
            vector<string> explodes;
            inputstring.append(delimiter);
            while(inputstring.find(delimiter)!=string::npos){
                explodes.push_back(inputstring.substr(0, inputstring.find(delimiter)));
                inputstring.erase(inputstring.begin(), inputstring.begin() + 
                        inputstring.find(delimiter)+delimiter.size());
            }
            return explodes;
        };

        // recuperem en un vector de conjunts les accions que s'executen a cada instant de temps
        std::vector< std::vector<string> > accions_t(t + 1);
        for(int i = 0; i <= t; i++){
            for(auto var : pO_vars){
                string v = var->toString(1);
                v = search_and_replace(v,"@",std::to_string(i));
                long val = solver->modelVarInt(v);
                if(val == 1){
                    vector<string> exploded = explode(v,"__");
                    int t = stoi(exploded.back());
                    accions_t[t].push_back(v);
                }
            }
        }

		cout << "Pla paralel:" << endl;
        // escrivim el fitxer de plan paralel
        ofstream f_sortida;
        f_sortida.open(plan_filename + ".plan", ios::trunc | ios::out);
        for(int i = 0; i <= t; i++){
            for(const auto acc : accions_t[i]){
                f_sortida << i << ": (";
                cout << i << ": (";
                vector<string> exploded = explode(acc,"__");
                // fem un shiftat de 1 per evitar imprimir l'instant de temps _t
                for(unsigned int j = 0;j < exploded.size() - 1; j++){
                    f_sortida << exploded[j];
                    cout << exploded[j];
                    if(j != exploded.size() - 2){  f_sortida << " "; cout << " "; }
                }
                f_sortida << ") [1]" << endl;
                cout << ") [1]" << endl;
            }
        }
        f_sortida.close();
		cout << endl;


        // linealitzem les accions, ordenant-les dins de cada TS
        accions_t = sequentializeActions(accions_t);

		cout << "Pla lineal:" << endl;
        // escrivim el fitxer de plan lineal 
        ofstream f_sortida_lineal;
        f_sortida_lineal.open(plan_filename + "_lineal.plan",ios::trunc | ios::out);
        int lineal_t = 0; 
        for(int i = 0; i <= t; i++){
            for(const auto acc : accions_t[i]){
                f_sortida_lineal << lineal_t << ": (";
                cout << lineal_t << ": (";
                vector<string> exploded = explode(acc,"__");
                // fem un shiftat de 1 per evitar imprimir l'instant de temps _t
                for(unsigned int j = 0;j < exploded.size() - 1; j++){
                    f_sortida_lineal << exploded[j];
                    cout << exploded[j];
                    if(j != exploded.size() - 2){ f_sortida_lineal << " "; cout << " "; }
                }
                f_sortida_lineal << ") [1]" << endl;
                cout << ") [1]" << endl;
                lineal_t++;
            }
        }
        f_sortida_lineal.close();
		cout << endl;
    }    
}

std::vector<string> firstEncodingVisitor::explode(string inputstring, string delimiter){
    vector<string> explodes;
    inputstring.append(delimiter);
    while(inputstring.find(delimiter)!=string::npos){
        explodes.push_back(inputstring.substr(0, inputstring.find(delimiter)));
        inputstring.erase(inputstring.begin(), inputstring.begin() + 
                inputstring.find(delimiter)+delimiter.size());
    }
    return explodes;
}

std::vector< std::vector<string> > firstEncodingVisitor::sequentializeActions(std::vector< std::vector<string> > accions_t){

    int t = accions_t.size() - 1;
    // linealitzem les accions
    // ----------------------------
    // per cada instant de temps, si hi tenim varies accions, fem el graf parcial d'afectacio
    // només amb les accions que s'executen en aquell instant de temps. Amb aquest graf, l'ordre
    // correcte sera el topological order al revés.
    // (http://en.wikipedia.org/wiki/Topological_sorting)
    for(int i = 0; i <= t; i++){

        // si tenim 2 o mes accions val la pena buscar un ordre
        if(accions_t[i].size() > 1){

            std::map<string,int> nom_idx;
            std::map<int,string> idx_nom;
            std::vector< std::vector< bool > > graph(accions_t[i].size(), std::vector<bool>(accions_t[i].size(),false));

            // lliguem idx dels vectors amb nom de les accions
            int idx_tmp = 0;
            for(const auto nom : accions_t[i]){
                //cout << nom << endl;
                nom_idx[nom] = idx_tmp;
                idx_nom[idx_tmp] = nom;
                idx_tmp++;
            }

            // enlloc de recorrer despres tota la matriu per saber nodes que no tenen 
            // arestes entrants, les considerem primerament totes com a que tenen arestes no entrants
            // i despres a mesura que migrem el graf les anem eliminant segons afegim arestes.
            std::vector<int> pre_S(accions_t[i].size(),0);

            // emplenem la matriu
            for(const auto acc1 : accions_t[i]){
                for(const auto acc2 : accions_t[i]){
                    if(acc1 != acc2){ // si no es la mateixa accio
                        // netejem
                        string cacc1,cacc2;

                        vector<string> exploded = explode(acc1,"__");
                        for(unsigned int it = 0; it < exploded.size() - 1; it ++){
                            cacc1 += exploded[it] + "__";
                        } cacc1 += "@";

                        exploded = explode(acc2,"__");
                        for(unsigned int it = 0; it < exploded.size() - 1; it ++){
                            cacc2 += exploded[it] + "__";
                        } cacc2 += "@";

                        // i si tenen conexio afegim
                        if(graph_inc[cacc1].count(std::make_pair("integer",cacc2)) == 1 || 
                                graph_inc[cacc1].count(std::make_pair("boolean",cacc2)) == 1){
                            //cout << cacc1 << " afecta a " << cacc2 << " , afegim a matriu " << endl;
                            graph[nom_idx[acc1]][nom_idx[acc2]] = true;
                            pre_S[nom_idx[acc2]] += 1;
                        }
                    }
                }
            }

            // aqui fem el topological order!
            // /////////////////////////////
            std::vector<string> L; // Empty list that will contain the sorted elements
            std::vector<string> S; // Set of all nodes with no incoming edges

            // S l'emplenem de les columnes buides, osigui, dels nodes que no tenen arestes entrants
            for(unsigned int i = 0; i < pre_S.size(); i++){
                if(pre_S[i] == 0){
                    S.push_back(idx_nom[i]); 
                }
            }

            while(S.size() > 0) {
                string n = S.back();
                S.pop_back();
                L.push_back(n);

                for(unsigned int j = 0; j < graph.size(); j++){
                    if(graph[nom_idx[n]][j]){
                        string m = idx_nom[j];
                        graph[nom_idx[n]][j] = false;
                        pre_S[j] -= 1;

                        if(pre_S[j] == 0){
                            S.push_back(m);
                        }
                    }
                }
            }

            /*
               cout << "matrix: " << endl;
               for(const auto fila : graph){
               for(const auto columna : fila){
               cout << columna << " ";
               } cout << endl;
               }
               cout << endl;


               cout << "timestep " << i << " (L) :" << endl;
               for(const auto acc : L){
               cout << acc << endl;
               }
               cout << endl;
               */

            // de fet , necessitem el reves de l'ordre topologic
            //cout << " ACCIONS ABANS DE SUBSTITUIR: " << accions_t[i].size() << endl;
            std::reverse(L.begin(),L.end());
            accions_t[i] = L;
            //cout << " ACCIONS DESPRES DE SUBSTITUIR: " << accions_t[i].size() << endl;
            //cout << endl << endl << endl;
        }
    }
    return accions_t;
}

void firstEncodingVisitor::debug(bool verbose){

    cout << "int vars : " << int_A.size() << endl;
    if(verbose){
        for(const auto str: int_A){
            auto foobar = static_pointer_cast<Functor>(str);
            if(foobar->getStatic()){
                cout << "   (int) " << foobar->toString() << " (static) " << endl;
            } else {
                cout << "   (int) " << foobar->toString() << endl;
            }
        } 
    }

    cout << "bool vars : " << bool_A.size() << endl;
    if(verbose){
        for(const auto str: bool_A){
            auto foobar = static_pointer_cast<Functor>(str);
            if(foobar->getStatic()){
                cout << "   (bool) " << foobar->toString() << " (static) " << endl;
            } else {
                cout << "   (bool) " << foobar->toString() << endl;
            }
        }
    }

    cout << "one: " << one.size() << endl;
    if(verbose){ for(const auto str: one){ cout << "(1)    " << str << endl; } }

    cout << "two: " << two.size() << endl;
    if(verbose){ for(const auto str: two){ cout << "(2)    " << str << endl; } } 

    cout << "three: " << three.size() << endl;
    if(verbose){ for(const auto str: three){ cout << "(3)    " << str << endl; } }

    cout << "four: " << four.size() << endl;
    if(verbose){ for(const auto str: four){ cout << "(4)    " << str << endl; } } 

    cout << "parallelism: " << act_per_step.size() << endl;
    if(verbose){ for(const auto str: act_per_step){ cout << "(A)    " << str << endl; } }

    cout << "s_inits: " << s_inits.size() << endl;
    if(verbose){ for(const auto str: s_inits){ cout << "(I)    " << str << endl; } }
}

