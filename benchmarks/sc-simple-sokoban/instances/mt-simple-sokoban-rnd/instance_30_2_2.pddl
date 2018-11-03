(define (problem instance_30_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 30)
	(= (min_x) 1)
	(= (max_y) 30)
	(= (min_y) 1)
	(= (x player1) 3)
	(= (y player1) 22)
	(= (x stone1) 14)
	(= (y stone1) 13)
	(= (x stone2) 6)
	(= (y stone2) 16)
  )

  (:goal (and 
    (or (and (= (x stone1) 8) (= (y stone1) 8)) (and (= (x stone1) 9) (= (y stone1) 6)))
	(or (and (= (x stone2) 8) (= (y stone2) 8)) (and (= (x stone2) 9) (= (y stone2) 6)))
  ))

  
  

  
)
