(define (problem instance_85_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 85)
	(= (min_x) 1)
	(= (max_y) 85)
	(= (min_y) 1)
	(= (x player1) 67)
	(= (y player1) 68)
	(= (x stone1) 46)
	(= (y stone1) 75)
	(= (x stone2) 27)
	(= (y stone2) 43)
  )

  (:goal (and 
    (or (and (= (x stone1) 74) (= (y stone1) 56)) (and (= (x stone1) 50) (= (y stone1) 39)))
	(or (and (= (x stone2) 74) (= (y stone2) 56)) (and (= (x stone2) 50) (= (y stone2) 39)))
  ))

  
  

  
)
