(define (problem instance_45_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 45)
	(= (min_x) 1)
	(= (max_y) 45)
	(= (min_y) 1)
	(= (x player1) 17)
	(= (y player1) 23)
	(= (x stone1) 36)
	(= (y stone1) 7)
	(= (x stone2) 40)
	(= (y stone2) 13)
  )

  (:goal (and 
    (or (and (= (x stone1) 9) (= (y stone1) 40)) (and (= (x stone1) 41) (= (y stone1) 38)))
	(or (and (= (x stone2) 9) (= (y stone2) 40)) (and (= (x stone2) 41) (= (y stone2) 38)))
  ))

  
  

  
)
