(define (problem instance_15_2_2)
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
	(= (x player1) 10)
	(= (y player1) 10)
	(= (x stone1) 13)
	(= (y stone1) 7)
	(= (x stone2) 14)
	(= (y stone2) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 5) (= (y stone1) 7)) (and (= (x stone1) 11) (= (y stone1) 12)))
	(or (and (= (x stone2) 5) (= (y stone2) 7)) (and (= (x stone2) 11) (= (y stone2) 12)))
  ))

  
  

  
)
