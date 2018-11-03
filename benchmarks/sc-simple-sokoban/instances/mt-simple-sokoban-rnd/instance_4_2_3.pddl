(define (problem instance_4_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    player1 - player
	stone1 stone2 - stone
  )

  (:init
    (= (max_x) 4)
	(= (min_x) 1)
	(= (max_y) 4)
	(= (min_y) 1)
	(= (x player1) 4)
	(= (y player1) 3)
	(= (x stone1) 3)
	(= (y stone1) 2)
	(= (x stone2) 3)
	(= (y stone2) 3)
  )

  (:goal (and 
    (or (and (= (x stone1) 3) (= (y stone1) 1)) (and (= (x stone1) 2) (= (y stone1) 1)))
	(or (and (= (x stone2) 3) (= (y stone2) 1)) (and (= (x stone2) 2) (= (y stone2) 1)))
  ))

  
  

  
)
