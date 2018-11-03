(define (domain LAP-PLANES)
(:requirements :typing :fluents)

(:types 
        locatable city - object
        aircraft person - locatable
        )

(:predicates 
             (at_ ?x - locatable ?c - city)
             (in ?p - person ?a - aircraft))

(:functions 
            (fuel    ?a - aircraft)
            (seats   ?a - aircraft)
            (capacity ?a - aircraft)
            (onboard ?a - aircraft)

            (distance ?c1 - city ?c2 - city)
)

(:action board
 :parameters (?p - person ?a - aircraft ?c - city)
 :precondition (and (at_ ?p ?c)
                 (at_ ?a ?c)
                 (> (seats ?a) (onboard ?a)))

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
                 (> (onboard ?a) 0)
                 (>= (fuel ?a) (distance ?c1 ?c2)))

 :effect (and (not (at_ ?a ?c1))
              (at_ ?a ?c2)
              (decrease (fuel ?a) (distance ?c1 ?c2))))
             
(:action refuel	
 :parameters (?a - aircraft)
 :precondition (and 
                   (< (* (fuel ?a) 2) (capacity ?a))
                   (= (onboard ?a) 0))

 :effect (and
            (assign (fuel ?a) (capacity ?a)))
)


)
