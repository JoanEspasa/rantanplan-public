(define (domain jug-pouring)
 (:requirements :typing :fluents)

 (:types jug - object)
 
 (:functions

  (amount ?j -jug) - number
  (capacity ?j -jug) - number
 )

; (:action pour 
;  :parameters (?jug1 - jug ?jug2 - jug)
;  :precondition
;      (>= (- (capacity ?jug2) (amount ?jug2)) (amount ?jug1))
;  :effect (and 
;      (assign (amount ?jug1) 0)
;      (assign (amount ?jug2) (+ (amount ?jug1) (amount ?jug2)))))

; pour contents of 1 to 2
 (:action pour 
  :parameters (?jug1 - jug ?jug2 - jug)
  :precondition
      (> (amount ?jug1) 0)
  :effect (and 
      (when (>= (- (capacity ?jug2) (amount ?jug2)) (amount ?jug1))
       (and
        (assign (amount ?jug1) 0)
        (increase (amount ?jug2) (amount ?jug1) )))
      (when (< (- (capacity ?jug2) (amount ?jug2)) (amount ?jug1))
       (and
        (decrease (amount ?jug1) (- (capacity ?jug2) (amount ?jug2)))
        (assign (amount ?jug2) (capacity ?jug2))))))
      

 (:action empty 
  :parameters (?jug - jug)
  :precondition (> (amount ?jug) 0)
  ;:precondition (> 1 0)
  :effect 
      (assign (amount ?jug) 0))

 (:action fill
  :parameters (?jug - jug)
  :precondition (< (amount ?jug) (capacity ?jug))
  ;:precondition (> 1 0)
  :effect 
      (assign (amount ?jug) (capacity ?jug)))
)
