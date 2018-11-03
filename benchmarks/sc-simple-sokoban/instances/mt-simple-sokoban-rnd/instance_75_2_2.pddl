(define (problem instance_75_2_2)
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
	(= (x player1) 11)
	(= (y player1) 7)
	(= (x stone1) 72)
	(= (y stone1) 53)
	(= (x stone2) 4)
	(= (y stone2) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 54) (= (y stone1) 64)) (and (= (x stone1) 9) (= (y stone1) 18)))
	(or (and (= (x stone2) 54) (= (y stone2) 64)) (and (= (x stone2) 9) (= (y stone2) 18)))
  ))

  
  

  
)
