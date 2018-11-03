(define (problem instance_13_2_3)
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
	(= (x player1) 13)
	(= (y player1) 5)
	(= (x stone1) 12)
	(= (y stone1) 5)
	(= (x stone2) 11)
	(= (y stone2) 11)
  )

  (:goal (and 
    (or (and (= (x stone1) 3) (= (y stone1) 13)) (and (= (x stone1) 6) (= (y stone1) 13)))
	(or (and (= (x stone2) 3) (= (y stone2) 13)) (and (= (x stone2) 6) (= (y stone2) 13)))
  ))

  
  

  
)
