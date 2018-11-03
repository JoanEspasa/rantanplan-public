(define (problem instance_95_2_3)
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
	(= (x player1) 11)
	(= (y player1) 9)
	(= (x stone1) 19)
	(= (y stone1) 85)
	(= (x stone2) 61)
	(= (y stone2) 53)
  )

  (:goal (and 
    (or (and (= (x stone1) 51) (= (y stone1) 10)) (and (= (x stone1) 50) (= (y stone1) 21)))
	(or (and (= (x stone2) 51) (= (y stone2) 10)) (and (= (x stone2) 50) (= (y stone2) 21)))
  ))

  
  

  
)
