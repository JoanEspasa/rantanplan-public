#ifndef THING_H
#define THING_H

#include <string>
#include <memory>
#include <iostream>

#include "nodeVisitor.h"

enum class functor_type: int {
    T_PREDICATE  ,
    T_FUNCTION   ,
    T_ACTION     ,
    T_CONSTRAINT ,
    T_OPERATION  ,
    T_CONSTANT   ,
    T_VARIABLE   ,
    T_UNKNOWN   // dunno, lol
};

class Thing : public std::enable_shared_from_this<Thing> {  

	public:
        functor_type type;
        bool is_static;

        Thing();
        virtual ~Thing()=0;

        void setStatic(bool n);
        void setType(functor_type t);

        bool getStatic() const;
        functor_type getType();


        // com que no tenim constructors virtuals, ens els fem adhoc xD
        virtual std::shared_ptr<Thing> duplicate()=0;

		// funcions que han d'implementar les classes que hi heredin
		virtual std::string toString(int t=0,bool relaxed=false) const=0;
		virtual std::string toStringUF(int t=0) const=0;

		virtual std::string getName() const=0;
		virtual void setName(std::string name)=0;

        virtual void accept(std::shared_ptr<nodeVisitor> v);//=0;
};

#endif
