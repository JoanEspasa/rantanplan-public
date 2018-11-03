(define (problem instance_40_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 40)
	(= (min_x) 1)
	(= (max_y) 40)
	(= (min_y) 1)
	(= (x player1) 37)
	(= (y player1) 26)
	(= (x stone1) 4)
	(= (y stone1) 32)
	(= (x stone2) 11)
	(= (y stone2) 11)
  )

  (:goal (and 
    (or (and (= (x stone1) 16) (= (y stone1) 8)) (and (= (x stone1) 35) (= (y stone1) 37)))
	(or (and (= (x stone2) 16) (= (y stone2) 8)) (and (= (x stone2) 35) (= (y stone2) 37)))
  ))

  
  

  
)
