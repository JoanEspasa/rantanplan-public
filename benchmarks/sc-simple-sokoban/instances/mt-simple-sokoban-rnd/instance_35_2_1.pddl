(define (problem instance_35_2_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 35)
	(= (min_x) 1)
	(= (max_y) 35)
	(= (min_y) 1)
	(= (x player1) 25)
	(= (y player1) 21)
	(= (x stone1) 16)
	(= (y stone1) 17)
	(= (x stone2) 12)
	(= (y stone2) 13)
  )

  (:goal (and 
    (or (and (= (x stone1) 11) (= (y stone1) 11)) (and (= (x stone1) 31) (= (y stone1) 32)))
	(or (and (= (x stone2) 11) (= (y stone2) 11)) (and (= (x stone2) 31) (= (y stone2) 32)))
  ))

  
  

  
)
