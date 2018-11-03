(define (problem instance_7_2_1)
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
	(= (x player1) 5)
	(= (y player1) 1)
	(= (x stone1) 3)
	(= (y stone1) 3)
	(= (x stone2) 4)
	(= (y stone2) 6)
  )

  (:goal (and 
    (or (and (= (x stone1) 6) (= (y stone1) 3)) (and (= (x stone1) 7) (= (y stone1) 4)))
	(or (and (= (x stone2) 6) (= (y stone2) 3)) (and (= (x stone2) 7) (= (y stone2) 4)))
  ))

  
  

  
)
