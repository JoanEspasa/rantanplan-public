(define (problem instance_60_6_3)
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
	(= (x player1) 35)
	(= (y player1) 52)
	(= (x stone1) 58)
	(= (y stone1) 35)
	(= (x stone2) 34)
	(= (y stone2) 38)
	(= (x stone3) 36)
	(= (y stone3) 46)
	(= (x stone4) 43)
	(= (y stone4) 9)
	(= (x stone5) 46)
	(= (y stone5) 15)
	(= (x stone6) 41)
	(= (y stone6) 53)
  )

  (:goal (and 
    (or (and (= (x stone1) 21) (= (y stone1) 21)) (and (= (x stone1) 52) (= (y stone1) 50)) (and (= (x stone1) 8) (= (y stone1) 20)) (and (= (x stone1) 57) (= (y stone1) 58)) (and (= (x stone1) 29) (= (y stone1) 27)) (and (= (x stone1) 20) (= (y stone1) 32)))
	(or (and (= (x stone2) 21) (= (y stone2) 21)) (and (= (x stone2) 52) (= (y stone2) 50)) (and (= (x stone2) 8) (= (y stone2) 20)) (and (= (x stone2) 57) (= (y stone2) 58)) (and (= (x stone2) 29) (= (y stone2) 27)) (and (= (x stone2) 20) (= (y stone2) 32)))
	(or (and (= (x stone3) 21) (= (y stone3) 21)) (and (= (x stone3) 52) (= (y stone3) 50)) (and (= (x stone3) 8) (= (y stone3) 20)) (and (= (x stone3) 57) (= (y stone3) 58)) (and (= (x stone3) 29) (= (y stone3) 27)) (and (= (x stone3) 20) (= (y stone3) 32)))
	(or (and (= (x stone4) 21) (= (y stone4) 21)) (and (= (x stone4) 52) (= (y stone4) 50)) (and (= (x stone4) 8) (= (y stone4) 20)) (and (= (x stone4) 57) (= (y stone4) 58)) (and (= (x stone4) 29) (= (y stone4) 27)) (and (= (x stone4) 20) (= (y stone4) 32)))
	(or (and (= (x stone5) 21) (= (y stone5) 21)) (and (= (x stone5) 52) (= (y stone5) 50)) (and (= (x stone5) 8) (= (y stone5) 20)) (and (= (x stone5) 57) (= (y stone5) 58)) (and (= (x stone5) 29) (= (y stone5) 27)) (and (= (x stone5) 20) (= (y stone5) 32)))
	(or (and (= (x stone6) 21) (= (y stone6) 21)) (and (= (x stone6) 52) (= (y stone6) 50)) (and (= (x stone6) 8) (= (y stone6) 20)) (and (= (x stone6) 57) (= (y stone6) 58)) (and (= (x stone6) 29) (= (y stone6) 27)) (and (= (x stone6) 20) (= (y stone6) 32)))
  ))

  
  

  
)
