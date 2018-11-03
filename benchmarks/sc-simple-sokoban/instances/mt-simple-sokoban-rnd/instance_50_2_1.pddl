(define (problem instance_50_2_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 50)
	(= (min_x) 1)
	(= (max_y) 50)
	(= (min_y) 1)
	(= (x player1) 20)
	(= (y player1) 10)
	(= (x stone1) 35)
	(= (y stone1) 7)
	(= (x stone2) 39)
	(= (y stone2) 7)
  )

  (:goal (and 
    (or (and (= (x stone1) 5) (= (y stone1) 49)) (and (= (x stone1) 12) (= (y stone1) 34)))
	(or (and (= (x stone2) 5) (= (y stone2) 49)) (and (= (x stone2) 12) (= (y stone2) 34)))
  ))

  
  

  
)
