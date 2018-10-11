#include "predicate.h"

using namespace std; 

Predicate::Predicate() : Functor(){
    type = functor_type::T_PREDICATE;
    return_type = "unknown";
}

Predicate::Predicate(std::string n, functor_type type, bool is_static) : Functor(n,type,is_static) {
}

Predicate::~Predicate(){
}

void Predicate::setReturnType(string type){
    return_type = type;
}

string Predicate::getReturnType(){
    return return_type;
}

shared_ptr<Thing> Predicate::duplicate() {
    shared_ptr<Predicate> ptr(new Predicate(*this));
    shared_ptr<Predicate> ptr_pred(static_pointer_cast<Predicate>(Functor::duplicate()));

    ptr->container = ptr_pred->container;
    return ptr;
}

void Predicate::accept(shared_ptr<nodeVisitor> v){
    for(const auto & elem : container){
        elem->accept(v);
    }
    v->visitPredicate(dynamic_pointer_cast<Predicate>(shared_from_this()));
}

string Predicate::toString(int t,bool relaxed) const{

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

string Predicate::toStringUF(int t) const{

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

