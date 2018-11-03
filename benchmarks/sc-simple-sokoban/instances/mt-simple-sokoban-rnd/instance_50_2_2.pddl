(define (problem instance_50_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 50)
	(= (min_x) 1)
	(= (max_y) 50)
	(= (min_y) 1)
	(= (x player1) 26)
	(= (y player1) 12)
	(= (x stone1) 6)
	(= (y stone1) 25)
	(= (x stone2) 24)
	(= (y stone2) 40)
  )

  (:goal (and 
    (or (and (= (x stone1) 44) (= (y stone1) 48)) (and (= (x stone1) 17) (= (y stone1) 5)))
	(or (and (= (x stone2) 44) (= (y stone2) 48)) (and (= (x stone2) 17) (= (y stone2) 5)))
  ))

  
  

  
)
