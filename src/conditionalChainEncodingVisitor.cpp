#include "conditionalChainEncodingVisitor.h"

using namespace std;

// cridem al pare, i ale, fet
// amb la unica notorietat que tallem sempre els cicles per afegir la mutex (la "cut_cycles" flag)
// aixi tindrem un graf d'incompatibilitats buit amb aquest encoding.
conditionalChainEncodingVisitor::conditionalChainEncodingVisitor(string chainism, string exists_order, string exists_enc, string int_incompat_type, string plan_file, string int_func_dom, int alg_solv, int cycles_flag, int mutex_flag,int sorting_network,int decide_flag) : firstEncodingVisitor(chainism, exists_order, exists_enc, int_incompat_type, plan_file, int_func_dom, alg_solv, cycles_flag , mutex_flag,sorting_network,decide_flag) {

}

conditionalChainEncodingVisitor::~conditionalChainEncodingVisitor(){
}

void conditionalChainEncodingVisitor::visitAction( shared_ptr<Action> ptr){

    // LAMBDAS
    // ----------------------------------------
    // lambda per a extreure totes les variables enteres de les precondicions
    //
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
                    // agafem el primer fill d'aquestes pq tenen la forma: (operacio (sobreque) (enquan))
                case functor_type::T_OPERATION: 
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
    extract_all_bools = [&](shared_ptr<Thing> tree, shared_ptr<vector<shared_ptr<Functor> > > bool_v) {
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
                                integer_fd_preconditions[f_tree->toString()].insert(std::make_pair(fd_id,ptr));
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

    // END LAMBDAS
    // ----------------------------------------
    stringstream ss;

    if(ptr->isInstanced()){
        // Emplenem indexos!
        // ------------------------------------------
        bool_recur(ptr->getRawPrecondition());
        int_recur(ptr->getRawPrecondition(),0,false);

        // afegim les vars que toquen a on toquen per despres
        // generar l'encoding
        // ------------------------------------------
        bool_A.push_back(shared_ptr<Action>(ptr));
        O_vars.push_back(ptr->toString(1));
        pO_vars.push_back(ptr);

        //////////////////////////////////
        // ara acabem d'afegir a les chains les variables que no es modifiquen pero es consulten.
        shared_ptr<vector<shared_ptr<Functor> > > int_vars_pre  = std::make_shared<vector<shared_ptr<Functor> > >();
        shared_ptr<vector<shared_ptr<Functor> > > bool_vars_pre = std::make_shared<vector<shared_ptr<Functor> > >();
        extract_all_ints(ptr->getRawPrecondition(),int_vars_pre);
        extract_all_bools(ptr->getRawPrecondition(),bool_vars_pre);
        // passem totes les vars que es consulten a la precondicio a un std::set, per a poder fer la resta 
        std::set<string> vars_consult;
        for(const auto elem : *int_vars_pre){
            //cout << "insert int " << elem->toString() << endl;
            vars_consult.insert(elem->toString()); str2func[elem->toString()] = elem;
        }
        for(const auto elem : *bool_vars_pre){
            //cout << "insert bool " << elem->toString() << endl;
            vars_consult.insert(elem->toString()); str2func[elem->toString()] = elem;
        }
        //////////////////////////////////

        // Per cada f->d ...
        std::set<string> vars_modif;
        for(int i = 0; i < ptr->getNFDs(); i++){
            auto fid = ptr->getFD(i);
            auto precond = fid.first;
            auto efect   = fid.second;

            // Emplenem indexos, ara dels efectes
            int_recur(precond,i,true); 


            // estem tractant amb un efecte compost?. En cas que si
            // agafem tots els subefectes i els empilem per a tractar,
            // en cas que no el tractem sol
            std::vector< std::shared_ptr<Thing> > elem_a_tractar;
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
                if(efecte->type == functor_type::T_OPERATION){
                    auto efecte_op = static_pointer_cast<Functor>(efecte);

                    if(efecte_op->getName() == "increase" ||
                            efecte_op->getName() == "decrease" ||
                            efecte_op->getName() == "assign" ){

                        int_epcs[efecte_op->toString(2)].push_back(
                                make_tuple(ptr,precond,efecte));
                        int_modif[efecte_op->getParam(0)->toString(1)].push_back(
                                make_tuple(ptr,precond,efecte_op->getParam(0)));

                        // Creem la var i l'afegim a la cadena corresponent
                        // ------------------------------------------------
                        auto var_eff = efecte_op->getParam(0);

                        // Creem la primera var, de la chain, la que no esta vinculada a
                        // cap accio, es nomes per a que la primera accio la referencii
                        if(chains.count(var_eff->toString()) == 0){
                            shared_ptr<Function> var_tmp = std::make_shared<Function>();
                            var_tmp->setName(getRandomName("par_enc"));
                            int_A.push_back(var_tmp);
                            auto var_eff = efecte_op->getParam(0);
                            chains[var_eff->toString()].push_back(make_tuple(
                                        shared_ptr<Action>(), var_tmp, shared_ptr<Thing>(), 0));
                        }

                        // ara si, creem la var i l'afegim
                        shared_ptr<Function> var_tmp = std::make_shared<Function>();
                        var_tmp->setName(getRandomName("par_enc"));
                        int_A.push_back(var_tmp);
                        chains[var_eff->toString()].push_back(make_tuple(ptr,var_tmp,efecte_op,i));

                        // ja que afegim l'accio a una chain com a accio modificadora, si tambe la consultavem la treiem de la
                        // llista, ja que te preferencia el fet de que sigui modificadora a nomes consultadora 
                        if(vars_consult.count(var_eff->toString()) > 0){ vars_consult.erase(var_eff->toString()); }

                        // emplenem l'estructura auxiliar per despres poder recuperar l'objecte a partir de una str.  
                        str2func[var_eff->toString()] = static_pointer_cast<Function>(var_eff); 
                        // ------------------------------------------------

                    } else if( efecte_op->getName() == "not" ){
                        bool_epcs[efecte_op->toString(2)].push_back(make_pair(ptr,precond));

                        // Creem la var i l'afegim a la cadena corresponent
                        // ------------------------------------------------
                        auto var_eff = efecte_op->getParam(0);

                        // Creem la primera var, de la chain, la que no esta vinculada a
                        // cap accio, es nomes per a que la primera accio la referencii
                        if(chains.count(var_eff->toString()) == 0){
                            shared_ptr<Predicate> var_tmp = std::make_shared<Predicate>();
                            var_tmp->setName(getRandomName("par_enc"));
                            bool_A.push_back(var_tmp);
                            auto var_eff = efecte_op->getParam(0);
                            chains[var_eff->toString()].push_back(make_tuple(
                                        shared_ptr<Action>(), var_tmp, shared_ptr<Thing>(), 0));
                        }

                        // ara si, creem la var i l'afegim
                        shared_ptr<Predicate> var_tmp = std::make_shared<Predicate>();
                        var_tmp->setName(getRandomName("par_enc"));
                        bool_A.push_back(var_tmp);
                        chains[var_eff->toString()].push_back(make_tuple(ptr,var_tmp,efecte_op,i));

                        // ja que afegim l'accio a una chain com a accio modificadora, si tambe la consultavem la treiem de la
                        // llista, ja que te preferencia el fet de que sigui modificadora a nomes consultadora 
                        if(vars_consult.count(var_eff->toString()) > 0){ vars_consult.erase(var_eff->toString()); }

                        // emplenem l'estructura auxiliar per despres poder recuperar l'objecte a partir de una str.  
                        str2func[var_eff->toString()] = static_pointer_cast<Predicate>(var_eff); 
                        // ------------------------------------------------

                        //cout << "+b epc [" << efecte_op->toString(2) << "] = ";
                        //cout << precond->toString() << endl;
                    } else {
                        cout << "ERR? " << efecte_op->toString(2) << __FILE__ << " ";
                        cout <<  __LINE__ << " " << __func__ << endl;
                    }
                } else if(efecte->type == functor_type::T_PREDICATE){

                    shared_ptr<Predicate> efecte_op = static_pointer_cast<Predicate>(efecte);

                    bool_epcs[efecte_op->toString(2)].push_back(make_pair(ptr,precond));
                    //cout << "+b epc [" << efecte->toString(2) << "] = ";
                    //cout << precond->toString() << endl;

                    // Creem la var i l'afegim a la cadena corresponent
                    // ------------------------------------------------
                    auto var_eff = efecte_op;

                    // Creem la primera var, de la chain, la que no esta vinculada a
                    // cap accio, es nomes per a que la primera accio la referencii
                    if(chains.count(var_eff->toString()) == 0){
                        shared_ptr<Predicate> var_tmp = std::make_shared<Predicate>();
                        var_tmp->setName(getRandomName("par_enc"));
                        bool_A.push_back(var_tmp);
                        //auto var_eff = efecte_op->getParam(0);
                        chains[var_eff->toString()].push_back(make_tuple(
                                    shared_ptr<Action>(), var_tmp, shared_ptr<Thing>(), 0));
                          //cout << "chains[" << var_eff->toString() << "].push_back(make_tuple(NULL," << var_tmp->toString() << "NULL,0))" << endl;
                    }

                    // ara si, creem la var i l'afegim
                    shared_ptr<Predicate> var_tmp = std::make_shared<Predicate>();
                    var_tmp->setName(getRandomName("par_enc"));
                    bool_A.push_back(var_tmp);
                    chains[var_eff->toString()].push_back(make_tuple(ptr,var_tmp,efecte_op,i));
                    //cout << "chains[" << var_eff->toString() << "].push_back(make_tuple("<< ptr->toString() << "," << var_tmp->toString() << ","<< efecte_op->toString(1)<<"," <<i <<"))" << endl;

                    // ja que afegim l'accio a una chain com a accio modificadora, si tambe la consultavem la treiem de la
                    // llista, ja que te preferencia el fet de que sigui modificadora a nomes consultadora 
                    if(vars_consult.count(var_eff->toString()) > 0){ vars_consult.erase(var_eff->toString()); }

                    // emplenem l'estructura auxiliar per despres poder recuperar l'objecte a partir de una str.  
                    str2func[var_eff->toString()] = static_pointer_cast<Predicate>(var_eff); 
                    // ------------------------------------------------
                }
            }
        }

        // ara per tota variable que es consulti pero no es modifiqui, l'afegim a la 
        // cadena corresponent.
        //cout << ptr->toString() << " te " << vars_consult.size();
        //cout << " variables que es consulten pero que no es modifiquen!!!:" << endl;

        for(const auto var_per_chain : vars_consult){
            // si encara no hi havia element inicial a la cadena, l'afegim primer
            // i despres l'accio que consulti

            // es una var entera
            if( str2func[var_per_chain]->type == functor_type::T_FUNCTION ){
                if(chains[var_per_chain].size() == 0){
                    shared_ptr<Function> var_tmp = std::make_shared<Function>();
                    var_tmp->setName(getRandomName("par_enc"));
                    int_A.push_back(var_tmp);
                    chains[var_per_chain].push_back(make_tuple(
                                shared_ptr<Action>(), var_tmp, shared_ptr<Thing>(), 0));
                }

                chains[var_per_chain].push_back(make_tuple(
                            shared_ptr<Action>(ptr), shared_ptr<Function>(),
                            shared_ptr<Thing>(), 0));

                // es una var booleana
            } else if( str2func[var_per_chain]->type == functor_type::T_PREDICATE ){
                if(chains[var_per_chain].size() == 0){
                    shared_ptr<Predicate> var_tmp = std::make_shared<Predicate>();
                    var_tmp->setName(getRandomName("par_enc"));
                    bool_A.push_back(var_tmp);
                    chains[var_per_chain].push_back(make_tuple(
                                shared_ptr<Action>(), var_tmp, shared_ptr<Thing>(), 0));
                }

                chains[var_per_chain].push_back(make_tuple(
                            shared_ptr<Action>(ptr), shared_ptr<Predicate>(),
                            shared_ptr<Thing>(), 0));
            } else {
                // ES UNA CONSTANT ENTERA, per tant podem ignorar
            }
        }
    }
    else {
        // es una raw action
        raw_actions.push_back(ptr);
    }
}

/*!
 * Les chains estan creades i ordenades
 */
void conditionalChainEncodingVisitor::generate1(){

    // lambda per a extreure totes les variables enteres de les precondicions
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
                // agafem el primer fill d'aquestes pq tenen la forma: (operacio (sobreque) (enquan))
                case functor_type::T_OPERATION: 
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
    extract_all_bools = [&](shared_ptr<Thing> tree, shared_ptr<vector<shared_ptr<Functor> > > bool_v) {
        shared_ptr<Functor> f_tree;
        if( tree->type == functor_type::T_PREDICATE || 
                tree->type == functor_type::T_OPERATION){
            f_tree = static_pointer_cast<Functor>(tree);
            switch(tree->type) {
                case functor_type::T_PREDICATE:
                    bool_v->push_back(static_pointer_cast<Predicate>(f_tree));
                    break;
                // agafem el primer fill d'aquestes pq tenen la forma: (operacio (sobreque) (enquan))
                case functor_type::T_OPERATION: 
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


    stringstream ss;

    for(const auto ptr : pO_vars){

        // treiem totes les vars de la precondicio
        shared_ptr<vector<shared_ptr<Functor> > >   vars  = std::make_shared<vector<shared_ptr<Functor> > >();
        extract_all_ints(ptr->getRawPrecondition(),vars);
        extract_all_bools(ptr->getRawPrecondition(),vars);

        // Encoding , part 1. Una accio implica que es compleixen les seves precondicions
        // 1 - o_t -> p_t 
        string o_t = ptr->getRawPrecondition()->toString(1);
        // per cada variable que apareix a la precondicio, necessitem saber si aquesta mateixa
        // funcio la modifica. En cas de que si, substituim la variable de la precondicio per la
        // temporal de la chain-1. Sino per la que te, ja que sera una operacio de consulta.
        for(const auto ptr_var : *vars){
            
            // si aquesta var pertany a una chain ...
            if(chains.count(ptr_var->toString()) > 0){
                string idx = ptr_var->toString();
                         
                bool trobat = false;
                int i = 1;

                //fem un recorregut per el vector i busquem aquesta accio
                if(std::get<0>(chains[idx][i])->toString(1) == ptr->toString(1)){ trobat = true; }
                while(!trobat && i < chains[idx].size()){
                    if(std::get<0>(chains[idx][i])->toString(1) == ptr->toString(1)){
                        trobat = true;
                    } else { i++; }
                }

                // si l'hem trobat
                if(trobat){
                    // i l'efecte es NULL, senyal que es de consulta
                    if(std::get<2>(chains[idx][i]) == NULL){
                        o_t = search_and_replace(o_t,
                            ptr_var->toString(1),std::get<1>(chains[idx][i])->toString(1));
                        //cout << "substituim " << ptr_var->toString(1) << " per ";
                        //cout << std::get<1>(chains[idx][i])->toString(1) << endl;

                    // si l'efecte no es NULL, es modificacio
                    } else {
                        // si aquesta accio no modifica la var, hem de canviar
                        // la variable per el  t+1 aixi en certa manera,
                        // estarem forçant l'execucio de les accions que toquen
                        // variables en una chain abans que les que nomes les
                        // consulten
                        o_t = search_and_replace(o_t,
                            ptr_var->toString(1),std::get<1>(chains[idx][i-1])->toString(1));
                    }

                    // si no hem trobat 
                } else {
                    cout << "ERR!! no hauria de passar! " << endl;
                    assert(false);
                }
            }
        }

        // per cada variable entera que aparegui a la precondicio, en cas de que aquesta accio la 
        // modifiqui, la substituim per la que toca.
        ss << "impl(" << ptr->toString(1) << "," << o_t << ")"; 
        one.push_back(ss.str());
        ss.str(string());

    }
}

// tenim que l'execucio de l'accio i la precondicio condicional implica els efectes
// condicionals. ( els efectes incondicionals es un f->d on f <=> true )
// 2 - (o_t /\ f_t) -> d_t+1
void conditionalChainEncodingVisitor::generate2(){
    stringstream ss;

    // si trobem un efecte que no esta en una chain, el posem normal ....
    for(const auto ptr : pO_vars){
        // Per cada f->d ...
        for(int i = 0; i < ptr->getNFDs(); i++){
            auto fid = ptr->getFD(i);
            auto precond = fid.first;
            auto efect   = fid.second;

            // estem tractant amb un efecte compost?. En cas que si
            // agafem tots els subefectes i els empilem per a tractar,
            // en cas que no el tractem sol
            std::vector< std::shared_ptr<Thing> > elem_a_tractar;
            if(efect->type == functor_type::T_OPERATION &&
                    efect->getName() == "and"){
                auto efect_f = static_pointer_cast<Functor>(efect);
                for(int j = 0; j < efect_f->getNParams(); j++){
                    elem_a_tractar.push_back(efect_f->getParam(j));
                }
            } else {
                elem_a_tractar.push_back(efect);
            }

            // per cada efecte a tractar
            for(const auto ptr_effect : elem_a_tractar){

                // si es una operacio o un predicat
                if(
                        (ptr_effect->type == functor_type::T_OPERATION && (ptr_effect->getName() == "increase" ||
                            ptr_effect->getName() == "decrease" || ptr_effect->getName() == "assign" || 
                            ptr_effect->getName() == "not")) || ptr_effect->type == functor_type::T_PREDICATE){

                    string a_que;
                    if(ptr_effect->type != functor_type::T_PREDICATE){
                       a_que = static_pointer_cast<Functor>(ptr_effect)->getParam(0)->toString(); 
                    } else {
                       a_que = static_pointer_cast<Functor>(ptr_effect)->toString(); 
                    }
                    // si l'efecte modifica una variable que no pertany a cap chain, ho posem tal qual.
                    if(chains.count(a_que) == 0){
                        ss << "impl(and(" << ptr->toString(1) << "," << precond->toString(1) << ")," << efect->toString(2) << ")";
                        two.push_back(ss.str());
                        ss.str(string());
                    }

                }
            }
        }
    }
}

void conditionalChainEncodingVisitor::generateChains(){
    stringstream ss;

    cout << " Encoding: " << endl;

    for(const auto elem : chains){
        auto chain = elem.second;
        for(unsigned int idx = 0; idx < chain.size(); idx++){

            // primer element de la cadena
            if(idx == 0){
                ss << "=(" << str2func[elem.first]->toString(1) << ",";
                ss << get<1>(chain[idx])->toString(1) << ")";
                two.push_back(ss.str());
                //cout << ss.str() << endl;
                ss.str(string());

            // si no es una operacio de consulta ...
            } else if(get<2>(chain[idx]) != NULL){
                // element intermig de la cadena
                auto ptr_act = get<0>(chain[idx]);
                int fd = get<3>(chain[idx]);
                auto ptr_eff = static_pointer_cast<Functor>(get<2>(chain[idx]));
                auto v_last  = get<1>(chain[idx-1]);
                auto v_act   = get<1>(chain[idx]);

                // TODO f de d
                auto fid = ptr_act->getFD(fd);
                ss << "impl(and(" << ptr_act->toString(1) << "," << fid.first->toString(1) << "),";
                if(ptr_eff->getName() == "increase"){
                    ss << "=(" << v_act->toString(1) << ",+(";
                    ss << v_last->toString(1) << ",";
                    ss << ptr_eff->getParam(1)->toString(1) << "))";
                } else if(ptr_eff->getName() == "decrease"){
                    ss << "=(" << v_act->toString(1) << ",-(";
                    ss << v_last->toString(1) << ",";
                    ss << ptr_eff->getParam(1)->toString(1) << "))";
                } else if(ptr_eff->getName() == "assign"){
                    ss << "=(" << v_act->toString(1) << ",";
                    ss << ptr_eff->getParam(1)->toString(1) << ")";
                } else if(ptr_eff->type == functor_type::T_OPERATION){
                  // es un NOT
                    ss << "=(" << v_act->toString(1) << ",false)";
                } else if(ptr_eff->type == functor_type::T_PREDICATE){
                  // es un predicat
                    ss << "=(" << v_act->toString(1) << ",true)";
                }
                ss << ")";
                two.push_back(ss.str());
                //cout << ss.str() << endl;
                ss.str(string());

                // not
                ss << "impl(not(" << ptr_act->toString(1) << "),";
                ss << "=(" << v_last->toString(1) << "," << v_act->toString(1);
                ss << "))";
                two.push_back(ss.str());
                //cout << ss.str() << endl;
                ss.str(string());

            } else {
                // son operacions de consulta, per tant no hem de fer res en aquest cas crec.
            }

            if(idx == chain.size() - 1){
                // ultim element de la cadena
                ss << "=(" << str2func[elem.first]->toString(2) << ",";
                ss << get<1>(chain[idx])->toString(1) << ")";
                two.push_back(ss.str());
                //cout << ss.str() << endl;
                ss.str(string());
            }
        }
    }
}

void conditionalChainEncodingVisitor::encodeTheRestPlease(){
    stringstream ss;

    // constraint 1 per el problema relaxed: o_t -> p_t
    for(const auto ptr : pO_vars){
        ss << "impl(" << ptr->toString(1,true) << "," << ptr->getRawPrecondition()->toString(1,true) << ")";
        relaxed_one.push_back(ss.str());
        ss.str(string());
        for(int i = 0; i < ptr->getNFDs(); i++){
            auto fid = ptr->getFD(i);
            auto precond = fid.first;
            auto efect   = fid.second;

            //constraint 2 per el problema relaxed: o_t /\ f_t -> d_t+1
            ss << "impl(and(" << ptr->toString(1,true)  << "," << precond->toString(1,true) << ")," << efect->toString(2,true) << ")" << endl;
            relaxed_two.push_back(ss.str());
            ss.str(string());
        }
    }

    // hem de generar frame axiom boolea:
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
		relaxed_three.push_back(ss.str());
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
		relaxed_three.push_back(ss.str());
		ss.str(string());
	} 
    // parallelism es fa dins
    // -----------------------

	// primer de tot codifiquem aixo perque sino no tenim les estructures de dfsnum i tal
	// preparades, i per tant no podem triar un ordre per les accions

	encodeParallelism();

  // primer eliminem les chains que nomes tenen element inicial i consultes
  std::vector<string> chains_a_eliminar;
  for(const auto chain : chains){
    bool elim = true;
    int i = 0;

    while(elim && i < chain.second.size()){
      // el que tenen en comu el primer element i les operacions de consulta
      // es que tenen el camp 2 (l'efecte en si que modifica) de la tupla  a NULL.
      if( std::get<2>(chain.second[i]) != NULL){
        elim = false;
      }
      i++;
    }

    // si nomes tenim una operacio, sigui la que sigui, la petem ... 
    // Fem check de size 2 ja que segur que tenim el HEAD, i una operacio...
    // DEBUG DEBUG HACK HACK
    // DEBUG DEBUG HACK HACK
    // DEBUG DEBUG HACK HACK
    // DEBUG DEBUG HACK HACK
    //if(chain.second.size() == 2){ elim = true; }
    // DEBUG DEBUG HACK HACK
    // DEBUG DEBUG HACK HACK
    // DEBUG DEBUG HACK HACK

    // si no hem trobat cap operacio de modificacio ...
    if(elim){ chains_a_eliminar.push_back(chain.first); }
  }
  for(const auto rmrf : chains_a_eliminar){ chains.erase(rmrf); }

  // Ordenem totes les llistes de chains per a que segueixin el mateix ordre. Osigui,
  // es modifiqui la variable que es modifiqui, a_foo vagi abans que a_bar a la llista de tuples.
  /*for(auto v : dfsnum){ cout << v.first << " -> " << v.second << endl; } cout << endl;*/

  for(auto v : chains){
    std::sort(begin(chains[v.first]), end(chains[v.first]), 
        [&](std::tuple<
          std::shared_ptr<Action>,
          std::shared_ptr<Functor>,
          std::shared_ptr<Thing>,int> const &e1, 
          std::tuple<
          std::shared_ptr<Action>,
          std::shared_ptr<Functor>,
          std::shared_ptr<Thing>,int> const &e2) {
        if(std::get<0>(e1) == NULL){ return true;}
        if(std::get<0>(e2) == NULL){ return false;}
        return (dfsnum[std::get<0>(e1)->toString(1)] < dfsnum[std::get<0>(e2)->toString(1)]); 
        });
  }
  //dumpChains();

  // assignem les variables temporals a les operacions de consulta. Fins ara les 
  // operacions de consulta a una chain tenien en el camp de la variable temporal
  // creada un NULL. Ara el que farem sera assignar-hi la variable temporal ultima
  // segons l'ordre
  //
  // TODO 
  // no se pq no puc fer la modificacio in-place, he de fer-ho despres de recorrer ...
  //
  std::vector<string> sub1;
  std::vector<int> sub2;
  std::vector<std::shared_ptr<Functor> > sub3;

  for(auto chain : chains){
    // punter a la var anterior. L'inicialitzem a la variable inicial
    auto ptr_ant = get<1>(chain.second[0]);
    int idx = 0;
    while(idx < chain.second.size()){
      auto ring = chain.second[idx];
      // si no te variable temporal, es que es una consulta, i per 
      // tant l'hi assignem l'anterior
      if(get<1>(ring) == NULL){
        sub1.push_back(chain.first);
        sub2.push_back(idx);
        sub3.push_back(ptr_ant);

        // altrament es una modificacio i per tant actualitzem 
        // el punter a la var temporal anterior
      } else {
        ptr_ant = get<1>(ring);
      }
      idx++;
    }
  }

  int idx = 0;
  while(idx < sub1.size()){ get<1>(chains[ sub1[idx] ][ sub2[idx] ]) = sub3[idx]; idx++; }

  //dumpChains();
  generate1();
  generate2();
  generateChains();
  generate4();
  //debug(true);
}

void conditionalChainEncodingVisitor::dumpChains(){
    // DEBUG
    cout << " Dump Chains: " << endl;
    for(const auto elem : chains){
        cout << elem.first << " -> {" << endl;
        for(const auto elem2 : elem.second){
            string f1 = "NULL";
            string f2 = "NULL";
            string f3 = "NULL";
            int dfs_num = -1;
            if(get<0>(elem2) != NULL) { f1 = get<0>(elem2)->toString(1); }
            if(get<0>(elem2) != NULL) { dfs_num = dfsnum[get<0>(elem2)->toString(1)]; }
            if(get<1>(elem2) != NULL) { f2 = get<1>(elem2)->toString(1); }
            if(get<2>(elem2) != NULL) { f3 = get<2>(elem2)->toString(1); }
            cout << "\t? (" << f1 << "," << f2 << "," << f3 << ", order: " << dfs_num << ")" << endl;
        }
        cout << "};" << endl;
    }
}

std::vector< std::vector<string> > conditionalChainEncodingVisitor::sequentializeActions(std::vector< std::vector<string> > accions_t){
    //cout << "SEQUENTIALIZE IN CONDITIONAL!" << endl << endl;
    int t = accions_t.size() - 1;
    // ordre lexicografic que es el que tenim implementat  a la classe
    // conditionalChainEncodingVisitor.h
    for(int i = 0; i <= t; i++){

            /*cout << "abans ordenar t:" << i << endl;
            for(const auto elem : accions_t[i]){
                string a1(elem); if(i < 10){ a1.pop_back();
                } else if(i < 100 && i > 9){ a1.pop_back(); a1.pop_back();
                } else { } a1.push_back('@');
                cout << a1 << ":" << dfsnum[a1] << endl; }*/

        // si tenim 2 o mes accions val la pena buscar un ordre
        if(accions_t[i].size() > 1){

            std::sort(begin(accions_t[i]), end(accions_t[i]), 
                    [&](std::string const &s1, std::string const &s2) {

                    string a1(s1);
                    string a2(s2);

                    if(i < 10){
                        a1.pop_back(); a2.pop_back();
                    } else if(i < 100 && i > 9){
                        a1.pop_back(); a1.pop_back();
                        a2.pop_back(); a2.pop_back();
                    } else {
                        cout << "joder com anem..." << endl; assert(false);
                    }
                    a1.push_back('@');
                    a2.push_back('@');

                    //cout << a1 << " vs " << a2 << endl;
                    return (dfsnum[a1] < dfsnum[a2]); 
                    });
        }
            /*cout << "despres ordenar t:" << i << endl;
            for(const auto elem : accions_t[i]){
                string a1(elem); if(i < 10){ a1.pop_back();
                } else if(i < 100 && i > 9){ a1.pop_back(); a1.pop_back();
                } else { } a1.push_back('@');
                cout << a1 << ":" << dfsnum[a1] << endl; }*/
    }
    return accions_t;
}

