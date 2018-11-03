(define (problem instance_13_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 13)
	(= (min_x) 1)
	(= (max_y) 13)
	(= (min_y) 1)
	(= (x player1) 12)
	(= (y player1) 10)
	(= (x stone1) 11)
	(= (y stone1) 12)
	(= (x stone2) 8)
	(= (y stone2) 11)
	(= (x stone3) 4)
	(= (y stone3) 4)
	(= (x stone4) 2)
	(= (y stone4) 6)
	(= (x stone5) 3)
	(= (y stone5) 10)
	(= (x stone6) 8)
	(= (y stone6) 5)
  )

  (:goal (and 
    (or (and (= (x stone1) 8) (= (y stone1) 1)) (and (= (x stone1) 12) (= (y stone1) 3)) (and (= (x stone1) 5) (= (y stone1) 12)) (and (= (x stone1) 3) (= (y stone1) 2)) (and (= (x stone1) 2) (= (y stone1) 8)) (and (= (x stone1) 5) (= (y stone1) 7)))
	(or (and (= (x stone2) 8) (= (y stone2) 1)) (and (= (x stone2) 12) (= (y stone2) 3)) (and (= (x stone2) 5) (= (y stone2) 12)) (and (= (x stone2) 3) (= (y stone2) 2)) (and (= (x stone2) 2) (= (y stone2) 8)) (and (= (x stone2) 5) (= (y stone2) 7)))
	(or (and (= (x stone3) 8) (= (y stone3) 1)) (and (= (x stone3) 12) (= (y stone3) 3)) (and (= (x stone3) 5) (= (y stone3) 12)) (and (= (x stone3) 3) (= (y stone3) 2)) (and (= (x stone3) 2) (= (y stone3) 8)) (and (= (x stone3) 5) (= (y stone3) 7)))
	(or (and (= (x stone4) 8) (= (y stone4) 1)) (and (= (x stone4) 12) (= (y stone4) 3)) (and (= (x stone4) 5) (= (y stone4) 12)) (and (= (x stone4) 3) (= (y stone4) 2)) (and (= (x stone4) 2) (= (y stone4) 8)) (and (= (x stone4) 5) (= (y stone4) 7)))
	(or (and (= (x stone5) 8) (= (y stone5) 1)) (and (= (x stone5) 12) (= (y stone5) 3)) (and (= (x stone5) 5) (= (y stone5) 12)) (and (= (x stone5) 3) (= (y stone5) 2)) (and (= (x stone5) 2) (= (y stone5) 8)) (and (= (x stone5) 5) (= (y stone5) 7)))
	(or (and (= (x stone6) 8) (= (y stone6) 1)) (and (= (x stone6) 12) (= (y stone6) 3)) (and (= (x stone6) 5) (= (y stone6) 12)) (and (= (x stone6) 3) (= (y stone6) 2)) (and (= (x stone6) 2) (= (y stone6) 8)) (and (= (x stone6) 5) (= (y stone6) 7)))
  ))

  
  

  
)
