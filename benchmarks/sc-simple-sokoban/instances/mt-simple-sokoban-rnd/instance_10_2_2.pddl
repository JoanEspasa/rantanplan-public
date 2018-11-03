(define (problem instance_10_2_2)
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
	(= (x player1) 2)
	(= (y player1) 2)
	(= (x stone1) 4)
	(= (y stone1) 9)
	(= (x stone2) 7)
	(= (y stone2) 8)
  )

  (:goal (and 
    (or (and (= (x stone1) 9) (= (y stone1) 2)) (and (= (x stone1) 2) (= (y stone1) 10)))
	(or (and (= (x stone2) 9) (= (y stone2) 2)) (and (= (x stone2) 2) (= (y stone2) 10)))
  ))

  
  

  
)
