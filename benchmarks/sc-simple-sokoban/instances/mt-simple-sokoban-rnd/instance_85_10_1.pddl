(define (problem instance_85_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 85)
	(= (min_x) 1)
	(= (max_y) 85)
	(= (min_y) 1)
	(= (x player1) 20)
	(= (y player1) 29)
	(= (x stone1) 39)
	(= (y stone1) 42)
	(= (x stone2) 81)
	(= (y stone2) 36)
	(= (x stone3) 71)
	(= (y stone3) 7)
	(= (x stone4) 40)
	(= (y stone4) 41)
	(= (x stone5) 13)
	(= (y stone5) 23)
	(= (x stone6) 22)
	(= (y stone6) 73)
	(= (x stone7) 65)
	(= (y stone7) 7)
	(= (x stone8) 48)
	(= (y stone8) 32)
	(= (x stone9) 83)
	(= (y stone9) 29)
	(= (x stone10) 82)
	(= (y stone10) 56)
  )

  (:goal (and 
    (or (and (= (x stone1) 40) (= (y stone1) 70)) (and (= (x stone1) 57) (= (y stone1) 3)) (and (= (x stone1) 9) (= (y stone1) 1)) (and (= (x stone1) 32) (= (y stone1) 81)) (and (= (x stone1) 24) (= (y stone1) 62)) (and (= (x stone1) 14) (= (y stone1) 40)) (and (= (x stone1) 59) (= (y stone1) 6)) (and (= (x stone1) 75) (= (y stone1) 70)) (and (= (x stone1) 63) (= (y stone1) 35)) (and (= (x stone1) 39) (= (y stone1) 56)))
	(or (and (= (x stone2) 40) (= (y stone2) 70)) (and (= (x stone2) 57) (= (y stone2) 3)) (and (= (x stone2) 9) (= (y stone2) 1)) (and (= (x stone2) 32) (= (y stone2) 81)) (and (= (x stone2) 24) (= (y stone2) 62)) (and (= (x stone2) 14) (= (y stone2) 40)) (and (= (x stone2) 59) (= (y stone2) 6)) (and (= (x stone2) 75) (= (y stone2) 70)) (and (= (x stone2) 63) (= (y stone2) 35)) (and (= (x stone2) 39) (= (y stone2) 56)))
	(or (and (= (x stone3) 40) (= (y stone3) 70)) (and (= (x stone3) 57) (= (y stone3) 3)) (and (= (x stone3) 9) (= (y stone3) 1)) (and (= (x stone3) 32) (= (y stone3) 81)) (and (= (x stone3) 24) (= (y stone3) 62)) (and (= (x stone3) 14) (= (y stone3) 40)) (and (= (x stone3) 59) (= (y stone3) 6)) (and (= (x stone3) 75) (= (y stone3) 70)) (and (= (x stone3) 63) (= (y stone3) 35)) (and (= (x stone3) 39) (= (y stone3) 56)))
	(or (and (= (x stone4) 40) (= (y stone4) 70)) (and (= (x stone4) 57) (= (y stone4) 3)) (and (= (x stone4) 9) (= (y stone4) 1)) (and (= (x stone4) 32) (= (y stone4) 81)) (and (= (x stone4) 24) (= (y stone4) 62)) (and (= (x stone4) 14) (= (y stone4) 40)) (and (= (x stone4) 59) (= (y stone4) 6)) (and (= (x stone4) 75) (= (y stone4) 70)) (and (= (x stone4) 63) (= (y stone4) 35)) (and (= (x stone4) 39) (= (y stone4) 56)))
	(or (and (= (x stone5) 40) (= (y stone5) 70)) (and (= (x stone5) 57) (= (y stone5) 3)) (and (= (x stone5) 9) (= (y stone5) 1)) (and (= (x stone5) 32) (= (y stone5) 81)) (and (= (x stone5) 24) (= (y stone5) 62)) (and (= (x stone5) 14) (= (y stone5) 40)) (and (= (x stone5) 59) (= (y stone5) 6)) (and (= (x stone5) 75) (= (y stone5) 70)) (and (= (x stone5) 63) (= (y stone5) 35)) (and (= (x stone5) 39) (= (y stone5) 56)))
	(or (and (= (x stone6) 40) (= (y stone6) 70)) (and (= (x stone6) 57) (= (y stone6) 3)) (and (= (x stone6) 9) (= (y stone6) 1)) (and (= (x stone6) 32) (= (y stone6) 81)) (and (= (x stone6) 24) (= (y stone6) 62)) (and (= (x stone6) 14) (= (y stone6) 40)) (and (= (x stone6) 59) (= (y stone6) 6)) (and (= (x stone6) 75) (= (y stone6) 70)) (and (= (x stone6) 63) (= (y stone6) 35)) (and (= (x stone6) 39) (= (y stone6) 56)))
	(or (and (= (x stone7) 40) (= (y stone7) 70)) (and (= (x stone7) 57) (= (y stone7) 3)) (and (= (x stone7) 9) (= (y stone7) 1)) (and (= (x stone7) 32) (= (y stone7) 81)) (and (= (x stone7) 24) (= (y stone7) 62)) (and (= (x stone7) 14) (= (y stone7) 40)) (and (= (x stone7) 59) (= (y stone7) 6)) (and (= (x stone7) 75) (= (y stone7) 70)) (and (= (x stone7) 63) (= (y stone7) 35)) (and (= (x stone7) 39) (= (y stone7) 56)))
	(or (and (= (x stone8) 40) (= (y stone8) 70)) (and (= (x stone8) 57) (= (y stone8) 3)) (and (= (x stone8) 9) (= (y stone8) 1)) (and (= (x stone8) 32) (= (y stone8) 81)) (and (= (x stone8) 24) (= (y stone8) 62)) (and (= (x stone8) 14) (= (y stone8) 40)) (and (= (x stone8) 59) (= (y stone8) 6)) (and (= (x stone8) 75) (= (y stone8) 70)) (and (= (x stone8) 63) (= (y stone8) 35)) (and (= (x stone8) 39) (= (y stone8) 56)))
	(or (and (= (x stone9) 40) (= (y stone9) 70)) (and (= (x stone9) 57) (= (y stone9) 3)) (and (= (x stone9) 9) (= (y stone9) 1)) (and (= (x stone9) 32) (= (y stone9) 81)) (and (= (x stone9) 24) (= (y stone9) 62)) (and (= (x stone9) 14) (= (y stone9) 40)) (and (= (x stone9) 59) (= (y stone9) 6)) (and (= (x stone9) 75) (= (y stone9) 70)) (and (= (x stone9) 63) (= (y stone9) 35)) (and (= (x stone9) 39) (= (y stone9) 56)))
	(or (and (= (x stone10) 40) (= (y stone10) 70)) (and (= (x stone10) 57) (= (y stone10) 3)) (and (= (x stone10) 9) (= (y stone10) 1)) (and (= (x stone10) 32) (= (y stone10) 81)) (and (= (x stone10) 24) (= (y stone10) 62)) (and (= (x stone10) 14) (= (y stone10) 40)) (and (= (x stone10) 59) (= (y stone10) 6)) (and (= (x stone10) 75) (= (y stone10) 70)) (and (= (x stone10) 63) (= (y stone10) 35)) (and (= (x stone10) 39) (= (y stone10) 56)))
  ))

  
  

  
)
