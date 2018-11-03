(define (problem instance_10_2_1)
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
	(= (x player1) 6)
	(= (y player1) 2)
	(= (x stone1) 5)
	(= (y stone1) 2)
	(= (x stone2) 7)
	(= (y stone2) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 6) (= (y stone1) 9)) (and (= (x stone1) 1) (= (y stone1) 3)))
	(or (and (= (x stone2) 6) (= (y stone2) 9)) (and (= (x stone2) 1) (= (y stone2) 3)))
  ))

  
  

  
)
