(define (problem instance_80_2_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 80)
	(= (min_x) 1)
	(= (max_y) 80)
	(= (min_y) 1)
	(= (x player1) 29)
	(= (y player1) 14)
	(= (x stone1) 54)
	(= (y stone1) 34)
	(= (x stone2) 18)
	(= (y stone2) 57)
  )

  (:goal (and 
    (or (and (= (x stone1) 68) (= (y stone1) 1)) (and (= (x stone1) 19) (= (y stone1) 63)))
	(or (and (= (x stone2) 68) (= (y stone2) 1)) (and (= (x stone2) 19) (= (y stone2) 63)))
  ))

  
  

  
)
