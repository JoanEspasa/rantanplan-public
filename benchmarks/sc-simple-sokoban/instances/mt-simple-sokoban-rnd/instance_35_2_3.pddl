(define (problem instance_35_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 35)
	(= (min_x) 1)
	(= (max_y) 35)
	(= (min_y) 1)
	(= (x player1) 32)
	(= (y player1) 33)
	(= (x stone1) 34)
	(= (y stone1) 7)
	(= (x stone2) 8)
	(= (y stone2) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 34) (= (y stone1) 12)) (and (= (x stone1) 24) (= (y stone1) 4)))
	(or (and (= (x stone2) 34) (= (y stone2) 12)) (and (= (x stone2) 24) (= (y stone2) 4)))
  ))

  
  

  
)
