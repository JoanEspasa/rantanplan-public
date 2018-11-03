(define (problem instance_20_8_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 - stone
	player1 - player
  )

  (:init
    (= (max_x) 20)
	(= (min_x) 1)
	(= (max_y) 20)
	(= (min_y) 1)
	(= (x player1) 16)
	(= (y player1) 8)
	(= (x stone1) 15)
	(= (y stone1) 5)
	(= (x stone2) 13)
	(= (y stone2) 10)
	(= (x stone3) 11)
	(= (y stone3) 10)
	(= (x stone4) 2)
	(= (y stone4) 2)
	(= (x stone5) 7)
	(= (y stone5) 13)
	(= (x stone6) 15)
	(= (y stone6) 13)
	(= (x stone7) 16)
	(= (y stone7) 6)
	(= (x stone8) 12)
	(= (y stone8) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 7) (= (y stone1) 12)) (and (= (x stone1) 13) (= (y stone1) 14)) (and (= (x stone1) 10) (= (y stone1) 12)) (and (= (x stone1) 12) (= (y stone1) 19)) (and (= (x stone1) 8) (= (y stone1) 10)) (and (= (x stone1) 15) (= (y stone1) 16)) (and (= (x stone1) 3) (= (y stone1) 19)) (and (= (x stone1) 6) (= (y stone1) 6)))
	(or (and (= (x stone2) 7) (= (y stone2) 12)) (and (= (x stone2) 13) (= (y stone2) 14)) (and (= (x stone2) 10) (= (y stone2) 12)) (and (= (x stone2) 12) (= (y stone2) 19)) (and (= (x stone2) 8) (= (y stone2) 10)) (and (= (x stone2) 15) (= (y stone2) 16)) (and (= (x stone2) 3) (= (y stone2) 19)) (and (= (x stone2) 6) (= (y stone2) 6)))
	(or (and (= (x stone3) 7) (= (y stone3) 12)) (and (= (x stone3) 13) (= (y stone3) 14)) (and (= (x stone3) 10) (= (y stone3) 12)) (and (= (x stone3) 12) (= (y stone3) 19)) (and (= (x stone3) 8) (= (y stone3) 10)) (and (= (x stone3) 15) (= (y stone3) 16)) (and (= (x stone3) 3) (= (y stone3) 19)) (and (= (x stone3) 6) (= (y stone3) 6)))
	(or (and (= (x stone4) 7) (= (y stone4) 12)) (and (= (x stone4) 13) (= (y stone4) 14)) (and (= (x stone4) 10) (= (y stone4) 12)) (and (= (x stone4) 12) (= (y stone4) 19)) (and (= (x stone4) 8) (= (y stone4) 10)) (and (= (x stone4) 15) (= (y stone4) 16)) (and (= (x stone4) 3) (= (y stone4) 19)) (and (= (x stone4) 6) (= (y stone4) 6)))
	(or (and (= (x stone5) 7) (= (y stone5) 12)) (and (= (x stone5) 13) (= (y stone5) 14)) (and (= (x stone5) 10) (= (y stone5) 12)) (and (= (x stone5) 12) (= (y stone5) 19)) (and (= (x stone5) 8) (= (y stone5) 10)) (and (= (x stone5) 15) (= (y stone5) 16)) (and (= (x stone5) 3) (= (y stone5) 19)) (and (= (x stone5) 6) (= (y stone5) 6)))
	(or (and (= (x stone6) 7) (= (y stone6) 12)) (and (= (x stone6) 13) (= (y stone6) 14)) (and (= (x stone6) 10) (= (y stone6) 12)) (and (= (x stone6) 12) (= (y stone6) 19)) (and (= (x stone6) 8) (= (y stone6) 10)) (and (= (x stone6) 15) (= (y stone6) 16)) (and (= (x stone6) 3) (= (y stone6) 19)) (and (= (x stone6) 6) (= (y stone6) 6)))
	(or (and (= (x stone7) 7) (= (y stone7) 12)) (and (= (x stone7) 13) (= (y stone7) 14)) (and (= (x stone7) 10) (= (y stone7) 12)) (and (= (x stone7) 12) (= (y stone7) 19)) (and (= (x stone7) 8) (= (y stone7) 10)) (and (= (x stone7) 15) (= (y stone7) 16)) (and (= (x stone7) 3) (= (y stone7) 19)) (and (= (x stone7) 6) (= (y stone7) 6)))
	(or (and (= (x stone8) 7) (= (y stone8) 12)) (and (= (x stone8) 13) (= (y stone8) 14)) (and (= (x stone8) 10) (= (y stone8) 12)) (and (= (x stone8) 12) (= (y stone8) 19)) (and (= (x stone8) 8) (= (y stone8) 10)) (and (= (x stone8) 15) (= (y stone8) 16)) (and (= (x stone8) 3) (= (y stone8) 19)) (and (= (x stone8) 6) (= (y stone8) 6)))
  ))

  
  

  
)
