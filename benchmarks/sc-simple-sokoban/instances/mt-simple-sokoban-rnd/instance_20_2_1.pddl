(define (problem instance_20_2_1)
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
	(= (x player1) 3)
	(= (y player1) 18)
	(= (x stone1) 19)
	(= (y stone1) 19)
	(= (x stone2) 6)
	(= (y stone2) 14)
  )

  (:goal (and 
    (or (and (= (x stone1) 3) (= (y stone1) 13)) (and (= (x stone1) 17) (= (y stone1) 9)))
	(or (and (= (x stone2) 3) (= (y stone2) 13)) (and (= (x stone2) 17) (= (y stone2) 9)))
  ))

  
  

  
)
