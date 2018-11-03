(define (problem instance_85_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 85)
	(= (min_x) 1)
	(= (max_y) 85)
	(= (min_y) 1)
	(= (x player1) 52)
	(= (y player1) 32)
	(= (x stone1) 11)
	(= (y stone1) 67)
	(= (x stone2) 43)
	(= (y stone2) 77)
  )

  (:goal (and 
    (or (and (= (x stone1) 32) (= (y stone1) 65)) (and (= (x stone1) 5) (= (y stone1) 6)))
	(or (and (= (x stone2) 32) (= (y stone2) 65)) (and (= (x stone2) 5) (= (y stone2) 6)))
  ))

  
  

  
)
