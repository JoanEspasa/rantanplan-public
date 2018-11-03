(define (problem instance_60_6_1)
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
	(= (x player1) 46)
	(= (y player1) 52)
	(= (x stone1) 39)
	(= (y stone1) 53)
	(= (x stone2) 25)
	(= (y stone2) 22)
	(= (x stone3) 10)
	(= (y stone3) 33)
	(= (x stone4) 36)
	(= (y stone4) 49)
	(= (x stone5) 20)
	(= (y stone5) 26)
	(= (x stone6) 23)
	(= (y stone6) 52)
  )

  (:goal (and 
    (or (and (= (x stone1) 43) (= (y stone1) 31)) (and (= (x stone1) 33) (= (y stone1) 25)) (and (= (x stone1) 25) (= (y stone1) 46)) (and (= (x stone1) 43) (= (y stone1) 45)) (and (= (x stone1) 51) (= (y stone1) 54)) (and (= (x stone1) 32) (= (y stone1) 39)))
	(or (and (= (x stone2) 43) (= (y stone2) 31)) (and (= (x stone2) 33) (= (y stone2) 25)) (and (= (x stone2) 25) (= (y stone2) 46)) (and (= (x stone2) 43) (= (y stone2) 45)) (and (= (x stone2) 51) (= (y stone2) 54)) (and (= (x stone2) 32) (= (y stone2) 39)))
	(or (and (= (x stone3) 43) (= (y stone3) 31)) (and (= (x stone3) 33) (= (y stone3) 25)) (and (= (x stone3) 25) (= (y stone3) 46)) (and (= (x stone3) 43) (= (y stone3) 45)) (and (= (x stone3) 51) (= (y stone3) 54)) (and (= (x stone3) 32) (= (y stone3) 39)))
	(or (and (= (x stone4) 43) (= (y stone4) 31)) (and (= (x stone4) 33) (= (y stone4) 25)) (and (= (x stone4) 25) (= (y stone4) 46)) (and (= (x stone4) 43) (= (y stone4) 45)) (and (= (x stone4) 51) (= (y stone4) 54)) (and (= (x stone4) 32) (= (y stone4) 39)))
	(or (and (= (x stone5) 43) (= (y stone5) 31)) (and (= (x stone5) 33) (= (y stone5) 25)) (and (= (x stone5) 25) (= (y stone5) 46)) (and (= (x stone5) 43) (= (y stone5) 45)) (and (= (x stone5) 51) (= (y stone5) 54)) (and (= (x stone5) 32) (= (y stone5) 39)))
	(or (and (= (x stone6) 43) (= (y stone6) 31)) (and (= (x stone6) 33) (= (y stone6) 25)) (and (= (x stone6) 25) (= (y stone6) 46)) (and (= (x stone6) 43) (= (y stone6) 45)) (and (= (x stone6) 51) (= (y stone6) 54)) (and (= (x stone6) 32) (= (y stone6) 39)))
  ))

  
  

  
)
