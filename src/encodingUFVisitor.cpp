#include "encodingUFVisitor.h"

using namespace std;

/*
    PLACEHOLDER 
*/


/*! 
 * Constructor de la classe. Seteja algunes variables base.
 */
encodingUFVisitor::encodingUFVisitor(string incomp, string par) {
    incompatibilities = incomp;
    parallelism = par;

    random_not_so_random = 0;
    max_type_domain = 0; // var global per a calcular els mappings de objectes a enters.
    max_steps = 1000;

    // inicialitzem l'unica estructura que no emplenem directament desde PDDLProblem
    inv_types = std::shared_ptr<std::map< std::string, std::vector< std::string> > >(
            new std::map< std::string, std::vector< std::string> >()); 
}

/*! 
 * Destructor de la classe. No fa res :(
 */
encodingUFVisitor::~encodingUFVisitor(){
    // NOP
}

/*!
 *  Dona un nom "aleatori" que no es repeteix. Esta pensat per a crear vars auxiliars.
 */
string encodingUFVisitor::getRandomName(string str){
    stringstream ss;
    ss << "t" << str << std::to_string(random_not_so_random);
    random_not_so_random++;
    return ss.str();
}

/*!
 *   Diu al PDDLProblem si fa falta que flatenitzi els predicats, funcions i accions
 */
bool encodingUFVisitor::needsFlattening(){
    return false;
}

/*!
 * Rep un punter a l'estructura de tipus del PDDLProblem, perque aqui la necessitarem tambe
 */
void encodingUFVisitor::setTypes(std::shared_ptr<std::map< std::string, std::vector< std::string> > > ptr){
    types = ptr;
    cout << "Types set" << endl;
    for(const auto subtypes : *types){
        for(const auto type : subtypes.second){
            (*inv_types)[type].push_back(subtypes.first);
        }
    }
    cout << "SuperTypes set" << endl;
}

/*!
 * Rep un punter a l'estructura de objectes del PDDLProblem, perque aqui la necessitarem tambe
 */
void encodingUFVisitor::setObjects(std::shared_ptr < std::map< std::string, std::string > > ptr){
    cout << "Objects set" << endl;
    objects = ptr;
    for(const auto elem : *objects){
        objects_by_type[elem.second].push_back(elem.first);
    }

    for(const auto foobar : objects_by_type){
        computeIntDomain(foobar.first);
    }
}

/*!
 * Rep el nom d'un objecte i retorna el tipus mes proper ( un objecte pot tindre varis tipus )
 * per exemple myawesomeredcar: car -> vehicle -> object, per tant intentem de tornar el mes 
 * especific, en aquest cas "car".
 */
string encodingUFVisitor::getObjectType(string obj){
    return (*objects)[obj];
}

/*!
 * Rep un punter a l'estructura de l'estat inicial del PDDLProblem, perque aqui la necessitarem tambe
 */
void encodingUFVisitor::setInits(std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p){
    cout << "Inits set" << endl;
    p_inits = p;
}

/*!
 * Rep un punter al solver que farem anar
 */
void encodingUFVisitor::setSolver(std::shared_ptr<Solver> solv){
    cout << "Solver set" << endl;
    solver = solv;
}

/*!
 * Rep un punter a l'arbre que ens representa l'objectiu del problema. 
 */
void encodingUFVisitor::setObjective(std::shared_ptr<Thing> obj){
    cout << "Objective set" << endl;

    std::function<void(shared_ptr<Thing>)> set_constant;                                               
    set_constant = [&](shared_ptr<Thing> tree) {
        shared_ptr<Functor> f_tree;
        if( tree->type == functor_type::T_FUNCTION ||                                                  
            tree->type == functor_type::T_OPERATION || 
            tree->type == functor_type::T_VARIABLE || 
            tree->type == functor_type::T_PREDICATE){                                              
            f_tree = static_pointer_cast<Functor>(tree);                                               
            switch(tree->type) {
                case functor_type::T_OPERATION:
                    for(int i = 0; i < f_tree->getNParams(); i++){                                     
                        set_constant(f_tree->getParam(i));                                             
                    }
                    break;                                                                             
                case functor_type::T_PREDICATE:                                                        
                case functor_type::T_FUNCTION:                                                         
                    for(int i = 0; i < f_tree->getNParams(); i++){                                     
                        f_tree->getParam(i)->type = functor_type::T_CONSTANT;                          
                    }
                    break;                                                                             
                case functor_type::T_VARIABLE:                                                         
                    f_tree->type = functor_type::T_CONSTANT;                          
                    break;
                default:
                    cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;        
                    break;
            }   
        }   
    };       
    set_constant(obj);

    objective = obj;
}

/*!
 * Aixo de moment nomes serveix per els encodings flattened, per tant es un NOOP
 */
void encodingUFVisitor::setDeletedFunctions(std::shared_ptr<std::set< std::string > > ptr){
}
    // NOP

/*!
 * Aixo de moment nomes serveix per els encodings flattened, per tant es un NOOP
 */
void encodingUFVisitor::setDeletedActions(std::shared_ptr<std::set< std::string > > ptr){
    // NOP
}

/* =========================================================================================
 * visitor functions
 * =========================================================================================
 */

/*!
 * El visitor de la classe Parameter, no fa res
 */
void encodingUFVisitor::visitParameter( shared_ptr<Parameter> ptr){
    //NOP
}

/*!
 * El visitor de la classe Functor, no fa res
 */
void encodingUFVisitor::visitFunctor( shared_ptr<Functor> ptr){
    //NOP
}

/*!
 * El visitor de la classe Constraint, de moment no fa res
 */
void encodingUFVisitor::visitConstraint( shared_ptr<Constraint> ptr){
    //NOP
}

/*! 
 * El visitor de la classe Predicate.
 */
void encodingUFVisitor::visitPredicate( shared_ptr<Predicate> ptr){
    if(!ptr->isInstanced()){
        auto to_push = static_pointer_cast<Predicate>(ptr->duplicate());
        //if(to_push->getReturnType() == "unknown"){ to_push->setReturnType("Bool"); }
        to_push->setReturnType("Bool"); 
        generateDefinitions(to_push);
        predicates.push_back(to_push);
    } else {
        // TODO caldria fer el duplicate abans? no crec ...
        for(int i = 0; i < ptr->getNParams(); i++){ ptr->getParam(i)->type = functor_type::T_CONSTANT; }
        grounded_predicates.push_back(ptr);


        // generem les inicialitzacions ( nomes hi han predicats, = i nots )
        bool found = false;

        // busquem si ja ha estat inicialitzat a la seccio de init del problema, si no l'iniciem a false.
        for(const auto & init : *p_inits){
            if(init->type == functor_type::T_OPERATION &&
                    init->getName() == "not" &&
                    static_pointer_cast<Functor>(init->getParam(0))->toString() == ptr->toString()){

                s_inits.push_back("(= "+ init->getParam(0)->toStringUF(1) + " false)");
                found = true;

            } else if(init->type == functor_type::T_PREDICATE &&
                    static_pointer_cast<Functor>(init)->toString() == ptr->toString()){
                s_inits.push_back("(= "+ init->toStringUF(1) + " true)");
                found = true;
            }
        }
        if(!found){
            s_inits.push_back("(= "+ ptr->toStringUF(1) + " false)");
        }
    }
}

/*! 
 * El visitor de la classe Function.
 */
void encodingUFVisitor::visitFunction( shared_ptr<Function> ptr){
    if(!ptr->isInstanced()){
        cout << " Visiting uninstanced function " << ptr->toStringUF(1) << endl;
        auto to_push = static_pointer_cast<Function>(ptr->duplicate());
        to_push->setReturnType("Int");

        generateDefinitions(to_push);
        functions.push_back(to_push);
    } else {
        // HACK TODO per mal disseny del PDDLProblem no podem tindre un simbol instanciat i sense instanciar sense parametres
        if(ptr->getNParams() == 0){
            cout << " Visiting uninstanced (hack) " << ptr->toStringUF(1) << endl;
            auto to_push = static_pointer_cast<Function>(ptr->duplicate());
            to_push->setReturnType("Int");
            generateDefinitions(to_push);
            functions.push_back(to_push);
        }
        // TODO caldria fer el duplicate abans? no crec ...
        for(int i = 0; i < ptr->getNParams(); i++){ ptr->getParam(i)->type = functor_type::T_CONSTANT; }
        grounded_functions.push_back(ptr);
    }
}

/*! 
 * El visitor de la classe Action.
 */
void encodingUFVisitor::visitAction( shared_ptr<Action> ptr){
    if(!ptr->isInstanced() || ptr->getNParams() == 0){
        cout << " Visiting uninstanced action " << ptr->toStringUF(1) << endl;
        auto to_push = static_pointer_cast<Action>(ptr->duplicate());
        if(to_push->getReturnType() == "unknown"){ to_push->setReturnType("Bool"); }

        generateDefinitions(to_push);
        actions.push_back(to_push);

        /* 
         * Aqui definim dos lambdes que passen recursivament per tota
         * l'estructura de les accions, i serveixen per identificar predicats i
         * funcions. Un cop identificats, s'emplenen els indexos
         * idx_eff_predicates i idx_eff_functions.
         */
        std::function<void(shared_ptr<Thing>,int)> bool_recur;
        bool_recur = [&](shared_ptr<Thing> tree,int fd) {
            shared_ptr<Functor> f_tree;
            shared_ptr<Predicate> pred_ptr;
            string str_key = "ERROR";
            bool found_please_insert = false;

            if( tree->type == functor_type::T_OPERATION ||
                    tree->type == functor_type::T_PREDICATE){
                f_tree = static_pointer_cast<Functor>(tree);
                switch(tree->type) {
                    case functor_type::T_OPERATION:
                        {
                            if(f_tree->getName() == "when"){ // mirem la part de l'efecte
                                bool_recur(f_tree->getParam(1),fd);
                            } else if(f_tree->getName() == "not"){
                                str_key = "not(" + f_tree->getParam(0)->getName() + ")";
                                pred_ptr = static_pointer_cast<Predicate>(f_tree->getParam(0));
                                found_please_insert = true;
                            } else{
                                for(int i = 0; i < f_tree->getNParams(); i++){
                                    bool_recur(f_tree->getParam(i),fd);
                                }
                            }
                        }
                        break;
                    case functor_type::T_PREDICATE:
                        {
                            str_key = f_tree->getName();
                            pred_ptr = static_pointer_cast<Predicate>(f_tree);
                            found_please_insert = true;
                        }
                        break;
                    default:
                        cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
                        break;
                }

                if(found_please_insert){
                    vector<int> params;

                    // per cada parametre del predicat el busquem a l'accio
                    for(int i = 0; i < pred_ptr->getNParams(); i++){
                        if(pred_ptr->getParam(i)->type == functor_type::T_VARIABLE){
                            int j = 0; bool trobat= false;
                            while(!trobat && j < to_push->getNParams()){
                                cout << to_push->getParam(j)->getName() << " == " << pred_ptr->getParam(i)->getName() << "?" << endl;
                                if(to_push->getParam(j)->getName() == pred_ptr->getParam(i)->getName()){
                                    trobat = true;
                                } else{ j++; }
                            }
                            if(trobat){
                                params.push_back(j);
                            } else {
                                cout << "No trobat!!! ERR? !!!" << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
                            }
                        } else {
                            params.push_back(-1);
                        }
                    }
                    assert(params.size() == pred_ptr->getNParams());
                    idx_eff_predicates[str_key].first  = pred_ptr;
                    idx_eff_predicates[str_key].second.push_back(std::make_tuple(to_push,fd,params));
                }
                // herpderp, es una constant, placeholder o whatever
            } else { }
        };

        std::function<void(shared_ptr<Thing>,int)> int_recur;
        int_recur = [&](shared_ptr<Thing> tree,int fd) {
            shared_ptr<Functor> f_tree;
            shared_ptr<Function> func_ptr;
            string str_key = "ERROR";
            bool found_please_insert = false;

            if( tree->type == functor_type::T_OPERATION ||
                    tree->type == functor_type::T_FUNCTION){
                f_tree = static_pointer_cast<Functor>(tree);
                switch(tree->type) {
                    case functor_type::T_OPERATION:
                        {
                            if(f_tree->getName() == "increase" ||
                                    f_tree->getName() == "decrease" ||
                                    f_tree->getName() == "assign"){
                                str_key = f_tree->getParam(0)->getName();
                                func_ptr = static_pointer_cast<Function>(f_tree->getParam(0));
                                found_please_insert = true;
                            } else if(f_tree->getName() == "when"){
                                int_recur(f_tree->getParam(1),fd); // mirem nomes la part de l'efecte
                            } else {
                                for(int i = 0; i < f_tree->getNParams(); i++){
                                    int_recur(f_tree->getParam(i),fd);
                                }
                            }
                        }
                        break;
                    case functor_type::T_FUNCTION:
                        {
                            str_key = f_tree->getName();
                            func_ptr = static_pointer_cast<Function>(f_tree);
                            found_please_insert = true;
                            cout << "WARNING no hauria d'entrar aqui ... " << f_tree->toString() << "   " << __FILE__;
                            cout << " " <<  __LINE__ << " " << __func__ << endl;
                        }
                        break;
                    default:
                        cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
                        break;
                }

                if(found_please_insert){
                    vector<int> params;
                    // per cada parametre de la funcio el busquem a l'accio
                    for(int i = 0; i < func_ptr->getNParams(); i++){
                        if(func_ptr->getParam(i)->type == functor_type::T_VARIABLE){
                            //cout << func_ptr->getParam(i)->toString(1) << " is a var!!!" << endl;
                            int j = 0; bool trobat= false;
                            //cout << func_ptr->toString(1) << " in " << ptr->toString(1) << endl;
                            while(!trobat && j < to_push->getNParams()){
                                //cout << to_push->getParam(j)->getName()  << " == " << func_ptr->getParam(i)->getName() << "?" << endl;
                                if(to_push->getParam(j)->getName() == func_ptr->getParam(i)->getName()){
                                    trobat = true;
                                } else{ j++; }
                            }
                            if(trobat){
                                params.push_back(j);
                            } else {
                                cout << "ERR? !!!" << __FILE__ << " ";
                                cout <<  __LINE__ << " " << __func__ << endl;
                                assert(false);
                            }
                        } else {
                            params.push_back(-1);
                        }
                    }

                    // insertem
                    assert(params.size() == func_ptr->getNParams());
                    // cout << "idx_eff_functions[" << str_key << "].first  = " << func_ptr->toString(1) << endl;
                    // cout << "idx_eff_functions[" << str_key << "].second.push_back(std::make_tuple(" << to_push << "," << fd << "," << params << "));" << endl;

                    idx_eff_functions[str_key].first  = func_ptr;
                    idx_eff_functions[str_key].second.push_back(
                            std::make_tuple(to_push,fd,params));
                }
                // herpderp, es una constant, placeholder o whatever
            } else { }
        };

        for(int i = 0;i < to_push->getNFDs();i++){
            bool_recur(to_push->getFD(i).second,i);
            int_recur(to_push->getFD(i).second,i);
        }
    } else {

        // TODO caldria fer el duplicate abans? no crec ...
        for(int i=0; i < ptr->getNParams(); i++){ ptr->getParam(i)->type = functor_type::T_CONSTANT; }
        grounded_actions.push_back(ptr);
    } 
}

/*!
 *  volem que cada parametre de cada accio tingui un nom unic al problema, 
 *  per tant el que farem sera renombrar tots els parametres de totes les accions.
 */
void encodingUFVisitor::encodeTheRestPlease(){

    /* 
     * Creem dos vectors, un pels noms nous i un pels noms vells. Quan els tenim 
     * plens renombrem tot el problema.
     */
    for(const auto accio : actions){
        if(accio->getNParams() > 0){
            shared_ptr<vector<string> > new_names(new vector<string>());
            shared_ptr<vector<string> > parameters(new vector<string>());
            for(int i=0; i < accio->getNParams(); i++){
                auto param = static_pointer_cast<Parameter>(accio->getParam(i));
                string new_name = "";
                if(param->type == functor_type::T_VARIABLE){
                    new_name = getRandomName();
                } else {
                    new_name = param->getName();
                }
                parameters->push_back(param->getName());
                new_names->push_back(new_name);
                param->setName(new_name);
            }

            searchAndReplaceNames(new_names,parameters,accio->getRawPrecondition());
            searchAndReplaceNames(new_names,parameters,accio->getRawEffect());
            for(int i=0;i < accio->getNFDs();i++){
                searchAndReplaceNames(new_names,parameters,accio->getFD(i).first);
                searchAndReplaceNames(new_names,parameters,accio->getFD(i).second);
            }
        }
    }

    /*
     * Creem les declaracions de les variables de tots els parametres de totes les accions 
     */
    for(const auto accio : actions){
        for(int i=0; i < accio->getNParams(); i++){
            encoded_vars["(declare-fun "+ accio->getParam(i)->toStringUF(1) +" () Int)"] = static_pointer_cast<Parameter>(accio->getParam(i));
        }
    }

    // ===============================================
    // Un cop fetes les reescriptures,
    // ara generem les constraints del problema
    // ===============================================

    // les variables de 1 i 2 van en funcio del nom dels parametres de cada accio
    generate1();
    generate2();

    // les variables de 4 van en funcio dels fluents
    generate4();

    encodeParallelism();

    debug(true);
}

/*!
 * Generem la primera constraint:
 *
 *  O_t -> P_t
 *
 *  Executar una accio implica les seves precondicions
 */
void encodingUFVisitor::generate1(){
    stringstream ss;

    for(const auto accio : actions){
        ss << "(=> " << accio->toStringUF(1) << " ";
        ss << accio->getRawPrecondition()->toStringUF(1) << ")";
        encoded_constraints.push_back(ss.str());
        ss.str(string());
    }
}


/*!  Generem la segona constraint
 *
 *  O_t /\ f_t -> d_t+1
 *
 * per cada efecte condicional, si s'executa l'accio i es compleix la
 * precondicio de l'efecte condicional, implica que els seus efectes es veuen
 * reflectits al seguent instant de temps
 */
void encodingUFVisitor::generate2(){
    stringstream ss;

    for(const auto accio : actions){
        for(int i = 0; i < accio->getNFDs(); i++){
            ss << "(=> (and " << accio->toStringUF(1) << " " << accio->getFD(i).first->toStringUF(1) << ") ";
            ss << accio->getFD(i).second->toStringUF(3) << ")";
            encoded_constraints.push_back(ss.str());
            ss.str(string());
        }
    }
}

/*!
 * calcul de les incompatibilitats entre accions representades
 * fent servir UF. Aqui implementem els checks via SMT, segons 
 * l'article enviat al ICAPS 2016.
 *
 * TODO: variable_modificada per poder fer l'encoding lineal d'en rintanen
 * TODO: tindre en compte el parametre (-u)
 */
void encodingUFVisitor::semanticIncompatibilities() {

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
      //cout << "SAT!" << endl;
      return true;
    } else {
      //cout << "UNSAT!" << endl;
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

    // les agrupem per variable a substituir. 
    std::map<string,vector< pair<t_substitution,int> > > idx_substitutions;
    for(const auto subst : *v_subst1){ idx_substitutions[subst.first].push_back(make_pair(subst,1)); }
    for(const auto subst : *v_subst2){ idx_substitutions[subst.first].push_back(make_pair(subst,2)); }

    // fem els checks
    for(const auto parella : idx_substitutions){
      if(parella.second.size() > 1){
        //cout << "cal checa de simply commuting, var: " << parella.first << " {" << endl;
        // per comprovar si son simply commuting neguem exp2@o_1 == exp1@o_2 i preguntem si es SAT, aixi
        // sabrem si hi ha algun model que ho invalidi, i per tant deixi de ser una tautologia

        // com que son dos accions nomes i nomes hi ha una assignacio per accio, nomes podem tindre
        // 2 elements, per tant hi accedim directament. Creem un vector per poderles passar a la 
        // funcio i comprovem si es SAT
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
          //cout << "SAT, no son simply commuting!" << endl;
          return true;
        } else {
          //cout << "UNSAT, son simply commuting!" << endl;
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

      ss << "and(" << acc1_p->toString() << "," << acc2_p->toString();
      // fem un vector amb 1 element, que es el happening combinat
      auto v_happening = make_shared< vector<t_substitution> >(); v_happening->push_back(parella.second);
      ss << ",not(=(" << applySubstitutions(parella.first,v_happening) << ",";
      ss << applySubstitutions(applySubstitutions(parella.first,v_subst2),v_subst1)<< ")))";

      //cout << "check 3: " << ss.str() << endl;
      temp_solver->addConstraint(ss.str(),0);
      if( temp_solver->check() == 1){
        //cout << "SAT!, s'afecten al 3!" << endl;
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
    for(const auto acc1 : actions){
      for(const auto acc2 : actions){

        cout << "checking " << acc1->toString() << " i " << acc2->toString() << endl;
        auto foobar = curate_combinations(acc1,acc2);
        auto prod_parametres   = foobar.first;
        auto prod_combinacions = foobar.second;

        // DEBUG
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
        /*
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
          bool incompat = (!check1(acc1,acc2,assignacions) &&
              !check2(acc1,acc2,assignacions) &&
              !check3(acc1,acc2,assignacions));
          cout << "check:" << acc1->toString() << " i " << acc2->toString() << " = " << incompat << endl;

          
          i++;
        }
      }
    }
  }

/*!
 * calcul de incompatibilitats entre accions amb UF. Aqui 
 * emulem una generalitzacio d'en rintanen a nivell sintactic
 */
void encodingUFVisitor::syntacticIncompatibilities() {
}

/*!
 * encoding de les incompatibilitats entre accions,
 * de moment nomes suportem l'encoding quadratic.
 */
void encodingUFVisitor::existsStep() {
}

/*!
 * Calculem les incompatibilitats si s'escau, i fem l'encoding
 * que ens demanin des de linia de comandes. De moment soportem:
 * * lineal (exactly one)
 * * exists-step (encoding quadratic)
 */
void encodingUFVisitor::encodeParallelism() {

    // si no volem un exactly one
    if(parallelism != "l"){
        if(incompatibilities == "o"){
            syntacticIncompatibilities();
        } else if (incompatibilities == "n") {
            semanticIncompatibilities();
        } else {
            cerr << "incompatibilities type not supported" << endl;
            abort();
        }
    }

    // exactly one
    if(parallelism == "l"){
        generateEX1();
    } else if(parallelism == "e"){
        existsStep();
    } else {
        cerr << "parallelism type not recognized" << endl;
        abort();
    }
}

/*!
 * Generem l'exactly-one, fent dos constraints:
 *
 * (or acc1 acc2 acc3 ...)
 * (or (not acc1) (not acc2)) /\ (or (not acc1) (not acc3)) ...
 */
void encodingUFVisitor::generateEX1() {

    stringstream ss_or; 

    ss_or << "(or "; 
    for(const auto accio : actions){
        ss_or << accio->toStringUF(1) << " ";
    }
    ss_or << ")";
    encoded_constraints.push_back(ss_or.str());
    ss_or.str(string());

    for(unsigned int i = 0; i < actions.size(); i++){
        for(unsigned int j = i; j < actions.size(); j++){
            if(i != j){
                ss_or << "(or (not " << actions[i]->toStringUF(1);
                ss_or << ") (not " << actions[j]->toStringUF(1) << "))";
                encoded_constraints.push_back(ss_or.str());
                ss_or.str(string());
            }
        }
    }
}

/*!
 * Fem l'encoding dels frame axioms
 *
 * Teoricament va aixi:
 * (=> (distinct (fuel A 0) (fuel A 1))
 *  (or (and (travel A x2_0 x3_0 0))
 *      (and (refuel A x5_0 0)))
 * 
 * (=> (distinct (fuel B 0) (fuel B 1))
 *  (or (and (travel x1_0 x2_0 x3_0 0) (= x1_0 B))
 *      (and (refuel x4_0 x5_0 0) (= x4_0 B))))
 * ...
 */
void encodingUFVisitor::generate4(){

    // a causa dels tipus, hem de revisar si realment una accio 
    // pot modificar el valor d'un predicat o funcio passat a ground. Per exemple:
    // truck - locatable
    // car - locatable
    // (at ?x - locatable ?y - place)
    // action: move_truck(?a - truck ?f - from ?t - to)
    // action: move_car(?b - car ?f - from ?t - to)
    //
    // tindriem marcat a l'index que tant move_truck com move_car poden canviar
    // el valor de qualsevol at, pero no es aixi. Es pot veure per els tipus de
    // parametres de les accions. Per aixo ens cal fer la segona comprovacio.
    std::function<bool(shared_ptr<Action> act, shared_ptr<Functor> func, std::vector<int> positions)> is_valid_action;
    is_valid_action = [&](shared_ptr<Action> act, shared_ptr<Functor> func, std::vector<int> positions)->bool {
        bool is_valid = true;

        int i = 0;
        while(i < positions.size() && is_valid){
            // parametre que ve de un predicat, per tant sabem del cert que es un Parameter
            auto parametre_instanciat = static_pointer_cast<Parameter>(func->getParam(i));
            shared_ptr<Parameter> parametre_a_modificar;
            string type;

            // si es -1 vol dir que es una constant, per tant no l'hem de considerar
            if(positions[i] != -1){ 
                // parametre que ve de una accio, per tant sabem del cert que es un Parameter
                parametre_a_modificar = static_pointer_cast<Parameter>(act->getParam(positions[i]));
                type = parametre_a_modificar->getObjectType();
            } else {
                type = getObjectType(parametre_instanciat->getValue()); // en necessitem el tipus
            }

            // creem un conjunt amb tots els subtipus del parametre del functor
            // i el seu mateix tipus. Si el tipus del parametre de l'accio no hi
            // pertany, senyal que son conjunts disjunts i per tant no podria ser
            // modificat. Per tant no es valid.
            shared_ptr<vector<string> > foo = getAllSubtypes(parametre_instanciat->getObjectType());
            foo->push_back(parametre_instanciat->getObjectType());
            if(std::find(foo->begin(), foo->end(), type) == foo->end()) {
                // no hi es, per tant no es valid
                is_valid = false;
            }

            if(!is_valid){
                cout << "NO ES VALID:" << endl;
                cout << "acc: " << act->toStringUF(1) << "  >>>  " << func->toStringUF(1) << endl;
                cout << " param : " << parametre_instanciat->toStringUF(1) << " type: " << parametre_instanciat->getObjectType() << endl;
                cout << " param : " << parametre_a_modificar->toStringUF(1) << " type: " << parametre_a_modificar->getObjectType() << endl;
                cout << endl;
            }
            i++;
        }

        return is_valid;
    };

    stringstream ss;

    for(const auto pred : grounded_predicates){

        bool alguna_acc_valida;


        auto p_ptr1 = idx_eff_predicates.find(pred->getName());
        alguna_acc_valida = false;
        // si aquest predicat es modifica a algun lloc ...
        if(p_ptr1 != idx_eff_predicates.end()){

            ss << "(=> (and (not " << pred->toStringUF(1) << ") " << pred->toStringUF(3) << ") (or ";
            // iterem per totes les accions on es modifica el predicat
            for(const auto bar : p_ptr1->second.second){
                auto ptr_acc = static_pointer_cast<Action>(std::get<0>(bar)->duplicate());
                if(is_valid_action(ptr_acc,pred,std::get<2>(bar))){

                    // iterem per tots els parametres
                    string param_fix_val = "";
                    for(unsigned int i = 0; i < std::get<2>(bar).size(); i++){

                        int value = std::get<2>(bar)[i];

                        // TODO check si es correcte
                        // aqui estem igualant els parametres entre el predicat modificat i l'accio. En cas de que tinguem un -1
                        // significa que estem tractant amb un valor fixe (provinent per exemple de una expansio de un forall) i 
                        // per tant no fa falta que fem res aqui ...
                        if(value != -1){
                            alguna_acc_valida = true;

                            // parametre que ve de un predicat, per tant sabem del cert que es un Parameter
                            auto parametre_instanciat = static_pointer_cast<Parameter>(pred->getParam(i));

                            // parametre que ve de una accio, per tant sabem del cert que es un Parameter
                            auto parametre_a_modificar = static_pointer_cast<Parameter>(ptr_acc->getParam(value));
                            param_fix_val += " (= " + parametre_a_modificar->toStringUF(1) + " " + parametre_instanciat->getValue() + ") ";
                        }
                    } 

                    ss << " (and " << ptr_acc->toStringUF(1) << param_fix_val << ") ";
                }
            }
            ss << "))";
            // si hi ha hagut alguna accio valida, acabem afegint la constraint.
            if(alguna_acc_valida){ encoded_constraints.push_back(ss.str()); }
            // i netejem l'string_stream de qualsevol manera.
            ss.str(string());
        } else if(!alguna_acc_valida || p_ptr1 == idx_eff_predicates.end()) {
            // si realment ningu el toca
            ss << "(=> (and (not " << pred->toStringUF(1) << ") " << pred->toStringUF(3) << ") false)";
            encoded_constraints.push_back(ss.str());
            ss.str(string());
        }

        auto p_ptr2 = idx_eff_predicates.find("not(" + pred->getName() + ")");
        alguna_acc_valida = false;
        // si aquest predicat es modifica a algun lloc ...
        if(p_ptr2 != idx_eff_predicates.end()){

            ss << "(=> (and " << pred->toStringUF(1) << " (not " << pred->toStringUF(3) << ")) (or ";
            // iterem per totes les accions on es modifica el predicat
            for(const auto bar : p_ptr2->second.second){
                auto ptr_acc = static_pointer_cast<Action>(std::get<0>(bar)->duplicate());
                if(is_valid_action(ptr_acc,pred,std::get<2>(bar))){
                    // iterem per tots els parametres
                    string param_fix_val = "";
                    for(unsigned int i = 0; i < std::get<2>(bar).size(); i++){

                        int value = std::get<2>(bar)[i];

                        // TODO check si es correcte
                        // aqui estem igualant els parametres entre el predicat modificat i l'accio. En cas de que tinguem un -1
                        // significa que estem tractant amb un valor fixe (provinent per exemple de una expansio de un forall) i 
                        // per tant no fa falta que fem res aqui ...
                        if(value != -1){
                            alguna_acc_valida = true;

                            // parametre que ve de un predicat, per tant sabem del cert que es un Parameter
                            auto parametre_instanciat = static_pointer_cast<Parameter>(pred->getParam(i));

                            // parametre que ve de una accio, per tant sabem del cert que es un Parameter
                            auto parametre_a_modificar = static_pointer_cast<Parameter>(ptr_acc->getParam(value));
                            param_fix_val += "(= " + parametre_a_modificar->toStringUF(1) + " " + parametre_instanciat->getValue() + ") ";
                        }
                    } 

                    ss << " (and " << ptr_acc->toStringUF(1) << param_fix_val << ")";
                }
            }
            ss << "))";
            // si hi ha hagut alguna accio valida, acabem afegint la constraint.
            if(alguna_acc_valida){ encoded_constraints.push_back(ss.str()); }
            // i netejem l'string_stream de qualsevol manera.
            ss.str(string());
        } else if(!alguna_acc_valida || p_ptr1 == idx_eff_predicates.end()) {
            // si realment ningu el toca
            ss << "(=> (and " << pred->toStringUF(1) << " (not " << pred->toStringUF(3) << ")) false)";
            encoded_constraints.push_back(ss.str());
            ss.str(string());
        }

    }

    // I ara per les funcions
    for(const auto func : grounded_functions){
        auto f_ptr = idx_eff_functions.find(func->getName());

        // si aquesta funcio es modifica a algun lloc ...
        if(f_ptr != idx_eff_functions.end()){
            ss << "(=> (distinct " << func->toStringUF(1) << " " << func->toStringUF(3) << ") (or ";

            for(const auto bar : f_ptr->second.second){
                // per cada accio que podria tocar la var
                string param_fix_val = "";

                auto ptr_acc = static_pointer_cast<Action>(std::get<0>(bar)->duplicate());
                // iterem per tots els parametres
                for(unsigned int i = 0; i < std::get<2>(bar).size(); i++){

                    int value = std::get<2>(bar)[i];
                    // parametre que ve de una funcio, per tant sabem del cert que es un Parameter
                    auto parametre_instanciat = static_pointer_cast<Parameter>(func->getParam(i));

                    // parametre que ve de una accio, per tant sabem del cert que es un Parameter
                    if(value != -1){
                        auto parametre_a_modificar = static_pointer_cast<Parameter>(ptr_acc->getParam(value));
                        param_fix_val += "(= " + parametre_a_modificar->toStringUF(1) + " " + parametre_instanciat->getValue() + ") ";
                    }
                } 
                ss << "(and " << ptr_acc->toStringUF(1) << param_fix_val << ") ";
            }
            ss << "))";
            encoded_constraints.push_back(ss.str());
            //cout << ss.str() << endl;
            ss.str(string());
        } else {
            ss << "(= " << func->toStringUF(1) << " " << func->toStringUF(3) << ")";
            encoded_constraints.push_back(ss.str());
            //cout << ss.str() << endl;
            ss.str(string());
        }
    }
}

/*! 
 * Dona un pair <int, int> on son el marge inferior i superior del tipus,
 * segons el mapping a enters
 */
//TODO no te en compte l'herencia de tipus, es tindra en compte en declarar els dominis!
std::pair<int, int> encodingUFVisitor::computeIntDomain(string type){
    auto pair_domain = type_domain.find(type);

    // si ja l'haviem tractat, el retornem
    if( pair_domain != type_domain.end()){
        return (*pair_domain).second;
    } else {
        auto objects = objects_by_type.find(type);
        // si el tipus no te objectes o 
        if(objects == objects_by_type.end() || (*objects).second.size() == 0){
            //cout << "ERR?" << " tipus *+" << type << "+* no te objectes ? " << endl;
            return std::make_pair(0,0);
        } else {
            auto new_pair = std::make_pair(max_type_domain+1,max_type_domain + (*objects).second.size());
            max_type_domain += (*objects).second.size();
            type_domain[type] = new_pair;
            return new_pair;
        }
    }
}



// TODO: evitar bucles infinits (fer anar un set i comprovar mida despres de insertar?)
std::shared_ptr<vector<string> > encodingUFVisitor::getAllSupertypes(string typeName){
    map<string,vector<string> >::iterator it = inv_types->find(typeName);
    shared_ptr<vector<string> > tmp_vector(new vector<string>());

    if(it == inv_types->end() ){
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

std::shared_ptr<vector<string> > encodingUFVisitor::getAllSubtypes(string typeName){
    map<string,vector<string> >::iterator it = types->find(typeName);
    shared_ptr<vector<string> > tmp_vector(new vector<string>());

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

/* =========================================================================================
 * helper functions
 * =========================================================================================
 */

/*!
 * substitueix els noms dels parametres especificats a l'array de punters a parametres per els del vector de strings
 */
void encodingUFVisitor::searchAndReplaceNames(shared_ptr<vector<string> > names, shared_ptr< vector<string> > parameters, shared_ptr<Thing> tree){
    assert(names->size() == parameters->size());
    assert(names->size() > 0);
    switch(tree->type) {
        case functor_type::T_OPERATION:    
        case functor_type::T_PREDICATE: 
        case functor_type::T_FUNCTION:     
        case functor_type::T_ACTION:     
            {
                shared_ptr<Functor> f = static_pointer_cast<Functor>(tree);
                for(int i = 0; i < f->getNParams(); i++){
                    searchAndReplaceNames(names,parameters,f->getParam(i)); 
                }
            }
            break;
        case functor_type::T_VARIABLE:     
            {
                shared_ptr<Parameter> p = static_pointer_cast<Parameter>(tree);
                for(unsigned int i = 0; i < parameters->size(); i++){
                    if( p->getName() == (*parameters)[i]){
                        p->setName((*names)[i]);
                    }
                }
            }
            break;
        case functor_type::T_CONSTANT:     
            // noop
            break;
        default:
            cout << "ERR? " << tree->toString() << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
            break;
    }
}

