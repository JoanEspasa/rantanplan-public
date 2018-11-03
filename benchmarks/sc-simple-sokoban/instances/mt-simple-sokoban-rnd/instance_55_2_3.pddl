(define (problem instance_55_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 55)
	(= (min_x) 1)
	(= (max_y) 55)
	(= (min_y) 1)
	(= (x player1) 24)
	(= (y player1) 40)
	(= (x stone1) 25)
	(= (y stone1) 34)
	(= (x stone2) 50)
	(= (y stone2) 8)
  )

  (:goal (and 
    (or (and (= (x stone1) 42) (= (y stone1) 18)) (and (= (x stone1) 52) (= (y stone1) 10)))
	(or (and (= (x stone2) 42) (= (y stone2) 18)) (and (= (x stone2) 52) (= (y stone2) 10)))
  ))

  
  

  
)
