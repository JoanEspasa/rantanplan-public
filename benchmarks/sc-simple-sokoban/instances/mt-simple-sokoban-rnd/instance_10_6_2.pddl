(define (problem instance_10_6_2)
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
	(= (x player1) 9)
	(= (y player1) 1)
	(= (x stone1) 2)
	(= (y stone1) 4)
	(= (x stone2) 7)
	(= (y stone2) 3)
	(= (x stone3) 8)
	(= (y stone3) 8)
	(= (x stone4) 5)
	(= (y stone4) 5)
	(= (x stone5) 8)
	(= (y stone5) 6)
	(= (x stone6) 3)
	(= (y stone6) 2)
  )

  (:goal (and 
    (or (and (= (x stone1) 9) (= (y stone1) 2)) (and (= (x stone1) 3) (= (y stone1) 7)) (and (= (x stone1) 1) (= (y stone1) 5)) (and (= (x stone1) 3) (= (y stone1) 1)) (and (= (x stone1) 8) (= (y stone1) 4)) (and (= (x stone1) 8) (= (y stone1) 10)))
	(or (and (= (x stone2) 9) (= (y stone2) 2)) (and (= (x stone2) 3) (= (y stone2) 7)) (and (= (x stone2) 1) (= (y stone2) 5)) (and (= (x stone2) 3) (= (y stone2) 1)) (and (= (x stone2) 8) (= (y stone2) 4)) (and (= (x stone2) 8) (= (y stone2) 10)))
	(or (and (= (x stone3) 9) (= (y stone3) 2)) (and (= (x stone3) 3) (= (y stone3) 7)) (and (= (x stone3) 1) (= (y stone3) 5)) (and (= (x stone3) 3) (= (y stone3) 1)) (and (= (x stone3) 8) (= (y stone3) 4)) (and (= (x stone3) 8) (= (y stone3) 10)))
	(or (and (= (x stone4) 9) (= (y stone4) 2)) (and (= (x stone4) 3) (= (y stone4) 7)) (and (= (x stone4) 1) (= (y stone4) 5)) (and (= (x stone4) 3) (= (y stone4) 1)) (and (= (x stone4) 8) (= (y stone4) 4)) (and (= (x stone4) 8) (= (y stone4) 10)))
	(or (and (= (x stone5) 9) (= (y stone5) 2)) (and (= (x stone5) 3) (= (y stone5) 7)) (and (= (x stone5) 1) (= (y stone5) 5)) (and (= (x stone5) 3) (= (y stone5) 1)) (and (= (x stone5) 8) (= (y stone5) 4)) (and (= (x stone5) 8) (= (y stone5) 10)))
	(or (and (= (x stone6) 9) (= (y stone6) 2)) (and (= (x stone6) 3) (= (y stone6) 7)) (and (= (x stone6) 1) (= (y stone6) 5)) (and (= (x stone6) 3) (= (y stone6) 1)) (and (= (x stone6) 8) (= (y stone6) 4)) (and (= (x stone6) 8) (= (y stone6) 10)))
  ))

  
  

  
)
