(define (problem instance_60_2_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 60)
	(= (min_x) 1)
	(= (max_y) 60)
	(= (min_y) 1)
	(= (x player1) 10)
	(= (y player1) 51)
	(= (x stone1) 24)
	(= (y stone1) 18)
	(= (x stone2) 14)
	(= (y stone2) 30)
  )

  (:goal (and 
    (or (and (= (x stone1) 31) (= (y stone1) 57)) (and (= (x stone1) 48) (= (y stone1) 14)))
	(or (and (= (x stone2) 31) (= (y stone2) 57)) (and (= (x stone2) 48) (= (y stone2) 14)))
  ))

  
  

  
)
