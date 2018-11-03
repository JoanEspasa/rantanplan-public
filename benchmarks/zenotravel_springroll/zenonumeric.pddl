(define (domain zeno-travel)
(:requirements :typing)
;(:requirements :typing :fluents)
(:types aircraft person city - object)
(:predicates (at_ ?x - object ?c - city)
             (in ?p - person ?a - aircraft))
(:functions (fuel ?a - aircraft)
            (distance ?c1 - city ?c2 - city)
            (slow-burn ?a - aircraft)
            (fast-burn ?a - aircraft)
            (capacity ?a - aircraft)
            (total-fuel-used)
	    (onboard ?a - aircraft)
            (zoom-limit ?a - aircraft)
            )


(:action board
 :parameters (?p - person ?a - aircraft ?c - city)
 :precondition (and (at_ ?p ?c)
                 (at_ ?a ?c))
 :effect (and (not (at_ ?p ?c))
              (in ?p ?a)
		(increase (onboard ?a) 1)))


(:action debark
 :parameters (?p - person ?a - aircraft ?c - city)
 :precondition (and (in ?p ?a)
                 (at_ ?a ?c))
 :effect (and (not (in ?p ?a))
              (at_ ?p ?c)
		(decrease (onboard ?a) 1)))

(:action fly 
 :parameters (?a - aircraft ?c1 ?c2 - city)
 :precondition (and (at_ ?a ?c1)
                 (>= (fuel ?a) 
                         (* (distance ?c1 ?c2) (slow-burn ?a))))
 :effect (and (not (at_ ?a ?c1))
              (at_ ?a ?c2)
              (increase (total-fuel-used)
                         (* (distance ?c1 ?c2) (slow-burn ?a)))
              (decrease (fuel ?a) 
                         (* (distance ?c1 ?c2) (slow-burn ?a)))))
                                  
(:action zoom
 :parameters (?a - aircraft ?c1 ?c2 - city)
 :precondition (and (at_ ?a ?c1)
                 (>= (fuel ?a) 
                         (* (distance ?c1 ?c2) (fast-burn ?a)))
                 (<= (onboard ?a) (zoom-limit ?a)))
 :effect (and (not (at_ ?a ?c1))
              (at_ ?a ?c2)
              (increase (total-fuel-used)
                         (* (distance ?c1 ?c2) (fast-burn ?a)))
              (decrease (fuel ?a) 
                         (* (distance ?c1 ?c2) (fast-burn ?a)))
	)
) 

(:action refuel	
 :parameters (?a - aircraft ?c - city)
 :precondition (and (> (capacity ?a) (fuel ?a))
               (at_ ?a ?c)
		)
 :effect (and (assign (fuel ?a) (capacity ?a)))
)


)
