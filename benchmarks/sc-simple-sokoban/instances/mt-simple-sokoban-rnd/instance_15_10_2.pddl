(define (problem instance_15_10_2)
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
	(= (x player1) 7)
	(= (y player1) 7)
	(= (x stone1) 13)
	(= (y stone1) 7)
	(= (x stone2) 5)
	(= (y stone2) 6)
	(= (x stone3) 9)
	(= (y stone3) 13)
	(= (x stone4) 10)
	(= (y stone4) 3)
	(= (x stone5) 8)
	(= (y stone5) 5)
	(= (x stone6) 9)
	(= (y stone6) 6)
	(= (x stone7) 3)
	(= (y stone7) 11)
	(= (x stone8) 11)
	(= (y stone8) 4)
	(= (x stone9) 11)
	(= (y stone9) 11)
	(= (x stone10) 2)
	(= (y stone10) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 6) (= (y stone1) 8)) (and (= (x stone1) 15) (= (y stone1) 4)) (and (= (x stone1) 10) (= (y stone1) 2)) (and (= (x stone1) 5) (= (y stone1) 14)) (and (= (x stone1) 3) (= (y stone1) 2)) (and (= (x stone1) 6) (= (y stone1) 10)) (and (= (x stone1) 11) (= (y stone1) 3)) (and (= (x stone1) 13) (= (y stone1) 6)) (and (= (x stone1) 1) (= (y stone1) 8)) (and (= (x stone1) 1) (= (y stone1) 1)))
	(or (and (= (x stone2) 6) (= (y stone2) 8)) (and (= (x stone2) 15) (= (y stone2) 4)) (and (= (x stone2) 10) (= (y stone2) 2)) (and (= (x stone2) 5) (= (y stone2) 14)) (and (= (x stone2) 3) (= (y stone2) 2)) (and (= (x stone2) 6) (= (y stone2) 10)) (and (= (x stone2) 11) (= (y stone2) 3)) (and (= (x stone2) 13) (= (y stone2) 6)) (and (= (x stone2) 1) (= (y stone2) 8)) (and (= (x stone2) 1) (= (y stone2) 1)))
	(or (and (= (x stone3) 6) (= (y stone3) 8)) (and (= (x stone3) 15) (= (y stone3) 4)) (and (= (x stone3) 10) (= (y stone3) 2)) (and (= (x stone3) 5) (= (y stone3) 14)) (and (= (x stone3) 3) (= (y stone3) 2)) (and (= (x stone3) 6) (= (y stone3) 10)) (and (= (x stone3) 11) (= (y stone3) 3)) (and (= (x stone3) 13) (= (y stone3) 6)) (and (= (x stone3) 1) (= (y stone3) 8)) (and (= (x stone3) 1) (= (y stone3) 1)))
	(or (and (= (x stone4) 6) (= (y stone4) 8)) (and (= (x stone4) 15) (= (y stone4) 4)) (and (= (x stone4) 10) (= (y stone4) 2)) (and (= (x stone4) 5) (= (y stone4) 14)) (and (= (x stone4) 3) (= (y stone4) 2)) (and (= (x stone4) 6) (= (y stone4) 10)) (and (= (x stone4) 11) (= (y stone4) 3)) (and (= (x stone4) 13) (= (y stone4) 6)) (and (= (x stone4) 1) (= (y stone4) 8)) (and (= (x stone4) 1) (= (y stone4) 1)))
	(or (and (= (x stone5) 6) (= (y stone5) 8)) (and (= (x stone5) 15) (= (y stone5) 4)) (and (= (x stone5) 10) (= (y stone5) 2)) (and (= (x stone5) 5) (= (y stone5) 14)) (and (= (x stone5) 3) (= (y stone5) 2)) (and (= (x stone5) 6) (= (y stone5) 10)) (and (= (x stone5) 11) (= (y stone5) 3)) (and (= (x stone5) 13) (= (y stone5) 6)) (and (= (x stone5) 1) (= (y stone5) 8)) (and (= (x stone5) 1) (= (y stone5) 1)))
	(or (and (= (x stone6) 6) (= (y stone6) 8)) (and (= (x stone6) 15) (= (y stone6) 4)) (and (= (x stone6) 10) (= (y stone6) 2)) (and (= (x stone6) 5) (= (y stone6) 14)) (and (= (x stone6) 3) (= (y stone6) 2)) (and (= (x stone6) 6) (= (y stone6) 10)) (and (= (x stone6) 11) (= (y stone6) 3)) (and (= (x stone6) 13) (= (y stone6) 6)) (and (= (x stone6) 1) (= (y stone6) 8)) (and (= (x stone6) 1) (= (y stone6) 1)))
	(or (and (= (x stone7) 6) (= (y stone7) 8)) (and (= (x stone7) 15) (= (y stone7) 4)) (and (= (x stone7) 10) (= (y stone7) 2)) (and (= (x stone7) 5) (= (y stone7) 14)) (and (= (x stone7) 3) (= (y stone7) 2)) (and (= (x stone7) 6) (= (y stone7) 10)) (and (= (x stone7) 11) (= (y stone7) 3)) (and (= (x stone7) 13) (= (y stone7) 6)) (and (= (x stone7) 1) (= (y stone7) 8)) (and (= (x stone7) 1) (= (y stone7) 1)))
	(or (and (= (x stone8) 6) (= (y stone8) 8)) (and (= (x stone8) 15) (= (y stone8) 4)) (and (= (x stone8) 10) (= (y stone8) 2)) (and (= (x stone8) 5) (= (y stone8) 14)) (and (= (x stone8) 3) (= (y stone8) 2)) (and (= (x stone8) 6) (= (y stone8) 10)) (and (= (x stone8) 11) (= (y stone8) 3)) (and (= (x stone8) 13) (= (y stone8) 6)) (and (= (x stone8) 1) (= (y stone8) 8)) (and (= (x stone8) 1) (= (y stone8) 1)))
	(or (and (= (x stone9) 6) (= (y stone9) 8)) (and (= (x stone9) 15) (= (y stone9) 4)) (and (= (x stone9) 10) (= (y stone9) 2)) (and (= (x stone9) 5) (= (y stone9) 14)) (and (= (x stone9) 3) (= (y stone9) 2)) (and (= (x stone9) 6) (= (y stone9) 10)) (and (= (x stone9) 11) (= (y stone9) 3)) (and (= (x stone9) 13) (= (y stone9) 6)) (and (= (x stone9) 1) (= (y stone9) 8)) (and (= (x stone9) 1) (= (y stone9) 1)))
	(or (and (= (x stone10) 6) (= (y stone10) 8)) (and (= (x stone10) 15) (= (y stone10) 4)) (and (= (x stone10) 10) (= (y stone10) 2)) (and (= (x stone10) 5) (= (y stone10) 14)) (and (= (x stone10) 3) (= (y stone10) 2)) (and (= (x stone10) 6) (= (y stone10) 10)) (and (= (x stone10) 11) (= (y stone10) 3)) (and (= (x stone10) 13) (= (y stone10) 6)) (and (= (x stone10) 1) (= (y stone10) 8)) (and (= (x stone10) 1) (= (y stone10) 1)))
  ))

  
  

  
)
