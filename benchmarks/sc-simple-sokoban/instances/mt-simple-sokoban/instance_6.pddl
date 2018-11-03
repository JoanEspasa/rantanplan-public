(define (problem instance_6)
  (:domain mt-simple-sokoban)
  (:objects
    stone1 stone2 stone3 - stone
	player1 - player
  )

  (:init
    (= (max_x) 6)
	(= (min_x) 1)
	(= (max_y) 6)
	(= (min_y) 1)
	(= (x player1) 2)
	(= (y player1) 3)
	(= (x stone1) 2)
	(= (y stone1) 2)
	(= (x stone2) 2)
	(= (y stone2) 4)
	(= (x stone3) 2)
	(= (y stone3) 5)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 3)) (and (= (x stone1) 6) (= (y stone1) 4)) (and (= (x stone1) 6) (= (y stone1) 5)))
	(or (and (= (x stone2) 1) (= (y stone2) 3)) (and (= (x stone2) 6) (= (y stone2) 4)) (and (= (x stone2) 6) (= (y stone2) 5)))
	(or (and (= (x stone3) 1) (= (y stone3) 3)) (and (= (x stone3) 6) (= (y stone3) 4)) (and (= (x stone3) 6) (= (y stone3) 5)))
  ))

  
  

  
)
