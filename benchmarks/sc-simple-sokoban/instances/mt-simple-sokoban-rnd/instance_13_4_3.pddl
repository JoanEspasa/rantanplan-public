(define (problem instance_13_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 13)
	(= (min_x) 1)
	(= (max_y) 13)
	(= (min_y) 1)
	(= (x player1) 13)
	(= (y player1) 12)
	(= (x stone1) 6)
	(= (y stone1) 2)
	(= (x stone2) 12)
	(= (y stone2) 8)
	(= (x stone3) 11)
	(= (y stone3) 10)
	(= (x stone4) 7)
	(= (y stone4) 6)
  )

  (:goal (and 
    (or (and (= (x stone1) 12) (= (y stone1) 7)) (and (= (x stone1) 7) (= (y stone1) 3)) (and (= (x stone1) 3) (= (y stone1) 1)) (and (= (x stone1) 1) (= (y stone1) 2)))
	(or (and (= (x stone2) 12) (= (y stone2) 7)) (and (= (x stone2) 7) (= (y stone2) 3)) (and (= (x stone2) 3) (= (y stone2) 1)) (and (= (x stone2) 1) (= (y stone2) 2)))
	(or (and (= (x stone3) 12) (= (y stone3) 7)) (and (= (x stone3) 7) (= (y stone3) 3)) (and (= (x stone3) 3) (= (y stone3) 1)) (and (= (x stone3) 1) (= (y stone3) 2)))
	(or (and (= (x stone4) 12) (= (y stone4) 7)) (and (= (x stone4) 7) (= (y stone4) 3)) (and (= (x stone4) 3) (= (y stone4) 1)) (and (= (x stone4) 1) (= (y stone4) 2)))
  ))

  
  

  
)
