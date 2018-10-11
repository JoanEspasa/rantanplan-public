// Compilar amb -DFLAG, on FLAG es el nom del ifdef. 

/* Del man del gcc:
===================
-D name
Predefine name as a macro, with definition 1.

-D name=definition
The contents of definition are tokenized and processed as if they appeared during translation phase three in a #define directive.  In particular, the definition will be truncated by embedded newline characters.

If you are invoking the preprocessor from a shell or shell-like program you may need to use the shell's quoting syntax to protect characters such as spaces that have a meaning in the shell syntax.

If you wish to define a function-like macro on the command line, write its argument list with surrounding parentheses before the equals sign (if any).  Parentheses are meaningful to most shells, so you will need to quote the option.  With sh and csh, -D'name(args...)=definition' works.

-D and -U options are processed in the order they are given on the command line.  All -imacros file and -include file options are processed after all -D and -U options.
*/

#ifdef VERBOSE_VERSION
#define VERBOSE(x) (cerr << x << endl)
#else
#define VERBOSE(x)
#endif

#ifdef DEBUG_VERSION
#define DEBUG(x) (cerr << __FILE__ << ":" << __LINE__ << " :" << x << endl)
#else
#define DEBUG(x)
#endif

/* P. Ex:
    int main() {
        VERBOSE("Missatge 1");
        DEBUG("Missatge de debug");
    }

  enlloc de:
    int main() {

        if(verbose == 1){
            cout << "Missatge 1" << endl;
        } 

        if(debug == 1){
            cout << "Missatge de debug" << endl;
        }

    }

*/
