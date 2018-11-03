(define (problem instance_30_2_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 30)
	(= (min_x) 1)
	(= (max_y) 30)
	(= (min_y) 1)
	(= (x player1) 19)
	(= (y player1) 26)
	(= (x stone1) 29)
	(= (y stone1) 17)
	(= (x stone2) 17)
	(= (y stone2) 14)
  )

  (:goal (and 
    (or (and (= (x stone1) 24) (= (y stone1) 21)) (and (= (x stone1) 6) (= (y stone1) 19)))
	(or (and (= (x stone2) 24) (= (y stone2) 21)) (and (= (x stone2) 6) (= (y stone2) 19)))
  ))

  
  

  
)
