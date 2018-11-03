(define (problem instance_15_2_1)
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
	(= (x player1) 2)
	(= (y player1) 11)
	(= (x stone1) 5)
	(= (y stone1) 7)
	(= (x stone2) 11)
	(= (y stone2) 7)
  )

  (:goal (and 
    (or (and (= (x stone1) 2) (= (y stone1) 2)) (and (= (x stone1) 3) (= (y stone1) 6)))
	(or (and (= (x stone2) 2) (= (y stone2) 2)) (and (= (x stone2) 3) (= (y stone2) 6)))
  ))

  
  

  
)
