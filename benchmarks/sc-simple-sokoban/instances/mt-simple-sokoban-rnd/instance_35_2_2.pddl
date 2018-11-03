(define (problem instance_35_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 35)
	(= (min_x) 1)
	(= (max_y) 35)
	(= (min_y) 1)
	(= (x player1) 24)
	(= (y player1) 23)
	(= (x stone1) 9)
	(= (y stone1) 11)
	(= (x stone2) 25)
	(= (y stone2) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 25) (= (y stone1) 29)) (and (= (x stone1) 5) (= (y stone1) 29)))
	(or (and (= (x stone2) 25) (= (y stone2) 29)) (and (= (x stone2) 5) (= (y stone2) 29)))
  ))

  
  

  
)
