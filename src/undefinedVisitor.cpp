#include "undefinedVisitor.h"

// TODO 
// IDENTIFICAR ELS OBJECTFLUENTS I ASIGNARLSHI UNDEFINED
// TODO 
using namespace std;

undefinedVisitor::undefinedVisitor() {
    deletable_actions   = make_shared<vector<shared_ptr<Action> > >();
    deletable_functions = make_shared<vector<shared_ptr<Function> > >();
}

undefinedVisitor::~undefinedVisitor(){
}

void undefinedVisitor::visitParameter( shared_ptr<Parameter> ptr){
}

void undefinedVisitor::visitFunctor( shared_ptr<Functor> ptr){
}

void undefinedVisitor::visitPredicate( shared_ptr<Predicate> ptr){
}

void undefinedVisitor::visitFunction( shared_ptr<Function> ptr){
//    cout << "undefinedVisitor :: Visiting: " << ptr->toString() << endl;
    if( !hasValue(ptr) ){
        deletable_functions->push_back(ptr);
    }
}

void undefinedVisitor::visitAction( shared_ptr<Action> ptr){
//    cout << "undefinedVisitor :: Visiting: " << ptr->toString() << endl;

    std::function<bool(shared_ptr<Thing>)> recur_values;
    recur_values = [&](shared_ptr<Thing> child)->bool {

        shared_ptr<Functor> f_child;
        if( (child->type == functor_type::T_OPERATION || child->type == functor_type::T_FUNCTION)){

            switch(child->type) {
                case functor_type::T_FUNCTION:
                    {
                        f_child  = static_pointer_cast<Functor>(child);
                        bool val = hasValue(child);
                        //cout << "Check value of func: " << f_child->toString() << " : " << std::to_string(val) << endl;
                        if(val == false) { return false; }
                    }
                    break;

                case functor_type::T_OPERATION:    
                    {    
                        f_child  = static_pointer_cast<Functor>(child);
                        for(int i = 0; i < f_child->getNParams(); i++){
                            bool ret = recur_values(f_child->getParam(i)); 
                            if(!ret){ return false; }
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
        return true;
    };   

    std::function<bool(shared_ptr<Thing>)> recur_base_values;
    recur_base_values = [&](shared_ptr<Thing> tree)->bool {
        shared_ptr<Functor> f_tree;
        if( tree->type == functor_type::T_OPERATION){
            f_tree = static_pointer_cast<Functor>(tree);

            switch(tree->type) {
                case functor_type::T_OPERATION:    
                case functor_type::T_FUNCTION:
                    {    
                        for(int i = 0; i < f_tree->getNParams(); i++){
                            // si retorna fals en algun moment retornem fals, i l'afegim a la llista negra
                            if(!recur_values(f_tree->getParam(i))){
                                return false;
                            }
                        }
                    };
                    break;
                default: 
                    break;
            }
        }
        return true;
    };

    if( !recur_base_values(ptr->getRawPrecondition()) || !recur_base_values(ptr->getRawEffect()) ){
        deletable_actions->push_back(ptr);
    }
}

void undefinedVisitor::visitConstraint( shared_ptr<Constraint> ptr){
}

void undefinedVisitor::setInits(std::shared_ptr<std::vector<std::shared_ptr<Functor> > > p){
    p_inits = p;
} 

shared_ptr<vector<shared_ptr<Function> > > undefinedVisitor::getDeletableFunctions(){
    return deletable_functions;
}

shared_ptr<vector<shared_ptr<Action> > > undefinedVisitor::getDeletableActions(){
    return deletable_actions;
}

bool undefinedVisitor::hasValue(shared_ptr<Thing> tree) {
    // si es una constant ... 
    if(tree->type == functor_type::T_CONSTANT){
        return true;

        // si es un functor el busquem als inits i hi passem el valor
    } else if(tree->type == functor_type::T_FUNCTION){
        for(const auto & init : *p_inits){
            if(init->type == functor_type::T_OPERATION &&
                    init->getName() == "=" &&
                    static_pointer_cast<Functor>(init->getParam(0))->toString() == tree->toString()){
                return true;
            }
        }
    }

#ifdef DEBUG_VERSION
    /*
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
    */
#endif
    return (false);
}


