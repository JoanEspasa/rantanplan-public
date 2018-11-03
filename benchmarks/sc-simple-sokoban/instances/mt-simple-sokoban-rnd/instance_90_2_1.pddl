(define (problem instance_90_2_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 90)
	(= (min_x) 1)
	(= (max_y) 90)
	(= (min_y) 1)
	(= (x player1) 62)
	(= (y player1) 78)
	(= (x stone1) 78)
	(= (y stone1) 26)
	(= (x stone2) 10)
	(= (y stone2) 68)
  )

  (:goal (and 
    (or (and (= (x stone1) 20) (= (y stone1) 27)) (and (= (x stone1) 63) (= (y stone1) 21)))
	(or (and (= (x stone2) 20) (= (y stone2) 27)) (and (= (x stone2) 63) (= (y stone2) 21)))
  ))

  
  

  
)
