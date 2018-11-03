(define (problem instance_25_2_3)
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
	(= (x player1) 4)
	(= (y player1) 16)
	(= (x stone1) 18)
	(= (y stone1) 17)
	(= (x stone2) 13)
	(= (y stone2) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 13) (= (y stone1) 23)) (and (= (x stone1) 19) (= (y stone1) 15)))
	(or (and (= (x stone2) 13) (= (y stone2) 23)) (and (= (x stone2) 19) (= (y stone2) 15)))
  ))

  
  

  
)
