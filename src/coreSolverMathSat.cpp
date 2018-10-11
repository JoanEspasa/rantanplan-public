#include "coreSolverMathSat.h"
#include "expression.h"


#include <string>
#include <cstdlib>
#include <map>
#include <sstream>



CoreSolverMathSat::CoreSolverMathSat(int verb) {
    verbose=verb;
    contRetract=0;
    ctx=msat_create_config();
    msat_set_option(ctx, "model_generation", "true");
    sol=msat_create_env(ctx);
}

CoreSolverMathSat::~CoreSolverMathSat() {
     msat_destroy_env(sol);
     msat_destroy_config(ctx);
}

void CoreSolverMathSat::assertConstraint(string s) {
    Expression e(s);
    int i = 0;
    msat_term exp=tradExpr(e,i);
    if (verbose>=10) cout << msat_term_repr(exp) << endl;
    int res=msat_assert_formula(sol,exp);
}

long CoreSolverMathSat::assertRetractable(string s){
    Expression e(s);
    int i = 0;


    msat_term exp0=tradExpr(e,i);

    string aux="r"+static_cast<ostringstream*> ( &(ostringstream() << contRetract) )->str();
    addVar(aux,"bool");


    msat_term exp1=msat_make_not(sol,mapVar[aux].exp);


    msat_term exp=msat_make_or(sol,exp0,exp1);

    infRectract infRect;
    infRect.retract=false;
    infRect.index=contRetract;
    retractable.push_back(infRect);
    if (verbose>=10) cout << msat_term_repr(exp) << endl;
    int res=msat_assert_formula(sol,exp);
    long l=contRetract;
    contRetract++;
    return l;
}

void CoreSolverMathSat::retract(long l){
    int i=0;
    bool f=false;
    while (!f && i<retractable.size()){
        if (i<l) i++;
        else {
            f=true;
            if (i==l) {
                retractable[i].retract=true;
                string aux="r"+static_cast<ostringstream*> ( &(ostringstream() << i) )->str();
                msat_term exp=msat_make_not(sol,mapVar[aux].exp);
                if (verbose>=10) cout << msat_term_repr(exp) << endl;
                int res=msat_assert_formula(sol,exp);
           }
        }
    }
}

void CoreSolverMathSat::addVar(string s,string t) {


    if (t.compare(string("int"))==0) {
         mapVar[s].decl=msat_declare_function(sol, s.c_str(), msat_get_integer_type(sol));;
         mapVar[s].tipus='I';
    }
    else if (t.compare(string("bool"))==0) {
         mapVar[s].decl=msat_declare_function(sol, s.c_str(), msat_get_bool_type(sol));
         mapVar[s].tipus='B';
    }
    else if (t.compare(string("real"))==0) {
         mapVar[s].decl=msat_declare_function(sol, s.c_str(), msat_get_rational_type(sol));
         mapVar[s].tipus='R';
    }
    else mapVar[s].tipus=' ';

    mapVar[s].exp=msat_make_constant(sol,mapVar[s].decl);
    mapVar[s].val="";
}


int CoreSolverMathSat::check(){

    vector<msat_term> assumptions;
    for (vector<infRectract>::iterator it=retractable.begin();it!=retractable.end() ;++it) {
        if (!it->retract) {
            string aux="r"+static_cast<ostringstream*> ( &(ostringstream() << it->index) )->str();
            assumptions.push_back(mapVar[aux].exp);
        }
    }


    msat_result status;

    if (assumptions.size()>0) status=msat_solve_with_assumptions(sol,&assumptions[0],assumptions.size());
    else status=msat_solve(sol);


    if(status == MSAT_UNSAT) return 0;
    if(status == MSAT_UNKNOWN) return -1;




    msat_model_iterator iter = msat_create_model_iterator(sol);

    while (msat_model_iterator_has_next(iter)) {
        msat_term t, v;
        msat_model_iterator_next(iter, &t, &v);
        stringstream ss;
        ss << msat_term_repr(t);
        string name=ss.str();
        ss.str(string());
        ss << msat_term_repr(v);
        string valor=ss.str();
        ss.str(string());
        switch(mapVar[name].tipus) {
            case 'B':
                if (valor.compare("`true`")==0) mapVar[name].val="1"; else mapVar[name].val="0";
                break;
            case 'I':
                mapVar[name].val=valor;
                break;
            case ' ':
                mapVar[name].val=valor;
                break;
        }
    }
    msat_destroy_model_iterator(iter);


    return 1;
}








long CoreSolverMathSat::modelVarInt(string s){
    return atoi(mapVar[s].val.c_str());
}

bool CoreSolverMathSat::modelVarBool(string s){
    if (mapVar[s].val.compare(string("0"))==0) return false;
    return true;
}










msat_term CoreSolverMathSat::tradIte(Expression & e,int & i) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a ite" << endl;exit;}
    i++;
    msat_term e1=tradExpr(e,i);
    msat_term e2=tradExpr(e,i);
    msat_term e3=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a ite" << endl;exit;}
    i++;
    return msat_make_term_ite(sol,e1,e2,e3);
}

msat_term CoreSolverMathSat::tradNot(Expression & e,int & i) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a not" << endl;exit;}
    i++;
    msat_term e1=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a not" << endl;exit;}
    i++;
    return msat_make_not(sol,e1);
}

msat_term CoreSolverMathSat::tradRel(Expression & e,int & i,string a) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a Rel" << endl;exit;}
    i++;
    msat_term e1=tradExpr(e,i);
    msat_term e2=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a Rel" << endl;exit;}
    i++;
    if (a.compare(string("="))==0) return msat_make_equal(sol,e1,e2);
    else if (a.compare(string("!="))==0) return msat_make_not(sol,msat_make_equal(sol,e1,e2));
    else if (a.compare(string("<="))==0) return msat_make_leq(sol,e1,e2);
    else if (a.compare(string("<"))==0) return msat_make_and(sol,msat_make_leq(sol,e1,e2),msat_make_not(sol,msat_make_equal(sol,e1,e2)));
    else if (a.compare(string(">="))==0) return msat_make_or(sol,msat_make_not(sol,msat_make_leq(sol,e1,e2)),msat_make_equal(sol,e1,e2));
    else if (a.compare(string(">"))==0) return msat_make_not(sol,msat_make_leq(sol,e1,e2));
    else if (a.compare(string("dimpl"))==0) return msat_make_iff(sol,e1,e2);
    else if (a.compare(string("impl"))==0) return msat_make_or(sol,msat_make_not(sol,e1),e2);
}

msat_term CoreSolverMathSat::tradList(Expression & e,int & i,string a) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a List" << endl;exit;}
    i++;
    msat_term res=tradExpr(e,i);
    while (e.element(i).compare(string(")"))!=0) {
        if (a.compare(string("+"))==0) res=msat_make_plus(sol,res,tradExpr(e,i));
        else if (a.compare(string("-"))==0) res=msat_make_plus(sol,res,msat_make_times(sol,msat_make_number(sol,"-1"),tradExpr(e,i)));
        else if (a.compare(string("*"))==0) res=msat_make_times(sol,res,tradExpr(e,i));
        else if (a.compare(string("or"))==0) res=msat_make_or(sol,res,tradExpr(e,i));
        else if (a.compare(string("and"))==0) res=msat_make_and(sol,res,tradExpr(e,i));
    }
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a List" << endl;exit;}
    i++;
    return res;
}

msat_term CoreSolverMathSat::tradUnari(Expression & e,int & i) {
    return msat_make_times(sol,msat_make_number(sol,"-1"),tradExpr(e,i));
}

msat_term CoreSolverMathSat::tradExpr(Expression & e,int & i) {

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
        return msat_make_true(sol);
    } else  if (a.compare(string("false"))==0) {
        i++;
        return msat_make_false(sol);
    } else   if (a.compare(string("EOE"))==0) {
        cout << "error in Expression" << endl;
        exit;
    } else {
        if (a[0]>='0' && a[0]<='9') {
            i++;
            return msat_make_number(sol,a.c_str());
        } else {
            i++;
            return mapVar[a].exp;
        }
    }

}
