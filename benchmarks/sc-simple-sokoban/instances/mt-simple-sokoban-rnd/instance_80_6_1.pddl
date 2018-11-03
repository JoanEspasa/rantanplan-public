(define (problem instance_80_6_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 80)
	(= (min_x) 1)
	(= (max_y) 80)
	(= (min_y) 1)
	(= (x player1) 51)
	(= (y player1) 29)
	(= (x stone1) 66)
	(= (y stone1) 6)
	(= (x stone2) 69)
	(= (y stone2) 27)
	(= (x stone3) 5)
	(= (y stone3) 26)
	(= (x stone4) 58)
	(= (y stone4) 79)
	(= (x stone5) 13)
	(= (y stone5) 58)
	(= (x stone6) 72)
	(= (y stone6) 75)
  )

  (:goal (and 
    (or (and (= (x stone1) 71) (= (y stone1) 41)) (and (= (x stone1) 24) (= (y stone1) 64)) (and (= (x stone1) 18) (= (y stone1) 49)) (and (= (x stone1) 80) (= (y stone1) 21)) (and (= (x stone1) 71) (= (y stone1) 63)) (and (= (x stone1) 34) (= (y stone1) 43)))
	(or (and (= (x stone2) 71) (= (y stone2) 41)) (and (= (x stone2) 24) (= (y stone2) 64)) (and (= (x stone2) 18) (= (y stone2) 49)) (and (= (x stone2) 80) (= (y stone2) 21)) (and (= (x stone2) 71) (= (y stone2) 63)) (and (= (x stone2) 34) (= (y stone2) 43)))
	(or (and (= (x stone3) 71) (= (y stone3) 41)) (and (= (x stone3) 24) (= (y stone3) 64)) (and (= (x stone3) 18) (= (y stone3) 49)) (and (= (x stone3) 80) (= (y stone3) 21)) (and (= (x stone3) 71) (= (y stone3) 63)) (and (= (x stone3) 34) (= (y stone3) 43)))
	(or (and (= (x stone4) 71) (= (y stone4) 41)) (and (= (x stone4) 24) (= (y stone4) 64)) (and (= (x stone4) 18) (= (y stone4) 49)) (and (= (x stone4) 80) (= (y stone4) 21)) (and (= (x stone4) 71) (= (y stone4) 63)) (and (= (x stone4) 34) (= (y stone4) 43)))
	(or (and (= (x stone5) 71) (= (y stone5) 41)) (and (= (x stone5) 24) (= (y stone5) 64)) (and (= (x stone5) 18) (= (y stone5) 49)) (and (= (x stone5) 80) (= (y stone5) 21)) (and (= (x stone5) 71) (= (y stone5) 63)) (and (= (x stone5) 34) (= (y stone5) 43)))
	(or (and (= (x stone6) 71) (= (y stone6) 41)) (and (= (x stone6) 24) (= (y stone6) 64)) (and (= (x stone6) 18) (= (y stone6) 49)) (and (= (x stone6) 80) (= (y stone6) 21)) (and (= (x stone6) 71) (= (y stone6) 63)) (and (= (x stone6) 34) (= (y stone6) 43)))
  ))

  
  

  
)
