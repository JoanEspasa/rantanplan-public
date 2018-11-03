(define (domain lap-planes)
(:requirements :typing)
;(:requirements :typing :fluents)

(:types aircraft person city - object)

(:predicates 
             (at ?x - object ?c - city)
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
 :precondition (and 
                 (at ?p ?c)
                 (at ?a ?c)
                 (> (seats ?a) (onboard ?a)))

 :effect (and (not (at ?p ?c))
              (in ?p ?a)
		(increase (onboard ?a) 1)))


(:action debark
 :parameters (?p - person ?a - aircraft ?c - city)
 :precondition (and (in ?p ?a)
                 (at ?a ?c)
                 (> (onboard ?a) 0)
                 )
 :effect (and (not (in ?p ?a))
              (at ?p ?c)
		(decrease (onboard ?a) 1)))

(:action fly 
 :parameters (?a - aircraft ?c1 ?c2 - city)
 :precondition (and (at ?a ?c1)
                 (> (onboard ?a) 0)
                 (>= (fuel ?a) (distance ?c1 ?c2)))

 :effect (and (not (at ?a ?c1))
              (at ?a ?c2)
              (decrease (fuel ?a) (distance ?c1 ?c2)))
 )
             
(:action refuel	
 :parameters (?a - aircraft)
 :precondition (and 
                   (< (* (fuel ?a) 2) (capacity ?a))
                   (= (onboard ?a) 0)
)

 :effect (and
            (assign (fuel ?a) (capacity ?a))
        )
)


)
