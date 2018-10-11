#include "simplifyVisitor.h"

using namespace std;

simplifyVisitor::simplifyVisitor() {
}

simplifyVisitor::~simplifyVisitor(){
}

void simplifyVisitor::visitParameter( shared_ptr<Parameter> ptr){
}

void simplifyVisitor::visitFunctor( shared_ptr<Functor> ptr){
}

void simplifyVisitor::visitPredicate( shared_ptr<Predicate> ptr){
}

void simplifyVisitor::visitFunction( shared_ptr<Function> ptr){

}

// TODO SIMPLIFICAR AMB BOOLEANS, val la pena? a primera instancia sembla que no ...
void simplifyVisitor::visitAction( shared_ptr<Action> ptr){
    //cout << "Visiting: " << ptr->toString() << endl;

    // get_Value: pot ser dos coses, un parameter constant, o un functor constant
    // que hagi sigut inicialitzat a l'inici.
    std::function<int(shared_ptr<Thing>)> getValue;
    getValue = [&](shared_ptr<Thing> tree) -> int {
        // si es una constant tornem el seu valor 
        if(tree->type == functor_type::T_CONSTANT){
            return std::stoi(static_pointer_cast<Parameter>(tree)->getValue());

            // si es un functor el busquem als inits i hi passem el valor
        } else if(tree->type == functor_type::T_FUNCTION){
            for(const auto & init : *p_inits){
                //cout << static_pointer_cast<Functor>(init->getParam(0))->toString();
                //cout << " == " << tree->toString() << "?" << endl;
                if(init->type == functor_type::T_OPERATION &&
                        init->getName() == "=" &&
                        static_pointer_cast<Functor>(init->getParam(0))->toString() == tree->toString()){
                    // TODO Caldria comprovar si es un objectfluent!!! (fet a undefinedVisitor)
                    return std::stoi(init->getParam(1)->toString(1));
                }
            }
        } /*else if(tree->type == functor_type::T_PREDICATE){ // TODO CONSIDEREM QUE NOMES INICIALITZEM A TRUE
            for(const auto & init : *p_inits){

                    cout << static_pointer_cast<Predicate>(init->getParam(0))->toString();
                    cout << " == " << tree->toString() << "?" << endl;
                if(init->type == functor_type::T_PREDICATE &&
                    static_pointer_cast<Predicate>(init->getParam(0))->toString() == tree->toString()){

                    return std::stoi(init->getParam(1)->toString(1));
                }
            }
        }*/

        cout << "ERR! var no inicialitzada? " << __func__ << " " << __FILE__ << " " << __LINE__ << " " << tree->toString();
        cout << "  tipus:";
        if(tree->type == functor_type::T_PREDICATE){
            cout << "predicat";
        } else if(tree->type == functor_type::T_FUNCTION){
            cout << "function";
        } else if(tree->type == functor_type::T_ACTION){
            cout << "action";
        } else if(tree->type == functor_type::T_OPERATION){
            cout << "operation";
        } else if(tree->type == functor_type::T_CONSTANT){
            cout << "constant";
        } else if(tree->type == functor_type::T_VARIABLE){
            cout << "variable";
        } else if(tree->type == functor_type::T_UNKNOWN){
            cout << "unknown";
        } 
        cout << endl;
        return (-1);
    };

    std::function<void(shared_ptr<Thing>,int,shared_ptr<Thing>)> recur_values;
    recur_values = [&](shared_ptr<Thing> parent, int num_child, shared_ptr<Thing> child) {

        shared_ptr<Functor> f_parent;
        shared_ptr<Functor> f_child;
        
        if( (child->type == functor_type::T_OPERATION  ||
//             child->type == functor_type::T_PREDICATE  ||
             child->type == functor_type::T_FUNCTION)  &&
            (parent->type == functor_type::T_OPERATION ||
//             parent->type == functor_type::T_PREDICATE ||
             parent->type == functor_type::T_FUNCTION)
          ){

            f_child  = static_pointer_cast<Functor>(child);
            f_parent = static_pointer_cast<Functor>(parent);

            switch(child->type) {
                case functor_type::T_PREDICATE: 
                case functor_type::T_FUNCTION:
                    {
                        if(f_child->getStatic()){
                            shared_ptr<Parameter> new_value(new Parameter());
                            new_value->setName("new_value");
                            new_value->setValue(std::to_string(getValue(child)));
                            new_value->setType(functor_type::T_CONSTANT);
                            new_value->setObjectType("constant");
                            //cout << "SUBSTS: " << f_child->toString() << " per " << new_value->toString() << " a " << f_parent->toString(1) << endl;
                            f_parent->replaceParam(num_child,new_value);
                        }
                    };
                    break;
                case functor_type::T_OPERATION:    
                    {    
                        for(int i = 0; i < f_child->getNParams(); i++){
                            recur_values(child,i,f_child->getParam(i)); 
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

    std::function<void(shared_ptr<Thing>)> recur_base_values;
    recur_base_values = [&](shared_ptr<Thing> tree) {
        shared_ptr<Functor> f_tree;
        if( tree->type == functor_type::T_OPERATION){
            f_tree = static_pointer_cast<Functor>(tree);

            switch(tree->type) {
                case functor_type::T_OPERATION:    
                case functor_type::T_PREDICATE: 
                case functor_type::T_FUNCTION:
                    {    
                        for(int i = 0; i < f_tree->getNParams(); i++){
                            recur_values(tree,i,f_tree->getParam(i));
                        }
                    };
                    break;
                default: 
                    break;
            }
        }

    };

    std::function<void(shared_ptr<Thing>)> recur_func;
    recur_func = [&](shared_ptr<Thing> tree) {
        shared_ptr<Functor> f_tree;
        if( tree->type == functor_type::T_OPERATION ||
                tree->type == functor_type::T_PREDICATE ||
                tree->type == functor_type::T_FUNCTION  ){
            f_tree = static_pointer_cast<Functor>(tree);

            switch(tree->type) {
                case functor_type::T_OPERATION:    
                case functor_type::T_PREDICATE: 
                case functor_type::T_FUNCTION:
                    {    
                        for(int i = 0; i < f_tree->getNParams(); i++){
                            if(f_tree->getParam(i)->type == functor_type::T_OPERATION){
                                shared_ptr<Functor> p_operation = static_pointer_cast<Functor>(f_tree->getParam(i));

                                
                                bool simplificable = true;

                                // si es una operacio simplificable
                                if(p_operation->getName() == "+" ||
                                        p_operation->getName() == "-" ||
                                        p_operation->getName() == "*" ||
                                        p_operation->getName() == "/"){

                                    // mirem si tots els parametres de l'operació són estatics o constants
                                    for(int j = 0; j < p_operation->getNParams(); j++){
                                        bool es_salva = false;

                                        if(p_operation->getParam(j)->type == functor_type::T_CONSTANT){
                                            es_salva = true;
                                        }

                                        if(p_operation->getParam(j)->type == functor_type::T_FUNCTION ||
                                                p_operation->getParam(j)->type == functor_type::T_PREDICATE){
                                            if(static_pointer_cast<Functor>(p_operation->getParam(j))->getStatic()){
                                                es_salva = true;
                                            }
                                        }

                                        if(!es_salva){
                                            simplificable = false;
                                        }
                                    }

                                } else {
                                    simplificable = false;
                                }

                                // si finalment es simplificable ... 
                                // ss << atoi(lhs.c_str())/atoi(rhs.c_str())
                                if(simplificable){
                                    int value;
                                    if(p_operation->getName() == "+"){
                                        value = 0;
                                        for(int j = 0; j < p_operation->getNParams(); j++){
                                            value += getValue(p_operation->getParam(j)); 
                                        }
                                    }else if( p_operation->getName() == "-"){
                                        assert(p_operation->getNParams() == 2); // la resta es binaria
                                        value = getValue(p_operation->getParam(0)) - getValue(p_operation->getParam(1));
                                    }else if( p_operation->getName() == "*"){ 
                                        value = 1;
                                        for(int j = 0; j < p_operation->getNParams(); j++){
                                            value *= getValue(p_operation->getParam(j)); 
                                        }
                                    }else if( p_operation->getName() == "/"){
                                        assert(p_operation->getNParams() == 2); // la div es binaria
                                        value = getValue(p_operation->getParam(0)) / getValue(p_operation->getParam(1));
                                    } else {
                                        cerr << "the value variable could not initialize" << endl;
                                        abort();
                                    }
                                    shared_ptr<Parameter> new_value(new Parameter());
                                    new_value->setName("new_value");
                                    new_value->setValue(std::to_string(value));
                                    new_value->setType(functor_type::T_CONSTANT);
                                    new_value->setObjectType("constant");
                                    //cout << "SUBSTS: " << f_tree->toString() << " per " << new_value->toString() << endl;
                                    f_tree->replaceParam(i,new_value);
                                }
                            }
                            recur_func(f_tree->getParam(i)); 
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

    recur_base_values(ptr->getRawPrecondition());
    recur_func(ptr->getRawPrecondition());
    recur_base_values(ptr->getRawEffect());
    recur_func(ptr->getRawEffect());
}

void simplifyVisitor::visitConstraint( shared_ptr<Constraint> ptr){

}

void simplifyVisitor::setInits(std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p){
    p_inits = p;
} 

