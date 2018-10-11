#include "constraint.h"

using namespace std;

Constraint::Constraint() : Functor(){
    type = functor_type::T_CONSTRAINT;
    return_type = "unknown";
}

Constraint::Constraint(std::string n, functor_type type, bool is_stat) : Functor(n,type,is_stat) {
    return_type = "unknown";
}

Constraint::~Constraint(){
}


void Constraint::setRawCondition(shared_ptr<Thing> ptr){
    raw_condition = ptr;
}

void Constraint::setReturnType(string type){
    return_type = type;
}

std::shared_ptr<Thing> Constraint::getRawCondition(){
    return raw_condition;
}

string Constraint::getReturnType(){
    return return_type;
}

std::shared_ptr<Parameter> Constraint::getParamByName(string n){
    for(const auto param : container){
        auto ptr = static_pointer_cast<Parameter>(param);
        if(ptr->getName() == n){
            return ptr;
        }
    }
    assert(false);
    return NULL;
}

shared_ptr<Thing> Constraint::duplicate(){
    // necessari pq sino no reserva la memoria per la resta d'atributs: raw_*
    shared_ptr<Constraint> ptr_constraint(new Constraint(*this));
    shared_ptr<Constraint> ptr_functor(static_pointer_cast<Constraint>(Functor::duplicate()));

    ptr_constraint->container = ptr_functor->container;
    ptr_constraint->setRawCondition(this->raw_condition->duplicate());
    return ptr_constraint;
}

/*
void Constraint::generateFDPairs(){

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
}*/

void Constraint::accept(shared_ptr<nodeVisitor> v){
    for(const auto & elem : container){
        elem->accept(v);
    }
    v->visitConstraint(dynamic_pointer_cast<Constraint>(shared_from_this()));
}

//std::ostream &operator << (std::ostream &o, const Constraint &f) {
std::ostream &operator << (std::ostream &o, Constraint &f) {
    o << "(Constraint:" << f.getName() << endl;
    cout << "\t" << f.getRawCondition()->toString() << endl;

    o << ")" << endl;
    return o;
}


string Constraint::toString(int t,bool relaxed) const{
    string foobar = getName() + "__";
   
    if(container.size() > 0){ foobar += container[0]->toString(t); }
    for(unsigned int i = 1; i < container.size(); i++){
        foobar += "__" + container[i]->toString(t);
    }

    if(!getStatic()){
        if(t == 1){ foobar += "__@";
        } else if(t == 2){ foobar += "__#"; }
    }

    return foobar;
}

string Constraint::toStringUF(int t) const {

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
