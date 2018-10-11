#include "coreSolverCVC4.h"
#include "expression.h"


#include <string>
#include <cstdlib>
#include <map>
#include <sstream>

using namespace CVC4;

CoreSolverCVC4::CoreSolverCVC4(int verb) {
    sol=new SmtEngine(&ctx);
    sol->setOption("incremental", SExpr("true"));
    sol->setOption("produce-models", SExpr("true"));
    verbose=verb;
    contRetract=0;
}

CoreSolverCVC4::~CoreSolverCVC4() {
    for (map<string,infVar>::iterator it=mapVar.begin(); it!=mapVar.end(); ++it) delete it->second.exp;
    delete sol;
}

void CoreSolverCVC4::assertConstraint(string s) {
    Expression e(s);
    int i = 0;
    Expr exp=tradExpr(e,i);
    if (verbose>=10) cout << exp << endl;
    sol->assertFormula(exp);
}

long CoreSolverCVC4::assertRetractable(string s){
    Expression e(s);
    int i = 0;
    string aux="r"+static_cast<ostringstream*> ( &(ostringstream() << contRetract) )->str();
    addVar(aux,"bool");
    Expr exp=ctx.mkExpr(kind::OR,tradExpr(e,i),ctx.mkExpr(kind::NOT,* mapVar[aux].exp));
    infRectract infRect;
    infRect.retract=false;
    infRect.index=contRetract;
    retractable.push_back(infRect);
    if (verbose>=10) cout << exp << endl;
    sol->assertFormula(exp);
    long l=contRetract;
    contRetract++;
    return l;
}

void CoreSolverCVC4::retract(long l){
    int i=0;
    bool f=false;
    while (!f && i<retractable.size()){
        if (i<l) i++;
        else {
            f=true;
            if (i==l) {
                retractable[i].retract=true;
                string aux="r"+static_cast<ostringstream*> ( &(ostringstream() << i) )->str();
                  Expr exp=ctx.mkExpr(kind::NOT,*mapVar[aux].exp);
                if (verbose>=10) cout << exp << endl;
                sol->assertFormula(exp);
            }
        }
    }
}

void CoreSolverCVC4::addVar(string s,string t) {


    if (t.compare(string("int"))==0) {
         mapVar[s].exp=new Expr(ctx.mkVar(s.c_str(),ctx.integerType()));
         mapVar[s].tipus='I';
    } else if (t.compare(string("bool"))==0) {
         mapVar[s].exp=new Expr(ctx.mkVar(s.c_str(),ctx.booleanType()));
         mapVar[s].tipus='B';
    } else if (t.compare(string("real"))==0) {
         mapVar[s].exp=new Expr(ctx.mkVar(s.c_str(),ctx.realType()));
         mapVar[s].tipus='R';
    } else mapVar[s].tipus=' ';



    mapVar[s].val="";

}


int CoreSolverCVC4::check(){ //no fet

    Expr res=ctx.mkConst(true);
    int cont=0;
    for (vector<infRectract>::iterator it=retractable.begin();it!=retractable.end() ;++it) {
        if (!it->retract) {
            string aux="r"+static_cast<ostringstream*> ( &(ostringstream() << it->index) )->str();
            res=ctx.mkExpr(kind::AND,res,* mapVar[aux].exp);
            cont++;
        }
    }


    Result status;
    if (cont>0) status=sol->checkSat(res);
    else status=sol->checkSat(res);

    if(status.isSat() == CVC4::Result::SAT_UNKNOWN) return -1;
    if(status.isSat() == CVC4::Result::UNSAT) return 0;


    for (map<string,infVar>::iterator it = mapVar.begin();it != mapVar.end(); ++it) {
        string s=sol->getValue(*(it->second.exp)).toString();
        //cout << "nom: " << *(it->second.exp) << " valor: " <<  sol->getValue(*(it->second.exp)).toString() << endl;
        switch(it->second.tipus) {
            case 'B':
                if (s.compare("(CONST_BOOLEAN 1)")==0) it->second.val="1"; else it->second.val="0";
                break;
            case 'I':
                s=s.substr(16);
                s=s.substr(0,s.size()-1);
                //cout << atoi(s.c_str()) << endl;
                it->second.val=s;
                break;
            case ' ':
                it->second.val="";
                break;
        }
    }


    return 1;

}

long CoreSolverCVC4::modelVarInt(string s){
    return atoi(mapVar[s].val.c_str());
}


bool CoreSolverCVC4::modelVarBool(string s){
    if (mapVar[s].val.compare(string("0"))==0) return false;
    return true;
}








Expr CoreSolverCVC4::tradIte(Expression & e,int & i) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a ite" << endl;exit;}
    i++;
    Expr e1=tradExpr(e,i);
    Expr e2=tradExpr(e,i);
    Expr e3=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a ite" << endl;exit;}
    i++;
    return ctx.mkExpr(kind::ITE,e1,e2,e3);
}

Expr CoreSolverCVC4::tradNot(Expression & e,int & i) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a not" << endl;exit;}
    i++;
    Expr e1=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a not" << endl;exit;}
    i++;
    return ctx.mkExpr(kind::NOT,e1);
}

Expr CoreSolverCVC4::tradRel(Expression & e,int & i,string a) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a Rel" << endl;exit;}
    i++;
    Expr e1=tradExpr(e,i);
    Expr e2=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a Rel" << endl;exit;}
    i++;
    if (a.compare(string("="))==0) return ctx.mkExpr(kind::EQUAL,e1,e2);
    else if (a.compare(string("!="))==0) return ctx.mkExpr(kind::DISTINCT,e1,e2).notExpr();
    else if (a.compare(string("<="))==0) return ctx.mkExpr(kind::LEQ,e1,e2);
    else if (a.compare(string("<"))==0) return ctx.mkExpr(kind::LT,e1,e2);
    else if (a.compare(string(">="))==0) return ctx.mkExpr(kind::GEQ,e1,e2);
    else if (a.compare(string(">"))==0) return ctx.mkExpr(kind::GT,e1,e2);
    else if (a.compare(string("dimpl"))==0) ctx.mkExpr(kind::IFF,e1,e2);
    else if (a.compare(string("impl"))==0) ctx.mkExpr(kind::IMPLIES,e1,e2);
}

Expr CoreSolverCVC4::tradList(Expression & e,int & i,string a) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a List" << endl;exit;}
    i++;
    Expr res=tradExpr(e,i);
    while (e.element(i).compare(string(")"))!=0) {
        if (a.compare(string("+"))==0) res=ctx.mkExpr(kind::PLUS,res,tradExpr(e,i));
        else if (a.compare(string("-"))==0) res=ctx.mkExpr(kind::MINUS,res,tradExpr(e,i));
        else if (a.compare(string("*"))==0) res=ctx.mkExpr(kind::MULT,res,tradExpr(e,i));
        else if (a.compare(string("or"))==0) res=ctx.mkExpr(kind::OR,res,tradExpr(e,i));
        else if (a.compare(string("and"))==0) res=ctx.mkExpr(kind::AND,res,tradExpr(e,i));
    }
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a List" << endl;exit;}
    i++;
    return res;
}

Expr CoreSolverCVC4::tradUnari(Expression & e,int & i) {
    return ctx.mkExpr(kind::UMINUS,tradExpr(e,i));
}

Expr CoreSolverCVC4::tradExpr(Expression & e,int & i) {

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
        return ctx.mkConst(true);
    } else  if (a.compare(string("false"))==0) {
        i++;
        return ctx.mkConst(false);
    } else   if (a.compare(string("EOE"))==0) {
        cout << "error in Expression" << endl;
        exit;
    } else {
        if (a[0]>='0' && a[0]<='9') {
            i++;
            int aux=atoi(a.c_str());
            return ctx.mkConst(Rational(aux));
        } else {
            i++;
            return * mapVar[a].exp;
        }
    }

}
