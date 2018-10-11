#include "anthelp.h"

using namespace std;

pANTLR3_BASE_TREE anthelp::getChild(pANTLR3_BASE_TREE tree, unsigned i)
{
  assert(i < tree->getChildCount(tree));
  return (pANTLR3_BASE_TREE) tree->getChild(tree, i);
}

const char* anthelp::getText(pANTLR3_BASE_TREE tree)
{
  return (const char*) tree->getText(tree)->chars;
}

const char* anthelp::toString(pANTLR3_BASE_TREE tree)
{
  return (const char*) anthelp::getText(tree);
}

const char* anthelp::toStringTree(pANTLR3_BASE_TREE tree)
{
  return (const char*) tree->toStringTree(tree)->chars;
}
/*
// te la forma:         nom_pred
//                    /          \       \
//              ?param1          ?param2   ...
//                   |            |
//                type1          type2
 */
std::shared_ptr<Predicate> anthelp::createPredicateFromTree(pANTLR3_BASE_TREE tree){

  std::shared_ptr<Predicate> pred(new Predicate());
  pred->setName(anthelp::getText(tree));
  int n_params = tree->getChildCount(tree);
  //std::cout << "nom pred: " << getText(tree) << " num params: " << n_params << std::endl;
  for(int i = 0; i < n_params; i++) {
    //std::cout << "param " << i << " nom: " << getText(getChild(tree, i));
    //std::cout << " tipus: " << getText(getChild(getChild(tree,i), 0)) << std::endl;
    shared_ptr<Parameter> param(new Parameter());
    param->setName(anthelp::getText( anthelp::getChild(tree, i) ));
    if(param->getName().substr(0,1) != "?"){ param->setType(functor_type::T_CONSTANT); }
    param->setObjectType(anthelp::getText( anthelp::getChild(anthelp::getChild(tree,i),0)));
    param->setType(functor_type::T_VARIABLE);
    pred->addParam(param);
  }
  return pred;
}

std::shared_ptr<Predicate> anthelp::createPredicateFromAction(pANTLR3_BASE_TREE tree){

  std::shared_ptr<Predicate> pred(new Predicate());
  int n_params = tree->getChildCount(tree);
  for(int i = 0; i < n_params; i++) {
    //std::cout << "param " << i << " nom: " << getText(getChild(tree, i)) <<  std::endl;
    if( i == 0 ) {
      pred->setName(anthelp::getText(anthelp::getChild(tree, i)));
    }else{
      // aqui haurem expandit els foralls, per tant tenim que vigilar, pot ser tambe
      // que hi hagin constants ... etc ...
      pANTLR3_BASE_TREE child = anthelp::getChild(tree,i);
      pANTLR3_COMMON_TOKEN tok = child->getToken(child);

      shared_ptr<Parameter> param(new Parameter());
      if(tok) {
        switch(tok->type) {
          case VARIABLE:
            param->setName(anthelp::getText(child));
            param->setValue("");
            param->setType(functor_type::T_VARIABLE);
            break;
          case NUMBER: 
          case NAME:
            param->setName(anthelp::getText(child));
            param->setValue(anthelp::getText(child));
            param->setType(functor_type::T_CONSTANT);
            break;
          default:
            std::cout << "ERR: " << __FILE__ << " " <<  __LINE__ << std::endl;
            break;
        }
      }
      pred->addParam(param);
    }
  }
  return pred;
}

std::shared_ptr<Function> anthelp::createFunctionFromTree(pANTLR3_BASE_TREE func_name, pANTLR3_BASE_TREE type){
  std::shared_ptr<Function> func(new Function());
  func->setName(anthelp::getText(func_name));
  int n_params = func_name->getChildCount(func_name);
  for(int i = 0; i < n_params; i++) {
    shared_ptr<Parameter> param(new Parameter());
    param->setName(anthelp::getText(anthelp::getChild(func_name, i)));
    if(param->getName().substr(0,1) != "?"){ param->setType(functor_type::T_CONSTANT); }
    param->setObjectType(anthelp::getText(anthelp::getChild(anthelp::getChild(func_name,i), 0)));
    param->setType(functor_type::T_VARIABLE);
    func->addParam(param);
  }
  /* de moment obviem els tipus de retorn */
  if( type != NULL){
    func->setReturnType(anthelp::getText(type));
  } 
  return func;
}

// TODO: Seria mes correcte buscarla a la taula de simbols despres i completar els tipus?
std::shared_ptr<Function> anthelp::createFunctionFromAction(pANTLR3_BASE_TREE tree){

  std::shared_ptr<Function> func(new Function());
  int n_params = tree->getChildCount(tree);
  for(int i = 0; i < n_params; i++) {
    //std::cout << "param " << i << " nom: " << getText(getChild(tree, i)) <<  std::endl;
    if( i == 0 ) {
      func->setName(anthelp::getText(anthelp::getChild(tree, i)));
    }else{
      // aqui haurem expandit els foralls, per tant tenim que vigilar, pot ser tambe
      // que hi hagin constants ... etc ...
      pANTLR3_BASE_TREE child = anthelp::getChild(tree,i);
      pANTLR3_COMMON_TOKEN tok = child->getToken(child);

      shared_ptr<Parameter> param(new Parameter());
      if(tok) {
        switch(tok->type) {
          case VARIABLE:
            param->setName(anthelp::getText(child));
            param->setValue("");
            param->setType(functor_type::T_VARIABLE);
            break;
          case NUMBER: 
          case NAME:
            param->setName(anthelp::getText(child));
            param->setValue(anthelp::getText(child));
            param->setType(functor_type::T_CONSTANT);
            break;
          default:
            std::cout << "ERR: " << __FILE__ << " " <<  __LINE__ << std::endl;
            break;
        }
      }
      func->addParam(param);
    }
  }
  return func;
}

std::shared_ptr<Functor> anthelp::createInitFromTree(pANTLR3_BASE_TREE tree, shared_ptr<PDDLProblem> problem){

  std::shared_ptr<Functor> func(new Functor("ROOT")); 
  shared_ptr<Functor> return_ptr;

  pANTLR3_BASE_TREE child;
  pANTLR3_COMMON_TOKEN tok = tree->getToken(tree);
  if(tok) {
    switch(tok->type) {
      // TODO : De moment nomes considerem el valor del init com a una constant, si fós un constructe
      // de l'estil (= (fuel ship1) (+ 3 5)) seria erroni i petaria tot ... xD
      case INIT_EQ: //anthelp::getChild(action_tree,i),0)
      case NOT_PRED_INIT: 
        {
          antlr3ToOwn(tree,func,problem,true);
          return_ptr = static_pointer_cast<Functor>(func->getParam(0));
          shared_ptr<Functor> tmp_ptr = static_pointer_cast<Functor>(return_ptr->getParam(0));
          for(int i = 0; i < tmp_ptr->getNParams(); i++){
            tmp_ptr->getParam(i)->type = functor_type::T_CONSTANT;
          }
        }
        break;
      case PRED_INST: 
        {
          antlr3ToOwn(tree,func,problem,true);
          return_ptr = static_pointer_cast<Functor>(func->getParam(0));
          for(int i = 0; i < return_ptr->getNParams(); i++){
            return_ptr->getParam(i)->type = functor_type::T_CONSTANT;
          }
        }
        break;
      default:
        std::cout << "wut wut?:" << anthelp::getText(tree) << "|" << tok->type << std::endl;
        std::cout << "ERR: TODO " << __FILE__ << " " <<  __LINE__ << std::endl;
        break;
    }
  }


  //agafem el primer fill perque ens desfem del temporal "ROOT"
  return return_ptr;
}

std::shared_ptr<Action> anthelp::createActionFromTree(pANTLR3_BASE_TREE action_tree, shared_ptr<PDDLProblem> prob){
  std::shared_ptr<Action> action(new Action());
  std::cout << "nom accio:" << anthelp::getText(anthelp::getChild(action_tree,0)) << std::endl;
  action->setName(anthelp::getText(anthelp::getChild(action_tree,0)));

  int i = 1; // comencem a 1 pq el 0 ja es el nom
  while(action_tree->getToken(anthelp::getChild(action_tree,i))->type != PRECONDITION){ 
    shared_ptr<Parameter> param(new Parameter());
    string name = anthelp::getText(anthelp::getChild(action_tree, i));
    param->setName(name);
    if(name.substr(0,1) != "?"){ param->setType(functor_type::T_CONSTANT); }
    param->setValue("");
    param->setObjectType(anthelp::getText(anthelp::getChild(anthelp::getChild(action_tree,i), 0)));
    action->addParam(param);
    //std::cout << "param " << i << " nom: " << anthelp::getText(anthelp::getChild(action_tree, i));
    //std::cout << " tipus: " << anthelp::getText(anthelp::getChild(anthelp::getChild(action_tree,i), 0)) << std::endl;
    i++;
  }

  shared_ptr<Thing> pre_root(new Functor("ROOT"));
  shared_ptr<Thing> eff_root(new Functor("ROOT"));
  // el primer es PRECONDITION, per tant ja afegim el fill d'aquest
  //pANTLR3_STRING precondition = action_tree->toStringTree(anthelp::getChild(action_tree,i));
  antlr3ToOwn(anthelp::getChild(anthelp::getChild(action_tree,i),0),pre_root,prob,true);
  action->setRawPrecondition(static_pointer_cast<Functor>(pre_root)->getParam(0)); 

  //pANTLR3_STRING effects = action_tree->toStringTree(anthelp::getChild(action_tree,i+1));
  antlr3ToOwn(anthelp::getChild(action_tree,i+1),eff_root,prob,true);
  action->setRawEffect(static_pointer_cast<Functor>(eff_root)->getParam(0));
  return action;
}

std::shared_ptr<Constraint> anthelp::createConstraintFromTree(pANTLR3_BASE_TREE constr_tree, shared_ptr<PDDLProblem> prob){
 // cout << "constraint: " << anthelp::toStringTree(constr_tree) << endl;
  std::shared_ptr<Constraint> constraint(new Constraint());
  std::cout << "nom constraint:" << anthelp::getText(anthelp::getChild(constr_tree,0)) << std::endl;
  constraint->setName(anthelp::getText(anthelp::getChild(constr_tree,0)));

  int i = 1; // comencem a 1 pq el 0 ja es el nom
  while(i < constr_tree->getChildCount(constr_tree) - 1){ // restem un per el nom 
  //while(constr_tree->getToken(anthelp::getChild(constr_tree,i))->type != COMPARISON_GD){ 
    shared_ptr<Parameter> param(new Parameter());
    string name = anthelp::getText(anthelp::getChild(constr_tree, i));
    param->setName(name);
    if(name.substr(0,1) != "?"){ param->setType(functor_type::T_CONSTANT); }
    param->setValue("");
    param->setObjectType(anthelp::getText(anthelp::getChild(anthelp::getChild(constr_tree,i), 0)));
    constraint->addParam(param);
    //std::cout << "param " << i << " nom: " << anthelp::getText(anthelp::getChild(constr_tree, i));
    //std::cout << " tipus: " << anthelp::getText(anthelp::getChild(anthelp::getChild(constr_tree,i), 0)) << std::endl;
    i++;
  }

  shared_ptr<Thing> cond_root(new Functor("ROOT"));
  // el primer es PRECONDITION, per tant ja afegim el fill d'aquest
  //pANTLR3_STRING precondition = action_tree->toStringTree(anthelp::getChild(action_tree,i));
  antlr3ToOwn(anthelp::getChild(constr_tree,i),cond_root,prob,true);
  //antlr3ToOwn(anthelp::getChild(anthelp::getChild(constr_tree,i),0),cond_root,prob,true);
  constraint->setRawCondition(static_pointer_cast<Functor>(cond_root)->getParam(0)); 

  //cout << *constraint << endl;

  return constraint;
}

// funcio que passa de un arbre de l'antlr3c a la nostre propia representació ...
// instanced ens diu si estem en un entorn o els predicats i funcions haurien d'estar instanciats
void anthelp::antlr3ToOwn(pANTLR3_BASE_TREE tree, std::shared_ptr<Thing> ptr, std::shared_ptr<PDDLProblem> prob, bool instanced) {
  pANTLR3_COMMON_TOKEN tok = tree->getToken(tree);
  if(tok) {
    switch(tok->type) {
      case PRED_HEAD:
      case PRED_INST:
        {
          if(instanced){
            shared_ptr<Predicate> new_pred  = anthelp::createPredicateFromAction(tree);
            shared_ptr<Predicate> orig_pred = prob->getRawPredicate(new_pred->getName());

            // copiem l'antic, i l'hi posem els valors com toquen 
            shared_ptr<Predicate> copy_pred = static_pointer_cast<Predicate>(orig_pred->duplicate());
            for(int i = 0; i < orig_pred->getNParams(); i ++){
              static_pointer_cast<Parameter>(copy_pred->getParam(i))->setValue(
                  static_pointer_cast<Parameter>(new_pred->getParam(i))->getValue());
              static_pointer_cast<Parameter>(copy_pred->getParam(i))->setName(
                  static_pointer_cast<Parameter>(new_pred->getParam(i))->getName());
            }

            /*
               if(!prob->hasSymbol(copy_pred->toString())){ 
               prob->addSymbol(copy_pred); 
               prob->getSymbol(copy_pred->toString())->parent = orig_pred; //swallow copy
               }*/
            static_pointer_cast<Functor>(ptr)->addParam(copy_pred);

          } else { // si en teoria es raw no hauriem d'afeguir res al problema ja que tots els simbols ja estaran declarats
            shared_ptr<Predicate> pred = prob->getRawPredicate(anthelp::getText(anthelp::getChild(tree, 0)));
            static_pointer_cast<Functor>(ptr)->addParam(pred);
          }
        }
        break;

      case FUNC_HEAD:
        {
          // Afegim el cas particular de l'undefined!
          if(string(anthelp::toString(anthelp::getChild(tree,0))) == "undefined"){
            shared_ptr<Parameter> param(new Parameter());
            param->setName("0");
            param->setObjectType("constant");
            param->setValue("0");
            param->setType(functor_type::T_CONSTANT);
            static_pointer_cast<Functor>(ptr)->addParam(param);
          } else {
            // TODO nota:
            // Al implementar els object-fluents la gramatica es torna ambigua,
            // al definir els goals ..
            // i per aixo pot ser que estiguem parsejant un objecte que ens pensem
            // que es una funcio
            // he afegit a la taula de simbols els objectes, per tant aqui 
            // tenim que controlar-ho

            // uuuuuuh no sabem que es ...
            // getRawSymbol ens retorna un simbol no aplanat, per tant 
            // mentre el nom hagi aparegut hauria de funcionar sempre ...
            string sym_name = anthelp::getText(anthelp::getChild(tree,0));
            shared_ptr<sym_register> sym_reg;

            Functor f_tmp; // s'ha de fer pel hack del nom
            f_tmp.setName(sym_name);

            if(prob->hasSymbol(f_tmp.getName())){
              sym_reg = prob->getRawSymbol(f_tmp.getName());

              switch(sym_reg->type){
                case functor_type::T_FUNCTION:
                  {
                    if(instanced){
                      shared_ptr<Function> new_func  = anthelp::createFunctionFromAction(tree);
                      shared_ptr<Function> orig_func = prob->getRawFunction(new_func->getName());
                      // copiem l'antic, i l'hi posem els valors com toquen
                      shared_ptr<Function> copy_func = static_pointer_cast<Function>(orig_func->duplicate());

                      for(int i = 0; i < orig_func->getNParams(); i++){
                        string name = orig_func->getName();
                        int num = orig_func->getNParams();
                        int type = static_cast<int>(orig_func->getType());

                        static_pointer_cast<Parameter>(copy_func->getParam(i))->setValue(
                            static_pointer_cast<Parameter>(new_func->getParam(i))->getValue());
                        static_pointer_cast<Parameter>(copy_func->getParam(i))->setName(
                            static_pointer_cast<Parameter>(new_func->getParam(i))->getName());
                        static_pointer_cast<Parameter>(copy_func->getParam(i))->setType(
                            static_pointer_cast<Parameter>(new_func->getParam(i))->getType());
                      }
                      static_pointer_cast<Functor>(ptr)->addParam(copy_func);
                    }else {
                      // si en teoria es raw no hauriem d'afegir res al problema ja que tots els
                      // simbols ja estaran declarats
                      shared_ptr<Function> func = prob->getRawFunction( 
                          anthelp::getText(anthelp::getChild(tree, 0)));
                      static_pointer_cast<Functor>(ptr)->addParam(func);
                    }
                  }
                  break;
                case functor_type::T_VARIABLE:
                case functor_type::T_CONSTANT:
                  {
                    shared_ptr<Parameter> param(static_pointer_cast<Parameter>(sym_reg->data));
                    static_pointer_cast<Functor>(ptr)->addParam(param);
                  }
                  break;
                default:
                  cout << "ERR! " << __FILE__ << " " <<  __LINE__;
                  cout << " " << __func__ << endl;
                  break;
              }
            } else {
              cout << "ERR! " << __FILE__ << " " <<  __LINE__ << " ";
              cout << __func__ << endl;
              cout << " No hi ha el simbol " << f_tmp.getName() << " a la taula de simbols" << endl;
              prob->dump();
              assert(false);
            }
          }
        }
        break;
      case NOT_EFFECT:     // espera un pred_head despres
      case NOT_GD:   
      case NOT_PRED_INIT:
        {
          shared_ptr<Functor> func(new Functor("not",functor_type::T_OPERATION));
          anthelp::antlr3ToOwn(anthelp::getChild(tree, 0),func, prob, instanced);
          static_pointer_cast<Functor>(ptr)->addParam(func);
        }
        break;
      case INIT_EQ:
        {
          shared_ptr<Functor> func(new Functor("=",functor_type::T_OPERATION));
          anthelp::antlr3ToOwn(anthelp::getChild(tree, 0),func, prob, instanced); // lo que
          anthelp::antlr3ToOwn(anthelp::getChild(tree, 1),func, prob, instanced); // en quan 
          static_pointer_cast<Functor>(ptr)->addParam(func);
        }
        break;
      case ASSIGN_EFFECT:  // espera un increase o decrease , un func_head i un valor
        {
          // les operacions poden ser: increase, decrease o assign.
          /*cout << "OP:  " << anthelp::toStringTree(anthelp::getChild(tree, 0)) << endl;
            cout << "ch1: " << anthelp::toStringTree(anthelp::getChild(tree, 1)) << endl;
            cout << "ch2: " << anthelp::toStringTree(anthelp::getChild(tree, 2)) << endl;*/
          shared_ptr<Functor> func(new Functor(anthelp::toStringTree(anthelp::getChild(tree, 0)),functor_type::T_OPERATION));
          anthelp::antlr3ToOwn(anthelp::getChild(tree, 1),func, prob, instanced); // lo que
          anthelp::antlr3ToOwn(anthelp::getChild(tree, 2),func, prob, instanced); // en quan 
          static_pointer_cast<Functor>(ptr)->addParam(func);
        }
        break;
      case AND_EFFECT:   
      case AND_GD:   
        {
          shared_ptr<Functor> func(new Functor("and",functor_type::T_OPERATION));
          int k = tree->getChildCount(tree);
          for(int i = 0; i < k; i++) {
            anthelp::antlr3ToOwn(anthelp::getChild(tree, i),func, prob, instanced); 
          } 
          static_pointer_cast<Functor>(ptr)->addParam(func);
        }
        break;
      case OR_GD:   
        {
          shared_ptr<Functor> func(new Functor("or",functor_type::T_OPERATION));
          int k = tree->getChildCount(tree);
          for(int i = 0; i < k; i++) {
            anthelp::antlr3ToOwn(anthelp::getChild(tree, i),func, prob, instanced); 
          } 
          static_pointer_cast<Functor>(ptr)->addParam(func);
        }
        break;
      case COMPARISON_GD:   // es pot ajuntar amb ASSIGN_EFFECT
      case BINARY_OP:   
        {
          shared_ptr<Functor> func(new Functor(anthelp::toStringTree(anthelp::getChild(tree, 0)),functor_type::T_OPERATION));
          anthelp::antlr3ToOwn(anthelp::getChild(tree, 1),func, prob, instanced); // lo que
          anthelp::antlr3ToOwn(anthelp::getChild(tree, 2),func, prob, instanced); // en quan 
          static_pointer_cast<Functor>(ptr)->addParam(func);
        }
        break;
      case IMPLY_GD:
        {
          shared_ptr<Functor> func(new Functor("impl",functor_type::T_OPERATION));
          anthelp::antlr3ToOwn(anthelp::getChild(tree, 0),func, prob, instanced); 
          anthelp::antlr3ToOwn(anthelp::getChild(tree, 1),func, prob, instanced);
          static_pointer_cast<Functor>(ptr)->addParam(func);
        }
        break;
      case NAME:
      case NUMBER:
        {
          string nameval;
          if(string(anthelp::toString(tree)) == "undefined"){
            nameval = "0";
          } else {
            nameval = anthelp::toStringTree(tree);
          }

          shared_ptr<Parameter> param(new Parameter());
          param->setName(nameval);
          param->setObjectType("constant");
          param->setValue(nameval);
          param->setType(functor_type::T_CONSTANT);
          static_pointer_cast<Functor>(ptr)->addParam(param);
        }
        break;
        // aixo es troba per exemple com a fills d'un forall ( els seus parametres )
      case VARIABLE: 
        {
          shared_ptr<Parameter> param(new Parameter());
          param->setName(anthelp::toString(tree));
          if(tree->getChildCount(tree) > 0){ // si ens trobem a la definicio d'una accio
            param->setObjectType(anthelp::toStringTree(anthelp::getChild(tree, 0)));
          } else {
            // o en un parametre d'una comparacio ( > >= = < <= ...)
            // en aquest cas agafarem el tipus de retorn de la funcio el
            // tipus correcte per posarli (HACK TODO) es podria fer despres?
            //
            //shared_ptr<Functor> tmp_ptr = static_pointer_cast<Functor>(ptr);
            //assert(tmp_ptr->getNParams() > 0); 
            //param->setObjectType(static_pointer_cast<Function>(tmp_ptr->getParam(0))->getReturnType() );
          }
          param->setType(functor_type::T_VARIABLE);
          static_pointer_cast<Functor>(ptr)->addParam(param);
        }
        break;
      case FORALL_GD:
      case FORALL_EFFECT:
        {
          shared_ptr<Functor> func(new Functor("forall",functor_type::T_OPERATION));
          int k = tree->getChildCount(tree);
          for(int i = 0; i < k; i++) {
            anthelp::antlr3ToOwn(anthelp::getChild(tree, i),func, prob, instanced); 
          } 
          static_pointer_cast<Functor>(ptr)->addParam(func);
        }
        break;
      case EFFECT:
        {   // passthrough, no fa res
          anthelp::antlr3ToOwn(anthelp::getChild(tree, 0),ptr, prob, instanced); 
        }
        break;
      case WHEN_EFFECT:
        {
          shared_ptr<Functor> func(new Functor("when",functor_type::T_OPERATION));
          anthelp::antlr3ToOwn(anthelp::getChild(tree, 0),func, prob, instanced); 
          anthelp::antlr3ToOwn(anthelp::getChild(tree, 1),func, prob, instanced);
          static_pointer_cast<Functor>(ptr)->addParam(func);
        }
        break;

      default:
        cout << "TOKEN NOT SUPPORTED: " << tok->type <<  endl;
        int k = tree->getChildCount(tree);
        for(int i = 0; i < k; i++) {
          anthelp::antlr3ToOwn(anthelp::getChild(tree, i),ptr, prob, instanced);
        }
        break;
    }
  } else {
    int k = tree->getChildCount(tree);
    for(int i = 0; i < k; i++) {
      anthelp::antlr3ToOwn(anthelp::getChild(tree, i),ptr, prob, instanced);
    }
  }
}
// values es un vector d'strings ( els valors )
// parameters són els parametres que estem buscant dintre l'arbre als que els hi posarem els valors de "values"
// tree es l'arbre sobre el qual buscarem
// WARNING: copia a encoderVisitor 
void anthelp::searchAndReplaceValues(shared_ptr<vector<string> > values ,shared_ptr< vector<shared_ptr<Parameter> > > parameters, shared_ptr<Thing> tree, bool set_static){
  assert(values->size() == parameters->size()); // ha de ser coherent el reemplacament
  assert(values->size() > 0); // ha de ser una accio amb parametres
  switch(tree->type) {
    case functor_type::T_OPERATION:    
    case functor_type::T_PREDICATE: 
    case functor_type::T_FUNCTION:     
      {
        shared_ptr<Functor> f = static_pointer_cast<Functor>(tree);
        for(int i = 0; i < f->getNParams(); i++){
          anthelp::searchAndReplaceValues(values,parameters,f->getParam(i),set_static); 
        }
      }
      break;
    case functor_type::T_CONSTANT:     
    case functor_type::T_VARIABLE:     
      {
        shared_ptr<Parameter> p = static_pointer_cast<Parameter>(tree);
        for(unsigned int i = 0; i < parameters->size(); i++){
          //cout << "is |" << p->getName() << "| == |" << (*parameters)[i]->getName() << "| ?" << endl;
          if( p->getName() == (*parameters)[i]->getName()){
            if( !p->hasValue() ){ // TODO check, es necesari?
              p->setValue((*values)[i]);
              if(set_static){
                p->type = functor_type::T_CONSTANT;
              }
            }else{ 
              cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
              assert(false);
            }
          }
        }
      }
      break;
      //        case functor_type::T_CONSTANT:     
      //            // noop
      //            break;
    default:
      cout << "ERR? " << tree->toString() << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
      break;
  }
}
