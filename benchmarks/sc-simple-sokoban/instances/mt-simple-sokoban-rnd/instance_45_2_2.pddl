(define (problem instance_45_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 45)
	(= (min_x) 1)
	(= (max_y) 45)
	(= (min_y) 1)
	(= (x player1) 6)
	(= (y player1) 22)
	(= (x stone1) 16)
	(= (y stone1) 6)
	(= (x stone2) 36)
	(= (y stone2) 37)
  )

  (:goal (and 
    (or (and (= (x stone1) 41) (= (y stone1) 41)) (and (= (x stone1) 22) (= (y stone1) 25)))
	(or (and (= (x stone2) 41) (= (y stone2) 41)) (and (= (x stone2) 22) (= (y stone2) 25)))
  ))

  
  

  
)
