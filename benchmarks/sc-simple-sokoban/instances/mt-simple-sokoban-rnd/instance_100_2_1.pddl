(define (problem instance_100_2_1)
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
	(= (x player1) 35)
	(= (y player1) 80)
	(= (x stone1) 30)
	(= (y stone1) 69)
	(= (x stone2) 9)
	(= (y stone2) 81)
  )

  (:goal (and 
    (or (and (= (x stone1) 58) (= (y stone1) 25)) (and (= (x stone1) 42) (= (y stone1) 74)))
	(or (and (= (x stone2) 58) (= (y stone2) 25)) (and (= (x stone2) 42) (= (y stone2) 74)))
  ))

  
  

  
)
