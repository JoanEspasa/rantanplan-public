(define (problem instance_40_2_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 40)
	(= (min_x) 1)
	(= (max_y) 40)
	(= (min_y) 1)
	(= (x player1) 32)
	(= (y player1) 30)
	(= (x stone1) 29)
	(= (y stone1) 9)
	(= (x stone2) 8)
	(= (y stone2) 5)
  )

  (:goal (and 
    (or (and (= (x stone1) 2) (= (y stone1) 18)) (and (= (x stone1) 25) (= (y stone1) 29)))
	(or (and (= (x stone2) 2) (= (y stone2) 18)) (and (= (x stone2) 25) (= (y stone2) 29)))
  ))

  
  

  
)
