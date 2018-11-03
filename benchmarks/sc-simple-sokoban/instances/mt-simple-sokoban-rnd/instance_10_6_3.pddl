(define (problem instance_10_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 10)
	(= (min_x) 1)
	(= (max_y) 10)
	(= (min_y) 1)
	(= (x player1) 4)
	(= (y player1) 1)
	(= (x stone1) 7)
	(= (y stone1) 6)
	(= (x stone2) 6)
	(= (y stone2) 4)
	(= (x stone3) 3)
	(= (y stone3) 9)
	(= (x stone4) 8)
	(= (y stone4) 7)
	(= (x stone5) 2)
	(= (y stone5) 8)
	(= (x stone6) 2)
	(= (y stone6) 6)
  )

  (:goal (and 
    (or (and (= (x stone1) 10) (= (y stone1) 8)) (and (= (x stone1) 4) (= (y stone1) 3)) (and (= (x stone1) 6) (= (y stone1) 5)) (and (= (x stone1) 6) (= (y stone1) 10)) (and (= (x stone1) 5) (= (y stone1) 6)) (and (= (x stone1) 8) (= (y stone1) 2)))
	(or (and (= (x stone2) 10) (= (y stone2) 8)) (and (= (x stone2) 4) (= (y stone2) 3)) (and (= (x stone2) 6) (= (y stone2) 5)) (and (= (x stone2) 6) (= (y stone2) 10)) (and (= (x stone2) 5) (= (y stone2) 6)) (and (= (x stone2) 8) (= (y stone2) 2)))
	(or (and (= (x stone3) 10) (= (y stone3) 8)) (and (= (x stone3) 4) (= (y stone3) 3)) (and (= (x stone3) 6) (= (y stone3) 5)) (and (= (x stone3) 6) (= (y stone3) 10)) (and (= (x stone3) 5) (= (y stone3) 6)) (and (= (x stone3) 8) (= (y stone3) 2)))
	(or (and (= (x stone4) 10) (= (y stone4) 8)) (and (= (x stone4) 4) (= (y stone4) 3)) (and (= (x stone4) 6) (= (y stone4) 5)) (and (= (x stone4) 6) (= (y stone4) 10)) (and (= (x stone4) 5) (= (y stone4) 6)) (and (= (x stone4) 8) (= (y stone4) 2)))
	(or (and (= (x stone5) 10) (= (y stone5) 8)) (and (= (x stone5) 4) (= (y stone5) 3)) (and (= (x stone5) 6) (= (y stone5) 5)) (and (= (x stone5) 6) (= (y stone5) 10)) (and (= (x stone5) 5) (= (y stone5) 6)) (and (= (x stone5) 8) (= (y stone5) 2)))
	(or (and (= (x stone6) 10) (= (y stone6) 8)) (and (= (x stone6) 4) (= (y stone6) 3)) (and (= (x stone6) 6) (= (y stone6) 5)) (and (= (x stone6) 6) (= (y stone6) 10)) (and (= (x stone6) 5) (= (y stone6) 6)) (and (= (x stone6) 8) (= (y stone6) 2)))
  ))

  
  

  
)
