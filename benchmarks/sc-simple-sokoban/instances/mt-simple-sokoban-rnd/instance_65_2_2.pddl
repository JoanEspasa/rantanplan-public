(define (problem instance_65_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 65)
	(= (min_x) 1)
	(= (max_y) 65)
	(= (min_y) 1)
	(= (x player1) 19)
	(= (y player1) 59)
	(= (x stone1) 43)
	(= (y stone1) 40)
	(= (x stone2) 20)
	(= (y stone2) 14)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 55)) (and (= (x stone1) 1) (= (y stone1) 16)))
	(or (and (= (x stone2) 1) (= (y stone2) 55)) (and (= (x stone2) 1) (= (y stone2) 16)))
  ))

  
  

  
)
