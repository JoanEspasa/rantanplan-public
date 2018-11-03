(define (problem instance_80_2_2)
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
	(= (x player1) 28)
	(= (y player1) 47)
	(= (x stone1) 20)
	(= (y stone1) 69)
	(= (x stone2) 78)
	(= (y stone2) 45)
  )

  (:goal (and 
    (or (and (= (x stone1) 27) (= (y stone1) 71)) (and (= (x stone1) 62) (= (y stone1) 32)))
	(or (and (= (x stone2) 27) (= (y stone2) 71)) (and (= (x stone2) 62) (= (y stone2) 32)))
  ))

  
  

  
)
