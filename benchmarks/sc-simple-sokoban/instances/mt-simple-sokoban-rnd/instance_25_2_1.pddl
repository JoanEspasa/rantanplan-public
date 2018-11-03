(define (problem instance_25_2_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 25)
	(= (min_x) 1)
	(= (max_y) 25)
	(= (min_y) 1)
	(= (x player1) 18)
	(= (y player1) 3)
	(= (x stone1) 13)
	(= (y stone1) 23)
	(= (x stone2) 21)
	(= (y stone2) 14)
  )

  (:goal (and 
    (or (and (= (x stone1) 2) (= (y stone1) 9)) (and (= (x stone1) 12) (= (y stone1) 12)))
	(or (and (= (x stone2) 2) (= (y stone2) 9)) (and (= (x stone2) 12) (= (y stone2) 12)))
  ))

  
  

  
)
