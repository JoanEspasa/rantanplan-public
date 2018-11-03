(define (problem instance_60_2_3)
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
	(= (x player1) 30)
	(= (y player1) 45)
	(= (x stone1) 49)
	(= (y stone1) 45)
	(= (x stone2) 23)
	(= (y stone2) 23)
  )

  (:goal (and 
    (or (and (= (x stone1) 47) (= (y stone1) 39)) (and (= (x stone1) 2) (= (y stone1) 41)))
	(or (and (= (x stone2) 47) (= (y stone2) 39)) (and (= (x stone2) 2) (= (y stone2) 41)))
  ))

  
  

  
)
