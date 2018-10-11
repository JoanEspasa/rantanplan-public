#include "functor.h"

using namespace std; 

Functor::Functor(){
    name = "uninitialized";
    container.resize(0);
}

Functor::Functor(string n, functor_type t, bool stat){
    is_static = stat;
    //setName(n); // no podem fer aixo aqui pq fa saltar un bug, sembla
    //que ho faig anar (la classe functor) per guardar model traduit, i per tant
    // peto els negatius i les restes ... :/
    name = n;
    type = t;
    container.resize(0);
}

Functor::~Functor() {
}

shared_ptr<Thing> Functor::duplicate(){
    shared_ptr<Functor> ptr(new Functor());
    ptr->name = name;
    ptr->is_static = is_static;
    ptr->type = type;
    ptr->container.resize(0);

    for(const auto foo: container){
        ptr->addParam(foo->duplicate());
    } 

    return ptr;
}

// sets
void Functor::setName(string n){
    // HACK
    // HACK perque el codi dels solvers no soporta noms amb guions entre mig (els 'parseja' com a restes)
    // HACK
    std::function<string(string, string, string)> s_a_r;
    s_a_r = [&](string s, string search, string replace)->string {
        size_t pos = s.find(search);
        while(pos != string::npos){
            s.replace(pos, search.length(), replace);
            pos = s.find(search);
        }
        return s;
    };

    name = s_a_r(n,"-","_");
}

// adds
void Functor::addParam(shared_ptr<Thing> elem){
    container.push_back(elem);
}

void Functor::replaceParam(int i, std::shared_ptr<Thing> elem){
    container.erase(container.begin()+i);
    container.insert(container.begin()+i,elem);
}

// gets
string Functor::getName() const {
    return name;
}

// removes last parameter
void Functor::popParam(){
    container.pop_back();
}

shared_ptr<Thing> Functor::getParam(int n) const {
    return container.at(n);
}

int Functor::getNParams(){
    return container.size();
}

bool Functor::isInstanced(){
    bool is_instanced = true;
    int i = 0;
    while(is_instanced && i < getNParams()){
        if(getParam(i)->type == functor_type::T_CONSTANT ||
                getParam(i)->type == functor_type::T_VARIABLE){
            if(! static_pointer_cast<Parameter>(getParam(i))->hasValue()){
                is_instanced = false; 
            }
        } else { is_instanced = false; }
        i++;
    }
    return is_instanced;
}

string Functor::toString(int t,bool relaxed) const {
    if(getName() == "increase" && !relaxed){
            string s_efecte = "=(" + getParam(0)->toString(2) + ",";
            s_efecte += "+(";
            s_efecte += getParam(0)->toString(1) + "," + getParam(1)->toString(1) + "))";
            return s_efecte;
    } else if(getName() == "decrease" && !relaxed){
            string s_efecte = "=(" + getParam(0)->toString(2) + ",";
            s_efecte += "-(";
            s_efecte += getParam(0)->toString(1) + "," + getParam(1)->toString(1) + "))";
            return s_efecte;
    } else if(getName() == "assign" && !relaxed){
            string s_efecte = "=(" + getParam(0)->toString(2) + ",";
            s_efecte += getParam(1)->toString(1) + ")";
            return s_efecte;
    } else {

        // UBER HACK
        if(relaxed && getName() == ">") { return "true"; }
        if(relaxed && getName() == "<") { return "true"; }
        if(relaxed && getName() == ">="){ return "true"; }
        if(relaxed && getName() == "<="){ return "true"; }
        if(relaxed && getName() == "=") { return "true"; }
        if(relaxed && getName() == "!="){ return "true"; }
        if(relaxed && getName() == "+"){ return "true"; }
        if(relaxed && getName() == "-"){ return "true"; }
        if(relaxed && getName() == "*"){ return "true"; }
        if(relaxed && getName() == "increase"){ return "true"; }
        if(relaxed && getName() == "decrease"){ return "true"; }
        if(relaxed && getName() == "assign"){ return "true"; }
        if(relaxed && getName() == "not" && t == 2){ return "true"; }

        string foobar = getName() + "(";
       
        if(container.size() > 0){
            foobar += container[0]->toString(t,relaxed); 
        }
        for(unsigned int i = 1; i < container.size(); i++){
            foobar += "," + container[i]->toString(t,relaxed);
        }

        return foobar + ")";
    }
}

string Functor::toStringUF(int t) const {
    if(getName() == "increase"){
            string s_efecte = "(= " + getParam(0)->toStringUF(3) + " ";
            s_efecte += "(+ ";
            s_efecte += getParam(0)->toStringUF(1) + " " + getParam(1)->toStringUF(1) + "))";
            return s_efecte;
    } else if(getName() == "decrease"){
            string s_efecte = "(= " + getParam(0)->toStringUF(3) + " ";
            s_efecte += "(- ";
            s_efecte += getParam(0)->toStringUF(1) + " " + getParam(1)->toStringUF(1) + "))";
            return s_efecte;
    } else if(getName() == "assign"){
            string s_efecte = "(= " + getParam(0)->toStringUF(3) + " ";
            s_efecte += getParam(1)->toStringUF(1) + ")";
            return s_efecte;
    } else {
        string nom = getName();
        if(nom == "impl"){ nom = "=>"; } // HACK HACK HACK TODO TODO TODO
        string foobar = "(" + nom;
        for(unsigned int i = 0; i < container.size(); i++){
            foobar += " " + container[i]->toStringUF(t);
        }
        return foobar + ")";
    }
}

void Functor::accept(shared_ptr<nodeVisitor> v){
    for(const auto & elem : container){
            elem->accept(v);
    }
    v->visitFunctor(dynamic_pointer_cast<Functor>(shared_from_this()));
}

std::ostream &operator << (std::ostream &o, const Functor &f) {
    o << "==";
    o << "== Functor: " << f.getName() << endl;
    o << "== static: " << f.is_static << endl;
    /*
    o << "== Params: ";
    for (const auto& it : f.params) {
        o << it.first << "," << it.second << " ";
    }
    o << std::endl;*/
    return o;
}

