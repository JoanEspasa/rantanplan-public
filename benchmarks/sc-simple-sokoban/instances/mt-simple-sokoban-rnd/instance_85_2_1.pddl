(define (problem instance_85_2_1)
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
	(= (x player1) 73)
	(= (y player1) 35)
	(= (x stone1) 3)
	(= (y stone1) 59)
	(= (x stone2) 66)
	(= (y stone2) 58)
  )

  (:goal (and 
    (or (and (= (x stone1) 85) (= (y stone1) 79)) (and (= (x stone1) 85) (= (y stone1) 38)))
	(or (and (= (x stone2) 85) (= (y stone2) 79)) (and (= (x stone2) 85) (= (y stone2) 38)))
  ))

  
  

  
)
