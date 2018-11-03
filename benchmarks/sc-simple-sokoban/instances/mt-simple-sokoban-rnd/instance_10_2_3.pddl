(define (problem instance_10_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 10)
	(= (min_x) 1)
	(= (max_y) 10)
	(= (min_y) 1)
	(= (x player1) 4)
	(= (y player1) 4)
	(= (x stone1) 6)
	(= (y stone1) 8)
	(= (x stone2) 2)
	(= (y stone2) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 4) (= (y stone1) 6)) (and (= (x stone1) 1) (= (y stone1) 4)))
	(or (and (= (x stone2) 4) (= (y stone2) 6)) (and (= (x stone2) 1) (= (y stone2) 4)))
  ))

  
  

  
)
