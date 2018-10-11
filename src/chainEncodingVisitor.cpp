#include "chainEncodingVisitor.h"

using namespace std;

// cridem al pare, i ale, fet
chainEncodingVisitor::chainEncodingVisitor(string chainism, string exists_order, string exists_enc, string int_incompat_type, string plan_file, string int_func_dom, int alg_solv, int cycles_flag, int mutex_flag,int sorting_network, int decide_flag) : firstEncodingVisitor(chainism, exists_order, exists_enc, int_incompat_type, plan_file, int_func_dom, alg_solv, cycles_flag, mutex_flag,sorting_network,decide_flag) {

}

chainEncodingVisitor::~chainEncodingVisitor(){
}

void chainEncodingVisitor::visitAction( shared_ptr<Action> ptr){

    // LAMBDAS
    // ----------------------------------------

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

    // END LAMBDAS
    // ----------------------------------------
    stringstream ss;

    if(ptr->isInstanced()){
        //cout << endl << "visitem " << ptr->toString(1) << endl;
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

        // Per cada f->d ...
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

                        // Creem la var i l'afegim a la cadena corresponent
                        // ------------------------------------------------
                        string ret_type = static_pointer_cast<Function>(
                                efecte_op->getParam(0))->getReturnType();

                        //cout << "efecte: " << efecte_op->toString(1);
                        //cout << " var: " << efecte_op->getParam(0)->toString(1);
                        //cout << " te com a tipus valor retorn de: ";
                        //cout << ret_type << endl;

                        // en cas de que sigui un object fluent no te sentit
                        // que fem l'encoding encadenat, per tant ho farem normal
                        // i no l'afegirem a l'index
                        if(ret_type != "number" && ret_type != ""){

                            // 2 - (o_t /\ f_t) -> d_t+1
                            ss << "impl(and(" << ptr->toString(1) << ",";
                            ss << precond->toString(1) << ")," << efecte_op->toString(2) << ")";
                            //cout << ss.str() << endl;
                            two.push_back(ss.str());
                            ss.str(string());

                        // altrement si que es un efecte enter "de veritat" per tant
                        // fem tot el que toca i afegim la var a l'index de cadenes
                        } else {
                            auto var_eff = efecte_op->getParam(0);

                            // Creem la primera var, de la chain, la que no esta vinculada a
                            // cap accio, es nomes per a que la primera accio la referencii
                            if(chains[var_eff->toString()].size() == 0){
                                shared_ptr<Function> var_tmp = std::make_shared<Function>();
                                var_tmp->setName(getRandomName("par_enc"));
                                int_A.push_back(var_tmp);
                                auto var_eff = efecte_op->getParam(0);
                                chains[var_eff->toString()].push_back(make_tuple(
                                            shared_ptr<Action>(),
                                            var_tmp,
                                            shared_ptr<Thing>(),
                                            0));
                            }

                            // ara si, creem la var i l'afegim
                            shared_ptr<Function> var_tmp = std::make_shared<Function>();
                            var_tmp->setName(getRandomName("par_enc"));
                            int_A.push_back(var_tmp);
                            chains[var_eff->toString()].push_back(make_tuple(ptr,var_tmp,efecte_op,i));
                            //cout << "chains[" << var_eff->toString() << "].push_back(make_tuple(" << ptr->toString(1) << "," << var_tmp->toString(1) << "," << efecte_op->toString(1) <<"," << i << "))" << endl;
                            // emplenem l'estructura auxiliar.  podem fer el
                            // cast pq sabem del cert que es una funcio de PDDL
                            str2func[var_eff->toString()] = static_pointer_cast<Function>(var_eff); 
                            // ------------------------------------------------
                        }


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
    }
    else {
        // es una raw action
        raw_actions.push_back(ptr);
    }
}

void chainEncodingVisitor::generate1(){
    stringstream ss;

    for(const auto ptr : pO_vars){
        // Encoding , part 1. Una accio implica que es compleixen les seves precondicions
        // 1 - o_t -> p_t 
        string o_t = ptr->getRawPrecondition()->toString(1);
        ss << "impl(" << ptr->toString(1) << "," << o_t << ")"; 
        one.push_back(ss.str());
        ss.str(string());
    }
}

// tenim que l'execucio de l'accio i la precondicio condicional implica els efectes
// condicionals. ( els efectes incondicionals es un f->d on f <=> true )
// 2 - (o_t /\ f_t) -> d_t+1
void chainEncodingVisitor::generate2(){
    stringstream ss;

    // EFECTES BOOLEANS
    // escupim els efectes booleans
    // ---------------------------------------
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

            // per cada efecte a tractar, l'afegim als indexos corresponents
            for(const auto ptr_effect : elem_a_tractar){
                if( ptr_effect->getName() != "increase" &&
                        // si no es un efecte enter, el fem
                        ptr_effect->getName() != "decrease" &&
                        ptr_effect->getName() != "assign"){
                    ss << "impl(and(" << ptr->toString(1) << "," << precond->toString(1) << ")," << efect->toString(2) << ")";
                    two.push_back(ss.str());
                    ss.str(string());

                }
            }
        }
    }

    // EFECTES ENTERS
    // aqui nomes comprovem fent asserts i afegim l'ultim element de la cadena
    // ---------------------------------------
    for(const auto varchain : chains){
        int idx = 0;
        for(const auto tuple_chain : varchain.second){
            auto ptr_act    = get<0>(tuple_chain);
            auto ptr_tmpvar = get<1>(tuple_chain);
            auto ptr_effect = static_pointer_cast<Functor>(get<2>(tuple_chain));

            // si es el primer te els punters a null, ja que ho fem anar 
            // per la primera var, que no fa referencia a res
            if(idx != 0){
                assert( ptr_effect->getName() == "increase" ||
                        ptr_effect->getName() == "decrease" ||
                        ptr_effect->getName() == "assign" );

                // de moment nomes soportem assignacions directes, o casi directes
                // TODO
                assert(ptr_effect->getNParams() == 2);
                assert(ptr_effect->getParam(0)->type == functor_type::T_FUNCTION); 
                if(ptr_effect->getParam(1)->type == functor_type::T_OPERATION){ cout << ptr_effect->toString(1) << "!!!!!!!!!!" << endl; }
                assert(ptr_effect->getParam(1)->type != functor_type::T_OPERATION); 
            } else {
            }
            idx++;
        }
        // afegim l'ultim element
        shared_ptr<Function> var_tmp = std::make_shared<Function>();
        var_tmp->setName(getRandomName("par_enc"));
        int_A.push_back(var_tmp);
    }
}

void chainEncodingVisitor::generateChains(){
    stringstream ss;

/*    
    cout << " Dump Chains: " << endl;
    for(const auto elem : chains){
        cout << elem.first << " -> {" << endl;
        int idx = 0;
        for(const auto elem2 : elem.second){
            if(idx == 0){
                cout << "\t(NULL," << get<1>(elem2)->toString(1) << ",NULL)" << endl;
            } else {
                cout << "\t(" << get<0>(elem2)->toString(1) << "," << get<1>(elem2)->toString(1) << "," << get<2>(elem2)->toString(1) << ")" << endl;
            }
            idx++;
        }
        cout << "};" << endl;
    }
    cout << " Encoding: " << endl;
*/
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

            } else {


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
}

void chainEncodingVisitor::encodeTheRestPlease(){
    generate1();
    generate2();
    generateChains();
    //generate3();
    generate4();
    encodeParallelism();
    debug(false);
}

