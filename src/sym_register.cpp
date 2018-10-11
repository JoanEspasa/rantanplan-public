#include "sym_register.h"

using namespace std;

sym_register::sym_register(){
}

sym_register::~sym_register(){
}

sym_register::sym_register( std::string k, functor_type t,
        std::shared_ptr<Thing> d,
        std::shared_ptr<Thing> p){
    key = k;
    type = t;
    data = d;
    parent = p;
}


