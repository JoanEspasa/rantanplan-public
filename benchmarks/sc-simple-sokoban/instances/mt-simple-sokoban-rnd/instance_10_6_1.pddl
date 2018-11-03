(define (problem instance_10_6_1)
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
	(= (x player1) 1)
	(= (y player1) 2)
	(= (x stone1) 5)
	(= (y stone1) 5)
	(= (x stone2) 5)
	(= (y stone2) 3)
	(= (x stone3) 3)
	(= (y stone3) 4)
	(= (x stone4) 6)
	(= (y stone4) 4)
	(= (x stone5) 7)
	(= (y stone5) 9)
	(= (x stone6) 9)
	(= (y stone6) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 2) (= (y stone1) 10)) (and (= (x stone1) 8) (= (y stone1) 1)) (and (= (x stone1) 9) (= (y stone1) 7)) (and (= (x stone1) 10) (= (y stone1) 8)) (and (= (x stone1) 7) (= (y stone1) 8)) (and (= (x stone1) 3) (= (y stone1) 9)))
	(or (and (= (x stone2) 2) (= (y stone2) 10)) (and (= (x stone2) 8) (= (y stone2) 1)) (and (= (x stone2) 9) (= (y stone2) 7)) (and (= (x stone2) 10) (= (y stone2) 8)) (and (= (x stone2) 7) (= (y stone2) 8)) (and (= (x stone2) 3) (= (y stone2) 9)))
	(or (and (= (x stone3) 2) (= (y stone3) 10)) (and (= (x stone3) 8) (= (y stone3) 1)) (and (= (x stone3) 9) (= (y stone3) 7)) (and (= (x stone3) 10) (= (y stone3) 8)) (and (= (x stone3) 7) (= (y stone3) 8)) (and (= (x stone3) 3) (= (y stone3) 9)))
	(or (and (= (x stone4) 2) (= (y stone4) 10)) (and (= (x stone4) 8) (= (y stone4) 1)) (and (= (x stone4) 9) (= (y stone4) 7)) (and (= (x stone4) 10) (= (y stone4) 8)) (and (= (x stone4) 7) (= (y stone4) 8)) (and (= (x stone4) 3) (= (y stone4) 9)))
	(or (and (= (x stone5) 2) (= (y stone5) 10)) (and (= (x stone5) 8) (= (y stone5) 1)) (and (= (x stone5) 9) (= (y stone5) 7)) (and (= (x stone5) 10) (= (y stone5) 8)) (and (= (x stone5) 7) (= (y stone5) 8)) (and (= (x stone5) 3) (= (y stone5) 9)))
	(or (and (= (x stone6) 2) (= (y stone6) 10)) (and (= (x stone6) 8) (= (y stone6) 1)) (and (= (x stone6) 9) (= (y stone6) 7)) (and (= (x stone6) 10) (= (y stone6) 8)) (and (= (x stone6) 7) (= (y stone6) 8)) (and (= (x stone6) 3) (= (y stone6) 9)))
  ))

  
  

  
)
