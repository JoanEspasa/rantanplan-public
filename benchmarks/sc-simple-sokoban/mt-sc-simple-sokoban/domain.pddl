
(define (domain mt-sc-simple-sokoban)

(:types player stone - object)

(:functions (x ?o - object)
            (y ?o - object)
            (max_y)
            (max_x)
            (min_y)
            (min_x)
)

(:action move_up
 :parameters (?p - player)
 :precondition (and (<= (+ (y ?p) 1) (max_y)))
 :effect (and
		(increase (y ?p) 1)))

(:action move_down
 :parameters (?p - player)
 :precondition (and (>= (- (y ?p) 1) (min_y)))
 :effect (and
		(decrease (y ?p) 1)))

(:action move_right
 :parameters (?p - player)
 :precondition (and (<= (+ (x ?p) 1) (max_x)))
 :effect (and
		(increase (x ?p) 1)))

(:action move_left
 :parameters (?p - player)
 :precondition (and (>= (- (x ?p) 1) (min_x)))
 :effect (and
		(decrease (x ?p) 1)))

(:action push_up
  :parameters (?p - player ?s - stone)
  :precondition (and
                    (= (x ?p) (x ?s))
                    (= (y ?p) (- (y ?s) 1))
                    (<= (+ (y ?s) 1) (max_y))
                )
  :effect (and
    (increase (y ?p) 1)
    (increase (y ?s) 1)
  )
)

(:action push_down
  :parameters (?p - player ?s - stone)
  :precondition (and
                    (= (x ?p) (x ?s))
                    (= (y ?p) (+ (y ?s) 1))
                    (>= (- (y ?s) 1) (min_y))
                )
  :effect (and
    (decrease (y ?p) 1)
    (decrease (y ?s) 1)
  )
)

(:action push_right
  :parameters (?p - player ?s - stone)
  :precondition (and
                    (= (y ?p) (y ?s))
                    (= (x ?p) (- (x ?s) 1))
                    (<= (+ (x ?s) 1) (max_x))
                )
  :effect (and
    (increase (x ?p) 1)
    (increase (x ?s) 1)
  )
)

(:action push_left
  :parameters (?p - player ?s - stone)
  :precondition (and
                    (= (y ?p) (y ?s))
                    (= (x ?p) (+ (x ?s) 1))
                    (>= (- (x ?s) 1) (min_x))
                )
  :effect (and
    (decrease (x ?p) 1)
    (decrease (x ?s) 1)
  )
)

;;(:constraint non_overlapping_objects
;;  :parameters (?o1 ?o2 - object)
;;  :condition (or (= ?o1 ?o2)
;;                  (not (= (x ?o1) (x ?o2)) )
;;                  (not (= (y ?o1) (y ?o2)) )
;;              )
;;)


(:constraint non_overlapping_stones
  :parameters (?p ?o - stone)
  :condition (or (= ?p ?o)
                  (> (x ?p) (x ?o)) (< (x ?p) (x ?o))
                  (> (y ?p) (y ?o)) (< (y ?p) (y ?o))
              )
)

(:constraint player_isnt_a_ghost
  :parameters (?p - player ?o - stone)
  :condition (or (> (x ?p) (x ?o)) (< (x ?p) (x ?o))
                 (> (y ?p) (y ?o)) (< (y ?p) (y ?o))
             )
)



)
