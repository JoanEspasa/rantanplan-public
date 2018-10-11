#include "PDDLProblem.h" 

using namespace std;

//action = shared_ptr<Action>((Action *)&*act->declaration); // C casts solution 

// Faig anar un map de vectors enlloc de un multimap pq un multimap
// te en compte l'ordre parcial i les insercions son de cost n log n+mida
// i un vector push_back es amortitzat constant.
// Tot i que despres he vist que al implementar la consulta haura de ser una 
// funcio recursiva i per tant ja no tinc clar que sera mes eficient, pero 
// tot i aixi el tipatge no sera una estructura gran, i per tant la diferencia
// sera minima. TODO es algo a comprovar quan m'aburreixi


PDDLProblem::PDDLProblem(){
    inits = std::shared_ptr< std::vector<std::shared_ptr<Functor> > >(
            new std::vector<std::shared_ptr<Functor> >());
    objects = std::shared_ptr< std::map< std::string , std::string > >(
            new std::map< std::string , std::string >);
    types = std::shared_ptr< std::map< std::string, std::vector< std::string> > >(
            new  std::map< std::string, std::vector< std::string> >);
    inv_types = std::shared_ptr<std::map< std::string, std::vector< std::string> > >(
            new std::map< std::string, std::vector< std::string> >()); 

    addType("object", "NULL"); // Tope
//  addObject("undefined", "NULL"); // deprecated
}

PDDLProblem::~PDDLProblem(){
}

void PDDLProblem::addType(string typeName, string baseType) {
    (*types)[baseType].push_back(typeName); 
    (*inv_types)[typeName].push_back(baseType);
}

// TODO: codi duplicat joder
std::shared_ptr<vector<string> > PDDLProblem::getAllSupertypes(string typeName){
    map<string,vector<string> >::iterator it = inv_types->find(typeName);
    if(it == inv_types->end()){
        return shared_ptr<vector<string> >(new vector<string>());
    } else {
        shared_ptr<vector<string> > tmp_vector(new vector<string>((*it).second));
        for(unsigned int vit = 0; vit < tmp_vector->size(); vit++){  
            shared_ptr<vector<string> > foo = getAllSupertypes(tmp_vector->at(vit));
            tmp_vector->insert(tmp_vector->end(),foo->begin(),foo->end());
        } 
        return tmp_vector;
    }
}

shared_ptr<vector<string>> PDDLProblem::getAllSubtypes(string typeName){
    map<string,vector<string> >::iterator it = types->find(typeName);     // busquem si hi han subtipus
    if(it == types->end()){                          
        return shared_ptr<vector<string> >(new vector<string>());         // si no, retornem vector buit
    } else {
        shared_ptr<vector<string> > foobar(new vector<string>((*it).second));// en cas de que si, copiem el vector
        for(unsigned int vit = 0; vit < foobar->size(); vit++){
            shared_ptr<vector<string> > foo = getAllSubtypes(foobar->at(vit));// foreach elem, fem crida recursiva
            foobar->insert(foobar->end(),foo->begin(),foo->end());   // e insertem els que trobem, fins arribar
        }                                                         // al punt fix de no trobar res
        return foobar;
    }
}

// funcions per als predicats
void PDDLProblem::addSymbol(shared_ptr<Thing> t){ 
    sym_table[t->toString()] = shared_ptr<sym_register>(
            new sym_register(t->toString(),t->getType(),t));
}

void PDDLProblem::deleteSymbol(string name){
    auto it = sym_table.find(name);
    if( it == sym_table.end()){
        assert(false);
    } else {
        sym_table.erase(it);
    }
}

shared_ptr<sym_register> PDDLProblem::getSymbol(string name){
    auto it = sym_table.find(name);
    if( it == sym_table.end()){
        assert(false);
        return NULL;
    } else {
        return sym_table.at(name);
    }
}

// retorna nomes simbols no instanciats, i els busca per el nom
shared_ptr<sym_register> PDDLProblem::getRawSymbol(string name){
    for (const auto& it : sym_table) {
        if(it.second->parent == NULL && it.second->data->getName() == name){
            return it.second;
        }
    }
    //assert(false);
    cerr << "ERR! " << name << " NO trobat a la taula de simbols!" << endl;
    return NULL;
}

bool PDDLProblem::hasSymbol(std::string s){
    for (const auto& it : sym_table) {
        if(it.second->data->getName() == s){
            return true;
        } 
    }
    return false;
}

shared_ptr<Predicate> PDDLProblem::getPredicateByKey(string name){
    return static_pointer_cast<Predicate>(getSymbol(name)->data);
}

shared_ptr<Predicate> PDDLProblem::getRawPredicate(string name){
    for (const auto& it : sym_table) {
        if(it.second->parent == NULL && it.second->data->getName() == name){
            return static_pointer_cast<Predicate>(it.second->data);
        }
    }

    cout << name << " NOT FOUND IN SYM TABLE, aborting. dump: " << endl;
    for (const auto& it : sym_table) {
        cout << it.first << " -> " << it.second->data->getName() << endl;
    }

    assert(false);
    return NULL;
}

shared_ptr<Function> PDDLProblem::getFunctionByKey(string name){
    return static_pointer_cast<Function>(getSymbol(name)->data);
}

shared_ptr<Function> PDDLProblem::getRawFunction(string name){
    for (const auto& it : sym_table) {
        if(it.second->parent == NULL && it.second->data->getName() == name
                && it.second->type == functor_type::T_FUNCTION){
            return static_pointer_cast<Function>(it.second->data);
        }
    }

    cout << name << " NOT FOUND IN SYM TABLE, aborting. dump: " << endl;
    for (const auto& it : sym_table) {
        cout << it.first << " -> " << it.second->data->getName() << endl;
    }

    assert(false);
    return NULL;
}

shared_ptr<Action> PDDLProblem::getActionByKey(string name){
    return static_pointer_cast<Action>(getSymbol(name)->data);
}

shared_ptr<Action> PDDLProblem::getRawAction(string name){
    for (const auto& it : sym_table) {
        if(it.second->parent == NULL && it.second->data->getName() == name
                && it.second->type == functor_type::T_ACTION){
            return static_pointer_cast<Action>(it.second->data);
        }
    }

    cout << name << " NOT FOUND IN SYM TABLE, aborting. dump: " << endl;
    for (const auto& it : sym_table) {
        cout << it.first << " -> " << it.second->data->getName() << endl;
    }

    assert(false);
    return NULL;
}

// resta
void PDDLProblem::addObject(string name, string type){

    objects_by_type[type].push_back(name);
    (*objects)[name] = type;

    // afegim l'objecte a la taula de simbols
    shared_ptr<Parameter> param(new Parameter());
    param->setName(name);
    param->setObjectType("constant");
    param->setType(functor_type::T_VARIABLE);

    //shared_ptr<Function> param(new Function(name,functor_type::T_FUNCTION,true));
    addSymbol(param);
}

string PDDLProblem::getObjectTypeByName(string name){
    return (*objects)[name];
}

vector<string> PDDLProblem::getObjectsByType(string type){
    return objects_by_type[type];
}

void PDDLProblem::addRawObjective(shared_ptr<Thing> ptr){
    objective = ptr;
}

void PDDLProblem::addMetricToOptimize( shared_ptr<Thing> ptr){
    metric = ptr;
}

void PDDLProblem::addInit(shared_ptr<Functor> ptr){
    inits->push_back(ptr);
}

void PDDLProblem::addEncoder(std::shared_ptr<encoderVisitor> vis){
    encoder = vis;
}

void PDDLProblem::addSolver(shared_ptr<Solver> solv){
    solver = solv;
}

void PDDLProblem::simplifyProblem(){
    shared_ptr<simplifyVisitor> simplifier(new simplifyVisitor());
    simplifier->setInits(inits);

    for (const auto& it : sym_table) {
        if(it.second->parent != NULL || 
                static_pointer_cast<Functor>(it.second->data)->getNParams() == 0){
            // nomes simplifiquem en cas de que sigui una operacio aritmetica de moment
            switch(it.second->type){
                case functor_type::T_ACTION:
                    static_pointer_cast<Action>(it.second->data)->accept(simplifier);
                    break;
                default:
                    break;
            }
        }
    }
}

void PDDLProblem::solveUndefined(){
    shared_ptr<undefinedVisitor> undef(new undefinedVisitor());
    undef->setInits(inits);

    for (const auto& it : sym_table) {
        // si es un fluent instanciat o no te parametres
        if(it.second->parent != NULL || 
                static_pointer_cast<Functor>(it.second->data)->getNParams() == 0){

            switch(it.second->type){
                case functor_type::T_FUNCTION:
                    static_pointer_cast<Function>(it.second->data)->accept(undef);
                    break;
                case functor_type::T_ACTION:
                    static_pointer_cast<Action>(it.second->data)->accept(undef);
                    break;
                default:
                    break;
            }
        }
    }

    auto set_del_act = make_shared<std::set< std::string > >(); 
    auto a_trouble = undef->getDeletableActions();
    for(const auto ptr : *a_trouble){
        deleteSymbol(ptr->toString());
        //cout << "ACTION " << ptr->toString() << " FOUND AND DELETED!!" << endl;
        set_del_act->insert(ptr->toString());
    }

    auto set_del_func = make_shared<std::set< std::string > >(); 
    auto f_trouble = undef->getDeletableFunctions();
    for(const auto ptr : *f_trouble){
        deleteSymbol(ptr->toString());
        //cout << "FUNCTION " << ptr->toString() << " FOUND AND DELETED!!" << endl;
        set_del_func->insert(ptr->toString());
    }

    encoder->setDeletedActions(set_del_act);
    encoder->setDeletedFunctions(set_del_func);
    cout << "deleted actions:" << set_del_act->size() << endl; 
    cout << "deleted functions:" << set_del_func->size() << endl; 
}

// Aquesta funcio rep un punter a un arbre que sera l'arrel de l'efecte d'una accio i comprova
// quins predicats i funcions apareixen. En cas d'apareixer els marca com a dinamics.
void PDDLProblem::checkAndSetStaticFunctors() {

    set<string> * names = new set<string>();

    // funcio que seteja recursivament quan troba un predicat o funcio
    std::function<void(shared_ptr<Thing>)> r_set;
    r_set = [&r_set,&names](shared_ptr<Thing> tree) {
        // NOMES es fa anar on se sap que es un functor!
        shared_ptr<Functor> f_tree;
        if( tree->type == functor_type::T_OPERATION ||
                tree->type == functor_type::T_PREDICATE ||
                tree->type == functor_type::T_FUNCTION  ){
            //f_tree = shared_ptr<Functor>((Functor *)&*tree);
            f_tree = static_pointer_cast<Functor>(tree);

            switch(tree->type) {
                case functor_type::T_OPERATION:    
                    {
                        for(int i = 0; i < f_tree->getNParams(); i++){
                            r_set(f_tree->getParam(i)); 
                        }
                    }
                    break;
                case functor_type::T_PREDICATE: 
                case functor_type::T_FUNCTION:     
                    {
                        if(names->find(f_tree->getName()) != names->end()){
                            static_pointer_cast<Functor>(f_tree)->setStatic(false);
                        } else {
                            static_pointer_cast<Functor>(f_tree)->setStatic(true);
                        }
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

    // funcio que acumula totes les aparicions de predicats i efectes en un arbre determinat
    std::function<void(shared_ptr<Thing>)> recur;
    recur = [&recur,&names](shared_ptr<Thing> tree) {
        // NOMES es fa anar on se sap que es un functor!
        shared_ptr<Functor> f_tree;
        if( tree->type == functor_type::T_OPERATION ||
                tree->type == functor_type::T_PREDICATE ||
                tree->type == functor_type::T_FUNCTION  ){
            //f_tree = shared_ptr<Functor>((Functor *)&*tree);
            f_tree = static_pointer_cast<Functor>(tree);

            switch(tree->type) {
                case functor_type::T_OPERATION:    
                    {
                        string op = f_tree->getName();
                        if(op == "when"){
                            recur(f_tree->getParam(1)); // mirem banda de l'efecte
                        } else if(op == "assign"  ||
                                op == "increase" ||
                                op == "decrease"){
                            recur(f_tree->getParam(0)); // mirem banda de l'efecte
                        } else { // default
                            for(int i = 0; i < f_tree->getNParams(); i++){
                                recur(f_tree->getParam(i)); 
                            }
                        }
                    }
                    break;
                case functor_type::T_PREDICATE: 
                case functor_type::T_FUNCTION:     
                    {
                        names->insert(f_tree->getName());
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

    // per totes les accions anem acumulant i finalment tindrem a names tots els noms dels predicats
    // i funcions que apareixen als efectes de les accions a on es modifiquen els seus valors
    for (const auto& it : sym_table) {
        if(it.second->type == functor_type::T_ACTION ){
            shared_ptr<Action> act = static_pointer_cast<Action>(it.second->data);
            recur(act->getRawEffect());
        }
    }

    // per tots els predicats i funcions els setejem a estatics o dinamics segons si l'hem trobat o no
    for(const auto& it : sym_table){
        if(it.second->type == functor_type::T_PREDICATE ||
                it.second->type == functor_type::T_FUNCTION   ){

            if(names->find(it.second->data->getName()) != names->end()){
                static_pointer_cast<Functor>(it.second->data)->setStatic(false);
            } else {
                static_pointer_cast<Functor>(it.second->data)->setStatic(true);
            }
        }
        if(it.second->type == functor_type::T_ACTION){
            r_set(static_pointer_cast<Action>(it.second->data)->getRawPrecondition());
            r_set(static_pointer_cast<Action>(it.second->data)->getRawEffect());
        }
    }
    delete names;
}

// agrupat el codi comu de pred/func/act en aquesta funcio
shared_ptr<vector<shared_ptr<Functor> > > PDDLProblem::encodeFunctor(shared_ptr<Functor> f){
    // vector de strings que retornem
    shared_ptr<vector<shared_ptr<Functor> > > encoding(new vector<shared_ptr<Functor> >());

    // vector de punters a vectors d'strings i vector de iteradors per fer hodometre
    vector<shared_ptr<vector<string> > > sets;
    vector<vector<string>::iterator> it;

    // inicialitzem els dos vectors
    if(f->getNParams() > 0) {
            //cout << "Functor: " <<  f->toString(1) << endl;
        for(int i=0;i < f->getNParams();i++){
            shared_ptr<vector<string>> objs(new vector<string>());
            // TODO runtimecheck de l'atribut type ...
            shared_ptr<Parameter> param = static_pointer_cast<Parameter>(f->getParam(i)); 
            //cout << "Param: " << param->toString(1) << " - " << param->getObjectType() << endl;
            // iterem per el tipus i tots els subtipus de cada parametre i recuperem
            // tots els objectes declarats per fer totes les combinacions.
            shared_ptr<vector<string> > subtypes(getAllSubtypes(param->getObjectType())); //subtipus
            subtypes->push_back(param->getObjectType());                                  // i tipus
            for( const auto& subt : *subtypes ){
                //cout << subt << " is a subtype of " << param->getObjectType() << " per el functor: " << f->getName() << endl;
                for( const auto object : getObjectsByType(subt)){
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
            encoding->push_back(in);
            
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
        shared_ptr<Functor> in = static_pointer_cast<Functor>(f->duplicate());
        encoding->push_back(in);
    }
    return encoding;
}

void PDDLProblem::addNOP(){
    shared_ptr<Action> act = make_shared<Action>("nop");

    Parameter * foo = new Parameter();
    foo->setName("true");
    foo->setValue("true");
    foo->setObjectType("constant");
    foo->setType(functor_type::T_CONSTANT);
    shared_ptr<Parameter> foobar(foo);

    shared_ptr<Functor> pre_root = make_shared<Functor>("ROOT");
    pre_root->addParam(foobar);
    shared_ptr<Functor> eff_root = make_shared<Functor>("ROOT");
    eff_root->addParam(foobar);

    act->setRawPrecondition(pre_root->getParam(0)); 
    act->setRawEffect(eff_root->getParam(0));
    addSymbol(act);
}

void PDDLProblem::encodeProblem(){
    Timer tim;
    tim.start();

#ifdef DEBUG_VERSION
    dump();
#endif

    for (const auto& it : sym_table) {
        if(it.second->parent == NULL ){
            switch(it.second->type){
                // Hem de fer el grounding tant si com no tant per QF_LIA com 
                // per a QF_UFLIA perque ens representa l'estat, i el necessitem
                // expressar de manera explicita
                case functor_type::T_PREDICATE:
                    encodePredicate(it.second);
                    break;
                case functor_type::T_FUNCTION:
                    encodeFunction(it.second);
                    break;
                case functor_type::T_ACTION:
                    encodeAction(it.second);
                    break;
                case functor_type::T_CONSTRAINT:
                    encodeConstraint(it.second);
                    break;
                default:
                    break;
            }
        }
    }

    // com que ho haurem de fer per tots
    for (const auto& it : sym_table) {
        switch(it.second->type){
            case functor_type::T_ACTION:
                expandForalls(static_pointer_cast<Action>((it.second)->data));
                static_pointer_cast<Action>((it.second)->data)->generateFDPairs();
                // expandim els foralls i posem com a parametre estatic els parametres del forall
                break;
            default:
                break;
        }
    }

    encoder->setInits(inits);
    solveUndefined();
    simplifyProblem();
    encoder->setObjective(objective);
    encoder->setTypes(types);
    encoder->setObjects(objects);

    // la visita de rigor ... :P
    for (const auto& it : sym_table) {
        switch(it.second->type){
            case functor_type::T_PREDICATE:
                static_pointer_cast<Functor>(it.second->data)->accept(encoder);
                break;
            case functor_type::T_FUNCTION:
                static_pointer_cast<Function>(it.second->data)->accept(encoder);
                break;
            case functor_type::T_ACTION:
                static_pointer_cast<Action>(it.second->data)->accept(encoder);
                break;
            case functor_type::T_CONSTRAINT:
                static_pointer_cast<Constraint>(it.second->data)->accept(encoder);
                break;
            default:
                break;
        }
    }
    encoder->encodeTheRestPlease();
    //encoder->debug();

    cout << "Time spent encoding: ";
    cout << duration_cast<milliseconds>(tim.elapsed()).count() << " milliseconds" << endl;
}

void PDDLProblem::encodePredicate(shared_ptr<sym_register> pred){
    shared_ptr<Predicate> predicate = static_pointer_cast<Predicate>(pred->data);
    shared_ptr<vector<shared_ptr<Functor> > > data = encodeFunctor(predicate);
    for( const auto element : *data){
        addSymbol(element);
        getSymbol(element->toString())->parent = predicate;
    }
}

void PDDLProblem::encodeFunction(shared_ptr<sym_register> func){
    shared_ptr<Function> function = static_pointer_cast<Function>(func->data);
    shared_ptr<vector<shared_ptr<Functor> > > data = encodeFunctor(function);
    for( const auto element : *data){
        addSymbol(element);
        getSymbol(element->toString())->parent = function;
    }
}

void PDDLProblem::encodeConstraint(shared_ptr<sym_register> con){
    shared_ptr<Constraint> constraint = static_pointer_cast<Constraint>(con->data);
    shared_ptr<vector<shared_ptr<Functor> > > data = encodeFunctor(constraint);
    for( const auto element : *data){

        shared_ptr<Constraint> inst_constraint(static_pointer_cast<Constraint>(element));

        // si tenim algun valor, osigui,
        if(inst_constraint->getNParams() > 0){
            shared_ptr<vector<string> > values(new vector<string>());
            shared_ptr<vector<shared_ptr<Parameter> > > parameters(
                    new vector<shared_ptr<Parameter> > ());
            for(int i = 0; i < inst_constraint->getNParams(); i++){
                shared_ptr<Parameter> p = static_pointer_cast<Parameter>(inst_constraint->getParam(i));
                values->push_back(p->getValue());
                parameters->push_back(p);
            }

            shared_ptr<Thing> condition = inst_constraint->getRawCondition();
            anthelp::searchAndReplaceValues(values, parameters, condition);
        }

        addSymbol(element);
        getSymbol(element->toString())->parent = constraint;
    }
}

void PDDLProblem::encodeAction(shared_ptr<sym_register> act){
    shared_ptr<Action> action = static_pointer_cast<Action>(act->data);
    shared_ptr<vector<shared_ptr<Functor> > > data = encodeFunctor(action);
    for( const auto element : *data){

        shared_ptr<Action> inst_action(static_pointer_cast<Action>(element));

        // si tenim algun valor, osigui,
        if(inst_action->getNParams() > 0){
            shared_ptr<vector<string> > values(new vector<string>());
            shared_ptr<vector<shared_ptr<Parameter> > > parameters(
                    new vector<shared_ptr<Parameter> > ());
            for(int i = 0; i < inst_action->getNParams(); i++){
                shared_ptr<Parameter> p = static_pointer_cast<Parameter>(inst_action->getParam(i));
                values->push_back(p->getValue());
                parameters->push_back(p);
            }

            shared_ptr<Thing> tree1 = inst_action->getRawPrecondition();
            shared_ptr<Thing> tree2 = inst_action->getRawEffect();
            anthelp::searchAndReplaceValues(values, parameters, tree1);
            anthelp::searchAndReplaceValues(values, parameters, tree2);
        }

        addSymbol(element);
        getSymbol(element->toString())->parent = action;
    }
}

// el planning es crear un functor temporal, ferlo explotar i per cada un, com
// que tenim el nom i valor crear una copia del que penja del forall, arrelarla
// i canviar totes les variables a predicats i funcions amb aquell nom per el
// valor pur i dur. Vamos, canviar el node "variable" per un node "name" o
// "number"
// TODO: fer el mateix per els efectes?
void PDDLProblem::expandForalls(shared_ptr<Action> act){

    shared_ptr<Thing> pre = act->getRawPrecondition();
    shared_ptr<Thing> eff = act->getRawEffect();
    // si començem amb una "operacio" i no amb una constant 
    // o predicat o efecte o variable, pot ser que tinguem foralls a dins,
    if( pre->type == functor_type::T_OPERATION){

        std::function<void(shared_ptr<Functor>)> recur;

        // Aquesta lambda agafa i recorre
        recur = [&](shared_ptr<Functor> tree) {
            if( tree->type == functor_type::T_OPERATION ){
                switch(tree->type) {
                    case functor_type::T_OPERATION:    
                        {
                            string op = tree->getName();
                            if(op == "forall"){

                                size_t n_param = tree->getNParams();// N - 1 seran parametres, l'N el contingut del forall
                                shared_ptr<Thing> forall_content = tree->getParam(n_param-1);
                                shared_ptr<vector<shared_ptr<Parameter> > > parameters(
                                        new vector<shared_ptr<Parameter> > ());

                                // del primer al penultim
                                for(size_t i = 0; i < n_param - 1; i++){
                                    parameters->push_back(static_pointer_cast<Parameter>(tree->getParam(i)));
                                }

                                // recuperem tots els objectes dels parametres
                                vector<shared_ptr<vector<string> > > sets;
                                vector<vector<string>::iterator> it;
                                for(const auto param: *parameters){
                                    shared_ptr<vector<string>> objs(new vector<string>());
                                    // iterem per el tipus i tots els subtipus de cada parametre i recuperem
                                    // tots els objectes declarats per fer totes les combinacions.
                                    shared_ptr<vector<string> > subtypes(getAllSubtypes(param->getObjectType())); 
                                    subtypes->push_back(param->getObjectType());                                
                                    for( const auto& subt : *subtypes ){
                                        for( const auto object : this->getObjectsByType(subt)){
                                            objs->push_back(object);
                                        }
                                    }
                                    sets.push_back(objs);
                                    it.push_back(sets[sets.size()-1]->begin());
                                }

                                // ara generem totes les combinacions!
                                shared_ptr< vector< shared_ptr<vector<string> > > > combinacions(
                                        new vector< shared_ptr<vector<string> > >());

                                while(it[0] != sets[0]->end()){
                                    shared_ptr<vector<string> > values(new vector<string>());
                                    for(unsigned int i = 0; i < sets.size(); i++){
                                        values->push_back(*(it[i]));
                                    } 
                                    combinacions->push_back(values);
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

                                // calculem quantes copies haurem de fer de l'interior del forall
                                unsigned int n_copies = 1;
                                for(const auto values : sets){
                                    n_copies = n_copies * values->size();
                                }

                                // i finalment reemplaçem
                                shared_ptr<Functor> wrapper(new Functor("and"));
                                wrapper->setType(functor_type::T_OPERATION);
                                for(unsigned int i = 0; i < n_copies; i++){
                                    shared_ptr<vector<string> > combo = (*combinacions)[i];
                                    shared_ptr<Thing> copia = forall_content->duplicate();
                                    // substituim
                                    anthelp::searchAndReplaceValues(combo,parameters,copia,true);
                                    wrapper->addParam(copia);
                                }

                                tree->setName("and");
                                while(tree->getNParams() > 0){
                                    tree->popParam();
                                }
                                for(int i = 0; i < wrapper->getNParams(); i++){
                                    tree->addParam(wrapper->getParam(i));
                                }
                                // DEBUG  TODO DELETE -------------------------------------
                                /*
                                for(const auto comb : *combinacions){
                                for(const auto val : *comb){
                                cout << val << ",";
                                } cout << endl;
                                }
                                for(size_t i = 0; i < parameters->size();i++){
                                cout << "parameter " << (*parameters)[i]->getName() << " with type ";
                                cout << (*parameters)[i]->getObjectType() << ":" << endl;
                                for(const auto value : *sets[i]){
                                cout << value << ", ";
                                } cout << endl;
                                }

                                cout << "that makes " << n_copies << " copies " << endl;
                                for(size_t i = 0; i < n_copies; i++){
                                cout << wrapper->getParam(i)->toString() << endl;
                                }

                                cout << "I queda aixi: " << tree->toString() << endl;
                                // END DEBUG TODO DELETE -----------------------------------

                                // i mirem si son foralls anidats  (iterem pel contingut)
                                */

                                // TODO check aquest cast ... 
                                if( tree->getNParams() > n_param - 1){
                                    recur(static_pointer_cast<Functor>(tree->getParam(n_param - 1))); 
                                }

                                //i finalment substituir l'original per el wrapper
                                //tree->popParam();
                                //tree->addParam(wrapper);

                            } else { // default
                                for(int i = 0; i < tree->getNParams(); i++){
                                    recur(static_pointer_cast<Functor>(tree->getParam(i))); 
                                }
                            }
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

        recur(static_pointer_cast<Functor>(pre));  // i cridem la funcio
        recur(static_pointer_cast<Functor>(eff));  // i cridem la funcio
    }
}

void PDDLProblem::dump(){
    cout << "***************** PROBLEM ************" << endl << endl;
    for (const auto symbol : sym_table) {
        cout << (symbol.first);
        if((symbol.second)->parent != NULL){
            cout << " parent: " << (symbol.second)->parent->toString();
        } else {
            cout << " parent: NULL ";
        }
        if( static_pointer_cast<Functor>(symbol.second->data)->getStatic() ){
            cout << " (static) ";
        } else {
        }
        cout << endl; // << flush << " -> " << << endl;
    }
}

void PDDLProblem::solve(){
    encoder->setSolver(solver);
    encoder->solve();
}
