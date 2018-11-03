(define (problem instance_55_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 55)
	(= (min_x) 1)
	(= (max_y) 55)
	(= (min_y) 1)
	(= (x player1) 6)
	(= (y player1) 27)
	(= (x stone1) 37)
	(= (y stone1) 38)
	(= (x stone2) 26)
	(= (y stone2) 6)
	(= (x stone3) 44)
	(= (y stone3) 30)
	(= (x stone4) 3)
	(= (y stone4) 29)
	(= (x stone5) 25)
	(= (y stone5) 16)
	(= (x stone6) 33)
	(= (y stone6) 35)
  )

  (:goal (and 
    (or (and (= (x stone1) 16) (= (y stone1) 10)) (and (= (x stone1) 21) (= (y stone1) 17)) (and (= (x stone1) 51) (= (y stone1) 31)) (and (= (x stone1) 14) (= (y stone1) 19)) (and (= (x stone1) 2) (= (y stone1) 48)) (and (= (x stone1) 46) (= (y stone1) 49)))
	(or (and (= (x stone2) 16) (= (y stone2) 10)) (and (= (x stone2) 21) (= (y stone2) 17)) (and (= (x stone2) 51) (= (y stone2) 31)) (and (= (x stone2) 14) (= (y stone2) 19)) (and (= (x stone2) 2) (= (y stone2) 48)) (and (= (x stone2) 46) (= (y stone2) 49)))
	(or (and (= (x stone3) 16) (= (y stone3) 10)) (and (= (x stone3) 21) (= (y stone3) 17)) (and (= (x stone3) 51) (= (y stone3) 31)) (and (= (x stone3) 14) (= (y stone3) 19)) (and (= (x stone3) 2) (= (y stone3) 48)) (and (= (x stone3) 46) (= (y stone3) 49)))
	(or (and (= (x stone4) 16) (= (y stone4) 10)) (and (= (x stone4) 21) (= (y stone4) 17)) (and (= (x stone4) 51) (= (y stone4) 31)) (and (= (x stone4) 14) (= (y stone4) 19)) (and (= (x stone4) 2) (= (y stone4) 48)) (and (= (x stone4) 46) (= (y stone4) 49)))
	(or (and (= (x stone5) 16) (= (y stone5) 10)) (and (= (x stone5) 21) (= (y stone5) 17)) (and (= (x stone5) 51) (= (y stone5) 31)) (and (= (x stone5) 14) (= (y stone5) 19)) (and (= (x stone5) 2) (= (y stone5) 48)) (and (= (x stone5) 46) (= (y stone5) 49)))
	(or (and (= (x stone6) 16) (= (y stone6) 10)) (and (= (x stone6) 21) (= (y stone6) 17)) (and (= (x stone6) 51) (= (y stone6) 31)) (and (= (x stone6) 14) (= (y stone6) 19)) (and (= (x stone6) 2) (= (y stone6) 48)) (and (= (x stone6) 46) (= (y stone6) 49)))
  ))

  
  

  
)
