(define (problem instance_95_2_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 95)
	(= (min_x) 1)
	(= (max_y) 95)
	(= (min_y) 1)
	(= (x player1) 24)
	(= (y player1) 60)
	(= (x stone1) 14)
	(= (y stone1) 61)
	(= (x stone2) 58)
	(= (y stone2) 85)
  )

  (:goal (and 
    (or (and (= (x stone1) 19) (= (y stone1) 33)) (and (= (x stone1) 56) (= (y stone1) 23)))
	(or (and (= (x stone2) 19) (= (y stone2) 33)) (and (= (x stone2) 56) (= (y stone2) 23)))
  ))

  
  

  
)
