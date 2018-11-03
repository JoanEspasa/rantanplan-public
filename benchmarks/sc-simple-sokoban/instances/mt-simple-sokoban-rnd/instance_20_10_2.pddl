(define (problem instance_20_10_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 20)
	(= (min_x) 1)
	(= (max_y) 20)
	(= (min_y) 1)
	(= (x player1) 7)
	(= (y player1) 19)
	(= (x stone1) 6)
	(= (y stone1) 8)
	(= (x stone2) 9)
	(= (y stone2) 13)
	(= (x stone3) 8)
	(= (y stone3) 4)
	(= (x stone4) 15)
	(= (y stone4) 9)
	(= (x stone5) 5)
	(= (y stone5) 5)
	(= (x stone6) 14)
	(= (y stone6) 3)
	(= (x stone7) 17)
	(= (y stone7) 5)
	(= (x stone8) 12)
	(= (y stone8) 19)
	(= (x stone9) 15)
	(= (y stone9) 19)
	(= (x stone10) 19)
	(= (y stone10) 14)
  )

  (:goal (and 
    (or (and (= (x stone1) 11) (= (y stone1) 20)) (and (= (x stone1) 17) (= (y stone1) 19)) (and (= (x stone1) 11) (= (y stone1) 17)) (and (= (x stone1) 20) (= (y stone1) 16)) (and (= (x stone1) 12) (= (y stone1) 8)) (and (= (x stone1) 20) (= (y stone1) 2)) (and (= (x stone1) 10) (= (y stone1) 10)) (and (= (x stone1) 16) (= (y stone1) 10)) (and (= (x stone1) 1) (= (y stone1) 3)) (and (= (x stone1) 17) (= (y stone1) 13)))
	(or (and (= (x stone2) 11) (= (y stone2) 20)) (and (= (x stone2) 17) (= (y stone2) 19)) (and (= (x stone2) 11) (= (y stone2) 17)) (and (= (x stone2) 20) (= (y stone2) 16)) (and (= (x stone2) 12) (= (y stone2) 8)) (and (= (x stone2) 20) (= (y stone2) 2)) (and (= (x stone2) 10) (= (y stone2) 10)) (and (= (x stone2) 16) (= (y stone2) 10)) (and (= (x stone2) 1) (= (y stone2) 3)) (and (= (x stone2) 17) (= (y stone2) 13)))
	(or (and (= (x stone3) 11) (= (y stone3) 20)) (and (= (x stone3) 17) (= (y stone3) 19)) (and (= (x stone3) 11) (= (y stone3) 17)) (and (= (x stone3) 20) (= (y stone3) 16)) (and (= (x stone3) 12) (= (y stone3) 8)) (and (= (x stone3) 20) (= (y stone3) 2)) (and (= (x stone3) 10) (= (y stone3) 10)) (and (= (x stone3) 16) (= (y stone3) 10)) (and (= (x stone3) 1) (= (y stone3) 3)) (and (= (x stone3) 17) (= (y stone3) 13)))
	(or (and (= (x stone4) 11) (= (y stone4) 20)) (and (= (x stone4) 17) (= (y stone4) 19)) (and (= (x stone4) 11) (= (y stone4) 17)) (and (= (x stone4) 20) (= (y stone4) 16)) (and (= (x stone4) 12) (= (y stone4) 8)) (and (= (x stone4) 20) (= (y stone4) 2)) (and (= (x stone4) 10) (= (y stone4) 10)) (and (= (x stone4) 16) (= (y stone4) 10)) (and (= (x stone4) 1) (= (y stone4) 3)) (and (= (x stone4) 17) (= (y stone4) 13)))
	(or (and (= (x stone5) 11) (= (y stone5) 20)) (and (= (x stone5) 17) (= (y stone5) 19)) (and (= (x stone5) 11) (= (y stone5) 17)) (and (= (x stone5) 20) (= (y stone5) 16)) (and (= (x stone5) 12) (= (y stone5) 8)) (and (= (x stone5) 20) (= (y stone5) 2)) (and (= (x stone5) 10) (= (y stone5) 10)) (and (= (x stone5) 16) (= (y stone5) 10)) (and (= (x stone5) 1) (= (y stone5) 3)) (and (= (x stone5) 17) (= (y stone5) 13)))
	(or (and (= (x stone6) 11) (= (y stone6) 20)) (and (= (x stone6) 17) (= (y stone6) 19)) (and (= (x stone6) 11) (= (y stone6) 17)) (and (= (x stone6) 20) (= (y stone6) 16)) (and (= (x stone6) 12) (= (y stone6) 8)) (and (= (x stone6) 20) (= (y stone6) 2)) (and (= (x stone6) 10) (= (y stone6) 10)) (and (= (x stone6) 16) (= (y stone6) 10)) (and (= (x stone6) 1) (= (y stone6) 3)) (and (= (x stone6) 17) (= (y stone6) 13)))
	(or (and (= (x stone7) 11) (= (y stone7) 20)) (and (= (x stone7) 17) (= (y stone7) 19)) (and (= (x stone7) 11) (= (y stone7) 17)) (and (= (x stone7) 20) (= (y stone7) 16)) (and (= (x stone7) 12) (= (y stone7) 8)) (and (= (x stone7) 20) (= (y stone7) 2)) (and (= (x stone7) 10) (= (y stone7) 10)) (and (= (x stone7) 16) (= (y stone7) 10)) (and (= (x stone7) 1) (= (y stone7) 3)) (and (= (x stone7) 17) (= (y stone7) 13)))
	(or (and (= (x stone8) 11) (= (y stone8) 20)) (and (= (x stone8) 17) (= (y stone8) 19)) (and (= (x stone8) 11) (= (y stone8) 17)) (and (= (x stone8) 20) (= (y stone8) 16)) (and (= (x stone8) 12) (= (y stone8) 8)) (and (= (x stone8) 20) (= (y stone8) 2)) (and (= (x stone8) 10) (= (y stone8) 10)) (and (= (x stone8) 16) (= (y stone8) 10)) (and (= (x stone8) 1) (= (y stone8) 3)) (and (= (x stone8) 17) (= (y stone8) 13)))
	(or (and (= (x stone9) 11) (= (y stone9) 20)) (and (= (x stone9) 17) (= (y stone9) 19)) (and (= (x stone9) 11) (= (y stone9) 17)) (and (= (x stone9) 20) (= (y stone9) 16)) (and (= (x stone9) 12) (= (y stone9) 8)) (and (= (x stone9) 20) (= (y stone9) 2)) (and (= (x stone9) 10) (= (y stone9) 10)) (and (= (x stone9) 16) (= (y stone9) 10)) (and (= (x stone9) 1) (= (y stone9) 3)) (and (= (x stone9) 17) (= (y stone9) 13)))
	(or (and (= (x stone10) 11) (= (y stone10) 20)) (and (= (x stone10) 17) (= (y stone10) 19)) (and (= (x stone10) 11) (= (y stone10) 17)) (and (= (x stone10) 20) (= (y stone10) 16)) (and (= (x stone10) 12) (= (y stone10) 8)) (and (= (x stone10) 20) (= (y stone10) 2)) (and (= (x stone10) 10) (= (y stone10) 10)) (and (= (x stone10) 16) (= (y stone10) 10)) (and (= (x stone10) 1) (= (y stone10) 3)) (and (= (x stone10) 17) (= (y stone10) 13)))
  ))

  
  

  
)
