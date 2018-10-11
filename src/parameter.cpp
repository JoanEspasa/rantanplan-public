#include "parameter.h"

using namespace std; 

Parameter::Parameter() : Thing() {
    value       = "";
    type        = functor_type::T_VARIABLE;
    object_type = "unknown";
}

Parameter::~Parameter(){
}

shared_ptr<Thing> Parameter::duplicate(){
    auto ptr = shared_ptr<Parameter>(new Parameter(*this));
    ptr->setType(type);
    /*cout << "duplicating " << toString(1) << " with type " ; //to " << ptr->toString(1) << endl;
    if(type == functor_type::T_PREDICATE){
        cout << "predicat";
    } else if(type == functor_type::T_FUNCTION){
        cout << "function";
    } else if(type == functor_type::T_ACTION){
        cout << "action";
    } else if(type == functor_type::T_OPERATION){
        cout << "operation";
    } else if(type == functor_type::T_CONSTANT){
        cout << "constant";
    } else if(type == functor_type::T_VARIABLE){
        cout << "variable";
    } else if(type == functor_type::T_UNKNOWN){
        cout << "unknown";
    } 
    cout << endl;*/

    return ptr;
}

void Parameter::setValue(string v){
    value = v;
}

void Parameter::setObjectType(string t){
    object_type = t;
}

void Parameter::setName(string n){
    name = n;
}

string Parameter::getName() const {
    return name;
}

string Parameter::getValue() const {
    return value;
}

string Parameter::getObjectType(){
    return object_type;
}

bool Parameter::hasValue() const {
    return !(value == "");
}

string Parameter::toString(int t,bool relaxed) const {
    if(hasValue()){
        return value;// + " - " + object_type;
    } else {
        return name;// + " - " + object_type;
    }
}

string Parameter::toStringUF(int t) const{
    string extra = "";
    if(type == functor_type::T_VARIABLE){
        if(t == 1) {
            extra = "_@TS@";
        } else if(t>1){
            extra = "_#TS#";
        }
    }

    if(hasValue()){
        return value + extra;// + " - " + object_type;
    } else {
        return name + extra;// + " - " + object_type;
    }
}

void Parameter::accept(shared_ptr<nodeVisitor> v){
    v->visitParameter(dynamic_pointer_cast<Parameter>(shared_from_this()));
    return;
}

std::ostream &operator << (std::ostream &o, const Parameter &f) {
    o << "(Param:" << f.getName() << " Val:" << f.getValue() << ")" << endl;
    return o;
}

