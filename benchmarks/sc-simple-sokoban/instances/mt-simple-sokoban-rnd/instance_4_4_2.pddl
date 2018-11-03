(define (problem instance_4_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    player1 - player
	stone1 stone2 stone3 stone4 - stone
  )

  (:init
    (= (max_x) 4)
	(= (min_x) 1)
	(= (max_y) 4)
	(= (min_y) 1)
	(= (x player1) 4)
	(= (y player1) 3)
	(= (x stone1) 2)
	(= (y stone1) 3)
	(= (x stone2) 2)
	(= (y stone2) 2)
	(= (x stone3) 3)
	(= (y stone3) 3)
	(= (x stone4) 3)
	(= (y stone4) 2)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 3)) (and (= (x stone1) 1) (= (y stone1) 1)) (and (= (x stone1) 2) (= (y stone1) 1)) (and (= (x stone1) 4) (= (y stone1) 2)))
	(or (and (= (x stone2) 1) (= (y stone2) 3)) (and (= (x stone2) 1) (= (y stone2) 1)) (and (= (x stone2) 2) (= (y stone2) 1)) (and (= (x stone2) 4) (= (y stone2) 2)))
	(or (and (= (x stone3) 1) (= (y stone3) 3)) (and (= (x stone3) 1) (= (y stone3) 1)) (and (= (x stone3) 2) (= (y stone3) 1)) (and (= (x stone3) 4) (= (y stone3) 2)))
	(or (and (= (x stone4) 1) (= (y stone4) 3)) (and (= (x stone4) 1) (= (y stone4) 1)) (and (= (x stone4) 2) (= (y stone4) 1)) (and (= (x stone4) 4) (= (y stone4) 2)))
  ))

  
  

  
)
