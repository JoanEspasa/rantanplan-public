(define (problem instance_15_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 15)
	(= (min_x) 1)
	(= (max_y) 15)
	(= (min_y) 1)
	(= (x player1) 9)
	(= (y player1) 2)
	(= (x stone1) 11)
	(= (y stone1) 11)
	(= (x stone2) 13)
	(= (y stone2) 3)
	(= (x stone3) 14)
	(= (y stone3) 11)
	(= (x stone4) 8)
	(= (y stone4) 10)
	(= (x stone5) 14)
	(= (y stone5) 3)
	(= (x stone6) 2)
	(= (y stone6) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 4) (= (y stone1) 4)) (and (= (x stone1) 15) (= (y stone1) 8)) (and (= (x stone1) 2) (= (y stone1) 1)) (and (= (x stone1) 2) (= (y stone1) 2)) (and (= (x stone1) 12) (= (y stone1) 12)) (and (= (x stone1) 10) (= (y stone1) 11)))
	(or (and (= (x stone2) 4) (= (y stone2) 4)) (and (= (x stone2) 15) (= (y stone2) 8)) (and (= (x stone2) 2) (= (y stone2) 1)) (and (= (x stone2) 2) (= (y stone2) 2)) (and (= (x stone2) 12) (= (y stone2) 12)) (and (= (x stone2) 10) (= (y stone2) 11)))
	(or (and (= (x stone3) 4) (= (y stone3) 4)) (and (= (x stone3) 15) (= (y stone3) 8)) (and (= (x stone3) 2) (= (y stone3) 1)) (and (= (x stone3) 2) (= (y stone3) 2)) (and (= (x stone3) 12) (= (y stone3) 12)) (and (= (x stone3) 10) (= (y stone3) 11)))
	(or (and (= (x stone4) 4) (= (y stone4) 4)) (and (= (x stone4) 15) (= (y stone4) 8)) (and (= (x stone4) 2) (= (y stone4) 1)) (and (= (x stone4) 2) (= (y stone4) 2)) (and (= (x stone4) 12) (= (y stone4) 12)) (and (= (x stone4) 10) (= (y stone4) 11)))
	(or (and (= (x stone5) 4) (= (y stone5) 4)) (and (= (x stone5) 15) (= (y stone5) 8)) (and (= (x stone5) 2) (= (y stone5) 1)) (and (= (x stone5) 2) (= (y stone5) 2)) (and (= (x stone5) 12) (= (y stone5) 12)) (and (= (x stone5) 10) (= (y stone5) 11)))
	(or (and (= (x stone6) 4) (= (y stone6) 4)) (and (= (x stone6) 15) (= (y stone6) 8)) (and (= (x stone6) 2) (= (y stone6) 1)) (and (= (x stone6) 2) (= (y stone6) 2)) (and (= (x stone6) 12) (= (y stone6) 12)) (and (= (x stone6) 10) (= (y stone6) 11)))
  ))

  
  

  
)
