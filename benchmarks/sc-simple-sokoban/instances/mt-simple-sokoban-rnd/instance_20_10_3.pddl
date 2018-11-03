(define (problem instance_20_10_3)
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
	(= (x player1) 3)
	(= (y player1) 5)
	(= (x stone1) 6)
	(= (y stone1) 12)
	(= (x stone2) 2)
	(= (y stone2) 5)
	(= (x stone3) 2)
	(= (y stone3) 2)
	(= (x stone4) 16)
	(= (y stone4) 6)
	(= (x stone5) 10)
	(= (y stone5) 8)
	(= (x stone6) 2)
	(= (y stone6) 17)
	(= (x stone7) 4)
	(= (y stone7) 4)
	(= (x stone8) 14)
	(= (y stone8) 13)
	(= (x stone9) 18)
	(= (y stone9) 12)
	(= (x stone10) 2)
	(= (y stone10) 16)
  )

  (:goal (and 
    (or (and (= (x stone1) 3) (= (y stone1) 10)) (and (= (x stone1) 12) (= (y stone1) 19)) (and (= (x stone1) 2) (= (y stone1) 14)) (and (= (x stone1) 13) (= (y stone1) 20)) (and (= (x stone1) 3) (= (y stone1) 4)) (and (= (x stone1) 17) (= (y stone1) 18)) (and (= (x stone1) 13) (= (y stone1) 6)) (and (= (x stone1) 1) (= (y stone1) 13)) (and (= (x stone1) 6) (= (y stone1) 8)) (and (= (x stone1) 17) (= (y stone1) 10)))
	(or (and (= (x stone2) 3) (= (y stone2) 10)) (and (= (x stone2) 12) (= (y stone2) 19)) (and (= (x stone2) 2) (= (y stone2) 14)) (and (= (x stone2) 13) (= (y stone2) 20)) (and (= (x stone2) 3) (= (y stone2) 4)) (and (= (x stone2) 17) (= (y stone2) 18)) (and (= (x stone2) 13) (= (y stone2) 6)) (and (= (x stone2) 1) (= (y stone2) 13)) (and (= (x stone2) 6) (= (y stone2) 8)) (and (= (x stone2) 17) (= (y stone2) 10)))
	(or (and (= (x stone3) 3) (= (y stone3) 10)) (and (= (x stone3) 12) (= (y stone3) 19)) (and (= (x stone3) 2) (= (y stone3) 14)) (and (= (x stone3) 13) (= (y stone3) 20)) (and (= (x stone3) 3) (= (y stone3) 4)) (and (= (x stone3) 17) (= (y stone3) 18)) (and (= (x stone3) 13) (= (y stone3) 6)) (and (= (x stone3) 1) (= (y stone3) 13)) (and (= (x stone3) 6) (= (y stone3) 8)) (and (= (x stone3) 17) (= (y stone3) 10)))
	(or (and (= (x stone4) 3) (= (y stone4) 10)) (and (= (x stone4) 12) (= (y stone4) 19)) (and (= (x stone4) 2) (= (y stone4) 14)) (and (= (x stone4) 13) (= (y stone4) 20)) (and (= (x stone4) 3) (= (y stone4) 4)) (and (= (x stone4) 17) (= (y stone4) 18)) (and (= (x stone4) 13) (= (y stone4) 6)) (and (= (x stone4) 1) (= (y stone4) 13)) (and (= (x stone4) 6) (= (y stone4) 8)) (and (= (x stone4) 17) (= (y stone4) 10)))
	(or (and (= (x stone5) 3) (= (y stone5) 10)) (and (= (x stone5) 12) (= (y stone5) 19)) (and (= (x stone5) 2) (= (y stone5) 14)) (and (= (x stone5) 13) (= (y stone5) 20)) (and (= (x stone5) 3) (= (y stone5) 4)) (and (= (x stone5) 17) (= (y stone5) 18)) (and (= (x stone5) 13) (= (y stone5) 6)) (and (= (x stone5) 1) (= (y stone5) 13)) (and (= (x stone5) 6) (= (y stone5) 8)) (and (= (x stone5) 17) (= (y stone5) 10)))
	(or (and (= (x stone6) 3) (= (y stone6) 10)) (and (= (x stone6) 12) (= (y stone6) 19)) (and (= (x stone6) 2) (= (y stone6) 14)) (and (= (x stone6) 13) (= (y stone6) 20)) (and (= (x stone6) 3) (= (y stone6) 4)) (and (= (x stone6) 17) (= (y stone6) 18)) (and (= (x stone6) 13) (= (y stone6) 6)) (and (= (x stone6) 1) (= (y stone6) 13)) (and (= (x stone6) 6) (= (y stone6) 8)) (and (= (x stone6) 17) (= (y stone6) 10)))
	(or (and (= (x stone7) 3) (= (y stone7) 10)) (and (= (x stone7) 12) (= (y stone7) 19)) (and (= (x stone7) 2) (= (y stone7) 14)) (and (= (x stone7) 13) (= (y stone7) 20)) (and (= (x stone7) 3) (= (y stone7) 4)) (and (= (x stone7) 17) (= (y stone7) 18)) (and (= (x stone7) 13) (= (y stone7) 6)) (and (= (x stone7) 1) (= (y stone7) 13)) (and (= (x stone7) 6) (= (y stone7) 8)) (and (= (x stone7) 17) (= (y stone7) 10)))
	(or (and (= (x stone8) 3) (= (y stone8) 10)) (and (= (x stone8) 12) (= (y stone8) 19)) (and (= (x stone8) 2) (= (y stone8) 14)) (and (= (x stone8) 13) (= (y stone8) 20)) (and (= (x stone8) 3) (= (y stone8) 4)) (and (= (x stone8) 17) (= (y stone8) 18)) (and (= (x stone8) 13) (= (y stone8) 6)) (and (= (x stone8) 1) (= (y stone8) 13)) (and (= (x stone8) 6) (= (y stone8) 8)) (and (= (x stone8) 17) (= (y stone8) 10)))
	(or (and (= (x stone9) 3) (= (y stone9) 10)) (and (= (x stone9) 12) (= (y stone9) 19)) (and (= (x stone9) 2) (= (y stone9) 14)) (and (= (x stone9) 13) (= (y stone9) 20)) (and (= (x stone9) 3) (= (y stone9) 4)) (and (= (x stone9) 17) (= (y stone9) 18)) (and (= (x stone9) 13) (= (y stone9) 6)) (and (= (x stone9) 1) (= (y stone9) 13)) (and (= (x stone9) 6) (= (y stone9) 8)) (and (= (x stone9) 17) (= (y stone9) 10)))
	(or (and (= (x stone10) 3) (= (y stone10) 10)) (and (= (x stone10) 12) (= (y stone10) 19)) (and (= (x stone10) 2) (= (y stone10) 14)) (and (= (x stone10) 13) (= (y stone10) 20)) (and (= (x stone10) 3) (= (y stone10) 4)) (and (= (x stone10) 17) (= (y stone10) 18)) (and (= (x stone10) 13) (= (y stone10) 6)) (and (= (x stone10) 1) (= (y stone10) 13)) (and (= (x stone10) 6) (= (y stone10) 8)) (and (= (x stone10) 17) (= (y stone10) 10)))
  ))

  
  

  
)
