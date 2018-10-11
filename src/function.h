#ifndef FUNCTION_H
#define FUNCTION_H

#include <iostream>
#include <vector>
#include <string>
#include <memory>

#include "functor.h"

class Function : public Functor {

    public:
        Function();
        Function(std::string n,
                functor_type type = functor_type::T_FUNCTION,
                bool is_static = false);
        virtual ~Function();

        virtual std::shared_ptr<Thing> duplicate();
        virtual void accept(std::shared_ptr<nodeVisitor> v);

        string getReturnType();
        void setReturnType(string type);

        virtual std::string toString(int t=0,bool relaxed=false) const;
        virtual std::string toStringUF(int t=0) const;
        friend std::ostream &operator << (std::ostream &o, const Function &f);

    protected:
        string return_type;
};

#endif 
