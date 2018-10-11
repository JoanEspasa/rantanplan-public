#include "encoderVisitor.h"

using namespace std;

/*!
 * values es un vector d'strings ( els valors )
 * parameters són els parametres que estem buscant dintre
 * de l'arbre als que els hi posarem els valors de "values"
 * tree es l'arbre sobre el qual buscarem
 * WARNING: copia a anthelp.cpp
 */
void encoderVisitor::searchAndReplaceValues(shared_ptr<vector<string> > values ,shared_ptr< vector<shared_ptr<Parameter> > > parameters, shared_ptr<Thing> tree){
		assert(values->size() == parameters->size());
		assert(values->size() > 0);
		switch(tree->type) {
		    case functor_type::T_OPERATION:    
				case functor_type::T_PREDICATE: 
				case functor_type::T_FUNCTION:     
						{
								shared_ptr<Functor> f = static_pointer_cast<Functor>(tree);
								for(int i = 0; i < f->getNParams(); i++){
										searchAndReplaceValues(values,parameters,f->getParam(i)); 
								}
						}
						break;
				case functor_type::T_VARIABLE:     
						{
								shared_ptr<Parameter> p = static_pointer_cast<Parameter>(tree);
								for(unsigned int i = 0; i < parameters->size(); i++){
										//cout << "is |" << p->getName() << "| == |" << (*parameters)[i]->getName() << "| ?" << endl;
										if( p->getName() == (*parameters)[i]->getName()){
												if( !p->hasValue() ){
														p->setValue((*values)[i]);
												}else{ 
														cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << p->getName() << " te valor: " << p->getValue() << endl;
														assert(false);
												}
										}
								}
						}
						break;
				case functor_type::T_CONSTANT:     
						{
								//shared_ptr<Parameter> z = static_pointer_cast<Parameter>(tree);
								//cout << "CONSTANT: " << z->toString() << endl;
								// noop
						}
						break;
				default:
						cout << "ERR? " << tree->toString() << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
						break;
		}
}


string encoderVisitor::search_and_replace(string s, string search, string replace) {
    size_t pos = s.find(search);
    while(pos != string::npos){
        s.replace(pos, search.length(), replace);
        pos = s.find(search, pos + replace.length());
    }    
    return s;
}

std::vector<std::string> encoderVisitor::str_explode(std::string s,std::string delimiter){
    std::vector<std::string> results;
    size_t last = 0;
    size_t next = 0;
    while ((next = s.find(delimiter, last)) != string::npos) {
        results.push_back(s.substr(last, next-last));
        last = next + delimiter.size();
    }
    results.push_back(s.substr(last));

    return results;
}

/*
const vector<string> explode(const string& s, const char& c) {
    string buff{""};
    vector<string> v;

    for(auto n : s)
    {
        if(n != c) buff+=n; else
            if(n == c && buff != "") { v.push_back(buff); buff = ""; }
    }
    if(buff != "") v.push_back(buff);

    return v;
}*/
