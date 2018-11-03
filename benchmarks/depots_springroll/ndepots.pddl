(define (domain Depot)
(:requirements :typing :fluents)
(:types Place Locatable - object
	Depot Distributor - Place
        Truck Hoist Surface - Locatable
        Pallet Crate - Surface)

(:predicates (at_ ?x - Locatable ?y - Place) 
             (on ?x - Crate ?y - Surface)
             (in ?x - Crate ?y - Truck)
             (lifting ?x - Hoist ?y - Crate)
             (available ?x - Hoist)
             (clear ?x - Surface)
)

(:functions 
	(load_limit ?t - Truck) 
	(current_load ?t - Truck) 
	(weight ?c - Crate)
	(fuel-cost)
)
	
(:action Drive
:parameters (?x - Truck ?y - Place ?z - Place) 
:precondition (and (at_ ?x ?y))
:effect (and
        (not (at_ ?x ?y))
        (at_ ?x ?z)
		(increase (fuel-cost) 10)))

(:action Lift
:parameters (?x - Hoist ?y - Crate ?z - Surface ?p - Place)
:precondition (and
                (at_ ?x ?p)
                (available ?x)
                (at_ ?y ?p)
                (on ?y ?z)
                (clear ?y))

:effect (and (not (at_ ?y ?p))
             (lifting ?x ?y)
             (not (clear ?y))
             (not (available ?x)) 
             (clear ?z)
             (not (on ?y ?z))
             (increase (fuel-cost) 1)))

(:action Drop 
:parameters (?x - Hoist ?y - Crate ?z - Surface ?p - Place)
:precondition (and (at_ ?x ?p)
                   (at_ ?z ?p)
                   (clear ?z)
                   (lifting ?x ?y))

:effect (and (available ?x)
             (not (lifting ?x ?y))
             (at_ ?y ?p)
             (not (clear ?z))
             (clear ?y)
             (on ?y ?z)))

(:action Load
:parameters (?x - Hoist ?y - Crate ?z - Truck ?p - Place)
:precondition (and (at_ ?x ?p) (at_ ?z ?p) (lifting ?x ?y)
		(<= (+ (current_load ?z) (weight ?y)) (load_limit ?z)))
:effect (and (not (lifting ?x ?y)) (in ?y ?z) (available ?x)
		(increase (current_load ?z) (weight ?y))))

(:action Unload 
:parameters (?x - Hoist ?y - Crate ?z - Truck ?p - Place)
:precondition (and (at_ ?x ?p) (at_ ?z ?p) (available ?x) (in ?y ?z))
:effect (and (not (in ?y ?z)) (not (available ?x)) (lifting ?x ?y)
		(decrease (current_load ?z) (weight ?y))))

)
