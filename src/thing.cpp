#include "thing.h"

using namespace std; 

Thing::Thing(){
    is_static = false;
    type = functor_type::T_UNKNOWN;
}

Thing::~Thing(){
}

void Thing::setStatic(bool n){
    is_static = n;
}

void Thing::setType(functor_type t){
    type = t;
}

bool Thing::getStatic() const{
    return is_static;
}

functor_type Thing::getType(){
    return type;
}

void Thing::accept(shared_ptr<nodeVisitor> v){
    std::cout << "ERR! " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
}
