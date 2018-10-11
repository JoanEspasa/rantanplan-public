#ifndef PARAMETER_H 
#define PARAMETER_H 

#include <iostream>
#include <string>
#include <memory>

#include "thing.h"

/* Es part d'un Composite */
class Parameter : public Thing {

    protected:
        std::string name;
        std::string value;
        std::string object_type;

    public:
        Parameter();
        virtual ~Parameter();

        // sets
        void setValue(std::string v);
        void setObjectType(std::string t);
		void setName(std::string name);

        // gets
		std::string getName() const;
        std::string getValue() const;
        std::string getObjectType();
        
        bool hasValue() const;

        virtual std::string toString(int t=0,bool relaxed=false) const;
        virtual std::string toStringUF(int t=0) const;

        virtual std::shared_ptr<Thing> duplicate();
        virtual void accept(std::shared_ptr<nodeVisitor> v);
        friend std::ostream &operator << (std::ostream &o, const Parameter &f);
};

#endif 
