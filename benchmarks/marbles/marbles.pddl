(define (domain marbles)
(:requirements :typing)

(:types  place person - locatable)

(:predicates
            (neighbour ?x - place ?y - place)
            (at ?p - person ?x - place)
            (has_item ?x - person))

(:functions 
            (items ?x - place) - number
            )

(:action move
 :parameters (?p - person ?x - place ?y - place)
 :precondition (and
                 (at ?p ?x)
                 (neighbour ?x ?y))

 :effect (and 
          (not (at ?p ?x))
          (at ?p ?y)
          (assign (at ?p) ?y)))

(:action pick 
 :parameters (?p - person ?x - place)
 :precondition (and
                (at ?p ?x)
                (> (items ?x) 0)
                (not (has_item ?p)))

 :effect (and
          (has_item ?p)
		  (decrease (items ?x) 1)))

(:action drop 
 :parameters (?p - person ?x - place)
 :precondition (and
                (at ?p ?x)
                (has_item ?p))

 :effect (and 
          (not (has_item ?p))
		  (increase (items ?x) 1)))
 
)
