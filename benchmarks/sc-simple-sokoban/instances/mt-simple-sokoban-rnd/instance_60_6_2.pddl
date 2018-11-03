(define (problem instance_60_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 60)
	(= (min_x) 1)
	(= (max_y) 60)
	(= (min_y) 1)
	(= (x player1) 58)
	(= (y player1) 10)
	(= (x stone1) 44)
	(= (y stone1) 49)
	(= (x stone2) 58)
	(= (y stone2) 5)
	(= (x stone3) 43)
	(= (y stone3) 47)
	(= (x stone4) 54)
	(= (y stone4) 20)
	(= (x stone5) 35)
	(= (y stone5) 24)
	(= (x stone6) 49)
	(= (y stone6) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 34) (= (y stone1) 14)) (and (= (x stone1) 25) (= (y stone1) 55)) (and (= (x stone1) 50) (= (y stone1) 32)) (and (= (x stone1) 57) (= (y stone1) 14)) (and (= (x stone1) 1) (= (y stone1) 46)) (and (= (x stone1) 7) (= (y stone1) 37)))
	(or (and (= (x stone2) 34) (= (y stone2) 14)) (and (= (x stone2) 25) (= (y stone2) 55)) (and (= (x stone2) 50) (= (y stone2) 32)) (and (= (x stone2) 57) (= (y stone2) 14)) (and (= (x stone2) 1) (= (y stone2) 46)) (and (= (x stone2) 7) (= (y stone2) 37)))
	(or (and (= (x stone3) 34) (= (y stone3) 14)) (and (= (x stone3) 25) (= (y stone3) 55)) (and (= (x stone3) 50) (= (y stone3) 32)) (and (= (x stone3) 57) (= (y stone3) 14)) (and (= (x stone3) 1) (= (y stone3) 46)) (and (= (x stone3) 7) (= (y stone3) 37)))
	(or (and (= (x stone4) 34) (= (y stone4) 14)) (and (= (x stone4) 25) (= (y stone4) 55)) (and (= (x stone4) 50) (= (y stone4) 32)) (and (= (x stone4) 57) (= (y stone4) 14)) (and (= (x stone4) 1) (= (y stone4) 46)) (and (= (x stone4) 7) (= (y stone4) 37)))
	(or (and (= (x stone5) 34) (= (y stone5) 14)) (and (= (x stone5) 25) (= (y stone5) 55)) (and (= (x stone5) 50) (= (y stone5) 32)) (and (= (x stone5) 57) (= (y stone5) 14)) (and (= (x stone5) 1) (= (y stone5) 46)) (and (= (x stone5) 7) (= (y stone5) 37)))
	(or (and (= (x stone6) 34) (= (y stone6) 14)) (and (= (x stone6) 25) (= (y stone6) 55)) (and (= (x stone6) 50) (= (y stone6) 32)) (and (= (x stone6) 57) (= (y stone6) 14)) (and (= (x stone6) 1) (= (y stone6) 46)) (and (= (x stone6) 7) (= (y stone6) 37)))
  ))

  
  

  
)
