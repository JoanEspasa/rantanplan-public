(define (problem instance_13_8_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 - stone
	player1 - player
  )

  (:init
    (= (max_x) 13)
	(= (min_x) 1)
	(= (max_y) 13)
	(= (min_y) 1)
	(= (x player1) 4)
	(= (y player1) 3)
	(= (x stone1) 4)
	(= (y stone1) 2)
	(= (x stone2) 6)
	(= (y stone2) 8)
	(= (x stone3) 12)
	(= (y stone3) 10)
	(= (x stone4) 11)
	(= (y stone4) 11)
	(= (x stone5) 8)
	(= (y stone5) 7)
	(= (x stone6) 3)
	(= (y stone6) 3)
	(= (x stone7) 12)
	(= (y stone7) 12)
	(= (x stone8) 5)
	(= (y stone8) 5)
  )

  (:goal (and 
    (or (and (= (x stone1) 6) (= (y stone1) 3)) (and (= (x stone1) 10) (= (y stone1) 11)) (and (= (x stone1) 6) (= (y stone1) 12)) (and (= (x stone1) 1) (= (y stone1) 13)) (and (= (x stone1) 4) (= (y stone1) 8)) (and (= (x stone1) 1) (= (y stone1) 10)) (and (= (x stone1) 7) (= (y stone1) 10)) (and (= (x stone1) 5) (= (y stone1) 9)))
	(or (and (= (x stone2) 6) (= (y stone2) 3)) (and (= (x stone2) 10) (= (y stone2) 11)) (and (= (x stone2) 6) (= (y stone2) 12)) (and (= (x stone2) 1) (= (y stone2) 13)) (and (= (x stone2) 4) (= (y stone2) 8)) (and (= (x stone2) 1) (= (y stone2) 10)) (and (= (x stone2) 7) (= (y stone2) 10)) (and (= (x stone2) 5) (= (y stone2) 9)))
	(or (and (= (x stone3) 6) (= (y stone3) 3)) (and (= (x stone3) 10) (= (y stone3) 11)) (and (= (x stone3) 6) (= (y stone3) 12)) (and (= (x stone3) 1) (= (y stone3) 13)) (and (= (x stone3) 4) (= (y stone3) 8)) (and (= (x stone3) 1) (= (y stone3) 10)) (and (= (x stone3) 7) (= (y stone3) 10)) (and (= (x stone3) 5) (= (y stone3) 9)))
	(or (and (= (x stone4) 6) (= (y stone4) 3)) (and (= (x stone4) 10) (= (y stone4) 11)) (and (= (x stone4) 6) (= (y stone4) 12)) (and (= (x stone4) 1) (= (y stone4) 13)) (and (= (x stone4) 4) (= (y stone4) 8)) (and (= (x stone4) 1) (= (y stone4) 10)) (and (= (x stone4) 7) (= (y stone4) 10)) (and (= (x stone4) 5) (= (y stone4) 9)))
	(or (and (= (x stone5) 6) (= (y stone5) 3)) (and (= (x stone5) 10) (= (y stone5) 11)) (and (= (x stone5) 6) (= (y stone5) 12)) (and (= (x stone5) 1) (= (y stone5) 13)) (and (= (x stone5) 4) (= (y stone5) 8)) (and (= (x stone5) 1) (= (y stone5) 10)) (and (= (x stone5) 7) (= (y stone5) 10)) (and (= (x stone5) 5) (= (y stone5) 9)))
	(or (and (= (x stone6) 6) (= (y stone6) 3)) (and (= (x stone6) 10) (= (y stone6) 11)) (and (= (x stone6) 6) (= (y stone6) 12)) (and (= (x stone6) 1) (= (y stone6) 13)) (and (= (x stone6) 4) (= (y stone6) 8)) (and (= (x stone6) 1) (= (y stone6) 10)) (and (= (x stone6) 7) (= (y stone6) 10)) (and (= (x stone6) 5) (= (y stone6) 9)))
	(or (and (= (x stone7) 6) (= (y stone7) 3)) (and (= (x stone7) 10) (= (y stone7) 11)) (and (= (x stone7) 6) (= (y stone7) 12)) (and (= (x stone7) 1) (= (y stone7) 13)) (and (= (x stone7) 4) (= (y stone7) 8)) (and (= (x stone7) 1) (= (y stone7) 10)) (and (= (x stone7) 7) (= (y stone7) 10)) (and (= (x stone7) 5) (= (y stone7) 9)))
	(or (and (= (x stone8) 6) (= (y stone8) 3)) (and (= (x stone8) 10) (= (y stone8) 11)) (and (= (x stone8) 6) (= (y stone8) 12)) (and (= (x stone8) 1) (= (y stone8) 13)) (and (= (x stone8) 4) (= (y stone8) 8)) (and (= (x stone8) 1) (= (y stone8) 10)) (and (= (x stone8) 7) (= (y stone8) 10)) (and (= (x stone8) 5) (= (y stone8) 9)))
  ))

  
  

  
)
