#include "coreSolverZ3.h"
#include "expression.h"


#include <string>
#include <cstdlib>
#include <map>
#include <sstream>

using namespace z3;

CoreSolverZ3::CoreSolverZ3(int verb) {
    sol=new solver(ctx);
    verbose=verb;
    contRetract=0;
}

CoreSolverZ3::~CoreSolverZ3() {
    for (map<string,infVar>::iterator it=mapVar.begin(); it!=mapVar.end(); ++it) delete it->second.exp;  
    delete sol;
}

void CoreSolverZ3::assertConstraint(string s) {
    Expression e(s);
    int i = 0;
    expr exp=tradExpr(e,i);
    if (verbose>=10) cout << exp << endl;
    sol->add(exp);
}

long CoreSolverZ3::assertRetractable(string s){
    Expression e(s);
    int i = 0;
    expr exp0=tradExpr(e,i);
    string aux="r"+std::to_string(contRetract);
    addVar(aux,"bool");

    expr exp1= ! (*mapVar[aux].exp);

    expr exp=exp0 || exp1;

    infRectract infRect;
    infRect.retract=false;
    infRect.index=contRetract;
    retractable.push_back(infRect);
    if (verbose>=10) cout << exp << endl;
    sol->add(exp);
    long l=contRetract;
    contRetract++;
    return l;
}

void CoreSolverZ3::retract(long l){
    unsigned int i=0;
    bool f=false;
    while (!f && i<retractable.size()){
        if (i<l) i++;
        else {
            f=true;
            if (i==l) {
                retractable[i].retract=true;
                string aux="r"+std::to_string(i);
                expr exp=!(*mapVar[aux].exp);
                if (verbose>=10) cout << exp << endl;
                sol->add(exp);
            }
        }
    }
}

void CoreSolverZ3::setDecidable(string s) {
    // NOOP
}

void CoreSolverZ3::addVar(string s,string t) {


    if (t.compare(string("int"))==0) {
         mapVar[s].exp=new expr(ctx.int_const(s.c_str()));
         mapVar[s].tipus='I';
    }
    else if (t.compare(string("bool"))==0) {
         mapVar[s].exp=new expr(ctx.bool_const(s.c_str()));
         mapVar[s].tipus='B';
    }
    else if (t.compare(string("real"))==0) {
         mapVar[s].exp=new expr(ctx.real_const(s.c_str()));
         mapVar[s].tipus='R';
    }
    else mapVar[s].tipus=' ';

    mapVar[s].val="";

}


int CoreSolverZ3::check(){

    vector<expr> assumptions;
    for (vector<infRectract>::iterator it=retractable.begin();it!=retractable.end() ;++it) {
        if (!it->retract) {
            //string aux="r"+static_cast<ostringstream*> ( &(ostringstream() << it->index) )->str();
            string aux="r"+std::to_string(it->index);//static_cast<ostringstream*> ( &(ostringstream() << it->index) )->str();
            assumptions.push_back(* mapVar[aux].exp);
        }
    }


    check_result status;

    if (assumptions.size()>0) status=sol->check(assumptions.size(), &assumptions[0]);
    else status=sol->check();


    if(status == unsat) return 0;
    if(status == unknown) return -1;

    model m=sol->get_model();
    for (unsigned i=0;i<m.size(); i++) {
        func_decl v=m[i];
        assert(v.arity()==0);
        stringstream ss1;
        ss1 << v.name();
        string name=ss1.str();
        stringstream ss;
        ss << m.get_const_interp(v);
        string valor=ss.str();
        switch(mapVar[name].tipus) {
            case 'B':
                if (valor.compare("true")==0) mapVar[name].val="1"; else mapVar[name].val="0";
                break;
            case 'I':
                mapVar[name].val=valor; 
                break;
            case ' ':
                mapVar[name].val="";
                break;
        }
    }


    return 1;
}








long CoreSolverZ3::modelVarInt(string s){
    return atoi(mapVar[s].val.c_str());
}

bool CoreSolverZ3::modelVarBool(string s){
    if (mapVar[s].val.compare(string("0"))==0) return false;
    return true;
}

expr CoreSolverZ3::tradIte(Expression & e,int & i) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a ite" << endl;exit(-1);}
    i++;
    expr e1=tradExpr(e,i);
    expr e2=tradExpr(e,i);
    expr e3=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a ite" << endl;exit(-1);}
    i++;
    return to_expr(ctx,Z3_mk_ite(ctx,e1,e2,e3));
}

expr CoreSolverZ3::tradNot(Expression & e,int & i) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a not" << endl;exit(-1);}
    i++;
    expr e1=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a not" << endl;exit(-1);}
    i++;
    return !e1;
}

expr CoreSolverZ3::tradRel(Expression & e,int & i,string a) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a Rel" << endl;exit(-1);}
    i++;
    expr e1=tradExpr(e,i);
    expr e2=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a Rel" << endl;exit(-1);}
    i++;
    if (a.compare(string("="))==0) return e1==e2;
    else if (a.compare(string("!="))==0) return e1!=e2;
    else if (a.compare(string("<="))==0) return e1<=e2;
    else if (a.compare(string("<"))==0) return e1<e2;
    else if (a.compare(string(">="))==0) return e1>=e2;
    else if (a.compare(string(">"))==0) return e1>e2;
    else if (a.compare(string("dimpl"))==0) return e1==e2;
    else if (a.compare(string("impl"))==0) return implies(e1,e2);
    else {
        cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
        return ctx.bool_val(true);
    }
}

expr CoreSolverZ3::tradList(Expression & e,int & i,string a) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a List" << endl;exit(-1);}
    i++;
    expr res=tradExpr(e,i);
    while (e.element(i).compare(string(")"))!=0) {
        if (a.compare(string("+"))==0) res=res+tradExpr(e,i);
        else if (a.compare(string("-"))==0) res=res-tradExpr(e,i);
        else if (a.compare(string("*"))==0) res=res*tradExpr(e,i);
        else if (a.compare(string("/"))==0) res=res/tradExpr(e,i);
        else if (a.compare(string("or"))==0) res=res || tradExpr(e,i);
        else if (a.compare(string("and"))==0) res=res && tradExpr(e,i);
    }
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a List" << endl;exit(-1);}
    i++;
    return res;
}

expr CoreSolverZ3::tradUnari(Expression & e,int & i) {
    return -tradExpr(e,i);
}

expr CoreSolverZ3::tradExpr(Expression & e,int & i) {

    string a=e.element(i);
    if (a.compare(string("ite"))==0) {
        i++;
        return tradIte(e,i);
    } else if (a.compare(string("<"))==0 || a.compare(string("<="))==0 || a.compare(string(">"))==0 || a.compare(string(">="))==0 || a.compare(string("="))==0 || a.compare(string("!="))==0 || a.compare(string("impl"))==0 || a.compare(string("dimpl"))==0) {
        i++;
        return tradRel(e,i,a);
    } else if (a.compare(string("-"))==0 || a.compare(string("+"))==0) {
        string aux=a;
        i++;
        if (e.element(i).compare(string("("))==0) return tradList(e,i,a);
        else {
            if (a.compare(string("-"))==0) return tradUnari(e,i);
            else return tradExpr(e,i);
        }
    } else if (a.compare(string("*"))==0 || a.compare(string("or"))==0 || a.compare(string("and"))==0) {
        i++;
        return tradList(e,i,a);
    } else  if (a.compare(string("not"))==0) {
        i++;
        return tradNot(e,i);
    } else  if (a.compare(string("true"))==0) {
        i++;
        return ctx.bool_val(true);
    } else  if (a.compare(string("false"))==0) {
        i++;
        return ctx.bool_val(false);
    } else   if (a.compare(string("EOE"))==0) {
        cout << "error in Expression" << endl;
        exit(-1);
    } else if (a.compare(string("/"))==0) {
        i++;
        return tradList(e,i,a);
    } else {
        if (a[0]>='0' && a[0]<='9') {
            i++;
            return ctx.int_val(atoi(a.c_str()));
        } else {
            i++;
            return * mapVar[a].exp;
        }
    }

}
