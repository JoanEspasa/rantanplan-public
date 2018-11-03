(define (problem instance_75_10_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 75)
	(= (min_x) 1)
	(= (max_y) 75)
	(= (min_y) 1)
	(= (x player1) 55)
	(= (y player1) 20)
	(= (x stone1) 12)
	(= (y stone1) 45)
	(= (x stone2) 62)
	(= (y stone2) 58)
	(= (x stone3) 39)
	(= (y stone3) 64)
	(= (x stone4) 61)
	(= (y stone4) 63)
	(= (x stone5) 13)
	(= (y stone5) 11)
	(= (x stone6) 63)
	(= (y stone6) 57)
	(= (x stone7) 6)
	(= (y stone7) 26)
	(= (x stone8) 37)
	(= (y stone8) 61)
	(= (x stone9) 15)
	(= (y stone9) 15)
	(= (x stone10) 66)
	(= (y stone10) 31)
  )

  (:goal (and 
    (or (and (= (x stone1) 7) (= (y stone1) 36)) (and (= (x stone1) 35) (= (y stone1) 9)) (and (= (x stone1) 38) (= (y stone1) 3)) (and (= (x stone1) 1) (= (y stone1) 33)) (and (= (x stone1) 8) (= (y stone1) 22)) (and (= (x stone1) 72) (= (y stone1) 33)) (and (= (x stone1) 55) (= (y stone1) 14)) (and (= (x stone1) 14) (= (y stone1) 58)) (and (= (x stone1) 29) (= (y stone1) 15)) (and (= (x stone1) 24) (= (y stone1) 62)))
	(or (and (= (x stone2) 7) (= (y stone2) 36)) (and (= (x stone2) 35) (= (y stone2) 9)) (and (= (x stone2) 38) (= (y stone2) 3)) (and (= (x stone2) 1) (= (y stone2) 33)) (and (= (x stone2) 8) (= (y stone2) 22)) (and (= (x stone2) 72) (= (y stone2) 33)) (and (= (x stone2) 55) (= (y stone2) 14)) (and (= (x stone2) 14) (= (y stone2) 58)) (and (= (x stone2) 29) (= (y stone2) 15)) (and (= (x stone2) 24) (= (y stone2) 62)))
	(or (and (= (x stone3) 7) (= (y stone3) 36)) (and (= (x stone3) 35) (= (y stone3) 9)) (and (= (x stone3) 38) (= (y stone3) 3)) (and (= (x stone3) 1) (= (y stone3) 33)) (and (= (x stone3) 8) (= (y stone3) 22)) (and (= (x stone3) 72) (= (y stone3) 33)) (and (= (x stone3) 55) (= (y stone3) 14)) (and (= (x stone3) 14) (= (y stone3) 58)) (and (= (x stone3) 29) (= (y stone3) 15)) (and (= (x stone3) 24) (= (y stone3) 62)))
	(or (and (= (x stone4) 7) (= (y stone4) 36)) (and (= (x stone4) 35) (= (y stone4) 9)) (and (= (x stone4) 38) (= (y stone4) 3)) (and (= (x stone4) 1) (= (y stone4) 33)) (and (= (x stone4) 8) (= (y stone4) 22)) (and (= (x stone4) 72) (= (y stone4) 33)) (and (= (x stone4) 55) (= (y stone4) 14)) (and (= (x stone4) 14) (= (y stone4) 58)) (and (= (x stone4) 29) (= (y stone4) 15)) (and (= (x stone4) 24) (= (y stone4) 62)))
	(or (and (= (x stone5) 7) (= (y stone5) 36)) (and (= (x stone5) 35) (= (y stone5) 9)) (and (= (x stone5) 38) (= (y stone5) 3)) (and (= (x stone5) 1) (= (y stone5) 33)) (and (= (x stone5) 8) (= (y stone5) 22)) (and (= (x stone5) 72) (= (y stone5) 33)) (and (= (x stone5) 55) (= (y stone5) 14)) (and (= (x stone5) 14) (= (y stone5) 58)) (and (= (x stone5) 29) (= (y stone5) 15)) (and (= (x stone5) 24) (= (y stone5) 62)))
	(or (and (= (x stone6) 7) (= (y stone6) 36)) (and (= (x stone6) 35) (= (y stone6) 9)) (and (= (x stone6) 38) (= (y stone6) 3)) (and (= (x stone6) 1) (= (y stone6) 33)) (and (= (x stone6) 8) (= (y stone6) 22)) (and (= (x stone6) 72) (= (y stone6) 33)) (and (= (x stone6) 55) (= (y stone6) 14)) (and (= (x stone6) 14) (= (y stone6) 58)) (and (= (x stone6) 29) (= (y stone6) 15)) (and (= (x stone6) 24) (= (y stone6) 62)))
	(or (and (= (x stone7) 7) (= (y stone7) 36)) (and (= (x stone7) 35) (= (y stone7) 9)) (and (= (x stone7) 38) (= (y stone7) 3)) (and (= (x stone7) 1) (= (y stone7) 33)) (and (= (x stone7) 8) (= (y stone7) 22)) (and (= (x stone7) 72) (= (y stone7) 33)) (and (= (x stone7) 55) (= (y stone7) 14)) (and (= (x stone7) 14) (= (y stone7) 58)) (and (= (x stone7) 29) (= (y stone7) 15)) (and (= (x stone7) 24) (= (y stone7) 62)))
	(or (and (= (x stone8) 7) (= (y stone8) 36)) (and (= (x stone8) 35) (= (y stone8) 9)) (and (= (x stone8) 38) (= (y stone8) 3)) (and (= (x stone8) 1) (= (y stone8) 33)) (and (= (x stone8) 8) (= (y stone8) 22)) (and (= (x stone8) 72) (= (y stone8) 33)) (and (= (x stone8) 55) (= (y stone8) 14)) (and (= (x stone8) 14) (= (y stone8) 58)) (and (= (x stone8) 29) (= (y stone8) 15)) (and (= (x stone8) 24) (= (y stone8) 62)))
	(or (and (= (x stone9) 7) (= (y stone9) 36)) (and (= (x stone9) 35) (= (y stone9) 9)) (and (= (x stone9) 38) (= (y stone9) 3)) (and (= (x stone9) 1) (= (y stone9) 33)) (and (= (x stone9) 8) (= (y stone9) 22)) (and (= (x stone9) 72) (= (y stone9) 33)) (and (= (x stone9) 55) (= (y stone9) 14)) (and (= (x stone9) 14) (= (y stone9) 58)) (and (= (x stone9) 29) (= (y stone9) 15)) (and (= (x stone9) 24) (= (y stone9) 62)))
	(or (and (= (x stone10) 7) (= (y stone10) 36)) (and (= (x stone10) 35) (= (y stone10) 9)) (and (= (x stone10) 38) (= (y stone10) 3)) (and (= (x stone10) 1) (= (y stone10) 33)) (and (= (x stone10) 8) (= (y stone10) 22)) (and (= (x stone10) 72) (= (y stone10) 33)) (and (= (x stone10) 55) (= (y stone10) 14)) (and (= (x stone10) 14) (= (y stone10) 58)) (and (= (x stone10) 29) (= (y stone10) 15)) (and (= (x stone10) 24) (= (y stone10) 62)))
  ))

  
  

  
)
