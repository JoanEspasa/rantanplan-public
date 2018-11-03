(define (problem instance_10_8_3)
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
	(= (x player1) 4)
	(= (y player1) 9)
	(= (x stone1) 4)
	(= (y stone1) 5)
	(= (x stone2) 8)
	(= (y stone2) 8)
	(= (x stone3) 4)
	(= (y stone3) 2)
	(= (x stone4) 7)
	(= (y stone4) 4)
	(= (x stone5) 5)
	(= (y stone5) 8)
	(= (x stone6) 7)
	(= (y stone6) 8)
	(= (x stone7) 8)
	(= (y stone7) 2)
	(= (x stone8) 7)
	(= (y stone8) 3)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 7)) (and (= (x stone1) 3) (= (y stone1) 3)) (and (= (x stone1) 1) (= (y stone1) 5)) (and (= (x stone1) 5) (= (y stone1) 4)) (and (= (x stone1) 3) (= (y stone1) 9)) (and (= (x stone1) 6) (= (y stone1) 5)) (and (= (x stone1) 6) (= (y stone1) 2)) (and (= (x stone1) 4) (= (y stone1) 6)))
	(or (and (= (x stone2) 1) (= (y stone2) 7)) (and (= (x stone2) 3) (= (y stone2) 3)) (and (= (x stone2) 1) (= (y stone2) 5)) (and (= (x stone2) 5) (= (y stone2) 4)) (and (= (x stone2) 3) (= (y stone2) 9)) (and (= (x stone2) 6) (= (y stone2) 5)) (and (= (x stone2) 6) (= (y stone2) 2)) (and (= (x stone2) 4) (= (y stone2) 6)))
	(or (and (= (x stone3) 1) (= (y stone3) 7)) (and (= (x stone3) 3) (= (y stone3) 3)) (and (= (x stone3) 1) (= (y stone3) 5)) (and (= (x stone3) 5) (= (y stone3) 4)) (and (= (x stone3) 3) (= (y stone3) 9)) (and (= (x stone3) 6) (= (y stone3) 5)) (and (= (x stone3) 6) (= (y stone3) 2)) (and (= (x stone3) 4) (= (y stone3) 6)))
	(or (and (= (x stone4) 1) (= (y stone4) 7)) (and (= (x stone4) 3) (= (y stone4) 3)) (and (= (x stone4) 1) (= (y stone4) 5)) (and (= (x stone4) 5) (= (y stone4) 4)) (and (= (x stone4) 3) (= (y stone4) 9)) (and (= (x stone4) 6) (= (y stone4) 5)) (and (= (x stone4) 6) (= (y stone4) 2)) (and (= (x stone4) 4) (= (y stone4) 6)))
	(or (and (= (x stone5) 1) (= (y stone5) 7)) (and (= (x stone5) 3) (= (y stone5) 3)) (and (= (x stone5) 1) (= (y stone5) 5)) (and (= (x stone5) 5) (= (y stone5) 4)) (and (= (x stone5) 3) (= (y stone5) 9)) (and (= (x stone5) 6) (= (y stone5) 5)) (and (= (x stone5) 6) (= (y stone5) 2)) (and (= (x stone5) 4) (= (y stone5) 6)))
	(or (and (= (x stone6) 1) (= (y stone6) 7)) (and (= (x stone6) 3) (= (y stone6) 3)) (and (= (x stone6) 1) (= (y stone6) 5)) (and (= (x stone6) 5) (= (y stone6) 4)) (and (= (x stone6) 3) (= (y stone6) 9)) (and (= (x stone6) 6) (= (y stone6) 5)) (and (= (x stone6) 6) (= (y stone6) 2)) (and (= (x stone6) 4) (= (y stone6) 6)))
	(or (and (= (x stone7) 1) (= (y stone7) 7)) (and (= (x stone7) 3) (= (y stone7) 3)) (and (= (x stone7) 1) (= (y stone7) 5)) (and (= (x stone7) 5) (= (y stone7) 4)) (and (= (x stone7) 3) (= (y stone7) 9)) (and (= (x stone7) 6) (= (y stone7) 5)) (and (= (x stone7) 6) (= (y stone7) 2)) (and (= (x stone7) 4) (= (y stone7) 6)))
	(or (and (= (x stone8) 1) (= (y stone8) 7)) (and (= (x stone8) 3) (= (y stone8) 3)) (and (= (x stone8) 1) (= (y stone8) 5)) (and (= (x stone8) 5) (= (y stone8) 4)) (and (= (x stone8) 3) (= (y stone8) 9)) (and (= (x stone8) 6) (= (y stone8) 5)) (and (= (x stone8) 6) (= (y stone8) 2)) (and (= (x stone8) 4) (= (y stone8) 6)))
  ))

  
  

  
)
