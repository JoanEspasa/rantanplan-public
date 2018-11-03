(define (problem instance_15_8_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 - stone
	player1 - player
  )

  (:init
    (= (max_x) 15)
	(= (min_x) 1)
	(= (max_y) 15)
	(= (min_y) 1)
	(= (x player1) 13)
	(= (y player1) 15)
	(= (x stone1) 6)
	(= (y stone1) 3)
	(= (x stone2) 14)
	(= (y stone2) 7)
	(= (x stone3) 14)
	(= (y stone3) 14)
	(= (x stone4) 10)
	(= (y stone4) 5)
	(= (x stone5) 7)
	(= (y stone5) 11)
	(= (x stone6) 3)
	(= (y stone6) 5)
	(= (x stone7) 11)
	(= (y stone7) 12)
	(= (x stone8) 8)
	(= (y stone8) 6)
  )

  (:goal (and 
    (or (and (= (x stone1) 3) (= (y stone1) 14)) (and (= (x stone1) 1) (= (y stone1) 4)) (and (= (x stone1) 1) (= (y stone1) 8)) (and (= (x stone1) 4) (= (y stone1) 13)) (and (= (x stone1) 14) (= (y stone1) 4)) (and (= (x stone1) 4) (= (y stone1) 10)) (and (= (x stone1) 5) (= (y stone1) 4)) (and (= (x stone1) 2) (= (y stone1) 6)))
	(or (and (= (x stone2) 3) (= (y stone2) 14)) (and (= (x stone2) 1) (= (y stone2) 4)) (and (= (x stone2) 1) (= (y stone2) 8)) (and (= (x stone2) 4) (= (y stone2) 13)) (and (= (x stone2) 14) (= (y stone2) 4)) (and (= (x stone2) 4) (= (y stone2) 10)) (and (= (x stone2) 5) (= (y stone2) 4)) (and (= (x stone2) 2) (= (y stone2) 6)))
	(or (and (= (x stone3) 3) (= (y stone3) 14)) (and (= (x stone3) 1) (= (y stone3) 4)) (and (= (x stone3) 1) (= (y stone3) 8)) (and (= (x stone3) 4) (= (y stone3) 13)) (and (= (x stone3) 14) (= (y stone3) 4)) (and (= (x stone3) 4) (= (y stone3) 10)) (and (= (x stone3) 5) (= (y stone3) 4)) (and (= (x stone3) 2) (= (y stone3) 6)))
	(or (and (= (x stone4) 3) (= (y stone4) 14)) (and (= (x stone4) 1) (= (y stone4) 4)) (and (= (x stone4) 1) (= (y stone4) 8)) (and (= (x stone4) 4) (= (y stone4) 13)) (and (= (x stone4) 14) (= (y stone4) 4)) (and (= (x stone4) 4) (= (y stone4) 10)) (and (= (x stone4) 5) (= (y stone4) 4)) (and (= (x stone4) 2) (= (y stone4) 6)))
	(or (and (= (x stone5) 3) (= (y stone5) 14)) (and (= (x stone5) 1) (= (y stone5) 4)) (and (= (x stone5) 1) (= (y stone5) 8)) (and (= (x stone5) 4) (= (y stone5) 13)) (and (= (x stone5) 14) (= (y stone5) 4)) (and (= (x stone5) 4) (= (y stone5) 10)) (and (= (x stone5) 5) (= (y stone5) 4)) (and (= (x stone5) 2) (= (y stone5) 6)))
	(or (and (= (x stone6) 3) (= (y stone6) 14)) (and (= (x stone6) 1) (= (y stone6) 4)) (and (= (x stone6) 1) (= (y stone6) 8)) (and (= (x stone6) 4) (= (y stone6) 13)) (and (= (x stone6) 14) (= (y stone6) 4)) (and (= (x stone6) 4) (= (y stone6) 10)) (and (= (x stone6) 5) (= (y stone6) 4)) (and (= (x stone6) 2) (= (y stone6) 6)))
	(or (and (= (x stone7) 3) (= (y stone7) 14)) (and (= (x stone7) 1) (= (y stone7) 4)) (and (= (x stone7) 1) (= (y stone7) 8)) (and (= (x stone7) 4) (= (y stone7) 13)) (and (= (x stone7) 14) (= (y stone7) 4)) (and (= (x stone7) 4) (= (y stone7) 10)) (and (= (x stone7) 5) (= (y stone7) 4)) (and (= (x stone7) 2) (= (y stone7) 6)))
	(or (and (= (x stone8) 3) (= (y stone8) 14)) (and (= (x stone8) 1) (= (y stone8) 4)) (and (= (x stone8) 1) (= (y stone8) 8)) (and (= (x stone8) 4) (= (y stone8) 13)) (and (= (x stone8) 14) (= (y stone8) 4)) (and (= (x stone8) 4) (= (y stone8) 10)) (and (= (x stone8) 5) (= (y stone8) 4)) (and (= (x stone8) 2) (= (y stone8) 6)))
  ))

  
  

  
)
