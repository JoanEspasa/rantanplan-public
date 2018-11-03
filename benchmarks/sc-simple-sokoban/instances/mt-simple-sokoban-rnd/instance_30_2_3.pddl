(define (problem instance_30_2_3)
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
	(= (x player1) 17)
	(= (y player1) 22)
	(= (x stone1) 28)
	(= (y stone1) 8)
	(= (x stone2) 2)
	(= (y stone2) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 18) (= (y stone1) 23)) (and (= (x stone1) 16) (= (y stone1) 5)))
	(or (and (= (x stone2) 18) (= (y stone2) 23)) (and (= (x stone2) 16) (= (y stone2) 5)))
  ))

  
  

  
)
