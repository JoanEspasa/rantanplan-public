#ifndef	SYM_REGISTER_H
#define SYM_REGISTER_H

#include <vector>
#include <string>
#include "functor.h"

class sym_register {
    public:
        std::string key;
        functor_type type;
        std::shared_ptr<Thing> data;
        std::shared_ptr<Thing> parent;

        sym_register();
        sym_register( std::string k, functor_type t,
                std::shared_ptr<Thing> d = NULL,
                std::shared_ptr<Thing> p = NULL);

        ~sym_register();
};

#endif

