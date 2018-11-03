(define (problem instance_40_10_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 40)
	(= (min_x) 1)
	(= (max_y) 40)
	(= (min_y) 1)
	(= (x player1) 31)
	(= (y player1) 33)
	(= (x stone1) 10)
	(= (y stone1) 20)
	(= (x stone2) 21)
	(= (y stone2) 27)
	(= (x stone3) 29)
	(= (y stone3) 33)
	(= (x stone4) 2)
	(= (y stone4) 22)
	(= (x stone5) 31)
	(= (y stone5) 37)
	(= (x stone6) 38)
	(= (y stone6) 29)
	(= (x stone7) 14)
	(= (y stone7) 24)
	(= (x stone8) 31)
	(= (y stone8) 11)
	(= (x stone9) 27)
	(= (y stone9) 25)
	(= (x stone10) 14)
	(= (y stone10) 35)
  )

  (:goal (and 
    (or (and (= (x stone1) 34) (= (y stone1) 31)) (and (= (x stone1) 40) (= (y stone1) 16)) (and (= (x stone1) 23) (= (y stone1) 5)) (and (= (x stone1) 32) (= (y stone1) 36)) (and (= (x stone1) 6) (= (y stone1) 36)) (and (= (x stone1) 10) (= (y stone1) 13)) (and (= (x stone1) 26) (= (y stone1) 6)) (and (= (x stone1) 14) (= (y stone1) 31)) (and (= (x stone1) 12) (= (y stone1) 27)) (and (= (x stone1) 12) (= (y stone1) 40)))
	(or (and (= (x stone2) 34) (= (y stone2) 31)) (and (= (x stone2) 40) (= (y stone2) 16)) (and (= (x stone2) 23) (= (y stone2) 5)) (and (= (x stone2) 32) (= (y stone2) 36)) (and (= (x stone2) 6) (= (y stone2) 36)) (and (= (x stone2) 10) (= (y stone2) 13)) (and (= (x stone2) 26) (= (y stone2) 6)) (and (= (x stone2) 14) (= (y stone2) 31)) (and (= (x stone2) 12) (= (y stone2) 27)) (and (= (x stone2) 12) (= (y stone2) 40)))
	(or (and (= (x stone3) 34) (= (y stone3) 31)) (and (= (x stone3) 40) (= (y stone3) 16)) (and (= (x stone3) 23) (= (y stone3) 5)) (and (= (x stone3) 32) (= (y stone3) 36)) (and (= (x stone3) 6) (= (y stone3) 36)) (and (= (x stone3) 10) (= (y stone3) 13)) (and (= (x stone3) 26) (= (y stone3) 6)) (and (= (x stone3) 14) (= (y stone3) 31)) (and (= (x stone3) 12) (= (y stone3) 27)) (and (= (x stone3) 12) (= (y stone3) 40)))
	(or (and (= (x stone4) 34) (= (y stone4) 31)) (and (= (x stone4) 40) (= (y stone4) 16)) (and (= (x stone4) 23) (= (y stone4) 5)) (and (= (x stone4) 32) (= (y stone4) 36)) (and (= (x stone4) 6) (= (y stone4) 36)) (and (= (x stone4) 10) (= (y stone4) 13)) (and (= (x stone4) 26) (= (y stone4) 6)) (and (= (x stone4) 14) (= (y stone4) 31)) (and (= (x stone4) 12) (= (y stone4) 27)) (and (= (x stone4) 12) (= (y stone4) 40)))
	(or (and (= (x stone5) 34) (= (y stone5) 31)) (and (= (x stone5) 40) (= (y stone5) 16)) (and (= (x stone5) 23) (= (y stone5) 5)) (and (= (x stone5) 32) (= (y stone5) 36)) (and (= (x stone5) 6) (= (y stone5) 36)) (and (= (x stone5) 10) (= (y stone5) 13)) (and (= (x stone5) 26) (= (y stone5) 6)) (and (= (x stone5) 14) (= (y stone5) 31)) (and (= (x stone5) 12) (= (y stone5) 27)) (and (= (x stone5) 12) (= (y stone5) 40)))
	(or (and (= (x stone6) 34) (= (y stone6) 31)) (and (= (x stone6) 40) (= (y stone6) 16)) (and (= (x stone6) 23) (= (y stone6) 5)) (and (= (x stone6) 32) (= (y stone6) 36)) (and (= (x stone6) 6) (= (y stone6) 36)) (and (= (x stone6) 10) (= (y stone6) 13)) (and (= (x stone6) 26) (= (y stone6) 6)) (and (= (x stone6) 14) (= (y stone6) 31)) (and (= (x stone6) 12) (= (y stone6) 27)) (and (= (x stone6) 12) (= (y stone6) 40)))
	(or (and (= (x stone7) 34) (= (y stone7) 31)) (and (= (x stone7) 40) (= (y stone7) 16)) (and (= (x stone7) 23) (= (y stone7) 5)) (and (= (x stone7) 32) (= (y stone7) 36)) (and (= (x stone7) 6) (= (y stone7) 36)) (and (= (x stone7) 10) (= (y stone7) 13)) (and (= (x stone7) 26) (= (y stone7) 6)) (and (= (x stone7) 14) (= (y stone7) 31)) (and (= (x stone7) 12) (= (y stone7) 27)) (and (= (x stone7) 12) (= (y stone7) 40)))
	(or (and (= (x stone8) 34) (= (y stone8) 31)) (and (= (x stone8) 40) (= (y stone8) 16)) (and (= (x stone8) 23) (= (y stone8) 5)) (and (= (x stone8) 32) (= (y stone8) 36)) (and (= (x stone8) 6) (= (y stone8) 36)) (and (= (x stone8) 10) (= (y stone8) 13)) (and (= (x stone8) 26) (= (y stone8) 6)) (and (= (x stone8) 14) (= (y stone8) 31)) (and (= (x stone8) 12) (= (y stone8) 27)) (and (= (x stone8) 12) (= (y stone8) 40)))
	(or (and (= (x stone9) 34) (= (y stone9) 31)) (and (= (x stone9) 40) (= (y stone9) 16)) (and (= (x stone9) 23) (= (y stone9) 5)) (and (= (x stone9) 32) (= (y stone9) 36)) (and (= (x stone9) 6) (= (y stone9) 36)) (and (= (x stone9) 10) (= (y stone9) 13)) (and (= (x stone9) 26) (= (y stone9) 6)) (and (= (x stone9) 14) (= (y stone9) 31)) (and (= (x stone9) 12) (= (y stone9) 27)) (and (= (x stone9) 12) (= (y stone9) 40)))
	(or (and (= (x stone10) 34) (= (y stone10) 31)) (and (= (x stone10) 40) (= (y stone10) 16)) (and (= (x stone10) 23) (= (y stone10) 5)) (and (= (x stone10) 32) (= (y stone10) 36)) (and (= (x stone10) 6) (= (y stone10) 36)) (and (= (x stone10) 10) (= (y stone10) 13)) (and (= (x stone10) 26) (= (y stone10) 6)) (and (= (x stone10) 14) (= (y stone10) 31)) (and (= (x stone10) 12) (= (y stone10) 27)) (and (= (x stone10) 12) (= (y stone10) 40)))
  ))

  
  

  
)
