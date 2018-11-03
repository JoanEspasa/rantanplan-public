(define (problem instance_60_2_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 60)
	(= (min_x) 1)
	(= (max_y) 60)
	(= (min_y) 1)
	(= (x player1) 38)
	(= (y player1) 38)
	(= (x stone1) 49)
	(= (y stone1) 29)
	(= (x stone2) 48)
	(= (y stone2) 26)
  )

  (:goal (and 
    (or (and (= (x stone1) 23) (= (y stone1) 46)) (and (= (x stone1) 19) (= (y stone1) 16)))
	(or (and (= (x stone2) 23) (= (y stone2) 46)) (and (= (x stone2) 19) (= (y stone2) 16)))
  ))

  
  

  
)
