#include "action.h"

using namespace std;

Action::Action() : Functor(){
    type = functor_type::T_ACTION;
    return_type = "unknown";
}

Action::Action(std::string n, functor_type type, bool is_stat) : Functor(n,type,is_stat) {
    return_type = "unknown";
}

Action::~Action(){
}

void Action::setReturnType(string type){
    return_type = type;
}

string Action::getReturnType(){
    return return_type;
}

std::shared_ptr<Parameter> Action::getParamByName(string n){
    for(const auto param : container){
        auto ptr = static_pointer_cast<Parameter>(param);
        if(ptr->getName() == n){
            return ptr;
        }
    }
    assert(false);
    return NULL;
}

shared_ptr<Thing> Action::duplicate(){
    // necessari pq sino no reserva la memoria per la resta d'atributs: raw_*
    shared_ptr<Action> ptr_action(new Action(*this));
    shared_ptr<Action> ptr_functor(static_pointer_cast<Action>(Functor::duplicate()));

    ptr_action->container = ptr_functor->container;
    ptr_action->setRawPrecondition(this->raw_precondition->duplicate());
    ptr_action->setRawEffect(this->raw_effect->duplicate());
    return ptr_action;
}

void Action::setRawPrecondition(shared_ptr<Thing> ptr){
    raw_precondition = ptr;
}

void Action::setRawEffect(shared_ptr<Thing> ptr){
    raw_effect = ptr;
}

std::shared_ptr<Thing> Action::getRawPrecondition(){
    return raw_precondition;
}

std::shared_ptr<Thing> Action::getRawEffect(){
    return raw_effect;
}

pair<shared_ptr<Thing>, shared_ptr<Thing> > Action::getFD(unsigned int i){
    return make_pair( f_pairs[i] , d_pairs[i] );
}

int Action::getNFDs(){
    assert(f_pairs.size() == d_pairs.size());
    return f_pairs.size();
}

void Action::generateFDPairs(){

    std::vector< std::shared_ptr<Thing> > tmp_f_pairs;
    std::vector< std::shared_ptr<Thing> > tmp_d_pairs;

    f_pairs.clear();    
    d_pairs.clear();

    Parameter * foo = new Parameter();
    foo->setName("true");
    foo->setValue("true");
    foo->setObjectType("constant");
    foo->setType(functor_type::T_CONSTANT);
    shared_ptr<Parameter> foobar(foo);

    std::function<void(shared_ptr<Thing>)> recur;
    recur = [&](shared_ptr<Thing> tree) {
        shared_ptr<Functor> f_tree;

        if(     tree->type == functor_type::T_OPERATION ||
                tree->type == functor_type::T_PREDICATE ||
                tree->type == functor_type::T_FUNCTION  ){
            f_tree = static_pointer_cast<Functor>(tree);

            switch(f_tree->type) {
                case functor_type::T_OPERATION:    
                    {
                        string op = f_tree->getName();
                        if(op == "when"){
                            if(f_tree->getParam(1)->getType() == functor_type::T_OPERATION){
                                /* no veig perque ho hem de fer ....
                                    shared_ptr<Functor> when_effect = static_pointer_cast<Functor>(f_tree->getParam(1));
                                    if(when_effect->getName() == "and"){ // si l'efecte del when es un and, el descomposem
                                        for(int i = 0; i < when_effect->getNParams(); i++){
                                            tmp_f_pairs.push_back(f_tree->getParam(0)); 
                                            tmp_d_pairs.push_back(when_effect->getParam(i));
                                        }
                                     
                                } else {*/
                                    tmp_f_pairs.push_back(f_tree->getParam(0)); // la condicio del when
                                    tmp_d_pairs.push_back(f_tree->getParam(1)); // l'efecte del when
                                //}
                            }
                        } else if(op == "not"  ||
                                op == "increase" ||
                                op == "decrease" || 
                                op == "assign"){
                            tmp_f_pairs.push_back(foobar); // true 
                            tmp_d_pairs.push_back(tree);
                        } 
                        else { // default
                            for(int i = 0; i < f_tree->getNParams(); i++){
                                recur(f_tree->getParam(i)); 
                            }
                        }
                    }
                    break;
                case functor_type::T_PREDICATE: 
                    {
                        tmp_f_pairs.push_back(foobar); // true 
                        tmp_d_pairs.push_back(tree);
                    }
                    break;
                default:
                    cout << this->toString() << " ::: " << f_tree->toString() << " cannot be translated to f->d" << endl;
                    cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
                    break;
            }
        } else {
            // herpderp, es una constant, placeholder o whatever
        }
    };

    recur(raw_effect);


    // un cop generats els F->D , ajuntem els que tinguin "true" com a precondicio
    unsigned int i = 0;
    shared_ptr<Functor> and_glob(new Functor("and",functor_type::T_OPERATION));
    while (i < tmp_f_pairs.size()){
        if(tmp_f_pairs.at(i) == foobar){ // foobar es el true ...
            and_glob->addParam(tmp_d_pairs.at(i));
        } else {
            f_pairs.push_back(tmp_f_pairs.at(i));
            d_pairs.push_back(tmp_d_pairs.at(i));
        }
        i++;
    }
    // i finalment empilem el true
    if(and_glob->getNParams() > 0){
        f_pairs.push_back(foobar);
        d_pairs.push_back(and_glob);
    }
}

void Action::accept(shared_ptr<nodeVisitor> v){
    for(const auto & elem : container){
        elem->accept(v);
    }
    v->visitAction(dynamic_pointer_cast<Action>(shared_from_this()));
}

std::ostream &operator << (std::ostream &o, const Action &f) {
    o << "(Action:" << f.toString() << endl;
    for(unsigned int i = 0; i < f.f_pairs.size(); i++){
        cout << "\t" << (f.f_pairs[i])->toString() << "  ===>>> " << (f.d_pairs[i])->toString() << endl;
    }

    o << ")" << endl;
    return o;
}

string Action::toString(int t,bool relaxed) const{
    string foobar = getName() + "__";
   
    if(container.size() > 0){ foobar += container[0]->toString(t,relaxed); }
    for(unsigned int i = 1; i < container.size(); i++){
        foobar += "__" + container[i]->toString(t,relaxed);
    }

    if(!getStatic()){
        if(t == 1){ foobar += "__@";
        } else if(t == 2){ foobar += "__#"; }
    }

    return foobar;
}

string Action::toStringUF(int t) const {

    string foobar = "(" + getName();
   
    for(unsigned int i = 0; i < container.size(); i++){
        if(t == 3){
            foobar += " " + container[i]->toStringUF(1);
        } else {
            foobar += " " + container[i]->toStringUF(t);
        }
    }

    if(t == 1){ foobar += " @TS@";
    } else if(t > 1){ foobar += " #TS#"; }

    foobar += ")";

    return foobar;
}
