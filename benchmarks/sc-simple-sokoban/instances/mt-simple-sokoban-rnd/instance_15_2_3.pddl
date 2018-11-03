(define (problem instance_15_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 15)
	(= (min_x) 1)
	(= (max_y) 15)
	(= (min_y) 1)
	(= (x player1) 15)
	(= (y player1) 12)
	(= (x stone1) 7)
	(= (y stone1) 10)
	(= (x stone2) 13)
	(= (y stone2) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 14) (= (y stone1) 5)) (and (= (x stone1) 13) (= (y stone1) 5)))
	(or (and (= (x stone2) 14) (= (y stone2) 5)) (and (= (x stone2) 13) (= (y stone2) 5)))
  ))

  
  

  
)
