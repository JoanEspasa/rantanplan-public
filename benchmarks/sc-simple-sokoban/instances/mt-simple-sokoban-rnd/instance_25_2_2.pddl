(define (problem instance_25_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 25)
	(= (min_x) 1)
	(= (max_y) 25)
	(= (min_y) 1)
	(= (x player1) 15)
	(= (y player1) 4)
	(= (x stone1) 21)
	(= (y stone1) 13)
	(= (x stone2) 16)
	(= (y stone2) 13)
  )

  (:goal (and 
    (or (and (= (x stone1) 24) (= (y stone1) 7)) (and (= (x stone1) 5) (= (y stone1) 24)))
	(or (and (= (x stone2) 24) (= (y stone2) 7)) (and (= (x stone2) 5) (= (y stone2) 24)))
  ))

  
  

  
)
