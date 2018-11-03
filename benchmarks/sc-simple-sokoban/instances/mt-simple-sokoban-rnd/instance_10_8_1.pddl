(define (problem instance_10_8_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 - stone
	player1 - player
  )

  (:init
    (= (max_x) 10)
	(= (min_x) 1)
	(= (max_y) 10)
	(= (min_y) 1)
	(= (x player1) 6)
	(= (y player1) 10)
	(= (x stone1) 3)
	(= (y stone1) 3)
	(= (x stone2) 5)
	(= (y stone2) 8)
	(= (x stone3) 4)
	(= (y stone3) 4)
	(= (x stone4) 4)
	(= (y stone4) 3)
	(= (x stone5) 3)
	(= (y stone5) 8)
	(= (x stone6) 2)
	(= (y stone6) 2)
	(= (x stone7) 8)
	(= (y stone7) 9)
	(= (x stone8) 6)
	(= (y stone8) 2)
  )

  (:goal (and 
    (or (and (= (x stone1) 2) (= (y stone1) 10)) (and (= (x stone1) 6) (= (y stone1) 9)) (and (= (x stone1) 8) (= (y stone1) 5)) (and (= (x stone1) 10) (= (y stone1) 5)) (and (= (x stone1) 9) (= (y stone1) 8)) (and (= (x stone1) 6) (= (y stone1) 6)) (and (= (x stone1) 5) (= (y stone1) 4)) (and (= (x stone1) 5) (= (y stone1) 10)))
	(or (and (= (x stone2) 2) (= (y stone2) 10)) (and (= (x stone2) 6) (= (y stone2) 9)) (and (= (x stone2) 8) (= (y stone2) 5)) (and (= (x stone2) 10) (= (y stone2) 5)) (and (= (x stone2) 9) (= (y stone2) 8)) (and (= (x stone2) 6) (= (y stone2) 6)) (and (= (x stone2) 5) (= (y stone2) 4)) (and (= (x stone2) 5) (= (y stone2) 10)))
	(or (and (= (x stone3) 2) (= (y stone3) 10)) (and (= (x stone3) 6) (= (y stone3) 9)) (and (= (x stone3) 8) (= (y stone3) 5)) (and (= (x stone3) 10) (= (y stone3) 5)) (and (= (x stone3) 9) (= (y stone3) 8)) (and (= (x stone3) 6) (= (y stone3) 6)) (and (= (x stone3) 5) (= (y stone3) 4)) (and (= (x stone3) 5) (= (y stone3) 10)))
	(or (and (= (x stone4) 2) (= (y stone4) 10)) (and (= (x stone4) 6) (= (y stone4) 9)) (and (= (x stone4) 8) (= (y stone4) 5)) (and (= (x stone4) 10) (= (y stone4) 5)) (and (= (x stone4) 9) (= (y stone4) 8)) (and (= (x stone4) 6) (= (y stone4) 6)) (and (= (x stone4) 5) (= (y stone4) 4)) (and (= (x stone4) 5) (= (y stone4) 10)))
	(or (and (= (x stone5) 2) (= (y stone5) 10)) (and (= (x stone5) 6) (= (y stone5) 9)) (and (= (x stone5) 8) (= (y stone5) 5)) (and (= (x stone5) 10) (= (y stone5) 5)) (and (= (x stone5) 9) (= (y stone5) 8)) (and (= (x stone5) 6) (= (y stone5) 6)) (and (= (x stone5) 5) (= (y stone5) 4)) (and (= (x stone5) 5) (= (y stone5) 10)))
	(or (and (= (x stone6) 2) (= (y stone6) 10)) (and (= (x stone6) 6) (= (y stone6) 9)) (and (= (x stone6) 8) (= (y stone6) 5)) (and (= (x stone6) 10) (= (y stone6) 5)) (and (= (x stone6) 9) (= (y stone6) 8)) (and (= (x stone6) 6) (= (y stone6) 6)) (and (= (x stone6) 5) (= (y stone6) 4)) (and (= (x stone6) 5) (= (y stone6) 10)))
	(or (and (= (x stone7) 2) (= (y stone7) 10)) (and (= (x stone7) 6) (= (y stone7) 9)) (and (= (x stone7) 8) (= (y stone7) 5)) (and (= (x stone7) 10) (= (y stone7) 5)) (and (= (x stone7) 9) (= (y stone7) 8)) (and (= (x stone7) 6) (= (y stone7) 6)) (and (= (x stone7) 5) (= (y stone7) 4)) (and (= (x stone7) 5) (= (y stone7) 10)))
	(or (and (= (x stone8) 2) (= (y stone8) 10)) (and (= (x stone8) 6) (= (y stone8) 9)) (and (= (x stone8) 8) (= (y stone8) 5)) (and (= (x stone8) 10) (= (y stone8) 5)) (and (= (x stone8) 9) (= (y stone8) 8)) (and (= (x stone8) 6) (= (y stone8) 6)) (and (= (x stone8) 5) (= (y stone8) 4)) (and (= (x stone8) 5) (= (y stone8) 10)))
  ))

  
  

  
)
