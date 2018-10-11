#ifndef CHAINENCODINGVISITOR_H
#define CHAINENCODINGVISITOR_H

#include "firstEncodingVisitor.h"

class chainEncodingVisitor : public firstEncodingVisitor {

    public:
        chainEncodingVisitor(string chainism, string exists_order, string exists_enc, string int_incompat_type, string plan_file, std::string int_func_dom, int alg_solv, int cycles_flag, int mutex_flag,int sorting_network, int decide_flag);
        virtual ~chainEncodingVisitor();

        virtual void visitAction( std::shared_ptr<Action> ptr);

        void generate1();
        void generate2();
        void generateChains();
        void encodeTheRestPlease();

        //virtual void encodeParallelism();
        // duplicat per a tocar el check (3), ara mergit a firstEncoding...
        //virtual void newIncompatibilities(bool permissiveThird);

        // no checkeja si els parametres que busca ja tenien valor
        // sino que fa un overwrite directe, sin contemplaciones
        //virtual void searchAndReplaceValues(std::shared_ptr<std::vector<std::string> > values ,
        //        std::shared_ptr< std::vector<std::shared_ptr<Parameter> > > parameters,
        //        std::shared_ptr<Thing> tree);

    protected:
        //std::map<std::string,std::shared_ptr<Function> > action2var;
        //
        // Index per a fer l'encoding encadenat aquest nou d'en miquel
        // -----------------------------------------------------------
        // var - en forma d'string
        //       -> vector< (o1, var ,eff) , (o2, var, eff) , (o3, var, eff),  ... >
        map<std::string,
            std::vector< 
                std::tuple<std::shared_ptr<Action>,        // accio a on surt l'efecte
                           std::shared_ptr<Function>,      // variable temporal nova creada
                           std::shared_ptr<Thing>,         // effecte en si
                           int > > > chains;               // FD al qual pertany

        // estructura auxiliar per a el punter a la funcio de la clau 
        map<std::string, std::shared_ptr<Function> > str2func; 
};


#endif
