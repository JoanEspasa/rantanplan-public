(define (problem instance_35_10_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 35)
	(= (min_x) 1)
	(= (max_y) 35)
	(= (min_y) 1)
	(= (x player1) 9)
	(= (y player1) 1)
	(= (x stone1) 22)
	(= (y stone1) 7)
	(= (x stone2) 2)
	(= (y stone2) 31)
	(= (x stone3) 23)
	(= (y stone3) 5)
	(= (x stone4) 31)
	(= (y stone4) 25)
	(= (x stone5) 14)
	(= (y stone5) 33)
	(= (x stone6) 28)
	(= (y stone6) 6)
	(= (x stone7) 15)
	(= (y stone7) 15)
	(= (x stone8) 25)
	(= (y stone8) 10)
	(= (x stone9) 14)
	(= (y stone9) 23)
	(= (x stone10) 2)
	(= (y stone10) 11)
  )

  (:goal (and 
    (or (and (= (x stone1) 3) (= (y stone1) 12)) (and (= (x stone1) 35) (= (y stone1) 19)) (and (= (x stone1) 28) (= (y stone1) 11)) (and (= (x stone1) 6) (= (y stone1) 22)) (and (= (x stone1) 4) (= (y stone1) 23)) (and (= (x stone1) 28) (= (y stone1) 15)) (and (= (x stone1) 34) (= (y stone1) 13)) (and (= (x stone1) 34) (= (y stone1) 6)) (and (= (x stone1) 10) (= (y stone1) 4)) (and (= (x stone1) 11) (= (y stone1) 11)))
	(or (and (= (x stone2) 3) (= (y stone2) 12)) (and (= (x stone2) 35) (= (y stone2) 19)) (and (= (x stone2) 28) (= (y stone2) 11)) (and (= (x stone2) 6) (= (y stone2) 22)) (and (= (x stone2) 4) (= (y stone2) 23)) (and (= (x stone2) 28) (= (y stone2) 15)) (and (= (x stone2) 34) (= (y stone2) 13)) (and (= (x stone2) 34) (= (y stone2) 6)) (and (= (x stone2) 10) (= (y stone2) 4)) (and (= (x stone2) 11) (= (y stone2) 11)))
	(or (and (= (x stone3) 3) (= (y stone3) 12)) (and (= (x stone3) 35) (= (y stone3) 19)) (and (= (x stone3) 28) (= (y stone3) 11)) (and (= (x stone3) 6) (= (y stone3) 22)) (and (= (x stone3) 4) (= (y stone3) 23)) (and (= (x stone3) 28) (= (y stone3) 15)) (and (= (x stone3) 34) (= (y stone3) 13)) (and (= (x stone3) 34) (= (y stone3) 6)) (and (= (x stone3) 10) (= (y stone3) 4)) (and (= (x stone3) 11) (= (y stone3) 11)))
	(or (and (= (x stone4) 3) (= (y stone4) 12)) (and (= (x stone4) 35) (= (y stone4) 19)) (and (= (x stone4) 28) (= (y stone4) 11)) (and (= (x stone4) 6) (= (y stone4) 22)) (and (= (x stone4) 4) (= (y stone4) 23)) (and (= (x stone4) 28) (= (y stone4) 15)) (and (= (x stone4) 34) (= (y stone4) 13)) (and (= (x stone4) 34) (= (y stone4) 6)) (and (= (x stone4) 10) (= (y stone4) 4)) (and (= (x stone4) 11) (= (y stone4) 11)))
	(or (and (= (x stone5) 3) (= (y stone5) 12)) (and (= (x stone5) 35) (= (y stone5) 19)) (and (= (x stone5) 28) (= (y stone5) 11)) (and (= (x stone5) 6) (= (y stone5) 22)) (and (= (x stone5) 4) (= (y stone5) 23)) (and (= (x stone5) 28) (= (y stone5) 15)) (and (= (x stone5) 34) (= (y stone5) 13)) (and (= (x stone5) 34) (= (y stone5) 6)) (and (= (x stone5) 10) (= (y stone5) 4)) (and (= (x stone5) 11) (= (y stone5) 11)))
	(or (and (= (x stone6) 3) (= (y stone6) 12)) (and (= (x stone6) 35) (= (y stone6) 19)) (and (= (x stone6) 28) (= (y stone6) 11)) (and (= (x stone6) 6) (= (y stone6) 22)) (and (= (x stone6) 4) (= (y stone6) 23)) (and (= (x stone6) 28) (= (y stone6) 15)) (and (= (x stone6) 34) (= (y stone6) 13)) (and (= (x stone6) 34) (= (y stone6) 6)) (and (= (x stone6) 10) (= (y stone6) 4)) (and (= (x stone6) 11) (= (y stone6) 11)))
	(or (and (= (x stone7) 3) (= (y stone7) 12)) (and (= (x stone7) 35) (= (y stone7) 19)) (and (= (x stone7) 28) (= (y stone7) 11)) (and (= (x stone7) 6) (= (y stone7) 22)) (and (= (x stone7) 4) (= (y stone7) 23)) (and (= (x stone7) 28) (= (y stone7) 15)) (and (= (x stone7) 34) (= (y stone7) 13)) (and (= (x stone7) 34) (= (y stone7) 6)) (and (= (x stone7) 10) (= (y stone7) 4)) (and (= (x stone7) 11) (= (y stone7) 11)))
	(or (and (= (x stone8) 3) (= (y stone8) 12)) (and (= (x stone8) 35) (= (y stone8) 19)) (and (= (x stone8) 28) (= (y stone8) 11)) (and (= (x stone8) 6) (= (y stone8) 22)) (and (= (x stone8) 4) (= (y stone8) 23)) (and (= (x stone8) 28) (= (y stone8) 15)) (and (= (x stone8) 34) (= (y stone8) 13)) (and (= (x stone8) 34) (= (y stone8) 6)) (and (= (x stone8) 10) (= (y stone8) 4)) (and (= (x stone8) 11) (= (y stone8) 11)))
	(or (and (= (x stone9) 3) (= (y stone9) 12)) (and (= (x stone9) 35) (= (y stone9) 19)) (and (= (x stone9) 28) (= (y stone9) 11)) (and (= (x stone9) 6) (= (y stone9) 22)) (and (= (x stone9) 4) (= (y stone9) 23)) (and (= (x stone9) 28) (= (y stone9) 15)) (and (= (x stone9) 34) (= (y stone9) 13)) (and (= (x stone9) 34) (= (y stone9) 6)) (and (= (x stone9) 10) (= (y stone9) 4)) (and (= (x stone9) 11) (= (y stone9) 11)))
	(or (and (= (x stone10) 3) (= (y stone10) 12)) (and (= (x stone10) 35) (= (y stone10) 19)) (and (= (x stone10) 28) (= (y stone10) 11)) (and (= (x stone10) 6) (= (y stone10) 22)) (and (= (x stone10) 4) (= (y stone10) 23)) (and (= (x stone10) 28) (= (y stone10) 15)) (and (= (x stone10) 34) (= (y stone10) 13)) (and (= (x stone10) 34) (= (y stone10) 6)) (and (= (x stone10) 10) (= (y stone10) 4)) (and (= (x stone10) 11) (= (y stone10) 11)))
  ))

  
  

  
)
