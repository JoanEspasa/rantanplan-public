(define (problem instance_4)
  (:domain mt-simple-sokoban)
  (:objects
    stone1 - stone
	player1 - player
  )

  (:init
    (= (max_x) 4)
	(= (min_x) 1)
	(= (max_y) 4)
	(= (min_y) 1)
	(= (x player1) 2)
	(= (y player1) 2)
	(= (x stone1) 2)
	(= (y stone1) 3)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 2)))
  ))

  
  

  
)
