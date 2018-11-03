(define (problem instance_75_2_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 75)
	(= (min_x) 1)
	(= (max_y) 75)
	(= (min_y) 1)
	(= (x player1) 20)
	(= (y player1) 69)
	(= (x stone1) 32)
	(= (y stone1) 52)
	(= (x stone2) 62)
	(= (y stone2) 31)
  )

  (:goal (and 
    (or (and (= (x stone1) 34) (= (y stone1) 75)) (and (= (x stone1) 50) (= (y stone1) 40)))
	(or (and (= (x stone2) 34) (= (y stone2) 75)) (and (= (x stone2) 50) (= (y stone2) 40)))
  ))

  
  

  
)
