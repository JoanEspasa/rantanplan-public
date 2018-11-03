(define (problem instance_90_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 90)
	(= (min_x) 1)
	(= (max_y) 90)
	(= (min_y) 1)
	(= (x player1) 57)
	(= (y player1) 67)
	(= (x stone1) 28)
	(= (y stone1) 39)
	(= (x stone2) 15)
	(= (y stone2) 87)
  )

  (:goal (and 
    (or (and (= (x stone1) 80) (= (y stone1) 1)) (and (= (x stone1) 19) (= (y stone1) 84)))
	(or (and (= (x stone2) 80) (= (y stone2) 1)) (and (= (x stone2) 19) (= (y stone2) 84)))
  ))

  
  

  
)
