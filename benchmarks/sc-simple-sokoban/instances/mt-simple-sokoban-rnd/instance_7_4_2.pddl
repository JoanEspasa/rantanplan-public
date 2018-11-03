(define (problem instance_7_4_2)
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
	(= (x player1) 4)
	(= (y player1) 6)
	(= (x stone1) 6)
	(= (y stone1) 6)
	(= (x stone2) 6)
	(= (y stone2) 3)
	(= (x stone3) 2)
	(= (y stone3) 6)
	(= (x stone4) 2)
	(= (y stone4) 2)
  )

  (:goal (and 
    (or (and (= (x stone1) 3) (= (y stone1) 2)) (and (= (x stone1) 3) (= (y stone1) 1)) (and (= (x stone1) 4) (= (y stone1) 4)) (and (= (x stone1) 7) (= (y stone1) 2)))
	(or (and (= (x stone2) 3) (= (y stone2) 2)) (and (= (x stone2) 3) (= (y stone2) 1)) (and (= (x stone2) 4) (= (y stone2) 4)) (and (= (x stone2) 7) (= (y stone2) 2)))
	(or (and (= (x stone3) 3) (= (y stone3) 2)) (and (= (x stone3) 3) (= (y stone3) 1)) (and (= (x stone3) 4) (= (y stone3) 4)) (and (= (x stone3) 7) (= (y stone3) 2)))
	(or (and (= (x stone4) 3) (= (y stone4) 2)) (and (= (x stone4) 3) (= (y stone4) 1)) (and (= (x stone4) 4) (= (y stone4) 4)) (and (= (x stone4) 7) (= (y stone4) 2)))
  ))

  
  

  
)
