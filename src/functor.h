#ifndef FUNCTOR_H
#define FUNCTOR_H

#include <iostream>
#include <functional>
#include <vector>
#include <string>
#include <memory>
#include <set>

#include "thing.h"
#include "parameter.h"
#include "nodeVisitor.h"


class Predicate;
class Function;
class Action;

/* Es part d'un Composite */
class Functor : public Thing {

    protected:
        std::vector< std::shared_ptr<Thing> >  container{};
        std::string name;

    public:

        Functor();
 //       Functor(const Functor & f);
        Functor(std::string n,
                functor_type t = functor_type::T_UNKNOWN,
                bool stat = false);
        virtual ~Functor();

        // sets
        void setName(std::string n); 

        // adds
        void addParam(std::shared_ptr<Thing> elem);
        void replaceParam(int i, std::shared_ptr<Thing> elem);

        // gets
        std::string getName() const;
        int getNParams();
        bool isInstanced();

        void popParam();
        std::shared_ptr<Thing> getParam(int n) const;

        virtual std::string toString(int t=0,bool relaxed=false) const;
        virtual std::string toStringUF(int t=0) const;

        virtual std::shared_ptr<Thing> duplicate();
        virtual void accept(std::shared_ptr<nodeVisitor> v);

        friend std::ostream &operator << (std::ostream &o, const Functor &f);
};

#endif 
