(define (problem instance_30_6_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 30)
	(= (min_x) 1)
	(= (max_y) 30)
	(= (min_y) 1)
	(= (x player1) 5)
	(= (y player1) 18)
	(= (x stone1) 19)
	(= (y stone1) 3)
	(= (x stone2) 2)
	(= (y stone2) 25)
	(= (x stone3) 2)
	(= (y stone3) 14)
	(= (x stone4) 27)
	(= (y stone4) 17)
	(= (x stone5) 13)
	(= (y stone5) 15)
	(= (x stone6) 29)
	(= (y stone6) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 20) (= (y stone1) 10)) (and (= (x stone1) 1) (= (y stone1) 26)) (and (= (x stone1) 23) (= (y stone1) 21)) (and (= (x stone1) 2) (= (y stone1) 15)) (and (= (x stone1) 7) (= (y stone1) 20)) (and (= (x stone1) 5) (= (y stone1) 15)))
	(or (and (= (x stone2) 20) (= (y stone2) 10)) (and (= (x stone2) 1) (= (y stone2) 26)) (and (= (x stone2) 23) (= (y stone2) 21)) (and (= (x stone2) 2) (= (y stone2) 15)) (and (= (x stone2) 7) (= (y stone2) 20)) (and (= (x stone2) 5) (= (y stone2) 15)))
	(or (and (= (x stone3) 20) (= (y stone3) 10)) (and (= (x stone3) 1) (= (y stone3) 26)) (and (= (x stone3) 23) (= (y stone3) 21)) (and (= (x stone3) 2) (= (y stone3) 15)) (and (= (x stone3) 7) (= (y stone3) 20)) (and (= (x stone3) 5) (= (y stone3) 15)))
	(or (and (= (x stone4) 20) (= (y stone4) 10)) (and (= (x stone4) 1) (= (y stone4) 26)) (and (= (x stone4) 23) (= (y stone4) 21)) (and (= (x stone4) 2) (= (y stone4) 15)) (and (= (x stone4) 7) (= (y stone4) 20)) (and (= (x stone4) 5) (= (y stone4) 15)))
	(or (and (= (x stone5) 20) (= (y stone5) 10)) (and (= (x stone5) 1) (= (y stone5) 26)) (and (= (x stone5) 23) (= (y stone5) 21)) (and (= (x stone5) 2) (= (y stone5) 15)) (and (= (x stone5) 7) (= (y stone5) 20)) (and (= (x stone5) 5) (= (y stone5) 15)))
	(or (and (= (x stone6) 20) (= (y stone6) 10)) (and (= (x stone6) 1) (= (y stone6) 26)) (and (= (x stone6) 23) (= (y stone6) 21)) (and (= (x stone6) 2) (= (y stone6) 15)) (and (= (x stone6) 7) (= (y stone6) 20)) (and (= (x stone6) 5) (= (y stone6) 15)))
  ))

  
  

  
)
