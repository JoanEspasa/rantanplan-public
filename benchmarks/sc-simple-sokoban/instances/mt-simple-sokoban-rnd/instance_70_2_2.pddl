(define (problem instance_70_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 70)
	(= (min_x) 1)
	(= (max_y) 70)
	(= (min_y) 1)
	(= (x player1) 9)
	(= (y player1) 31)
	(= (x stone1) 36)
	(= (y stone1) 21)
	(= (x stone2) 45)
	(= (y stone2) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 53) (= (y stone1) 36)) (and (= (x stone1) 21) (= (y stone1) 40)))
	(or (and (= (x stone2) 53) (= (y stone2) 36)) (and (= (x stone2) 21) (= (y stone2) 40)))
  ))

  
  

  
)
