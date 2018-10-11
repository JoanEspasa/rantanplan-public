#include "PDDLTreeEvaluator.h"

using namespace std;

std::shared_ptr<PDDLProblem> PDDLTreeEvaluator::getProblem(pANTLR3_BASE_TREE domain_tree, pANTLR3_BASE_TREE instance_tree)
{
    std::shared_ptr<PDDLProblem> problem(new PDDLProblem());
    runDomain(domain_tree,problem);
    problem->checkAndSetStaticFunctors();
    runInstance(instance_tree,problem);
    //problem->simplifyProblem(); // el fem aqui pq necessitem els inits
    return problem;
}


void PDDLTreeEvaluator::runDomain(pANTLR3_BASE_TREE tree, shared_ptr<PDDLProblem> problem)
{
    pANTLR3_COMMON_TOKEN tok = tree->getToken(tree);
    if(tok) {
        switch(tok->type) {
            case PREDICATES: 
                //cout << "num de predicats:" << tree->getChildCount(tree) << endl;
                for(unsigned int i = 0; i < tree->getChildCount(tree); i++) {
                    problem->addSymbol(anthelp::createPredicateFromTree(anthelp::getChild(tree,i))); 
                }
                break;
            case CONSTANTS: 
                //cout << "num de constants:" << tree->getChildCount(tree) << endl;
                for(unsigned int i = 0; i < tree->getChildCount(tree); i++) {
                    pANTLR3_BASE_TREE child = anthelp::getChild(tree,i);

                    string     name(anthelp::getText(child));
                    string baseType(anthelp::getText(anthelp::getChild(child,0)));

                    problem->addObject(name,baseType);
                    cout << "Afegida constant: " << name << " --- " << baseType << endl;
                }
                break;
            case FUNCTIONS: 
                //cout << "num de funcions :" << tree->getChildCount(tree) << endl;
                //
                // si te tipus de retorn:
                // NAME - number
                // 30 - 57 - 106
                //
                // si no te tipus:
                // NAME
                // 30
                //
                {
                    for(unsigned int i = 0; i < tree->getChildCount(tree); i++) {
                        auto child = anthelp::getChild(tree,i);
                        if( (i + 2) < tree->getChildCount(tree) &&
                                tree->getToken(anthelp::getChild(tree,i))->type == NAME &&
                                tree->getToken(anthelp::getChild(tree,i+1))->type == 57){ //&& // u___u HACK HACK TODO
//                                tree->getToken(anthelp::getChild(tree,i+2))->type != NAME ){
                            problem->addSymbol(anthelp::createFunctionFromTree(anthelp::getChild(tree,i),anthelp::getChild(tree,i+2)));
                            i++;
                            i++;
                        } else {
                            //cout << "TOKEN:"<<tree->getToken(child)->type << " " << anthelp::getText(child) << endl;
                            if( tree->getToken(child)->type == NAME ){
                                problem->addSymbol(anthelp::createFunctionFromTree(anthelp::getChild(tree,i),NULL));
                            } else {
                                // NOOP
                            }
                        }
                    }
                }
                break;
            case TYPES: 
                //cout << "num de tipus:" << tree->getChildCount(tree) << endl;
                for(unsigned int i = 0; i < tree->getChildCount(tree); i++) {
                    pANTLR3_BASE_TREE child = anthelp::getChild(tree,i);

                    string     type(anthelp::getText(child));
                    string baseType = "object"; 
                    // si te un tipus base li posem, si no posem object
                    if( tree->getChildCount(child) > 0){ 
                       baseType =  (anthelp::getText(anthelp::getChild(child,0)));
                    }

                    problem->addType(type,baseType);
                }
                break;
            case ACTION:
                problem->addSymbol(anthelp::createActionFromTree(tree,problem));
                break;
            case CONSTRAINT:
                problem->addSymbol(anthelp::createConstraintFromTree(tree,problem));
                break;
            default:
                //cout << "Unhandled token: #" << tok->type << endl;
                //cout << "Text of token: #" << tok->type << ":" << getText(tree) << endl;
                int k = tree->getChildCount(tree);
                for(int i = 0; i < k; i++) {
                    runDomain(anthelp::getChild(tree, i), problem);
                }
        }
    }
    else {
        int k = tree->getChildCount(tree);
        for(int i = 0; i < k; i++) {
            runDomain(anthelp::getChild(tree, i),problem);
        }
    }
}

void PDDLTreeEvaluator::runInstance(pANTLR3_BASE_TREE tree, std::shared_ptr<PDDLProblem> problem){

    pANTLR3_COMMON_TOKEN tok = tree->getToken(tree);
    if(tok) {
        switch(tok->type) {
            case OBJECTS: 
#ifdef DEBUG_VERSION
                cout << "num de objectes:" << tree->getChildCount(tree) << endl;
#endif
                for(unsigned int i = 0; i < tree->getChildCount(tree); i++) {
                    pANTLR3_BASE_TREE child = anthelp::getChild(tree,i);

                    string     id(anthelp::getText(child));
                    string   type(anthelp::getText(anthelp::getChild(child,0)));

                    problem->addObject(id,type);
                }
                break;
            case INIT: 
#ifdef DEBUG_VERSION
                cout << "num de inits:" << tree->getChildCount(tree) << endl;
#endif
                for(unsigned int i = 0; i < tree->getChildCount(tree); i++) {
                    pANTLR3_BASE_TREE child = anthelp::getChild(tree,i);

                    // r es un (= X Y)
                    std::shared_ptr<Functor> r = anthelp::createInitFromTree(child,problem);
                    problem->addInit(r);
                }
                break;

            case GOAL: 
                {
#ifdef DEBUG_VERSION
                    cout << "num de goals:" << tree->getChildCount(tree) << endl;
#endif
                    shared_ptr<Functor> root(new Functor("ROOT"));

                    anthelp::antlr3ToOwn(anthelp::getChild(tree,0),root,problem,true);
//                    cout << "goal: " << root->getParam(0)->toString() << endl;
                    problem->addRawObjective(root->getParam(0)); // suposem que es una expr sola
                }
                break;

            case PROBLEM_METRIC: 
                {
                    // TODO TODO TODO
                    /*
                    //spit(tree);
                    */
                    cout << "metrica a optimitzar:" << tree->getChildCount(tree) << endl;
                    shared_ptr<Functor> root(new Functor("ROOT"));
                    // nomes hi ha implementat el == 4
                    // anthelp::getChild(tree,2)
                    assert(tree->getChildCount(tree) == 2 || tree->getChildCount(tree) == 4);
                    anthelp::antlr3ToOwn(anthelp::getChild(tree,2),root,problem);
                    cout << "metric : " << root->getParam(0)->toString() << endl;
                    problem->addMetricToOptimize(root->getParam(0));
                }
                break;
            default:
                int k = tree->getChildCount(tree);
                for(int i = 0; i < k; i++) {
                    runInstance(anthelp::getChild(tree, i), problem);
                }
        }
    }
    else {
        int k = tree->getChildCount(tree);
        for(int i = 0; i < k; i++) {
            runInstance(anthelp::getChild(tree, i),problem);
        }
    }
}

int PDDLTreeEvaluator::spit(pANTLR3_BASE_TREE tree, int n)
{
    int k = tree->getChildCount(tree);
    for(int i = 0; i < n; i++){ cout << " "; }
    cout << "|! depth : " << n << "!" << anthelp::getText(tree) << "| n_childs: " << k << "|childs:|\n";
    int r = 0;
    for(int i = 0; i < k; i++) {
        r = spit(anthelp::getChild(tree, i),n+1);
    }
    return r;
}

