(define (problem instance_45_2_1)
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
	(= (x player1) 2)
	(= (y player1) 27)
	(= (x stone1) 11)
	(= (y stone1) 22)
	(= (x stone2) 18)
	(= (y stone2) 43)
  )

  (:goal (and 
    (or (and (= (x stone1) 6) (= (y stone1) 11)) (and (= (x stone1) 24) (= (y stone1) 1)))
	(or (and (= (x stone2) 6) (= (y stone2) 11)) (and (= (x stone2) 24) (= (y stone2) 1)))
  ))

  
  

  
)
