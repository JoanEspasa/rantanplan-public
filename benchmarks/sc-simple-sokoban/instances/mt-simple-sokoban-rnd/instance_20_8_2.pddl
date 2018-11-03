(define (problem instance_20_8_2)
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
	(= (x player1) 1)
	(= (y player1) 17)
	(= (x stone1) 14)
	(= (y stone1) 8)
	(= (x stone2) 12)
	(= (y stone2) 10)
	(= (x stone3) 17)
	(= (y stone3) 4)
	(= (x stone4) 3)
	(= (y stone4) 3)
	(= (x stone5) 12)
	(= (y stone5) 6)
	(= (x stone6) 5)
	(= (y stone6) 2)
	(= (x stone7) 19)
	(= (y stone7) 13)
	(= (x stone8) 15)
	(= (y stone8) 5)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 4)) (and (= (x stone1) 3) (= (y stone1) 4)) (and (= (x stone1) 11) (= (y stone1) 4)) (and (= (x stone1) 10) (= (y stone1) 14)) (and (= (x stone1) 14) (= (y stone1) 9)) (and (= (x stone1) 17) (= (y stone1) 15)) (and (= (x stone1) 3) (= (y stone1) 20)) (and (= (x stone1) 18) (= (y stone1) 13)))
	(or (and (= (x stone2) 1) (= (y stone2) 4)) (and (= (x stone2) 3) (= (y stone2) 4)) (and (= (x stone2) 11) (= (y stone2) 4)) (and (= (x stone2) 10) (= (y stone2) 14)) (and (= (x stone2) 14) (= (y stone2) 9)) (and (= (x stone2) 17) (= (y stone2) 15)) (and (= (x stone2) 3) (= (y stone2) 20)) (and (= (x stone2) 18) (= (y stone2) 13)))
	(or (and (= (x stone3) 1) (= (y stone3) 4)) (and (= (x stone3) 3) (= (y stone3) 4)) (and (= (x stone3) 11) (= (y stone3) 4)) (and (= (x stone3) 10) (= (y stone3) 14)) (and (= (x stone3) 14) (= (y stone3) 9)) (and (= (x stone3) 17) (= (y stone3) 15)) (and (= (x stone3) 3) (= (y stone3) 20)) (and (= (x stone3) 18) (= (y stone3) 13)))
	(or (and (= (x stone4) 1) (= (y stone4) 4)) (and (= (x stone4) 3) (= (y stone4) 4)) (and (= (x stone4) 11) (= (y stone4) 4)) (and (= (x stone4) 10) (= (y stone4) 14)) (and (= (x stone4) 14) (= (y stone4) 9)) (and (= (x stone4) 17) (= (y stone4) 15)) (and (= (x stone4) 3) (= (y stone4) 20)) (and (= (x stone4) 18) (= (y stone4) 13)))
	(or (and (= (x stone5) 1) (= (y stone5) 4)) (and (= (x stone5) 3) (= (y stone5) 4)) (and (= (x stone5) 11) (= (y stone5) 4)) (and (= (x stone5) 10) (= (y stone5) 14)) (and (= (x stone5) 14) (= (y stone5) 9)) (and (= (x stone5) 17) (= (y stone5) 15)) (and (= (x stone5) 3) (= (y stone5) 20)) (and (= (x stone5) 18) (= (y stone5) 13)))
	(or (and (= (x stone6) 1) (= (y stone6) 4)) (and (= (x stone6) 3) (= (y stone6) 4)) (and (= (x stone6) 11) (= (y stone6) 4)) (and (= (x stone6) 10) (= (y stone6) 14)) (and (= (x stone6) 14) (= (y stone6) 9)) (and (= (x stone6) 17) (= (y stone6) 15)) (and (= (x stone6) 3) (= (y stone6) 20)) (and (= (x stone6) 18) (= (y stone6) 13)))
	(or (and (= (x stone7) 1) (= (y stone7) 4)) (and (= (x stone7) 3) (= (y stone7) 4)) (and (= (x stone7) 11) (= (y stone7) 4)) (and (= (x stone7) 10) (= (y stone7) 14)) (and (= (x stone7) 14) (= (y stone7) 9)) (and (= (x stone7) 17) (= (y stone7) 15)) (and (= (x stone7) 3) (= (y stone7) 20)) (and (= (x stone7) 18) (= (y stone7) 13)))
	(or (and (= (x stone8) 1) (= (y stone8) 4)) (and (= (x stone8) 3) (= (y stone8) 4)) (and (= (x stone8) 11) (= (y stone8) 4)) (and (= (x stone8) 10) (= (y stone8) 14)) (and (= (x stone8) 14) (= (y stone8) 9)) (and (= (x stone8) 17) (= (y stone8) 15)) (and (= (x stone8) 3) (= (y stone8) 20)) (and (= (x stone8) 18) (= (y stone8) 13)))
  ))

  
  

  
)
