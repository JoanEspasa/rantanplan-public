(define (problem instance_100_2_2)
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
	(= (x player1) 75)
	(= (y player1) 60)
	(= (x stone1) 68)
	(= (y stone1) 10)
	(= (x stone2) 51)
	(= (y stone2) 27)
  )

  (:goal (and 
    (or (and (= (x stone1) 65) (= (y stone1) 20)) (and (= (x stone1) 57) (= (y stone1) 35)))
	(or (and (= (x stone2) 65) (= (y stone2) 20)) (and (= (x stone2) 57) (= (y stone2) 35)))
  ))

  
  

  
)
