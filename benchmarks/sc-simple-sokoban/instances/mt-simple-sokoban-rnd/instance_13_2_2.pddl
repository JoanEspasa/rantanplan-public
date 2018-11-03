(define (problem instance_13_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 13)
	(= (min_x) 1)
	(= (max_y) 13)
	(= (min_y) 1)
	(= (x player1) 4)
	(= (y player1) 10)
	(= (x stone1) 11)
	(= (y stone1) 9)
	(= (x stone2) 2)
	(= (y stone2) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 8) (= (y stone1) 4)) (and (= (x stone1) 2) (= (y stone1) 12)))
	(or (and (= (x stone2) 8) (= (y stone2) 4)) (and (= (x stone2) 2) (= (y stone2) 12)))
  ))

  
  

  
)
