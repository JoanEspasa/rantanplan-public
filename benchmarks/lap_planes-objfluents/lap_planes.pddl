(define (domain lap-planes)
(:requirements :typing)

(:types  city locatable - object
         aircraft person - locatable)

(:functions 
            (at ?x - locatable) - city
            (in ?p - person) - aircraft
            (fuel    ?a - aircraft) - number
            (seats   ?a - aircraft) - number
            (capacity ?a - aircraft) - number
            (onboard ?a - aircraft) - number

            (distance ?c1 - city ?c2 - city) - number
)

(:action board
 :parameters (?p - person ?a - aircraft ?c - city)
 :precondition (and
                (= (at ?p) ?c)
                (= (at ?a) ?c)
                (> (seats ?a) (onboard ?a)))

 :effect (and 
          (assign (at ?p) undefined)
          (assign (in ?p) ?a)
          (increase (onboard ?a) 1)))

(:action debark
 :parameters (?p - person ?a - aircraft ?c - city)
 :precondition (and
                (= (in ?p) ?a)
                (= (at ?a) ?c))

 :effect (and
          (assign (in ?p) undefined)
          (assign (at ?p) ?c)
		  (decrease (onboard ?a) 1)))

(:action fly 
 :parameters (?a - aircraft ?c1 ?c2 - city)
 :precondition (and
                (= (at ?a) ?c1)
                (> (onboard ?a) 0)
                (>= (fuel ?a) (distance ?c1 ?c2)))

 :effect (and 
          (assign (at ?a) ?c2)
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
