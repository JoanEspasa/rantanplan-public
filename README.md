# RanTanPlan

RanTanPlan is a planner that supports numeric fluents and uses a planning as SMT approach. 

The code is in a state where it is more like a research prototype where various successful and failed ideas have been implemented. A rewrite of the successful ones is in dire need, to help further development and to clean-up the code base.

## Requirements

* Yices SMT solver
* Z3 SMT solver
* antlr3c (v3.2 or 3.4): you can download it from (<https://www.antlr3.org/download/C/>)
* a recent GCC or a C++ compiler with C++11 support, and a JVM

## Install

On the `Makefile` inside the `src`folder, `CFLAGS` and `LDFLAGS` are defined and then passed to the compiler. Depending on where you have installed the __Z3__, __Yices__ and __antlr3c__ you will have to change those. Personally I kept them on a folder called `solvers`.

Then, just use a `make`.


## Usage

The binary has lots of parameters, some being useless and some being cryptic. The main usages correspond to three published articles:

* [1] Linear semantics: 
	* `./rantanplan -d domain.pddl -p problem.pddl -s output.plan -i c -m l`
* [1] Exists-step semantics with a syntactic check for incompatibilities between actions:
	* `./rantanplan -d domain.pddl -p problem.pddl -s output.plan -i o -t f`
* [2] Exist-step semantics with semantic checks for incompatibilities:
	* `./rantanplan -d domain.pddl -p problem.pddl -s output.plan -i h -t p`
* [3] Relaxed-Relaxed Encoding:
	* `./rantanplan -d domain.pddl -p problem.pddl -s output.plan -i h -t c`
* [3] Informed Relaxed-Relaxed Encoding:
	* to generate the order: `./rantanplan -d domain.pddl -p problem.pddl -s output.plan -i c -t c -o relaxed -k -z order.txt`
	* to use the generated order: ` ./rantanplan -d domain.pddl -p problem.pddl -s output.plan -i c -t c -o relaxed -z order.txt`


## Articles

[1] - https://scholar.google.es/scholar?oi=bibs&cluster=5466607723729329909 : The RANTANPLAN Planner: System Description

[2] - https://scholar.google.es/scholar?oi=bibs&cluster=17029913781013285181 : A Semantic Notion of Interference for Planning Modulo Theories

[3] - https://scholar.google.es/scholar?oi=bibs&cluster=3114120780279434633 : Relaxed∃-Step Plans in Planning as SMT
