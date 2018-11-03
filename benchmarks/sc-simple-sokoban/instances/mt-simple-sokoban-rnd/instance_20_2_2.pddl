(define (problem instance_20_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 20)
	(= (min_x) 1)
	(= (max_y) 20)
	(= (min_y) 1)
	(= (x player1) 12)
	(= (y player1) 9)
	(= (x stone1) 14)
	(= (y stone1) 7)
	(= (x stone2) 18)
	(= (y stone2) 13)
  )

  (:goal (and 
    (or (and (= (x stone1) 3) (= (y stone1) 3)) (and (= (x stone1) 12) (= (y stone1) 8)))
	(or (and (= (x stone2) 3) (= (y stone2) 3)) (and (= (x stone2) 12) (= (y stone2) 8)))
  ))

  
  

  
)
