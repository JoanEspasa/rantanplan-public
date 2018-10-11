#include "coreSolverYices1.h"

using namespace std;

CoreSolverYices1::CoreSolverYices1(int verb) {
    ctx=yices_mk_context();
    verbose=verb;
    yices_set_arith_only(1);
    if(verb >= 10){ yices_enable_log_file("yices.log"); }
}

CoreSolverYices1::~CoreSolverYices1() {
    yices_del_context(ctx);
}

void CoreSolverYices1::assertConstraint(string s) {
    Expression e(s);
    int i = 0;
    yices_expr expr=tradExpr(e,i);
    if (verbose>=10) {yices_pp_expr(expr); cout << endl;}
    yices_assert(ctx,expr);
}

long CoreSolverYices1::assertRetractable(string s){
    Expression e(s);
    int i = 0;
    yices_expr expr=tradExpr(e,i);
    if (verbose>=10) {yices_pp_expr(expr); cout << endl;}
    return yices_assert_retractable(ctx,expr);
}

void CoreSolverYices1::retract(long l){
    yices_retract(ctx,l);
}

void CoreSolverYices1::setDecidable(string n) {
    // NOOP
    //
}

void CoreSolverYices1::addVar(string s,string t) {

    mapVar[s].decl=yices_mk_var_decl(ctx,(char *)s.c_str(),yices_mk_type(ctx,(char *)t.c_str()));
    mapVar[s].expr=yices_mk_var_from_decl(ctx,mapVar[s].decl);
    if (verbose>=10) {yices_pp_expr(mapVar[s].expr); cout << endl;}
    mapVar[s].val="";
    if (t.compare(string("int"))==0) mapVar[s].tipus='I';
    else if (t.compare(string("bool"))==0) mapVar[s].tipus='B';
    else if (t.compare(string("real"))==0) mapVar[s].tipus='R';
    else mapVar[s].tipus=' ';

}


int CoreSolverYices1::check(){
    lbool status = yices_check(ctx);
    if(status == l_false) return 0;
    if(status == l_undef) return -1;
    yices_model m = yices_get_model(ctx);
    for (map<string,infVar>::iterator it = mapVar.begin();it != mapVar.end(); ++it) {
        switch(it->second.tipus) {
            case 'B':
                lbool r;
                r=yices_get_value(m,it->second.decl);
                if (r==l_true) it->second.val="1"; else it->second.val="0";
                break;
            case 'I':
                long v;
                yices_get_int_value(m,it->second.decl,&v);
                it->second.val=static_cast<ostringstream*>( &(ostringstream() << v) )->str();
                break;
            case ' ':
                it->second.val="";
                break;
        }
    }
    return 1;
}

long CoreSolverYices1::modelVarInt(string s){
    return atoi(mapVar[s].val.c_str());
}

bool CoreSolverYices1::modelVarBool(string s){
    if (mapVar[s].val.compare(string("0"))==0) return false;
    return true;
}










yices_expr CoreSolverYices1::tradIte(Expression & e,int & i) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a ite" << endl;exit(-1);}
    i++;
    yices_expr e1=tradExpr(e,i);
    yices_expr e2=tradExpr(e,i);
    yices_expr e3=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a ite" << endl;exit(-1);}
    i++;
    return yices_mk_ite(ctx,e1,e2,e3);
}

yices_expr CoreSolverYices1::tradNot(Expression & e,int & i) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a not" << endl;exit(-1);}
    i++;
    yices_expr e1=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a not" << endl;exit(-1);}
    i++;
    return yices_mk_not(ctx,e1);
}

yices_expr CoreSolverYices1::tradRel(Expression & e,int & i,string a) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a Rel" << endl;exit(-1);}
    i++;
    yices_expr e1=tradExpr(e,i);
    yices_expr e2=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a Rel, es: " << e.element(i) << " (" << i << ") de " << e << endl;exit(-1);}
    i++;
    if (a.compare(string("="))==0) return yices_mk_eq(ctx,e1,e2);
    else if (a.compare(string("!="))==0) return yices_mk_not(ctx,yices_mk_eq(ctx,e1,e2));
    else if (a.compare(string("<="))==0) return yices_mk_le(ctx,e1,e2);
    else if (a.compare(string("<"))==0) return yices_mk_lt(ctx,e1,e2);
    else if (a.compare(string(">="))==0) return yices_mk_ge(ctx,e1,e2);
    else if (a.compare(string(">"))==0) return yices_mk_gt(ctx,e1,e2);
    else if (a.compare(string("dimpl"))==0) return yices_mk_eq(ctx,e1,e2);
    else if (a.compare(string("impl"))==0) {
         yices_expr arg[2];
         arg[0]=yices_mk_not(ctx,e1);
         arg[1]=e2;
         return yices_mk_or(ctx,arg,2);
    }
    cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
    return yices_mk_true(ctx);
}

yices_expr CoreSolverYices1::tradList(Expression & e,int & i,string a) {
    if (e.element(i).compare(string("("))!=0) {cout << "error ( a List" << endl;exit(-1);}
    i++;
    vector<yices_expr> ye;
    while (e.element(i).compare(string(")"))!=0) {
        ye.push_back(tradExpr(e,i));
    }
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a List" << endl;exit(-1);}
    i++;
    if (ye.size()>0) {
        if (a.compare(string("+"))==0) return yices_mk_sum(ctx,& ye[0],ye.size());
        else if (a.compare(string("-"))==0) return yices_mk_sub(ctx,& ye[0],ye.size());
        else if (a.compare(string("*"))==0) return yices_mk_mul(ctx,& ye[0],ye.size());
        else if (a.compare(string("or"))==0) return yices_mk_or(ctx,& ye[0],ye.size());
        else if (a.compare(string("and"))==0) return yices_mk_and(ctx,& ye[0],ye.size());
    }
    cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
    return yices_mk_true(ctx);
}

yices_expr CoreSolverYices1::tradUnari(Expression & e,int & i) {
    yices_expr arg[2];
    arg[0]=yices_mk_num(ctx,0);
    arg[1]=tradExpr(e,i);
    return yices_mk_sub(ctx,arg,2);
}


yices_expr CoreSolverYices1::tradExpr(Expression & e,int & i) {

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
        return yices_mk_true(ctx);
    } else  if (a.compare(string("false"))==0) {
        i++;
        return yices_mk_false(ctx);
    } else   if (a.compare(string("EOE"))==0) {
        cout << "error in Expression" << endl;
        exit(-1);
    } else {
        if (a[0]>='0' && a[0]<='9') {
            i++;
            return yices_mk_num(ctx,atoi(a.c_str()));
        } else {
            i++;
            return mapVar[a].expr;
        }
    }

}
