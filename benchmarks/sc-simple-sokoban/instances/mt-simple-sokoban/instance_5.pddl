(define (problem instance_5)
  (:domain mt-simple-sokoban)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 5)
	(= (min_x) 1)
	(= (max_y) 5)
	(= (min_y) 1)
	(= (x player1) 2)
	(= (y player1) 2)
	(= (x stone1) 2)
	(= (y stone1) 3)
	(= (x stone2) 2)
	(= (y stone2) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 2)) (and (= (x stone1) 5) (= (y stone1) 4)))
	(or (and (= (x stone2) 1) (= (y stone2) 2)) (and (= (x stone2) 5) (= (y stone2) 4)))
  ))

  
  

  
)
