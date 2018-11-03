(define (problem instance_10_10_2)
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
	(= (x player1) 10)
	(= (y player1) 6)
	(= (x stone1) 7)
	(= (y stone1) 8)
	(= (x stone2) 7)
	(= (y stone2) 2)
	(= (x stone3) 9)
	(= (y stone3) 9)
	(= (x stone4) 2)
	(= (y stone4) 5)
	(= (x stone5) 6)
	(= (y stone5) 7)
	(= (x stone6) 5)
	(= (y stone6) 4)
	(= (x stone7) 8)
	(= (y stone7) 2)
	(= (x stone8) 3)
	(= (y stone8) 7)
	(= (x stone9) 4)
	(= (y stone9) 6)
	(= (x stone10) 3)
	(= (y stone10) 6)
  )

  (:goal (and 
    (or (and (= (x stone1) 4) (= (y stone1) 5)) (and (= (x stone1) 2) (= (y stone1) 9)) (and (= (x stone1) 6) (= (y stone1) 5)) (and (= (x stone1) 8) (= (y stone1) 10)) (and (= (x stone1) 7) (= (y stone1) 3)) (and (= (x stone1) 4) (= (y stone1) 7)) (and (= (x stone1) 5) (= (y stone1) 5)) (and (= (x stone1) 7) (= (y stone1) 6)) (and (= (x stone1) 10) (= (y stone1) 9)) (and (= (x stone1) 9) (= (y stone1) 3)))
	(or (and (= (x stone2) 4) (= (y stone2) 5)) (and (= (x stone2) 2) (= (y stone2) 9)) (and (= (x stone2) 6) (= (y stone2) 5)) (and (= (x stone2) 8) (= (y stone2) 10)) (and (= (x stone2) 7) (= (y stone2) 3)) (and (= (x stone2) 4) (= (y stone2) 7)) (and (= (x stone2) 5) (= (y stone2) 5)) (and (= (x stone2) 7) (= (y stone2) 6)) (and (= (x stone2) 10) (= (y stone2) 9)) (and (= (x stone2) 9) (= (y stone2) 3)))
	(or (and (= (x stone3) 4) (= (y stone3) 5)) (and (= (x stone3) 2) (= (y stone3) 9)) (and (= (x stone3) 6) (= (y stone3) 5)) (and (= (x stone3) 8) (= (y stone3) 10)) (and (= (x stone3) 7) (= (y stone3) 3)) (and (= (x stone3) 4) (= (y stone3) 7)) (and (= (x stone3) 5) (= (y stone3) 5)) (and (= (x stone3) 7) (= (y stone3) 6)) (and (= (x stone3) 10) (= (y stone3) 9)) (and (= (x stone3) 9) (= (y stone3) 3)))
	(or (and (= (x stone4) 4) (= (y stone4) 5)) (and (= (x stone4) 2) (= (y stone4) 9)) (and (= (x stone4) 6) (= (y stone4) 5)) (and (= (x stone4) 8) (= (y stone4) 10)) (and (= (x stone4) 7) (= (y stone4) 3)) (and (= (x stone4) 4) (= (y stone4) 7)) (and (= (x stone4) 5) (= (y stone4) 5)) (and (= (x stone4) 7) (= (y stone4) 6)) (and (= (x stone4) 10) (= (y stone4) 9)) (and (= (x stone4) 9) (= (y stone4) 3)))
	(or (and (= (x stone5) 4) (= (y stone5) 5)) (and (= (x stone5) 2) (= (y stone5) 9)) (and (= (x stone5) 6) (= (y stone5) 5)) (and (= (x stone5) 8) (= (y stone5) 10)) (and (= (x stone5) 7) (= (y stone5) 3)) (and (= (x stone5) 4) (= (y stone5) 7)) (and (= (x stone5) 5) (= (y stone5) 5)) (and (= (x stone5) 7) (= (y stone5) 6)) (and (= (x stone5) 10) (= (y stone5) 9)) (and (= (x stone5) 9) (= (y stone5) 3)))
	(or (and (= (x stone6) 4) (= (y stone6) 5)) (and (= (x stone6) 2) (= (y stone6) 9)) (and (= (x stone6) 6) (= (y stone6) 5)) (and (= (x stone6) 8) (= (y stone6) 10)) (and (= (x stone6) 7) (= (y stone6) 3)) (and (= (x stone6) 4) (= (y stone6) 7)) (and (= (x stone6) 5) (= (y stone6) 5)) (and (= (x stone6) 7) (= (y stone6) 6)) (and (= (x stone6) 10) (= (y stone6) 9)) (and (= (x stone6) 9) (= (y stone6) 3)))
	(or (and (= (x stone7) 4) (= (y stone7) 5)) (and (= (x stone7) 2) (= (y stone7) 9)) (and (= (x stone7) 6) (= (y stone7) 5)) (and (= (x stone7) 8) (= (y stone7) 10)) (and (= (x stone7) 7) (= (y stone7) 3)) (and (= (x stone7) 4) (= (y stone7) 7)) (and (= (x stone7) 5) (= (y stone7) 5)) (and (= (x stone7) 7) (= (y stone7) 6)) (and (= (x stone7) 10) (= (y stone7) 9)) (and (= (x stone7) 9) (= (y stone7) 3)))
	(or (and (= (x stone8) 4) (= (y stone8) 5)) (and (= (x stone8) 2) (= (y stone8) 9)) (and (= (x stone8) 6) (= (y stone8) 5)) (and (= (x stone8) 8) (= (y stone8) 10)) (and (= (x stone8) 7) (= (y stone8) 3)) (and (= (x stone8) 4) (= (y stone8) 7)) (and (= (x stone8) 5) (= (y stone8) 5)) (and (= (x stone8) 7) (= (y stone8) 6)) (and (= (x stone8) 10) (= (y stone8) 9)) (and (= (x stone8) 9) (= (y stone8) 3)))
	(or (and (= (x stone9) 4) (= (y stone9) 5)) (and (= (x stone9) 2) (= (y stone9) 9)) (and (= (x stone9) 6) (= (y stone9) 5)) (and (= (x stone9) 8) (= (y stone9) 10)) (and (= (x stone9) 7) (= (y stone9) 3)) (and (= (x stone9) 4) (= (y stone9) 7)) (and (= (x stone9) 5) (= (y stone9) 5)) (and (= (x stone9) 7) (= (y stone9) 6)) (and (= (x stone9) 10) (= (y stone9) 9)) (and (= (x stone9) 9) (= (y stone9) 3)))
	(or (and (= (x stone10) 4) (= (y stone10) 5)) (and (= (x stone10) 2) (= (y stone10) 9)) (and (= (x stone10) 6) (= (y stone10) 5)) (and (= (x stone10) 8) (= (y stone10) 10)) (and (= (x stone10) 7) (= (y stone10) 3)) (and (= (x stone10) 4) (= (y stone10) 7)) (and (= (x stone10) 5) (= (y stone10) 5)) (and (= (x stone10) 7) (= (y stone10) 6)) (and (= (x stone10) 10) (= (y stone10) 9)) (and (= (x stone10) 9) (= (y stone10) 3)))
  ))

  
  

  
)
