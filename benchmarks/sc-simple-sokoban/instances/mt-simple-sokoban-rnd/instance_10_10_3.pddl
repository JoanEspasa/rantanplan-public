(define (problem instance_10_10_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 10)
	(= (min_x) 1)
	(= (max_y) 10)
	(= (min_y) 1)
	(= (x player1) 7)
	(= (y player1) 2)
	(= (x stone1) 7)
	(= (y stone1) 7)
	(= (x stone2) 9)
	(= (y stone2) 2)
	(= (x stone3) 2)
	(= (y stone3) 6)
	(= (x stone4) 9)
	(= (y stone4) 9)
	(= (x stone5) 4)
	(= (y stone5) 8)
	(= (x stone6) 8)
	(= (y stone6) 4)
	(= (x stone7) 9)
	(= (y stone7) 5)
	(= (x stone8) 7)
	(= (y stone8) 6)
	(= (x stone9) 3)
	(= (y stone9) 5)
	(= (x stone10) 4)
	(= (y stone10) 5)
  )

  (:goal (and 
    (or (and (= (x stone1) 10) (= (y stone1) 6)) (and (= (x stone1) 1) (= (y stone1) 8)) (and (= (x stone1) 10) (= (y stone1) 5)) (and (= (x stone1) 3) (= (y stone1) 4)) (and (= (x stone1) 5) (= (y stone1) 8)) (and (= (x stone1) 2) (= (y stone1) 2)) (and (= (x stone1) 4) (= (y stone1) 2)) (and (= (x stone1) 2) (= (y stone1) 10)) (and (= (x stone1) 5) (= (y stone1) 10)) (and (= (x stone1) 2) (= (y stone1) 1)))
	(or (and (= (x stone2) 10) (= (y stone2) 6)) (and (= (x stone2) 1) (= (y stone2) 8)) (and (= (x stone2) 10) (= (y stone2) 5)) (and (= (x stone2) 3) (= (y stone2) 4)) (and (= (x stone2) 5) (= (y stone2) 8)) (and (= (x stone2) 2) (= (y stone2) 2)) (and (= (x stone2) 4) (= (y stone2) 2)) (and (= (x stone2) 2) (= (y stone2) 10)) (and (= (x stone2) 5) (= (y stone2) 10)) (and (= (x stone2) 2) (= (y stone2) 1)))
	(or (and (= (x stone3) 10) (= (y stone3) 6)) (and (= (x stone3) 1) (= (y stone3) 8)) (and (= (x stone3) 10) (= (y stone3) 5)) (and (= (x stone3) 3) (= (y stone3) 4)) (and (= (x stone3) 5) (= (y stone3) 8)) (and (= (x stone3) 2) (= (y stone3) 2)) (and (= (x stone3) 4) (= (y stone3) 2)) (and (= (x stone3) 2) (= (y stone3) 10)) (and (= (x stone3) 5) (= (y stone3) 10)) (and (= (x stone3) 2) (= (y stone3) 1)))
	(or (and (= (x stone4) 10) (= (y stone4) 6)) (and (= (x stone4) 1) (= (y stone4) 8)) (and (= (x stone4) 10) (= (y stone4) 5)) (and (= (x stone4) 3) (= (y stone4) 4)) (and (= (x stone4) 5) (= (y stone4) 8)) (and (= (x stone4) 2) (= (y stone4) 2)) (and (= (x stone4) 4) (= (y stone4) 2)) (and (= (x stone4) 2) (= (y stone4) 10)) (and (= (x stone4) 5) (= (y stone4) 10)) (and (= (x stone4) 2) (= (y stone4) 1)))
	(or (and (= (x stone5) 10) (= (y stone5) 6)) (and (= (x stone5) 1) (= (y stone5) 8)) (and (= (x stone5) 10) (= (y stone5) 5)) (and (= (x stone5) 3) (= (y stone5) 4)) (and (= (x stone5) 5) (= (y stone5) 8)) (and (= (x stone5) 2) (= (y stone5) 2)) (and (= (x stone5) 4) (= (y stone5) 2)) (and (= (x stone5) 2) (= (y stone5) 10)) (and (= (x stone5) 5) (= (y stone5) 10)) (and (= (x stone5) 2) (= (y stone5) 1)))
	(or (and (= (x stone6) 10) (= (y stone6) 6)) (and (= (x stone6) 1) (= (y stone6) 8)) (and (= (x stone6) 10) (= (y stone6) 5)) (and (= (x stone6) 3) (= (y stone6) 4)) (and (= (x stone6) 5) (= (y stone6) 8)) (and (= (x stone6) 2) (= (y stone6) 2)) (and (= (x stone6) 4) (= (y stone6) 2)) (and (= (x stone6) 2) (= (y stone6) 10)) (and (= (x stone6) 5) (= (y stone6) 10)) (and (= (x stone6) 2) (= (y stone6) 1)))
	(or (and (= (x stone7) 10) (= (y stone7) 6)) (and (= (x stone7) 1) (= (y stone7) 8)) (and (= (x stone7) 10) (= (y stone7) 5)) (and (= (x stone7) 3) (= (y stone7) 4)) (and (= (x stone7) 5) (= (y stone7) 8)) (and (= (x stone7) 2) (= (y stone7) 2)) (and (= (x stone7) 4) (= (y stone7) 2)) (and (= (x stone7) 2) (= (y stone7) 10)) (and (= (x stone7) 5) (= (y stone7) 10)) (and (= (x stone7) 2) (= (y stone7) 1)))
	(or (and (= (x stone8) 10) (= (y stone8) 6)) (and (= (x stone8) 1) (= (y stone8) 8)) (and (= (x stone8) 10) (= (y stone8) 5)) (and (= (x stone8) 3) (= (y stone8) 4)) (and (= (x stone8) 5) (= (y stone8) 8)) (and (= (x stone8) 2) (= (y stone8) 2)) (and (= (x stone8) 4) (= (y stone8) 2)) (and (= (x stone8) 2) (= (y stone8) 10)) (and (= (x stone8) 5) (= (y stone8) 10)) (and (= (x stone8) 2) (= (y stone8) 1)))
	(or (and (= (x stone9) 10) (= (y stone9) 6)) (and (= (x stone9) 1) (= (y stone9) 8)) (and (= (x stone9) 10) (= (y stone9) 5)) (and (= (x stone9) 3) (= (y stone9) 4)) (and (= (x stone9) 5) (= (y stone9) 8)) (and (= (x stone9) 2) (= (y stone9) 2)) (and (= (x stone9) 4) (= (y stone9) 2)) (and (= (x stone9) 2) (= (y stone9) 10)) (and (= (x stone9) 5) (= (y stone9) 10)) (and (= (x stone9) 2) (= (y stone9) 1)))
	(or (and (= (x stone10) 10) (= (y stone10) 6)) (and (= (x stone10) 1) (= (y stone10) 8)) (and (= (x stone10) 10) (= (y stone10) 5)) (and (= (x stone10) 3) (= (y stone10) 4)) (and (= (x stone10) 5) (= (y stone10) 8)) (and (= (x stone10) 2) (= (y stone10) 2)) (and (= (x stone10) 4) (= (y stone10) 2)) (and (= (x stone10) 2) (= (y stone10) 10)) (and (= (x stone10) 5) (= (y stone10) 10)) (and (= (x stone10) 2) (= (y stone10) 1)))
  ))

  
  

  
)
