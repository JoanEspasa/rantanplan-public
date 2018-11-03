(define (problem instance_100_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 100)
	(= (min_x) 1)
	(= (max_y) 100)
	(= (min_y) 1)
	(= (x player1) 48)
	(= (y player1) 25)
	(= (x stone1) 30)
	(= (y stone1) 84)
	(= (x stone2) 46)
	(= (y stone2) 64)
	(= (x stone3) 73)
	(= (y stone3) 37)
	(= (x stone4) 83)
	(= (y stone4) 81)
	(= (x stone5) 68)
	(= (y stone5) 44)
	(= (x stone6) 68)
	(= (y stone6) 74)
  )

  (:goal (and 
    (or (and (= (x stone1) 92) (= (y stone1) 4)) (and (= (x stone1) 92) (= (y stone1) 14)) (and (= (x stone1) 23) (= (y stone1) 47)) (and (= (x stone1) 63) (= (y stone1) 20)) (and (= (x stone1) 1) (= (y stone1) 24)) (and (= (x stone1) 25) (= (y stone1) 14)))
	(or (and (= (x stone2) 92) (= (y stone2) 4)) (and (= (x stone2) 92) (= (y stone2) 14)) (and (= (x stone2) 23) (= (y stone2) 47)) (and (= (x stone2) 63) (= (y stone2) 20)) (and (= (x stone2) 1) (= (y stone2) 24)) (and (= (x stone2) 25) (= (y stone2) 14)))
	(or (and (= (x stone3) 92) (= (y stone3) 4)) (and (= (x stone3) 92) (= (y stone3) 14)) (and (= (x stone3) 23) (= (y stone3) 47)) (and (= (x stone3) 63) (= (y stone3) 20)) (and (= (x stone3) 1) (= (y stone3) 24)) (and (= (x stone3) 25) (= (y stone3) 14)))
	(or (and (= (x stone4) 92) (= (y stone4) 4)) (and (= (x stone4) 92) (= (y stone4) 14)) (and (= (x stone4) 23) (= (y stone4) 47)) (and (= (x stone4) 63) (= (y stone4) 20)) (and (= (x stone4) 1) (= (y stone4) 24)) (and (= (x stone4) 25) (= (y stone4) 14)))
	(or (and (= (x stone5) 92) (= (y stone5) 4)) (and (= (x stone5) 92) (= (y stone5) 14)) (and (= (x stone5) 23) (= (y stone5) 47)) (and (= (x stone5) 63) (= (y stone5) 20)) (and (= (x stone5) 1) (= (y stone5) 24)) (and (= (x stone5) 25) (= (y stone5) 14)))
	(or (and (= (x stone6) 92) (= (y stone6) 4)) (and (= (x stone6) 92) (= (y stone6) 14)) (and (= (x stone6) 23) (= (y stone6) 47)) (and (= (x stone6) 63) (= (y stone6) 20)) (and (= (x stone6) 1) (= (y stone6) 24)) (and (= (x stone6) 25) (= (y stone6) 14)))
  ))

  
  

  
)
