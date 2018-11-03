(define (problem instance_13_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 13)
	(= (min_x) 1)
	(= (max_y) 13)
	(= (min_y) 1)
	(= (x player1) 10)
	(= (y player1) 13)
	(= (x stone1) 6)
	(= (y stone1) 9)
	(= (x stone2) 6)
	(= (y stone2) 6)
	(= (x stone3) 5)
	(= (y stone3) 2)
	(= (x stone4) 7)
	(= (y stone4) 4)
	(= (x stone5) 7)
	(= (y stone5) 8)
	(= (x stone6) 11)
	(= (y stone6) 11)
	(= (x stone7) 3)
	(= (y stone7) 6)
	(= (x stone8) 2)
	(= (y stone8) 10)
	(= (x stone9) 8)
	(= (y stone9) 2)
	(= (x stone10) 8)
	(= (y stone10) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 12) (= (y stone1) 8)) (and (= (x stone1) 9) (= (y stone1) 12)) (and (= (x stone1) 8) (= (y stone1) 1)) (and (= (x stone1) 3) (= (y stone1) 10)) (and (= (x stone1) 9) (= (y stone1) 5)) (and (= (x stone1) 6) (= (y stone1) 3)) (and (= (x stone1) 2) (= (y stone1) 13)) (and (= (x stone1) 1) (= (y stone1) 2)) (and (= (x stone1) 8) (= (y stone1) 9)) (and (= (x stone1) 9) (= (y stone1) 2)))
	(or (and (= (x stone2) 12) (= (y stone2) 8)) (and (= (x stone2) 9) (= (y stone2) 12)) (and (= (x stone2) 8) (= (y stone2) 1)) (and (= (x stone2) 3) (= (y stone2) 10)) (and (= (x stone2) 9) (= (y stone2) 5)) (and (= (x stone2) 6) (= (y stone2) 3)) (and (= (x stone2) 2) (= (y stone2) 13)) (and (= (x stone2) 1) (= (y stone2) 2)) (and (= (x stone2) 8) (= (y stone2) 9)) (and (= (x stone2) 9) (= (y stone2) 2)))
	(or (and (= (x stone3) 12) (= (y stone3) 8)) (and (= (x stone3) 9) (= (y stone3) 12)) (and (= (x stone3) 8) (= (y stone3) 1)) (and (= (x stone3) 3) (= (y stone3) 10)) (and (= (x stone3) 9) (= (y stone3) 5)) (and (= (x stone3) 6) (= (y stone3) 3)) (and (= (x stone3) 2) (= (y stone3) 13)) (and (= (x stone3) 1) (= (y stone3) 2)) (and (= (x stone3) 8) (= (y stone3) 9)) (and (= (x stone3) 9) (= (y stone3) 2)))
	(or (and (= (x stone4) 12) (= (y stone4) 8)) (and (= (x stone4) 9) (= (y stone4) 12)) (and (= (x stone4) 8) (= (y stone4) 1)) (and (= (x stone4) 3) (= (y stone4) 10)) (and (= (x stone4) 9) (= (y stone4) 5)) (and (= (x stone4) 6) (= (y stone4) 3)) (and (= (x stone4) 2) (= (y stone4) 13)) (and (= (x stone4) 1) (= (y stone4) 2)) (and (= (x stone4) 8) (= (y stone4) 9)) (and (= (x stone4) 9) (= (y stone4) 2)))
	(or (and (= (x stone5) 12) (= (y stone5) 8)) (and (= (x stone5) 9) (= (y stone5) 12)) (and (= (x stone5) 8) (= (y stone5) 1)) (and (= (x stone5) 3) (= (y stone5) 10)) (and (= (x stone5) 9) (= (y stone5) 5)) (and (= (x stone5) 6) (= (y stone5) 3)) (and (= (x stone5) 2) (= (y stone5) 13)) (and (= (x stone5) 1) (= (y stone5) 2)) (and (= (x stone5) 8) (= (y stone5) 9)) (and (= (x stone5) 9) (= (y stone5) 2)))
	(or (and (= (x stone6) 12) (= (y stone6) 8)) (and (= (x stone6) 9) (= (y stone6) 12)) (and (= (x stone6) 8) (= (y stone6) 1)) (and (= (x stone6) 3) (= (y stone6) 10)) (and (= (x stone6) 9) (= (y stone6) 5)) (and (= (x stone6) 6) (= (y stone6) 3)) (and (= (x stone6) 2) (= (y stone6) 13)) (and (= (x stone6) 1) (= (y stone6) 2)) (and (= (x stone6) 8) (= (y stone6) 9)) (and (= (x stone6) 9) (= (y stone6) 2)))
	(or (and (= (x stone7) 12) (= (y stone7) 8)) (and (= (x stone7) 9) (= (y stone7) 12)) (and (= (x stone7) 8) (= (y stone7) 1)) (and (= (x stone7) 3) (= (y stone7) 10)) (and (= (x stone7) 9) (= (y stone7) 5)) (and (= (x stone7) 6) (= (y stone7) 3)) (and (= (x stone7) 2) (= (y stone7) 13)) (and (= (x stone7) 1) (= (y stone7) 2)) (and (= (x stone7) 8) (= (y stone7) 9)) (and (= (x stone7) 9) (= (y stone7) 2)))
	(or (and (= (x stone8) 12) (= (y stone8) 8)) (and (= (x stone8) 9) (= (y stone8) 12)) (and (= (x stone8) 8) (= (y stone8) 1)) (and (= (x stone8) 3) (= (y stone8) 10)) (and (= (x stone8) 9) (= (y stone8) 5)) (and (= (x stone8) 6) (= (y stone8) 3)) (and (= (x stone8) 2) (= (y stone8) 13)) (and (= (x stone8) 1) (= (y stone8) 2)) (and (= (x stone8) 8) (= (y stone8) 9)) (and (= (x stone8) 9) (= (y stone8) 2)))
	(or (and (= (x stone9) 12) (= (y stone9) 8)) (and (= (x stone9) 9) (= (y stone9) 12)) (and (= (x stone9) 8) (= (y stone9) 1)) (and (= (x stone9) 3) (= (y stone9) 10)) (and (= (x stone9) 9) (= (y stone9) 5)) (and (= (x stone9) 6) (= (y stone9) 3)) (and (= (x stone9) 2) (= (y stone9) 13)) (and (= (x stone9) 1) (= (y stone9) 2)) (and (= (x stone9) 8) (= (y stone9) 9)) (and (= (x stone9) 9) (= (y stone9) 2)))
	(or (and (= (x stone10) 12) (= (y stone10) 8)) (and (= (x stone10) 9) (= (y stone10) 12)) (and (= (x stone10) 8) (= (y stone10) 1)) (and (= (x stone10) 3) (= (y stone10) 10)) (and (= (x stone10) 9) (= (y stone10) 5)) (and (= (x stone10) 6) (= (y stone10) 3)) (and (= (x stone10) 2) (= (y stone10) 13)) (and (= (x stone10) 1) (= (y stone10) 2)) (and (= (x stone10) 8) (= (y stone10) 9)) (and (= (x stone10) 9) (= (y stone10) 2)))
  ))

  
  

  
)
