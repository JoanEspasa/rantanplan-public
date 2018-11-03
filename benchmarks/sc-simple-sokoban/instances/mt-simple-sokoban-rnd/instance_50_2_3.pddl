(define (problem instance_50_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 50)
	(= (min_x) 1)
	(= (max_y) 50)
	(= (min_y) 1)
	(= (x player1) 7)
	(= (y player1) 6)
	(= (x stone1) 49)
	(= (y stone1) 34)
	(= (x stone2) 4)
	(= (y stone2) 48)
  )

  (:goal (and 
    (or (and (= (x stone1) 21) (= (y stone1) 15)) (and (= (x stone1) 16) (= (y stone1) 23)))
	(or (and (= (x stone2) 21) (= (y stone2) 15)) (and (= (x stone2) 16) (= (y stone2) 23)))
  ))

  
  

  
)
