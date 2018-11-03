(define (problem instance_15_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 15)
	(= (min_x) 1)
	(= (max_y) 15)
	(= (min_y) 1)
	(= (x player1) 3)
	(= (y player1) 2)
	(= (x stone1) 12)
	(= (y stone1) 14)
	(= (x stone2) 7)
	(= (y stone2) 4)
	(= (x stone3) 4)
	(= (y stone3) 8)
	(= (x stone4) 8)
	(= (y stone4) 7)
	(= (x stone5) 7)
	(= (y stone5) 14)
	(= (x stone6) 12)
	(= (y stone6) 8)
	(= (x stone7) 5)
	(= (y stone7) 13)
	(= (x stone8) 14)
	(= (y stone8) 14)
	(= (x stone9) 2)
	(= (y stone9) 13)
	(= (x stone10) 14)
	(= (y stone10) 6)
  )

  (:goal (and 
    (or (and (= (x stone1) 7) (= (y stone1) 3)) (and (= (x stone1) 6) (= (y stone1) 9)) (and (= (x stone1) 6) (= (y stone1) 4)) (and (= (x stone1) 5) (= (y stone1) 15)) (and (= (x stone1) 8) (= (y stone1) 2)) (and (= (x stone1) 11) (= (y stone1) 11)) (and (= (x stone1) 9) (= (y stone1) 1)) (and (= (x stone1) 3) (= (y stone1) 12)) (and (= (x stone1) 11) (= (y stone1) 5)) (and (= (x stone1) 9) (= (y stone1) 10)))
	(or (and (= (x stone2) 7) (= (y stone2) 3)) (and (= (x stone2) 6) (= (y stone2) 9)) (and (= (x stone2) 6) (= (y stone2) 4)) (and (= (x stone2) 5) (= (y stone2) 15)) (and (= (x stone2) 8) (= (y stone2) 2)) (and (= (x stone2) 11) (= (y stone2) 11)) (and (= (x stone2) 9) (= (y stone2) 1)) (and (= (x stone2) 3) (= (y stone2) 12)) (and (= (x stone2) 11) (= (y stone2) 5)) (and (= (x stone2) 9) (= (y stone2) 10)))
	(or (and (= (x stone3) 7) (= (y stone3) 3)) (and (= (x stone3) 6) (= (y stone3) 9)) (and (= (x stone3) 6) (= (y stone3) 4)) (and (= (x stone3) 5) (= (y stone3) 15)) (and (= (x stone3) 8) (= (y stone3) 2)) (and (= (x stone3) 11) (= (y stone3) 11)) (and (= (x stone3) 9) (= (y stone3) 1)) (and (= (x stone3) 3) (= (y stone3) 12)) (and (= (x stone3) 11) (= (y stone3) 5)) (and (= (x stone3) 9) (= (y stone3) 10)))
	(or (and (= (x stone4) 7) (= (y stone4) 3)) (and (= (x stone4) 6) (= (y stone4) 9)) (and (= (x stone4) 6) (= (y stone4) 4)) (and (= (x stone4) 5) (= (y stone4) 15)) (and (= (x stone4) 8) (= (y stone4) 2)) (and (= (x stone4) 11) (= (y stone4) 11)) (and (= (x stone4) 9) (= (y stone4) 1)) (and (= (x stone4) 3) (= (y stone4) 12)) (and (= (x stone4) 11) (= (y stone4) 5)) (and (= (x stone4) 9) (= (y stone4) 10)))
	(or (and (= (x stone5) 7) (= (y stone5) 3)) (and (= (x stone5) 6) (= (y stone5) 9)) (and (= (x stone5) 6) (= (y stone5) 4)) (and (= (x stone5) 5) (= (y stone5) 15)) (and (= (x stone5) 8) (= (y stone5) 2)) (and (= (x stone5) 11) (= (y stone5) 11)) (and (= (x stone5) 9) (= (y stone5) 1)) (and (= (x stone5) 3) (= (y stone5) 12)) (and (= (x stone5) 11) (= (y stone5) 5)) (and (= (x stone5) 9) (= (y stone5) 10)))
	(or (and (= (x stone6) 7) (= (y stone6) 3)) (and (= (x stone6) 6) (= (y stone6) 9)) (and (= (x stone6) 6) (= (y stone6) 4)) (and (= (x stone6) 5) (= (y stone6) 15)) (and (= (x stone6) 8) (= (y stone6) 2)) (and (= (x stone6) 11) (= (y stone6) 11)) (and (= (x stone6) 9) (= (y stone6) 1)) (and (= (x stone6) 3) (= (y stone6) 12)) (and (= (x stone6) 11) (= (y stone6) 5)) (and (= (x stone6) 9) (= (y stone6) 10)))
	(or (and (= (x stone7) 7) (= (y stone7) 3)) (and (= (x stone7) 6) (= (y stone7) 9)) (and (= (x stone7) 6) (= (y stone7) 4)) (and (= (x stone7) 5) (= (y stone7) 15)) (and (= (x stone7) 8) (= (y stone7) 2)) (and (= (x stone7) 11) (= (y stone7) 11)) (and (= (x stone7) 9) (= (y stone7) 1)) (and (= (x stone7) 3) (= (y stone7) 12)) (and (= (x stone7) 11) (= (y stone7) 5)) (and (= (x stone7) 9) (= (y stone7) 10)))
	(or (and (= (x stone8) 7) (= (y stone8) 3)) (and (= (x stone8) 6) (= (y stone8) 9)) (and (= (x stone8) 6) (= (y stone8) 4)) (and (= (x stone8) 5) (= (y stone8) 15)) (and (= (x stone8) 8) (= (y stone8) 2)) (and (= (x stone8) 11) (= (y stone8) 11)) (and (= (x stone8) 9) (= (y stone8) 1)) (and (= (x stone8) 3) (= (y stone8) 12)) (and (= (x stone8) 11) (= (y stone8) 5)) (and (= (x stone8) 9) (= (y stone8) 10)))
	(or (and (= (x stone9) 7) (= (y stone9) 3)) (and (= (x stone9) 6) (= (y stone9) 9)) (and (= (x stone9) 6) (= (y stone9) 4)) (and (= (x stone9) 5) (= (y stone9) 15)) (and (= (x stone9) 8) (= (y stone9) 2)) (and (= (x stone9) 11) (= (y stone9) 11)) (and (= (x stone9) 9) (= (y stone9) 1)) (and (= (x stone9) 3) (= (y stone9) 12)) (and (= (x stone9) 11) (= (y stone9) 5)) (and (= (x stone9) 9) (= (y stone9) 10)))
	(or (and (= (x stone10) 7) (= (y stone10) 3)) (and (= (x stone10) 6) (= (y stone10) 9)) (and (= (x stone10) 6) (= (y stone10) 4)) (and (= (x stone10) 5) (= (y stone10) 15)) (and (= (x stone10) 8) (= (y stone10) 2)) (and (= (x stone10) 11) (= (y stone10) 11)) (and (= (x stone10) 9) (= (y stone10) 1)) (and (= (x stone10) 3) (= (y stone10) 12)) (and (= (x stone10) 11) (= (y stone10) 5)) (and (= (x stone10) 9) (= (y stone10) 10)))
  ))

  
  

  
)
