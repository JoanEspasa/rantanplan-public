(define (problem instance_15_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 15)
	(= (min_x) 1)
	(= (max_y) 15)
	(= (min_y) 1)
	(= (x player1) 15)
	(= (y player1) 8)
	(= (x stone1) 3)
	(= (y stone1) 2)
	(= (x stone2) 9)
	(= (y stone2) 3)
	(= (x stone3) 14)
	(= (y stone3) 13)
	(= (x stone4) 11)
	(= (y stone4) 2)
	(= (x stone5) 5)
	(= (y stone5) 2)
	(= (x stone6) 11)
	(= (y stone6) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 4) (= (y stone1) 9)) (and (= (x stone1) 7) (= (y stone1) 12)) (and (= (x stone1) 3) (= (y stone1) 10)) (and (= (x stone1) 6) (= (y stone1) 3)) (and (= (x stone1) 1) (= (y stone1) 9)) (and (= (x stone1) 14) (= (y stone1) 8)))
	(or (and (= (x stone2) 4) (= (y stone2) 9)) (and (= (x stone2) 7) (= (y stone2) 12)) (and (= (x stone2) 3) (= (y stone2) 10)) (and (= (x stone2) 6) (= (y stone2) 3)) (and (= (x stone2) 1) (= (y stone2) 9)) (and (= (x stone2) 14) (= (y stone2) 8)))
	(or (and (= (x stone3) 4) (= (y stone3) 9)) (and (= (x stone3) 7) (= (y stone3) 12)) (and (= (x stone3) 3) (= (y stone3) 10)) (and (= (x stone3) 6) (= (y stone3) 3)) (and (= (x stone3) 1) (= (y stone3) 9)) (and (= (x stone3) 14) (= (y stone3) 8)))
	(or (and (= (x stone4) 4) (= (y stone4) 9)) (and (= (x stone4) 7) (= (y stone4) 12)) (and (= (x stone4) 3) (= (y stone4) 10)) (and (= (x stone4) 6) (= (y stone4) 3)) (and (= (x stone4) 1) (= (y stone4) 9)) (and (= (x stone4) 14) (= (y stone4) 8)))
	(or (and (= (x stone5) 4) (= (y stone5) 9)) (and (= (x stone5) 7) (= (y stone5) 12)) (and (= (x stone5) 3) (= (y stone5) 10)) (and (= (x stone5) 6) (= (y stone5) 3)) (and (= (x stone5) 1) (= (y stone5) 9)) (and (= (x stone5) 14) (= (y stone5) 8)))
	(or (and (= (x stone6) 4) (= (y stone6) 9)) (and (= (x stone6) 7) (= (y stone6) 12)) (and (= (x stone6) 3) (= (y stone6) 10)) (and (= (x stone6) 6) (= (y stone6) 3)) (and (= (x stone6) 1) (= (y stone6) 9)) (and (= (x stone6) 14) (= (y stone6) 8)))
  ))

  
  

  
)
