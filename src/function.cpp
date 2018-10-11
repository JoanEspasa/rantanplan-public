#include "function.h"

using namespace std; 

Function::Function() : Functor(){
    type = functor_type::T_FUNCTION;
    return_type = "number";
}

Function::Function(std::string n, functor_type type, bool is_static) : Functor(n,type,is_static) {
}

Function::~Function(){
}

void Function::setReturnType(string type){
    return_type = type;
}

string Function::getReturnType(){
    return return_type;
}

shared_ptr<Thing> Function::duplicate(){
    shared_ptr<Function> ptr(new Function(*this));
    shared_ptr<Function> ptr_func(static_pointer_cast<Function>(Functor::duplicate()));

    ptr->container = ptr_func->container;
    return ptr;
}

void Function::accept(shared_ptr<nodeVisitor> v){
    for(const auto & elem : container){
        elem->accept(v);
    }
    v->visitFunction(dynamic_pointer_cast<Function>(shared_from_this()));
}

string Function::toString(int t,bool relaxed) const{
    if(relaxed){
        return "true";
    } else{
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
}

string Function::toStringUF(int t) const{

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
