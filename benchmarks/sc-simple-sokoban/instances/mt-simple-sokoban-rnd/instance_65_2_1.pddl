(define (problem instance_65_2_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 65)
	(= (min_x) 1)
	(= (max_y) 65)
	(= (min_y) 1)
	(= (x player1) 23)
	(= (y player1) 22)
	(= (x stone1) 31)
	(= (y stone1) 27)
	(= (x stone2) 31)
	(= (y stone2) 53)
  )

  (:goal (and 
    (or (and (= (x stone1) 3) (= (y stone1) 18)) (and (= (x stone1) 22) (= (y stone1) 56)))
	(or (and (= (x stone2) 3) (= (y stone2) 18)) (and (= (x stone2) 22) (= (y stone2) 56)))
  ))

  
  

  
)
