#ifndef ACTION_H 
#define ACTION_H

#include <cassert>
#include <iostream>
#include <vector>
#include <string>
#include <memory>

#include "functor.h"

#include "parameter.h"

class Action : public Functor {

    protected:
        std::shared_ptr<Thing> raw_precondition;
        std::shared_ptr<Thing> raw_effect;

        // f => d
        std::vector< std::shared_ptr<Thing> > f_pairs;
        std::vector< std::shared_ptr<Thing> > d_pairs;

        string return_type;

    public:
        Action();
        Action(std::string n,
                functor_type type = functor_type::T_ACTION,
                bool is_stat = false);
        virtual ~Action();

        int getNFDs();
        std::pair<std::shared_ptr<Thing>, std::shared_ptr<Thing> > getFD(unsigned int i);
        void setRawPrecondition(std::shared_ptr<Thing> ptr);
        void setRawEffect(std::shared_ptr<Thing> ptr);
        void setReturnType(string type);

        std::shared_ptr<Thing> getRawPrecondition();
        std::shared_ptr<Thing> getRawEffect();
        string getReturnType();
        std::shared_ptr<Parameter> getParamByName(string n);

        void generateFDPairs();

        virtual std::shared_ptr<Thing> duplicate();
        virtual void accept(std::shared_ptr<nodeVisitor> v);

        virtual std::string toString(int t=0,bool relaxed=false) const;
        virtual std::string toStringUF(int t=0) const;
        friend std::ostream &operator << (std::ostream &o, const Action &f);
};

#endif 
