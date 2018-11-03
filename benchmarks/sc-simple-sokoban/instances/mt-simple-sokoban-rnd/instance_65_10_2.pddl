(define (problem instance_65_10_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 65)
	(= (min_x) 1)
	(= (max_y) 65)
	(= (min_y) 1)
	(= (x player1) 29)
	(= (y player1) 34)
	(= (x stone1) 24)
	(= (y stone1) 4)
	(= (x stone2) 45)
	(= (y stone2) 9)
	(= (x stone3) 14)
	(= (y stone3) 43)
	(= (x stone4) 39)
	(= (y stone4) 38)
	(= (x stone5) 9)
	(= (y stone5) 7)
	(= (x stone6) 59)
	(= (y stone6) 63)
	(= (x stone7) 50)
	(= (y stone7) 43)
	(= (x stone8) 61)
	(= (y stone8) 22)
	(= (x stone9) 22)
	(= (y stone9) 21)
	(= (x stone10) 20)
	(= (y stone10) 51)
  )

  (:goal (and 
    (or (and (= (x stone1) 51) (= (y stone1) 15)) (and (= (x stone1) 46) (= (y stone1) 41)) (and (= (x stone1) 63) (= (y stone1) 6)) (and (= (x stone1) 3) (= (y stone1) 19)) (and (= (x stone1) 5) (= (y stone1) 60)) (and (= (x stone1) 62) (= (y stone1) 46)) (and (= (x stone1) 58) (= (y stone1) 64)) (and (= (x stone1) 17) (= (y stone1) 57)) (and (= (x stone1) 22) (= (y stone1) 55)) (and (= (x stone1) 61) (= (y stone1) 37)))
	(or (and (= (x stone2) 51) (= (y stone2) 15)) (and (= (x stone2) 46) (= (y stone2) 41)) (and (= (x stone2) 63) (= (y stone2) 6)) (and (= (x stone2) 3) (= (y stone2) 19)) (and (= (x stone2) 5) (= (y stone2) 60)) (and (= (x stone2) 62) (= (y stone2) 46)) (and (= (x stone2) 58) (= (y stone2) 64)) (and (= (x stone2) 17) (= (y stone2) 57)) (and (= (x stone2) 22) (= (y stone2) 55)) (and (= (x stone2) 61) (= (y stone2) 37)))
	(or (and (= (x stone3) 51) (= (y stone3) 15)) (and (= (x stone3) 46) (= (y stone3) 41)) (and (= (x stone3) 63) (= (y stone3) 6)) (and (= (x stone3) 3) (= (y stone3) 19)) (and (= (x stone3) 5) (= (y stone3) 60)) (and (= (x stone3) 62) (= (y stone3) 46)) (and (= (x stone3) 58) (= (y stone3) 64)) (and (= (x stone3) 17) (= (y stone3) 57)) (and (= (x stone3) 22) (= (y stone3) 55)) (and (= (x stone3) 61) (= (y stone3) 37)))
	(or (and (= (x stone4) 51) (= (y stone4) 15)) (and (= (x stone4) 46) (= (y stone4) 41)) (and (= (x stone4) 63) (= (y stone4) 6)) (and (= (x stone4) 3) (= (y stone4) 19)) (and (= (x stone4) 5) (= (y stone4) 60)) (and (= (x stone4) 62) (= (y stone4) 46)) (and (= (x stone4) 58) (= (y stone4) 64)) (and (= (x stone4) 17) (= (y stone4) 57)) (and (= (x stone4) 22) (= (y stone4) 55)) (and (= (x stone4) 61) (= (y stone4) 37)))
	(or (and (= (x stone5) 51) (= (y stone5) 15)) (and (= (x stone5) 46) (= (y stone5) 41)) (and (= (x stone5) 63) (= (y stone5) 6)) (and (= (x stone5) 3) (= (y stone5) 19)) (and (= (x stone5) 5) (= (y stone5) 60)) (and (= (x stone5) 62) (= (y stone5) 46)) (and (= (x stone5) 58) (= (y stone5) 64)) (and (= (x stone5) 17) (= (y stone5) 57)) (and (= (x stone5) 22) (= (y stone5) 55)) (and (= (x stone5) 61) (= (y stone5) 37)))
	(or (and (= (x stone6) 51) (= (y stone6) 15)) (and (= (x stone6) 46) (= (y stone6) 41)) (and (= (x stone6) 63) (= (y stone6) 6)) (and (= (x stone6) 3) (= (y stone6) 19)) (and (= (x stone6) 5) (= (y stone6) 60)) (and (= (x stone6) 62) (= (y stone6) 46)) (and (= (x stone6) 58) (= (y stone6) 64)) (and (= (x stone6) 17) (= (y stone6) 57)) (and (= (x stone6) 22) (= (y stone6) 55)) (and (= (x stone6) 61) (= (y stone6) 37)))
	(or (and (= (x stone7) 51) (= (y stone7) 15)) (and (= (x stone7) 46) (= (y stone7) 41)) (and (= (x stone7) 63) (= (y stone7) 6)) (and (= (x stone7) 3) (= (y stone7) 19)) (and (= (x stone7) 5) (= (y stone7) 60)) (and (= (x stone7) 62) (= (y stone7) 46)) (and (= (x stone7) 58) (= (y stone7) 64)) (and (= (x stone7) 17) (= (y stone7) 57)) (and (= (x stone7) 22) (= (y stone7) 55)) (and (= (x stone7) 61) (= (y stone7) 37)))
	(or (and (= (x stone8) 51) (= (y stone8) 15)) (and (= (x stone8) 46) (= (y stone8) 41)) (and (= (x stone8) 63) (= (y stone8) 6)) (and (= (x stone8) 3) (= (y stone8) 19)) (and (= (x stone8) 5) (= (y stone8) 60)) (and (= (x stone8) 62) (= (y stone8) 46)) (and (= (x stone8) 58) (= (y stone8) 64)) (and (= (x stone8) 17) (= (y stone8) 57)) (and (= (x stone8) 22) (= (y stone8) 55)) (and (= (x stone8) 61) (= (y stone8) 37)))
	(or (and (= (x stone9) 51) (= (y stone9) 15)) (and (= (x stone9) 46) (= (y stone9) 41)) (and (= (x stone9) 63) (= (y stone9) 6)) (and (= (x stone9) 3) (= (y stone9) 19)) (and (= (x stone9) 5) (= (y stone9) 60)) (and (= (x stone9) 62) (= (y stone9) 46)) (and (= (x stone9) 58) (= (y stone9) 64)) (and (= (x stone9) 17) (= (y stone9) 57)) (and (= (x stone9) 22) (= (y stone9) 55)) (and (= (x stone9) 61) (= (y stone9) 37)))
	(or (and (= (x stone10) 51) (= (y stone10) 15)) (and (= (x stone10) 46) (= (y stone10) 41)) (and (= (x stone10) 63) (= (y stone10) 6)) (and (= (x stone10) 3) (= (y stone10) 19)) (and (= (x stone10) 5) (= (y stone10) 60)) (and (= (x stone10) 62) (= (y stone10) 46)) (and (= (x stone10) 58) (= (y stone10) 64)) (and (= (x stone10) 17) (= (y stone10) 57)) (and (= (x stone10) 22) (= (y stone10) 55)) (and (= (x stone10) 61) (= (y stone10) 37)))
  ))

  
  

  
)
