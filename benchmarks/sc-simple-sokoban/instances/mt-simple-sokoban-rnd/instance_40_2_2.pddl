(define (problem instance_40_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 40)
	(= (min_x) 1)
	(= (max_y) 40)
	(= (min_y) 1)
	(= (x player1) 17)
	(= (y player1) 16)
	(= (x stone1) 26)
	(= (y stone1) 22)
	(= (x stone2) 22)
	(= (y stone2) 5)
  )

  (:goal (and 
    (or (and (= (x stone1) 22) (= (y stone1) 2)) (and (= (x stone1) 34) (= (y stone1) 12)))
	(or (and (= (x stone2) 22) (= (y stone2) 2)) (and (= (x stone2) 34) (= (y stone2) 12)))
  ))

  
  

  
)
