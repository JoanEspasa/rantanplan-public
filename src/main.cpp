#include "PDDLLexer.h"
#include "PDDLParser.h"

#include "PDDLTreeEvaluator.h"
#include "solverInclude.h"
#include "solverActionNOP.h"
#include "firstEncodingVisitor.h"
#include "chainEncodingVisitor.h"
#include "conditionalChainEncodingVisitor.h"
#include "encodingUFVisitorZ3.h"
#include "encodingUFVisitorFile.h"

#include <unistd.h>
#include <cassert>
#include <iostream>

using namespace std;

void printUsage(){
    cerr << endl;
    cerr << "- OMG --- L /\\ P Group." << endl;
    cerr << endl;
    cerr << " usage:  ./ineedaplan [OPTIONS] -d <domain file> -p <problem file>" << endl;
    cerr << endl;
    cerr << " -v                     : Verbose mode."                              << endl;
    cerr << " -d <filename.pddl>     : Domain file."                               << endl;
    cerr << " -p <filename.pddl>     : Problem file."                              << endl;
    cerr << " -s <output.pddl>       : PDDL plan output file."                     << endl;
    cerr << " -z <order.txt>         : order file."                                << endl;
    cerr << " -e <y | f | g | z | c> : If using a flattened encoding, the solver type for the flattened encoding: Yices (whatever is linked), Yices1 File, Yices2 File, Z3, CVC4.   (default: y)" << endl;
    cerr << " -m <l | f | e>         : Parallelism model: linear, forall, exists.  (default: e)" << endl;
    cerr << " -i <o | n | u | s | c | h> : Method for int incompatibilities: Old, New, unknown?,  Semantic, none, none+check1. (default: c)" << endl;
    cerr << " -t <f | p | c | u | a> : Encoding to use: flattened, flattened+chained, flattened+rchained, UF+Z3+files, UF+Z3+API. (default: c)" << endl;
    cerr << " -a <0 | 1>             : Solving algorithm : Lineal, Early Time Out. (default: lineal)" << endl;
    cerr << " -o <dfs | rdfs | lex | rlex | random | relaxed | rrelaxed | comm | rcomm | fromfile >       : Exists ordering for the quadratic encoding : dfs order, lexical, random, extracted from a plan of the relaxed problem, communities of ungrounded actions, read from file. add a r on the beginning to get the reverse (default: dfs)" << endl;
    cerr << " -x <quadratic | lineal | dfscuts >  : Exists encoding  : quadratic, linear, DFScuts (default: q)" << endl;
    cerr << " -f <or | range | none> : How numeric function domains are represented : by enumeration, by range, or none (default: range)" << endl;
    cerr << " -c                     : Cycles made of two nodes in the incompat graph are cut beforehand" << endl;
    cerr << " -n number              : Add a sorting network to limit how many actions can be executed in one time step, to help refuting" << endl;
    cerr << " -u                     : If two actions can NEVER be executed at the same timestep, a mutex is added. (new incompat only)" << endl;
    cerr << " -l                     : Try to decide first on variables that say if an action is executed." << endl;
    cerr << " -k                     : Die after spitting the order ..." << endl;
    cerr << endl;
}

static int __verbose__ = 0;
int kill_after_order_flag = 0;
string order_file = "";

int main(int argc, char* argv[])
{
    // variables per parsejar linia de comandes, no es fan anar enlloc mes
    int c;
    int error_flag  = 0;
    int plan_flag   = 1;
    int dfile_flag  = 1;
    int pfile_flag  = 1;
    int cycles_flag = 0;
    int mutex_flag  = 0;
    int decide_flag = 0;
    extern char *optarg;
    extern int optind, optopt;

    string dfile,pfile,sfile;
    string solv_type = "y";
    string parall = "e";
    string int_t = "c";
    string encoder = "c";
    string exists_ord = "dfs";
    string exists_enc = "quadratic";
    string int_func_dom = "range";
    int sorting_network = 0;
    int solving_alg = 0;

    // main parsing of parameters
    while ((c = getopt(argc, argv, "n:vd:p:s:e:m:i:t:o:x:f:a:culkz:")) != -1) {
        switch(c) {
            case 'v':
                __verbose__ = 50; 
                break;
            case 'd':
                dfile = string(optarg);
                dfile_flag--;
                break;
            case 's':
                sfile = string(optarg);
                plan_flag--;
                break;
            case 'p':
                pfile = string(optarg);
                pfile_flag--;
                break;
            case 'f':
                int_func_dom = string(optarg);
                break;
            case 'e':
                solv_type = string(optarg);
                break;
            case 'i':
                int_t = string(optarg);
                break;
            case 'm':
                parall = string(optarg);
                break;
            case 't':
                encoder = string(optarg);
                break;
            case 'o':
                exists_ord = string(optarg);
                break;
            case 'z':
                order_file = string(optarg);
                break;
            case 'x':
                exists_enc = string(optarg);
                break;
            case 'k':
                kill_after_order_flag = 1;
                break;
            case 'l':
                decide_flag = 1;
                break;
            case 'a':
                solving_alg = std::stoi(string(optarg));
                break;
            case 'n':
                sorting_network = std::stoi(string(optarg));
                break;
            case 'c':
                cycles_flag = 1;
                break;
            case 'u':
                mutex_flag  = 1;
                break;
            case '?':
                fprintf(stderr, "Unrecognized option: -%c\n", optopt);
                error_flag++;
                break;
        }
    }

    if (error_flag || pfile_flag || dfile_flag || plan_flag) {
        printUsage();
        exit(2);
    } else {
        cout << "Executin' with the following options:" << endl;
        cout << "=====================================" << endl;
        cout << "verbose           : " <<  __verbose__ << endl;
        cout << "domain  file      : " << dfile << endl;
        cout << "problem file      : " << pfile << endl;
        cout << "plan file         : " << sfile << endl;
        cout << "solver type       : " << solv_type << endl;
        cout << "parallelism type  : " << parall << endl;
        cout << "exists ordering   : " << exists_ord << endl;
        cout << "exists encoding   : " << exists_enc << endl;
        cout << "int incompat type : " << int_t << endl;
        cout << "encoding          : " << encoder << endl;
        cout << "cycles cutting    : " << cycles_flag << endl;
        cout << "free mutexes      : " << mutex_flag << endl;
        cout << "sorting network   : " << sorting_network << endl;
        cout << "decide flag       : " << decide_flag << endl;
    }

	pANTLR3_INPUT_STREAM              input_domain;
	pANTLR3_INPUT_STREAM              input_instance;
	pPDDLLexer                        lex;
	pANTLR3_COMMON_TOKEN_STREAM       tokens;
	pPDDLParser                       parser;
	PDDLParser_pddlDoc_return         r;

	PDDLTreeEvaluator                 eval;

#ifdef __FUCKING_OLD_ANTLR_VERSION__
// ANTLR3C <= 3.2
input_domain   = antlr3AsciiFileStreamNew((pANTLR3_UINT8)dfile.c_str());
input_instance = antlr3AsciiFileStreamNew((pANTLR3_UINT8)pfile.c_str());
#else
// ANTLR3C >= 3.4
input_domain   = antlr3FileStreamNew((pANTLR3_UINT8)dfile.c_str(),ANTLR3_ENC_8BIT);
input_instance = antlr3FileStreamNew((pANTLR3_UINT8)pfile.c_str(),ANTLR3_ENC_8BIT);
#endif

    // fem tot el proces de parsing
	lex = PDDLLexerNew(input_domain);
	tokens = antlr3CommonTokenStreamSourceNew(ANTLR3_SIZE_HINT, TOKENSOURCE(lex));
	parser = PDDLParserNew(tokens);
	r = parser->pddlDoc(parser);
	pANTLR3_BASE_TREE domain_tree = r.tree;
	pANTLR3_COMMON_TREE_NODE_STREAM domain_nodes = antlr3CommonTreeNodeStreamNewTree(domain_tree,ANTLR3_SIZE_HINT);

	lex = PDDLLexerNew(input_instance);
	tokens = antlr3CommonTokenStreamSourceNew(ANTLR3_SIZE_HINT, TOKENSOURCE(lex));
	parser = PDDLParserNew(tokens);
	r = parser->pddlDoc(parser);
	pANTLR3_BASE_TREE instance_tree = r.tree;
	pANTLR3_COMMON_TREE_NODE_STREAM instance_nodes = antlr3CommonTreeNodeStreamNewTree(instance_tree,ANTLR3_SIZE_HINT);

    std::shared_ptr<PDDLProblem> prob = eval.getProblem(domain_tree, instance_tree);

    int debug = __verbose__;
    std::shared_ptr<SolverStandard> solver;
    if(solv_type == "y"){
#ifdef YICES1
            solver = shared_ptr<SolverStandard>(
                    new SolverStandard(new CoreSolverYices1(debug),new SolverActionNOP()));
#else
            solver = shared_ptr<SolverStandard>(
                    new SolverStandard(new CoreSolverYices2(debug),new SolverActionNOP()));
#endif            
    } else if(solv_type == "z"){
            solver = shared_ptr<SolverStandard>(
          new SolverStandard(new CoreSolverZ3(debug),new SolverActionNOP()));
    } else if(solv_type == "f"){
            solver = shared_ptr<SolverStandard>(
            new SolverStandard(new CoreSolverFileYices1("/tmp/foobar.txt",debug),new SolverActionNOP()));
    } else if (solv_type == "g"){
            solver = shared_ptr<SolverStandard>(
                    new SolverStandard(new CoreSolverFileYices2("/tmp/foobar.txt",debug),new SolverActionNOP()));
    } else if(solv_type == "s"){
            solver = shared_ptr<SolverStandard>(
                    new SolverStandard(new CoreSolverFileSimply("/tmp/foobar.txt",debug),new SolverActionNOP()));
    } else if(solv_type == "c"){
            //solver = shared_ptr<SolverStandard>(
            //new SolverStandard(new CoreSolverCVC4(debug),new SolverActionNOP()));
            //cout << "TODO" << endl;
            //exit(1);
    } else {
        cout << "Solver not recognized: " << solv_type << endl;
            exit(1);
    }

    std::shared_ptr<encoderVisitor> encoding;
    if(encoder == "f"){
        encoding = std::shared_ptr<firstEncodingVisitor>(new firstEncodingVisitor(parall,exists_ord,exists_enc,int_t,sfile,int_func_dom,solving_alg,cycles_flag,mutex_flag,sorting_network,decide_flag));
    } else if(encoder == "u"){
        encoding = std::shared_ptr<encodingUFVisitorFile>(new encodingUFVisitorFile(sfile,solving_alg,int_t,parall));
    } else if(encoder == "a"){
        encoding = std::shared_ptr<encodingUFVisitorZ3>(new encodingUFVisitorZ3(sfile,solving_alg,int_t,parall));
    } else if(encoder == "p"){
        encoding = std::shared_ptr<chainEncodingVisitor>(new chainEncodingVisitor(parall,exists_ord,exists_enc,int_t,sfile,int_func_dom,solving_alg,cycles_flag,mutex_flag,sorting_network,decide_flag));
    } else if(encoder == "c"){
        encoding = std::shared_ptr<conditionalChainEncodingVisitor>(new conditionalChainEncodingVisitor(parall,exists_ord,exists_enc,int_t,sfile,int_func_dom,solving_alg,cycles_flag,mutex_flag,sorting_network,decide_flag));
    } else {
        cout << "Encoder not recognized: " << encoder << endl;
        exit(1);
    }

    prob->addEncoder(encoding);
    prob->addSolver(solver);
    if(solving_alg == 1){
        prob->addNOP();
    }
    prob->encodeProblem();
    prob->solve();

	// frees manuals
	parser         ->free(parser);
	tokens         ->free(tokens);
	lex            ->free(lex);
	input_instance ->close(input_instance);
	input_domain   ->close(input_domain);

	return 0;
}


