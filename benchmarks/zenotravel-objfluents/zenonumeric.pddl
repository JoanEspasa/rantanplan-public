(define (domain zeno-travel)
(:requirements :typing :fluents)
(:types aircraft person - objecte
		city - object)

(:functions 
 	    (at ?x - objecte) - city		
 	    (in ?p - person) - aircraft 
	    (fuel ?a - aircraft) - number
        (distance ?c1 - city ?c2 - city) - number
        (slow-burn ?a - aircraft) - number
        (fast-burn ?a - aircraft) - number
        (capacity ?a - aircraft) - number
        (total-fuel-used) - number
	    (onboard ?a - aircraft) - number
        (zoom-limit ?a - aircraft) - number
)

(:action board
 :parameters (?p - person ?a - aircraft ?c - city)
 :precondition (and
		 (= (at ?p) ?c)
                 (= (at ?a) ?c)
		)

 :effect (and 
		(assign (at ?p) undefined)
                (assign (in ?p) ?a)
		(increase (onboard ?a) 1)
 ))


(:action debark
 :parameters (?p - person ?a - aircraft ?c - city)
 :precondition (and
		 (= (in ?p) ?a)
                 (= (at ?a) ?c)
	       )
 :effect (and 
	      	 (assign (in ?p) undefined)
                 (assign (at ?p) ?c)
	         (decrease (onboard ?a) 1)
))

(:action fly 
 :parameters (?a - aircraft ?c1 ?c2 - city)
 :precondition (and 
                 (= (at ?a) ?c1)
                 (>= (fuel ?a) 
                     (* (distance ?c1 ?c2) (slow-burn ?a))))

 :effect (and
              (assign (at ?a) ?c2)
              (increase (total-fuel-used)
                         (* (distance ?c1 ?c2) (slow-burn ?a)))
              (decrease (fuel ?a) 
                         (* (distance ?c1 ?c2) (slow-burn ?a)))
))
                                  
(:action zoom
 :parameters (?a - aircraft ?c1 ?c2 - city)
 :precondition (and 
                 (= (at ?a) ?c1)
                 (>= (fuel ?a) 
                     (* (distance ?c1 ?c2) (fast-burn ?a)))
                 (<= (onboard ?a) (zoom-limit ?a)))
 :effect (and 
              (assign (at ?a) ?c2)
              (increase (total-fuel-used)
                         (* (distance ?c1 ?c2) (fast-burn ?a)))
              (decrease (fuel ?a) 
                         (* (distance ?c1 ?c2) (fast-burn ?a)))
)) 

(:action refuel	
 :parameters (?a - aircraft ?c - city)
 :precondition (and 
		(> (capacity ?a) (fuel ?a))
                (= (at ?a) ?c)
	       )
 :effect (and 
		(assign (fuel ?a) (capacity ?a))
))


)
