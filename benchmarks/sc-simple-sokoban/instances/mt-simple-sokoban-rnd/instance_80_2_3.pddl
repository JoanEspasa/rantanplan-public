(define (problem instance_80_2_3)
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
	(= (x player1) 13)
	(= (y player1) 7)
	(= (x stone1) 73)
	(= (y stone1) 66)
	(= (x stone2) 8)
	(= (y stone2) 31)
  )

  (:goal (and 
    (or (and (= (x stone1) 75) (= (y stone1) 32)) (and (= (x stone1) 24) (= (y stone1) 8)))
	(or (and (= (x stone2) 75) (= (y stone2) 32)) (and (= (x stone2) 24) (= (y stone2) 8)))
  ))

  
  

  
)
