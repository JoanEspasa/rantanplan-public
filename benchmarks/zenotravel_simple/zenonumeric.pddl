(define (domain zeno-travel)
(:requirements :typing)
;(:requirements :typing :fluents)
(:types aircraft person city - object)

(:predicates (at_ ?x - object ?c - city)
             (in ?p - person ?a - aircraft))

(:functions (fuel ?a - aircraft)
            (distance ?c1 - city ?c2 - city)
            (slow-burn ?a - aircraft)
            (capacity ?a - aircraft)
            (onboard ?a - aircraft)
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
              (decrease (fuel ?a) (* (distance ?c1 ?c2) (slow-burn ?a)))
         )
     )
)
