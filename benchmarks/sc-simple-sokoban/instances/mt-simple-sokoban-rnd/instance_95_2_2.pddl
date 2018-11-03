(define (problem instance_95_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 95)
	(= (min_x) 1)
	(= (max_y) 95)
	(= (min_y) 1)
	(= (x player1) 89)
	(= (y player1) 8)
	(= (x stone1) 57)
	(= (y stone1) 68)
	(= (x stone2) 62)
	(= (y stone2) 70)
  )

  (:goal (and 
    (or (and (= (x stone1) 72) (= (y stone1) 23)) (and (= (x stone1) 73) (= (y stone1) 80)))
	(or (and (= (x stone2) 72) (= (y stone2) 23)) (and (= (x stone2) 73) (= (y stone2) 80)))
  ))

  
  

  
)
