(define (problem instance_55_2_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 55)
	(= (min_x) 1)
	(= (max_y) 55)
	(= (min_y) 1)
	(= (x player1) 15)
	(= (y player1) 10)
	(= (x stone1) 27)
	(= (y stone1) 45)
	(= (x stone2) 6)
	(= (y stone2) 21)
  )

  (:goal (and 
    (or (and (= (x stone1) 33) (= (y stone1) 5)) (and (= (x stone1) 7) (= (y stone1) 37)))
	(or (and (= (x stone2) 33) (= (y stone2) 5)) (and (= (x stone2) 7) (= (y stone2) 37)))
  ))

  
  

  
)
