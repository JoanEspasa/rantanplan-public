(define (problem instance_55_2_2)
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
	(= (x player1) 30)
	(= (y player1) 4)
	(= (x stone1) 40)
	(= (y stone1) 26)
	(= (x stone2) 48)
	(= (y stone2) 51)
  )

  (:goal (and 
    (or (and (= (x stone1) 5) (= (y stone1) 39)) (and (= (x stone1) 10) (= (y stone1) 37)))
	(or (and (= (x stone2) 5) (= (y stone2) 39)) (and (= (x stone2) 10) (= (y stone2) 37)))
  ))

  
  

  
)
