(define (problem instance_70_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 70)
	(= (min_x) 1)
	(= (max_y) 70)
	(= (min_y) 1)
	(= (x player1) 66)
	(= (y player1) 11)
	(= (x stone1) 24)
	(= (y stone1) 54)
	(= (x stone2) 31)
	(= (y stone2) 19)
  )

  (:goal (and 
    (or (and (= (x stone1) 69) (= (y stone1) 11)) (and (= (x stone1) 22) (= (y stone1) 52)))
	(or (and (= (x stone2) 69) (= (y stone2) 11)) (and (= (x stone2) 22) (= (y stone2) 52)))
  ))

  
  

  
)
