(define (domain Depot)
(:requirements :typing :fluents)
(:types Place Locatable - Object
	Depot Distributor - Place
        Truck Hoist Surface - Locatable
        Pallet Crate - Surface)

(:predicates
             (available ?x - Hoist)
             (clear ?x - Surface)
)

(:functions 
	(at ?x - Locatable) - Place
	(on ?x - Crate) - Surface
	(in ?x - Crate) - Truck
	(lifting ?x - Hoist) - Crate

	(load_limit ?t - Truck) 
	(current_load ?t - Truck) 
	(weight ?c - Crate)
	(fuel-cost)
)
	
(:action Drive
:parameters (?x - Truck ?y - Place ?z - Place) 
:precondition (and (= (at ?x) ?y))
:effect (and
	    (assign (at ?x) ?z)
		(increase (fuel-cost) 10)
))

(:action Lift  
:parameters (?x - Hoist ?y - Crate ?z - Surface ?p - Place)
:precondition (and 
				(= (at ?x) ?p)
				(available ?x)
				(= (at ?y) ?p) 
				(= (on ?y) ?z) 
				(clear ?y))
:effect (and (assign (at ?y) undefined)
	     (assign (lifting ?x) ?y)
	     (not (clear ?y))
	     (not (available ?x))
             (clear ?z)
	     (assign (on ?y) undefined)
	     (increase (fuel-cost) 1)
))

(:action Drop 
:parameters (?x - Hoist ?y - Crate ?z - Surface ?p - Place)
:precondition (and
           (= (at ?x) ?p)
		   (= (at ?z) ?p)
		   (clear ?z)
		   (= (lifting ?x) ?y)
)
:effect (and 
			 (available ?x)
             (assign (lifting ?x) undefined)
             (assign (at ?y) ?p) 
             (not (clear ?z))
             (clear ?y)
             (assign (on ?y) ?z)
))

(:action Load
:parameters (?x - Hoist ?y - Crate ?z - Truck ?p - Place)
:precondition (and 
                (= (at ?x) ?p)
                (= (at ?z) ?p)
                (= (lifting ?x) ?y)
                (<= (+ (current_load ?z) (weight ?y)) (load_limit ?z)))

:effect (and
            (assign (lifting ?x) undefined)
            (assign (in ?y) ?z)
            (available ?x)
            (increase (current_load ?z) (weight ?y))
))

(:action Unload 
:parameters (?x - Hoist ?y - Crate ?z - Truck ?p - Place)
:precondition (and 
                (= (at ?x) ?p)
                (= (at ?z) ?p)
                (available ?x)
                (= (in ?y) ?z))

:effect (and
            (assign (lifting ?x) ?y)
            (assign (in ?y) undefined)
            (not (available ?x))
            (decrease (current_load ?z) (weight ?y))
))

)
