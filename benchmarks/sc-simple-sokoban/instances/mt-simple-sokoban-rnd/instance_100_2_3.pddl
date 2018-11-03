(define (problem instance_100_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 100)
	(= (min_x) 1)
	(= (max_y) 100)
	(= (min_y) 1)
	(= (x player1) 59)
	(= (y player1) 7)
	(= (x stone1) 39)
	(= (y stone1) 44)
	(= (x stone2) 90)
	(= (y stone2) 27)
  )

  (:goal (and 
    (or (and (= (x stone1) 70) (= (y stone1) 6)) (and (= (x stone1) 82) (= (y stone1) 21)))
	(or (and (= (x stone2) 70) (= (y stone2) 6)) (and (= (x stone2) 82) (= (y stone2) 21)))
  ))

  
  

  
)
