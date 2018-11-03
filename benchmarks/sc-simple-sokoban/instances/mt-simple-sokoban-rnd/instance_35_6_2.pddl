(define (problem instance_35_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 35)
	(= (min_x) 1)
	(= (max_y) 35)
	(= (min_y) 1)
	(= (x player1) 19)
	(= (y player1) 35)
	(= (x stone1) 34)
	(= (y stone1) 27)
	(= (x stone2) 24)
	(= (y stone2) 5)
	(= (x stone3) 8)
	(= (y stone3) 19)
	(= (x stone4) 23)
	(= (y stone4) 28)
	(= (x stone5) 24)
	(= (y stone5) 12)
	(= (x stone6) 10)
	(= (y stone6) 14)
  )

  (:goal (and 
    (or (and (= (x stone1) 12) (= (y stone1) 10)) (and (= (x stone1) 12) (= (y stone1) 19)) (and (= (x stone1) 31) (= (y stone1) 14)) (and (= (x stone1) 23) (= (y stone1) 1)) (and (= (x stone1) 33) (= (y stone1) 31)) (and (= (x stone1) 6) (= (y stone1) 11)))
	(or (and (= (x stone2) 12) (= (y stone2) 10)) (and (= (x stone2) 12) (= (y stone2) 19)) (and (= (x stone2) 31) (= (y stone2) 14)) (and (= (x stone2) 23) (= (y stone2) 1)) (and (= (x stone2) 33) (= (y stone2) 31)) (and (= (x stone2) 6) (= (y stone2) 11)))
	(or (and (= (x stone3) 12) (= (y stone3) 10)) (and (= (x stone3) 12) (= (y stone3) 19)) (and (= (x stone3) 31) (= (y stone3) 14)) (and (= (x stone3) 23) (= (y stone3) 1)) (and (= (x stone3) 33) (= (y stone3) 31)) (and (= (x stone3) 6) (= (y stone3) 11)))
	(or (and (= (x stone4) 12) (= (y stone4) 10)) (and (= (x stone4) 12) (= (y stone4) 19)) (and (= (x stone4) 31) (= (y stone4) 14)) (and (= (x stone4) 23) (= (y stone4) 1)) (and (= (x stone4) 33) (= (y stone4) 31)) (and (= (x stone4) 6) (= (y stone4) 11)))
	(or (and (= (x stone5) 12) (= (y stone5) 10)) (and (= (x stone5) 12) (= (y stone5) 19)) (and (= (x stone5) 31) (= (y stone5) 14)) (and (= (x stone5) 23) (= (y stone5) 1)) (and (= (x stone5) 33) (= (y stone5) 31)) (and (= (x stone5) 6) (= (y stone5) 11)))
	(or (and (= (x stone6) 12) (= (y stone6) 10)) (and (= (x stone6) 12) (= (y stone6) 19)) (and (= (x stone6) 31) (= (y stone6) 14)) (and (= (x stone6) 23) (= (y stone6) 1)) (and (= (x stone6) 33) (= (y stone6) 31)) (and (= (x stone6) 6) (= (y stone6) 11)))
  ))

  
  

  
)
