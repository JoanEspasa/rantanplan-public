(define (problem instance_20_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 20)
	(= (min_x) 1)
	(= (max_y) 20)
	(= (min_y) 1)
	(= (x player1) 8)
	(= (y player1) 20)
	(= (x stone1) 2)
	(= (y stone1) 12)
	(= (x stone2) 19)
	(= (y stone2) 3)
  )

  (:goal (and 
    (or (and (= (x stone1) 4) (= (y stone1) 6)) (and (= (x stone1) 8) (= (y stone1) 13)))
	(or (and (= (x stone2) 4) (= (y stone2) 6)) (and (= (x stone2) 8) (= (y stone2) 13)))
  ))

  
  

  
)
