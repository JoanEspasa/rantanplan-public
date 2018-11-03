(define (problem instance_75_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 75)
	(= (min_x) 1)
	(= (max_y) 75)
	(= (min_y) 1)
	(= (x player1) 66)
	(= (y player1) 68)
	(= (x stone1) 8)
	(= (y stone1) 32)
	(= (x stone2) 19)
	(= (y stone2) 8)
  )

  (:goal (and 
    (or (and (= (x stone1) 50) (= (y stone1) 54)) (and (= (x stone1) 33) (= (y stone1) 64)))
	(or (and (= (x stone2) 50) (= (y stone2) 54)) (and (= (x stone2) 33) (= (y stone2) 64)))
  ))

  
  

  
)
