#include "solverLinealUp.h"

#include <sstream>
#include <iostream>
#include <string>

using namespace std;

SolverLinealUp::SolverLinealUp(CoreSolver * c, SolverAction * action,int verb,double timeout) {
    this->core = c;
    this->actions = action;
    this->verbose = verb;
    this->timeOut = timeout;
}

SolverLinealUp::~SolverLinealUp() {
    delete core;
}


void SolverLinealUp::addConstraint(string s,int weight){
    core->assertConstraint(s);
}



void SolverLinealUp::addVar(string s,string t){
    core->addVar(s,t);
}


int SolverLinealUp::solve(string s,int lb,int ub) {
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


int SolverLinealUp::check() {
    return core->check();
}



int SolverLinealUp::optimize(string s,int lb,int ub) {

  long upper_bound=ub;
  long lower_bound=lb-1;
  int status;
  bool term=false;




  if (ub<lb) return 0;
  do {
    lower_bound++;
    long numRect=core->assertRetractable("<=("+s+","+std::to_string(lower_bound)+")");// static_cast<ostringstream*>( &(ostringstream() << lower_bound) )->str()+")");
    timeval t1,t2;
    gettimeofday(&t1, NULL);
    status=core->check();
    gettimeofday(&t2, NULL);
    double elapsedTime = t2.tv_sec - t1.tv_sec;
    if (timeOut>0 && timeOut<elapsedTime) term=true;
    if(status==0) {
      if (verbose>=5) cout << "c lb "<< lower_bound+1 << endl;
      core->retract(numRect);
      core->assertConstraint(">=("+s+"," + std::to_string(lower_bound+1) +")");
      actions->lowerBoundAction();
    } else if (status==1){
      upper_bound=lower_bound;
      if (verbose>=5) cout << "c ub "<< upper_bound << endl;
      actions->upperBoundAction();
    } else {return -1;}

  } while(status==0 && lower_bound+1<upper_bound && !term);

  if (ub==upper_bound) return -2;
  else return 1;

}




long SolverLinealUp::modelVarInt(string s){
    return core->modelVarInt(s);
}

bool SolverLinealUp::modelVarBool(string s){
    return core->modelVarBool(s);
}
