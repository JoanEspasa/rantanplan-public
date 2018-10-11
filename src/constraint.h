#ifndef CONSTRAINT_H 
#define CONSTRAINT_H

#include <cassert>
#include <iostream>
#include <vector>
#include <string>
#include <memory>

#include "functor.h"

#include "parameter.h"

/*
 *
 (:constraint non_overlapping_stones
   :parameters (?p ?o - stone)
     :condition (or (= ?p ?o) 
                   (> (x ?p) (x ?o)) (< (x ?p) (x ?o))
                   (> (y ?p) (y ?o)) (< (y ?p) (y ?o))))

 * */
class Constraint : public Functor {

    protected:
        std::shared_ptr<Thing> raw_condition;

        //std::shared_ptr<Thing> condition;
        string return_type;

    public:
        Constraint();
        Constraint(std::string n,
                functor_type type = functor_type::T_CONSTRAINT,
                bool is_stat = false);
        virtual ~Constraint();

        void setRawCondition(std::shared_ptr<Thing> ptr);
        void setReturnType(string type);

        std::shared_ptr<Thing> getRawCondition();
        string getReturnType();
        std::shared_ptr<Parameter> getParamByName(string n);


        virtual std::shared_ptr<Thing> duplicate();
        virtual void accept(std::shared_ptr<nodeVisitor> v);

        virtual std::string toString(int t=0,bool relaxed=false) const;
        virtual std::string toStringUF(int t=0) const;
        friend std::ostream &operator << (std::ostream &o,  Constraint &f);
        //friend std::ostream &operator << (std::ostream &o, const Constraint &f);
};

#endif 
