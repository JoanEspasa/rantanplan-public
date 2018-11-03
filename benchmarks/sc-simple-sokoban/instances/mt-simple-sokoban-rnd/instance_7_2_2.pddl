(define (problem instance_7_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 7)
	(= (min_x) 1)
	(= (max_y) 7)
	(= (min_y) 1)
	(= (x player1) 1)
	(= (y player1) 2)
	(= (x stone1) 4)
	(= (y stone1) 4)
	(= (x stone2) 3)
	(= (y stone2) 5)
  )

  (:goal (and 
    (or (and (= (x stone1) 7) (= (y stone1) 6)) (and (= (x stone1) 6) (= (y stone1) 4)))
	(or (and (= (x stone2) 7) (= (y stone2) 6)) (and (= (x stone2) 6) (= (y stone2) 4)))
  ))

  
  

  
)
