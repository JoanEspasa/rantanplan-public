(define (problem instance_7_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 7)
	(= (min_x) 1)
	(= (max_y) 7)
	(= (min_y) 1)
	(= (x player1) 6)
	(= (y player1) 5)
	(= (x stone1) 6)
	(= (y stone1) 3)
	(= (x stone2) 2)
	(= (y stone2) 6)
	(= (x stone3) 4)
	(= (y stone3) 6)
	(= (x stone4) 2)
	(= (y stone4) 2)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 2)) (and (= (x stone1) 1) (= (y stone1) 4)) (and (= (x stone1) 3) (= (y stone1) 2)) (and (= (x stone1) 1) (= (y stone1) 1)))
	(or (and (= (x stone2) 1) (= (y stone2) 2)) (and (= (x stone2) 1) (= (y stone2) 4)) (and (= (x stone2) 3) (= (y stone2) 2)) (and (= (x stone2) 1) (= (y stone2) 1)))
	(or (and (= (x stone3) 1) (= (y stone3) 2)) (and (= (x stone3) 1) (= (y stone3) 4)) (and (= (x stone3) 3) (= (y stone3) 2)) (and (= (x stone3) 1) (= (y stone3) 1)))
	(or (and (= (x stone4) 1) (= (y stone4) 2)) (and (= (x stone4) 1) (= (y stone4) 4)) (and (= (x stone4) 3) (= (y stone4) 2)) (and (= (x stone4) 1) (= (y stone4) 1)))
  ))

  
  

  
)
