(define (problem instance_30_10_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 30)
	(= (min_x) 1)
	(= (max_y) 30)
	(= (min_y) 1)
	(= (x player1) 21)
	(= (y player1) 14)
	(= (x stone1) 17)
	(= (y stone1) 9)
	(= (x stone2) 12)
	(= (y stone2) 3)
	(= (x stone3) 6)
	(= (y stone3) 8)
	(= (x stone4) 22)
	(= (y stone4) 7)
	(= (x stone5) 13)
	(= (y stone5) 8)
	(= (x stone6) 24)
	(= (y stone6) 17)
	(= (x stone7) 25)
	(= (y stone7) 25)
	(= (x stone8) 2)
	(= (y stone8) 17)
	(= (x stone9) 11)
	(= (y stone9) 22)
	(= (x stone10) 27)
	(= (y stone10) 24)
  )

  (:goal (and 
    (or (and (= (x stone1) 5) (= (y stone1) 7)) (and (= (x stone1) 8) (= (y stone1) 27)) (and (= (x stone1) 9) (= (y stone1) 6)) (and (= (x stone1) 9) (= (y stone1) 13)) (and (= (x stone1) 9) (= (y stone1) 29)) (and (= (x stone1) 9) (= (y stone1) 2)) (and (= (x stone1) 19) (= (y stone1) 19)) (and (= (x stone1) 24) (= (y stone1) 11)) (and (= (x stone1) 7) (= (y stone1) 12)) (and (= (x stone1) 5) (= (y stone1) 25)))
	(or (and (= (x stone2) 5) (= (y stone2) 7)) (and (= (x stone2) 8) (= (y stone2) 27)) (and (= (x stone2) 9) (= (y stone2) 6)) (and (= (x stone2) 9) (= (y stone2) 13)) (and (= (x stone2) 9) (= (y stone2) 29)) (and (= (x stone2) 9) (= (y stone2) 2)) (and (= (x stone2) 19) (= (y stone2) 19)) (and (= (x stone2) 24) (= (y stone2) 11)) (and (= (x stone2) 7) (= (y stone2) 12)) (and (= (x stone2) 5) (= (y stone2) 25)))
	(or (and (= (x stone3) 5) (= (y stone3) 7)) (and (= (x stone3) 8) (= (y stone3) 27)) (and (= (x stone3) 9) (= (y stone3) 6)) (and (= (x stone3) 9) (= (y stone3) 13)) (and (= (x stone3) 9) (= (y stone3) 29)) (and (= (x stone3) 9) (= (y stone3) 2)) (and (= (x stone3) 19) (= (y stone3) 19)) (and (= (x stone3) 24) (= (y stone3) 11)) (and (= (x stone3) 7) (= (y stone3) 12)) (and (= (x stone3) 5) (= (y stone3) 25)))
	(or (and (= (x stone4) 5) (= (y stone4) 7)) (and (= (x stone4) 8) (= (y stone4) 27)) (and (= (x stone4) 9) (= (y stone4) 6)) (and (= (x stone4) 9) (= (y stone4) 13)) (and (= (x stone4) 9) (= (y stone4) 29)) (and (= (x stone4) 9) (= (y stone4) 2)) (and (= (x stone4) 19) (= (y stone4) 19)) (and (= (x stone4) 24) (= (y stone4) 11)) (and (= (x stone4) 7) (= (y stone4) 12)) (and (= (x stone4) 5) (= (y stone4) 25)))
	(or (and (= (x stone5) 5) (= (y stone5) 7)) (and (= (x stone5) 8) (= (y stone5) 27)) (and (= (x stone5) 9) (= (y stone5) 6)) (and (= (x stone5) 9) (= (y stone5) 13)) (and (= (x stone5) 9) (= (y stone5) 29)) (and (= (x stone5) 9) (= (y stone5) 2)) (and (= (x stone5) 19) (= (y stone5) 19)) (and (= (x stone5) 24) (= (y stone5) 11)) (and (= (x stone5) 7) (= (y stone5) 12)) (and (= (x stone5) 5) (= (y stone5) 25)))
	(or (and (= (x stone6) 5) (= (y stone6) 7)) (and (= (x stone6) 8) (= (y stone6) 27)) (and (= (x stone6) 9) (= (y stone6) 6)) (and (= (x stone6) 9) (= (y stone6) 13)) (and (= (x stone6) 9) (= (y stone6) 29)) (and (= (x stone6) 9) (= (y stone6) 2)) (and (= (x stone6) 19) (= (y stone6) 19)) (and (= (x stone6) 24) (= (y stone6) 11)) (and (= (x stone6) 7) (= (y stone6) 12)) (and (= (x stone6) 5) (= (y stone6) 25)))
	(or (and (= (x stone7) 5) (= (y stone7) 7)) (and (= (x stone7) 8) (= (y stone7) 27)) (and (= (x stone7) 9) (= (y stone7) 6)) (and (= (x stone7) 9) (= (y stone7) 13)) (and (= (x stone7) 9) (= (y stone7) 29)) (and (= (x stone7) 9) (= (y stone7) 2)) (and (= (x stone7) 19) (= (y stone7) 19)) (and (= (x stone7) 24) (= (y stone7) 11)) (and (= (x stone7) 7) (= (y stone7) 12)) (and (= (x stone7) 5) (= (y stone7) 25)))
	(or (and (= (x stone8) 5) (= (y stone8) 7)) (and (= (x stone8) 8) (= (y stone8) 27)) (and (= (x stone8) 9) (= (y stone8) 6)) (and (= (x stone8) 9) (= (y stone8) 13)) (and (= (x stone8) 9) (= (y stone8) 29)) (and (= (x stone8) 9) (= (y stone8) 2)) (and (= (x stone8) 19) (= (y stone8) 19)) (and (= (x stone8) 24) (= (y stone8) 11)) (and (= (x stone8) 7) (= (y stone8) 12)) (and (= (x stone8) 5) (= (y stone8) 25)))
	(or (and (= (x stone9) 5) (= (y stone9) 7)) (and (= (x stone9) 8) (= (y stone9) 27)) (and (= (x stone9) 9) (= (y stone9) 6)) (and (= (x stone9) 9) (= (y stone9) 13)) (and (= (x stone9) 9) (= (y stone9) 29)) (and (= (x stone9) 9) (= (y stone9) 2)) (and (= (x stone9) 19) (= (y stone9) 19)) (and (= (x stone9) 24) (= (y stone9) 11)) (and (= (x stone9) 7) (= (y stone9) 12)) (and (= (x stone9) 5) (= (y stone9) 25)))
	(or (and (= (x stone10) 5) (= (y stone10) 7)) (and (= (x stone10) 8) (= (y stone10) 27)) (and (= (x stone10) 9) (= (y stone10) 6)) (and (= (x stone10) 9) (= (y stone10) 13)) (and (= (x stone10) 9) (= (y stone10) 29)) (and (= (x stone10) 9) (= (y stone10) 2)) (and (= (x stone10) 19) (= (y stone10) 19)) (and (= (x stone10) 24) (= (y stone10) 11)) (and (= (x stone10) 7) (= (y stone10) 12)) (and (= (x stone10) 5) (= (y stone10) 25)))
  ))

  
  

  
)
