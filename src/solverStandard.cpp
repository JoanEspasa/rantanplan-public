#include "solverStandard.h"

#include <sstream>
#include <iostream>
#include <string>


using namespace std;



SolverStandard::SolverStandard(CoreSolver * c, SolverAction * action, int verb, double timeout) {
    this->core = c;
    this->actions = action;
    this->verbose = verb;
    this->timeOut = timeout;
}

SolverStandard::~SolverStandard() {
    delete core;
    delete actions;
}


void SolverStandard::addConstraint(string s,int weight){
    core->assertConstraint(s);
}

void SolverStandard::setDecidable(string s){
    core->setDecidable(s);
}

void SolverStandard::addVar(string s,string t){
    core->addVar(s,t);
}


int SolverStandard::solve(string s,int lb,int ub) {
    timeval t1,t2;
    gettimeofday(&t1, NULL);
    int status=check();
    gettimeofday(&t2, NULL);
    double elapsedTime = t2.tv_sec - t1.tv_sec;
    bool term=false;
    if (timeOut>0 && timeOut<elapsedTime) term=true;
    if (status!=1) return status;
    int ub2=core->modelVarInt(s);
    if (verbose>=5) cout << "c ub "<< ub2 << endl;
    if (!term) status=optimize(s,lb,ub2);
    if (status!=-2) return status; else return 1;
}



int SolverStandard::check() {
    return core->check();
}



int SolverStandard::optimize(string s,int lb,int ub) {

  long upper_bound=ub;
  long lower_bound=lb-1;
  int status;
  bool term=false;

  if (ub<lb) return 0;
  do {
    long bound=(lower_bound+upper_bound)/2;
    long numRect=core->assertRetractable("<=("+s+","+std::to_string(bound)+")");//static_cast<ostringstream*>( &(ostringstream() << bound) )->str()+")");
    timeval t1,t2;
    gettimeofday(&t1, NULL);
    status=core->check();
    gettimeofday(&t2, NULL);
    double elapsedTime = t2.tv_sec - t1.tv_sec;
    if (timeOut>0 && timeOut<elapsedTime) term=true;
    if(status==0) {
      if (verbose>=5) cout << "c lb "<< bound+1 << endl;
      lower_bound = bound;
      core->retract(numRect);
      actions->lowerBoundAction();
     } else if (status==1){
      upper_bound=core->modelVarInt(s);
      if (verbose>=5) cout << "c ub "<< upper_bound << endl;
      actions->upperBoundAction();
    } else {return -1;}
  }while(lower_bound+1<upper_bound && !term);

  if (ub==upper_bound) return -2;
  else return 1;

}

long SolverStandard::modelVarInt(string s){
    return core->modelVarInt(s);
}

bool SolverStandard::modelVarBool(string s){
    return core->modelVarBool(s);
}

void SolverStandard::retract(long s){core->retract(s);}

long SolverStandard::assertRetractable(string s){ return core->assertRetractable(s); }
