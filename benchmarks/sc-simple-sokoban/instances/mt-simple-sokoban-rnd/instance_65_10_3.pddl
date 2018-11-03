(define (problem instance_65_10_3)
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
	(= (x player1) 32)
	(= (y player1) 43)
	(= (x stone1) 59)
	(= (y stone1) 59)
	(= (x stone2) 6)
	(= (y stone2) 58)
	(= (x stone3) 60)
	(= (y stone3) 64)
	(= (x stone4) 50)
	(= (y stone4) 4)
	(= (x stone5) 27)
	(= (y stone5) 5)
	(= (x stone6) 64)
	(= (y stone6) 24)
	(= (x stone7) 64)
	(= (y stone7) 14)
	(= (x stone8) 38)
	(= (y stone8) 49)
	(= (x stone9) 60)
	(= (y stone9) 54)
	(= (x stone10) 34)
	(= (y stone10) 55)
  )

  (:goal (and 
    (or (and (= (x stone1) 5) (= (y stone1) 46)) (and (= (x stone1) 64) (= (y stone1) 22)) (and (= (x stone1) 28) (= (y stone1) 29)) (and (= (x stone1) 22) (= (y stone1) 56)) (and (= (x stone1) 1) (= (y stone1) 47)) (and (= (x stone1) 32) (= (y stone1) 60)) (and (= (x stone1) 51) (= (y stone1) 20)) (and (= (x stone1) 23) (= (y stone1) 16)) (and (= (x stone1) 65) (= (y stone1) 28)) (and (= (x stone1) 32) (= (y stone1) 18)))
	(or (and (= (x stone2) 5) (= (y stone2) 46)) (and (= (x stone2) 64) (= (y stone2) 22)) (and (= (x stone2) 28) (= (y stone2) 29)) (and (= (x stone2) 22) (= (y stone2) 56)) (and (= (x stone2) 1) (= (y stone2) 47)) (and (= (x stone2) 32) (= (y stone2) 60)) (and (= (x stone2) 51) (= (y stone2) 20)) (and (= (x stone2) 23) (= (y stone2) 16)) (and (= (x stone2) 65) (= (y stone2) 28)) (and (= (x stone2) 32) (= (y stone2) 18)))
	(or (and (= (x stone3) 5) (= (y stone3) 46)) (and (= (x stone3) 64) (= (y stone3) 22)) (and (= (x stone3) 28) (= (y stone3) 29)) (and (= (x stone3) 22) (= (y stone3) 56)) (and (= (x stone3) 1) (= (y stone3) 47)) (and (= (x stone3) 32) (= (y stone3) 60)) (and (= (x stone3) 51) (= (y stone3) 20)) (and (= (x stone3) 23) (= (y stone3) 16)) (and (= (x stone3) 65) (= (y stone3) 28)) (and (= (x stone3) 32) (= (y stone3) 18)))
	(or (and (= (x stone4) 5) (= (y stone4) 46)) (and (= (x stone4) 64) (= (y stone4) 22)) (and (= (x stone4) 28) (= (y stone4) 29)) (and (= (x stone4) 22) (= (y stone4) 56)) (and (= (x stone4) 1) (= (y stone4) 47)) (and (= (x stone4) 32) (= (y stone4) 60)) (and (= (x stone4) 51) (= (y stone4) 20)) (and (= (x stone4) 23) (= (y stone4) 16)) (and (= (x stone4) 65) (= (y stone4) 28)) (and (= (x stone4) 32) (= (y stone4) 18)))
	(or (and (= (x stone5) 5) (= (y stone5) 46)) (and (= (x stone5) 64) (= (y stone5) 22)) (and (= (x stone5) 28) (= (y stone5) 29)) (and (= (x stone5) 22) (= (y stone5) 56)) (and (= (x stone5) 1) (= (y stone5) 47)) (and (= (x stone5) 32) (= (y stone5) 60)) (and (= (x stone5) 51) (= (y stone5) 20)) (and (= (x stone5) 23) (= (y stone5) 16)) (and (= (x stone5) 65) (= (y stone5) 28)) (and (= (x stone5) 32) (= (y stone5) 18)))
	(or (and (= (x stone6) 5) (= (y stone6) 46)) (and (= (x stone6) 64) (= (y stone6) 22)) (and (= (x stone6) 28) (= (y stone6) 29)) (and (= (x stone6) 22) (= (y stone6) 56)) (and (= (x stone6) 1) (= (y stone6) 47)) (and (= (x stone6) 32) (= (y stone6) 60)) (and (= (x stone6) 51) (= (y stone6) 20)) (and (= (x stone6) 23) (= (y stone6) 16)) (and (= (x stone6) 65) (= (y stone6) 28)) (and (= (x stone6) 32) (= (y stone6) 18)))
	(or (and (= (x stone7) 5) (= (y stone7) 46)) (and (= (x stone7) 64) (= (y stone7) 22)) (and (= (x stone7) 28) (= (y stone7) 29)) (and (= (x stone7) 22) (= (y stone7) 56)) (and (= (x stone7) 1) (= (y stone7) 47)) (and (= (x stone7) 32) (= (y stone7) 60)) (and (= (x stone7) 51) (= (y stone7) 20)) (and (= (x stone7) 23) (= (y stone7) 16)) (and (= (x stone7) 65) (= (y stone7) 28)) (and (= (x stone7) 32) (= (y stone7) 18)))
	(or (and (= (x stone8) 5) (= (y stone8) 46)) (and (= (x stone8) 64) (= (y stone8) 22)) (and (= (x stone8) 28) (= (y stone8) 29)) (and (= (x stone8) 22) (= (y stone8) 56)) (and (= (x stone8) 1) (= (y stone8) 47)) (and (= (x stone8) 32) (= (y stone8) 60)) (and (= (x stone8) 51) (= (y stone8) 20)) (and (= (x stone8) 23) (= (y stone8) 16)) (and (= (x stone8) 65) (= (y stone8) 28)) (and (= (x stone8) 32) (= (y stone8) 18)))
	(or (and (= (x stone9) 5) (= (y stone9) 46)) (and (= (x stone9) 64) (= (y stone9) 22)) (and (= (x stone9) 28) (= (y stone9) 29)) (and (= (x stone9) 22) (= (y stone9) 56)) (and (= (x stone9) 1) (= (y stone9) 47)) (and (= (x stone9) 32) (= (y stone9) 60)) (and (= (x stone9) 51) (= (y stone9) 20)) (and (= (x stone9) 23) (= (y stone9) 16)) (and (= (x stone9) 65) (= (y stone9) 28)) (and (= (x stone9) 32) (= (y stone9) 18)))
	(or (and (= (x stone10) 5) (= (y stone10) 46)) (and (= (x stone10) 64) (= (y stone10) 22)) (and (= (x stone10) 28) (= (y stone10) 29)) (and (= (x stone10) 22) (= (y stone10) 56)) (and (= (x stone10) 1) (= (y stone10) 47)) (and (= (x stone10) 32) (= (y stone10) 60)) (and (= (x stone10) 51) (= (y stone10) 20)) (and (= (x stone10) 23) (= (y stone10) 16)) (and (= (x stone10) 65) (= (y stone10) 28)) (and (= (x stone10) 32) (= (y stone10) 18)))
  ))

  
  

  
)
