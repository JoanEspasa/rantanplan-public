(define (problem instance_70_2_1)
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
	(= (x player1) 67)
	(= (y player1) 34)
	(= (x stone1) 52)
	(= (y stone1) 40)
	(= (x stone2) 63)
	(= (y stone2) 48)
  )

  (:goal (and 
    (or (and (= (x stone1) 56) (= (y stone1) 59)) (and (= (x stone1) 69) (= (y stone1) 64)))
	(or (and (= (x stone2) 56) (= (y stone2) 59)) (and (= (x stone2) 69) (= (y stone2) 64)))
  ))

  
  

  
)
