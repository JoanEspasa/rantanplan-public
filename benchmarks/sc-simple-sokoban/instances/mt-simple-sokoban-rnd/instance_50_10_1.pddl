(define (problem instance_50_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 50)
	(= (min_x) 1)
	(= (max_y) 50)
	(= (min_y) 1)
	(= (x player1) 27)
	(= (y player1) 47)
	(= (x stone1) 37)
	(= (y stone1) 6)
	(= (x stone2) 48)
	(= (y stone2) 17)
	(= (x stone3) 24)
	(= (y stone3) 31)
	(= (x stone4) 43)
	(= (y stone4) 21)
	(= (x stone5) 9)
	(= (y stone5) 40)
	(= (x stone6) 8)
	(= (y stone6) 31)
	(= (x stone7) 18)
	(= (y stone7) 35)
	(= (x stone8) 41)
	(= (y stone8) 26)
	(= (x stone9) 43)
	(= (y stone9) 41)
	(= (x stone10) 46)
	(= (y stone10) 35)
  )

  (:goal (and 
    (or (and (= (x stone1) 17) (= (y stone1) 16)) (and (= (x stone1) 37) (= (y stone1) 1)) (and (= (x stone1) 9) (= (y stone1) 36)) (and (= (x stone1) 35) (= (y stone1) 23)) (and (= (x stone1) 23) (= (y stone1) 43)) (and (= (x stone1) 30) (= (y stone1) 31)) (and (= (x stone1) 42) (= (y stone1) 5)) (and (= (x stone1) 5) (= (y stone1) 10)) (and (= (x stone1) 34) (= (y stone1) 41)) (and (= (x stone1) 18) (= (y stone1) 13)))
	(or (and (= (x stone2) 17) (= (y stone2) 16)) (and (= (x stone2) 37) (= (y stone2) 1)) (and (= (x stone2) 9) (= (y stone2) 36)) (and (= (x stone2) 35) (= (y stone2) 23)) (and (= (x stone2) 23) (= (y stone2) 43)) (and (= (x stone2) 30) (= (y stone2) 31)) (and (= (x stone2) 42) (= (y stone2) 5)) (and (= (x stone2) 5) (= (y stone2) 10)) (and (= (x stone2) 34) (= (y stone2) 41)) (and (= (x stone2) 18) (= (y stone2) 13)))
	(or (and (= (x stone3) 17) (= (y stone3) 16)) (and (= (x stone3) 37) (= (y stone3) 1)) (and (= (x stone3) 9) (= (y stone3) 36)) (and (= (x stone3) 35) (= (y stone3) 23)) (and (= (x stone3) 23) (= (y stone3) 43)) (and (= (x stone3) 30) (= (y stone3) 31)) (and (= (x stone3) 42) (= (y stone3) 5)) (and (= (x stone3) 5) (= (y stone3) 10)) (and (= (x stone3) 34) (= (y stone3) 41)) (and (= (x stone3) 18) (= (y stone3) 13)))
	(or (and (= (x stone4) 17) (= (y stone4) 16)) (and (= (x stone4) 37) (= (y stone4) 1)) (and (= (x stone4) 9) (= (y stone4) 36)) (and (= (x stone4) 35) (= (y stone4) 23)) (and (= (x stone4) 23) (= (y stone4) 43)) (and (= (x stone4) 30) (= (y stone4) 31)) (and (= (x stone4) 42) (= (y stone4) 5)) (and (= (x stone4) 5) (= (y stone4) 10)) (and (= (x stone4) 34) (= (y stone4) 41)) (and (= (x stone4) 18) (= (y stone4) 13)))
	(or (and (= (x stone5) 17) (= (y stone5) 16)) (and (= (x stone5) 37) (= (y stone5) 1)) (and (= (x stone5) 9) (= (y stone5) 36)) (and (= (x stone5) 35) (= (y stone5) 23)) (and (= (x stone5) 23) (= (y stone5) 43)) (and (= (x stone5) 30) (= (y stone5) 31)) (and (= (x stone5) 42) (= (y stone5) 5)) (and (= (x stone5) 5) (= (y stone5) 10)) (and (= (x stone5) 34) (= (y stone5) 41)) (and (= (x stone5) 18) (= (y stone5) 13)))
	(or (and (= (x stone6) 17) (= (y stone6) 16)) (and (= (x stone6) 37) (= (y stone6) 1)) (and (= (x stone6) 9) (= (y stone6) 36)) (and (= (x stone6) 35) (= (y stone6) 23)) (and (= (x stone6) 23) (= (y stone6) 43)) (and (= (x stone6) 30) (= (y stone6) 31)) (and (= (x stone6) 42) (= (y stone6) 5)) (and (= (x stone6) 5) (= (y stone6) 10)) (and (= (x stone6) 34) (= (y stone6) 41)) (and (= (x stone6) 18) (= (y stone6) 13)))
	(or (and (= (x stone7) 17) (= (y stone7) 16)) (and (= (x stone7) 37) (= (y stone7) 1)) (and (= (x stone7) 9) (= (y stone7) 36)) (and (= (x stone7) 35) (= (y stone7) 23)) (and (= (x stone7) 23) (= (y stone7) 43)) (and (= (x stone7) 30) (= (y stone7) 31)) (and (= (x stone7) 42) (= (y stone7) 5)) (and (= (x stone7) 5) (= (y stone7) 10)) (and (= (x stone7) 34) (= (y stone7) 41)) (and (= (x stone7) 18) (= (y stone7) 13)))
	(or (and (= (x stone8) 17) (= (y stone8) 16)) (and (= (x stone8) 37) (= (y stone8) 1)) (and (= (x stone8) 9) (= (y stone8) 36)) (and (= (x stone8) 35) (= (y stone8) 23)) (and (= (x stone8) 23) (= (y stone8) 43)) (and (= (x stone8) 30) (= (y stone8) 31)) (and (= (x stone8) 42) (= (y stone8) 5)) (and (= (x stone8) 5) (= (y stone8) 10)) (and (= (x stone8) 34) (= (y stone8) 41)) (and (= (x stone8) 18) (= (y stone8) 13)))
	(or (and (= (x stone9) 17) (= (y stone9) 16)) (and (= (x stone9) 37) (= (y stone9) 1)) (and (= (x stone9) 9) (= (y stone9) 36)) (and (= (x stone9) 35) (= (y stone9) 23)) (and (= (x stone9) 23) (= (y stone9) 43)) (and (= (x stone9) 30) (= (y stone9) 31)) (and (= (x stone9) 42) (= (y stone9) 5)) (and (= (x stone9) 5) (= (y stone9) 10)) (and (= (x stone9) 34) (= (y stone9) 41)) (and (= (x stone9) 18) (= (y stone9) 13)))
	(or (and (= (x stone10) 17) (= (y stone10) 16)) (and (= (x stone10) 37) (= (y stone10) 1)) (and (= (x stone10) 9) (= (y stone10) 36)) (and (= (x stone10) 35) (= (y stone10) 23)) (and (= (x stone10) 23) (= (y stone10) 43)) (and (= (x stone10) 30) (= (y stone10) 31)) (and (= (x stone10) 42) (= (y stone10) 5)) (and (= (x stone10) 5) (= (y stone10) 10)) (and (= (x stone10) 34) (= (y stone10) 41)) (and (= (x stone10) 18) (= (y stone10) 13)))
  ))

  
  

  
)
