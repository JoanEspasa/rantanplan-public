(define (problem instance_65_2_3)
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
	(= (x player1) 22)
	(= (y player1) 27)
	(= (x stone1) 49)
	(= (y stone1) 26)
	(= (x stone2) 42)
	(= (y stone2) 54)
  )

  (:goal (and 
    (or (and (= (x stone1) 21) (= (y stone1) 37)) (and (= (x stone1) 60) (= (y stone1) 4)))
	(or (and (= (x stone2) 21) (= (y stone2) 37)) (and (= (x stone2) 60) (= (y stone2) 4)))
  ))

  
  

  
)
