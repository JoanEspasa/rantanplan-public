(define (problem instance_25_10_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 25)
	(= (min_x) 1)
	(= (max_y) 25)
	(= (min_y) 1)
	(= (x player1) 20)
	(= (y player1) 18)
	(= (x stone1) 22)
	(= (y stone1) 13)
	(= (x stone2) 14)
	(= (y stone2) 6)
	(= (x stone3) 12)
	(= (y stone3) 5)
	(= (x stone4) 12)
	(= (y stone4) 3)
	(= (x stone5) 13)
	(= (y stone5) 8)
	(= (x stone6) 8)
	(= (y stone6) 22)
	(= (x stone7) 4)
	(= (y stone7) 16)
	(= (x stone8) 14)
	(= (y stone8) 8)
	(= (x stone9) 18)
	(= (y stone9) 14)
	(= (x stone10) 20)
	(= (y stone10) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 10) (= (y stone1) 20)) (and (= (x stone1) 22) (= (y stone1) 9)) (and (= (x stone1) 21) (= (y stone1) 2)) (and (= (x stone1) 11) (= (y stone1) 1)) (and (= (x stone1) 20) (= (y stone1) 16)) (and (= (x stone1) 25) (= (y stone1) 8)) (and (= (x stone1) 22) (= (y stone1) 14)) (and (= (x stone1) 21) (= (y stone1) 9)) (and (= (x stone1) 21) (= (y stone1) 4)) (and (= (x stone1) 25) (= (y stone1) 24)))
	(or (and (= (x stone2) 10) (= (y stone2) 20)) (and (= (x stone2) 22) (= (y stone2) 9)) (and (= (x stone2) 21) (= (y stone2) 2)) (and (= (x stone2) 11) (= (y stone2) 1)) (and (= (x stone2) 20) (= (y stone2) 16)) (and (= (x stone2) 25) (= (y stone2) 8)) (and (= (x stone2) 22) (= (y stone2) 14)) (and (= (x stone2) 21) (= (y stone2) 9)) (and (= (x stone2) 21) (= (y stone2) 4)) (and (= (x stone2) 25) (= (y stone2) 24)))
	(or (and (= (x stone3) 10) (= (y stone3) 20)) (and (= (x stone3) 22) (= (y stone3) 9)) (and (= (x stone3) 21) (= (y stone3) 2)) (and (= (x stone3) 11) (= (y stone3) 1)) (and (= (x stone3) 20) (= (y stone3) 16)) (and (= (x stone3) 25) (= (y stone3) 8)) (and (= (x stone3) 22) (= (y stone3) 14)) (and (= (x stone3) 21) (= (y stone3) 9)) (and (= (x stone3) 21) (= (y stone3) 4)) (and (= (x stone3) 25) (= (y stone3) 24)))
	(or (and (= (x stone4) 10) (= (y stone4) 20)) (and (= (x stone4) 22) (= (y stone4) 9)) (and (= (x stone4) 21) (= (y stone4) 2)) (and (= (x stone4) 11) (= (y stone4) 1)) (and (= (x stone4) 20) (= (y stone4) 16)) (and (= (x stone4) 25) (= (y stone4) 8)) (and (= (x stone4) 22) (= (y stone4) 14)) (and (= (x stone4) 21) (= (y stone4) 9)) (and (= (x stone4) 21) (= (y stone4) 4)) (and (= (x stone4) 25) (= (y stone4) 24)))
	(or (and (= (x stone5) 10) (= (y stone5) 20)) (and (= (x stone5) 22) (= (y stone5) 9)) (and (= (x stone5) 21) (= (y stone5) 2)) (and (= (x stone5) 11) (= (y stone5) 1)) (and (= (x stone5) 20) (= (y stone5) 16)) (and (= (x stone5) 25) (= (y stone5) 8)) (and (= (x stone5) 22) (= (y stone5) 14)) (and (= (x stone5) 21) (= (y stone5) 9)) (and (= (x stone5) 21) (= (y stone5) 4)) (and (= (x stone5) 25) (= (y stone5) 24)))
	(or (and (= (x stone6) 10) (= (y stone6) 20)) (and (= (x stone6) 22) (= (y stone6) 9)) (and (= (x stone6) 21) (= (y stone6) 2)) (and (= (x stone6) 11) (= (y stone6) 1)) (and (= (x stone6) 20) (= (y stone6) 16)) (and (= (x stone6) 25) (= (y stone6) 8)) (and (= (x stone6) 22) (= (y stone6) 14)) (and (= (x stone6) 21) (= (y stone6) 9)) (and (= (x stone6) 21) (= (y stone6) 4)) (and (= (x stone6) 25) (= (y stone6) 24)))
	(or (and (= (x stone7) 10) (= (y stone7) 20)) (and (= (x stone7) 22) (= (y stone7) 9)) (and (= (x stone7) 21) (= (y stone7) 2)) (and (= (x stone7) 11) (= (y stone7) 1)) (and (= (x stone7) 20) (= (y stone7) 16)) (and (= (x stone7) 25) (= (y stone7) 8)) (and (= (x stone7) 22) (= (y stone7) 14)) (and (= (x stone7) 21) (= (y stone7) 9)) (and (= (x stone7) 21) (= (y stone7) 4)) (and (= (x stone7) 25) (= (y stone7) 24)))
	(or (and (= (x stone8) 10) (= (y stone8) 20)) (and (= (x stone8) 22) (= (y stone8) 9)) (and (= (x stone8) 21) (= (y stone8) 2)) (and (= (x stone8) 11) (= (y stone8) 1)) (and (= (x stone8) 20) (= (y stone8) 16)) (and (= (x stone8) 25) (= (y stone8) 8)) (and (= (x stone8) 22) (= (y stone8) 14)) (and (= (x stone8) 21) (= (y stone8) 9)) (and (= (x stone8) 21) (= (y stone8) 4)) (and (= (x stone8) 25) (= (y stone8) 24)))
	(or (and (= (x stone9) 10) (= (y stone9) 20)) (and (= (x stone9) 22) (= (y stone9) 9)) (and (= (x stone9) 21) (= (y stone9) 2)) (and (= (x stone9) 11) (= (y stone9) 1)) (and (= (x stone9) 20) (= (y stone9) 16)) (and (= (x stone9) 25) (= (y stone9) 8)) (and (= (x stone9) 22) (= (y stone9) 14)) (and (= (x stone9) 21) (= (y stone9) 9)) (and (= (x stone9) 21) (= (y stone9) 4)) (and (= (x stone9) 25) (= (y stone9) 24)))
	(or (and (= (x stone10) 10) (= (y stone10) 20)) (and (= (x stone10) 22) (= (y stone10) 9)) (and (= (x stone10) 21) (= (y stone10) 2)) (and (= (x stone10) 11) (= (y stone10) 1)) (and (= (x stone10) 20) (= (y stone10) 16)) (and (= (x stone10) 25) (= (y stone10) 8)) (and (= (x stone10) 22) (= (y stone10) 14)) (and (= (x stone10) 21) (= (y stone10) 9)) (and (= (x stone10) 21) (= (y stone10) 4)) (and (= (x stone10) 25) (= (y stone10) 24)))
  ))

  
  

  
)
