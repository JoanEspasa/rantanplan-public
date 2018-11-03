(define (problem instance_12)
  (:domain mt-simple-sokoban)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 - stone
	player1 - player
  )

  (:init
    (= (max_x) 12)
	(= (min_x) 1)
	(= (max_y) 12)
	(= (min_y) 1)
	(= (x player1) 2)
	(= (y player1) 6)
	(= (x stone1) 2)
	(= (y stone1) 2)
	(= (x stone2) 2)
	(= (y stone2) 3)
	(= (x stone3) 2)
	(= (y stone3) 4)
	(= (x stone4) 2)
	(= (y stone4) 5)
	(= (x stone5) 2)
	(= (y stone5) 7)
	(= (x stone6) 2)
	(= (y stone6) 8)
	(= (x stone7) 2)
	(= (y stone7) 9)
	(= (x stone8) 2)
	(= (y stone8) 10)
	(= (x stone9) 2)
	(= (y stone9) 11)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 6)) (and (= (x stone1) 12) (= (y stone1) 3)) (and (= (x stone1) 12) (= (y stone1) 4)) (and (= (x stone1) 12) (= (y stone1) 5)) (and (= (x stone1) 12) (= (y stone1) 7)) (and (= (x stone1) 12) (= (y stone1) 8)) (and (= (x stone1) 12) (= (y stone1) 9)) (and (= (x stone1) 12) (= (y stone1) 10)) (and (= (x stone1) 12) (= (y stone1) 11)))
	(or (and (= (x stone2) 1) (= (y stone2) 6)) (and (= (x stone2) 12) (= (y stone2) 3)) (and (= (x stone2) 12) (= (y stone2) 4)) (and (= (x stone2) 12) (= (y stone2) 5)) (and (= (x stone2) 12) (= (y stone2) 7)) (and (= (x stone2) 12) (= (y stone2) 8)) (and (= (x stone2) 12) (= (y stone2) 9)) (and (= (x stone2) 12) (= (y stone2) 10)) (and (= (x stone2) 12) (= (y stone2) 11)))
	(or (and (= (x stone3) 1) (= (y stone3) 6)) (and (= (x stone3) 12) (= (y stone3) 3)) (and (= (x stone3) 12) (= (y stone3) 4)) (and (= (x stone3) 12) (= (y stone3) 5)) (and (= (x stone3) 12) (= (y stone3) 7)) (and (= (x stone3) 12) (= (y stone3) 8)) (and (= (x stone3) 12) (= (y stone3) 9)) (and (= (x stone3) 12) (= (y stone3) 10)) (and (= (x stone3) 12) (= (y stone3) 11)))
	(or (and (= (x stone4) 1) (= (y stone4) 6)) (and (= (x stone4) 12) (= (y stone4) 3)) (and (= (x stone4) 12) (= (y stone4) 4)) (and (= (x stone4) 12) (= (y stone4) 5)) (and (= (x stone4) 12) (= (y stone4) 7)) (and (= (x stone4) 12) (= (y stone4) 8)) (and (= (x stone4) 12) (= (y stone4) 9)) (and (= (x stone4) 12) (= (y stone4) 10)) (and (= (x stone4) 12) (= (y stone4) 11)))
	(or (and (= (x stone5) 1) (= (y stone5) 6)) (and (= (x stone5) 12) (= (y stone5) 3)) (and (= (x stone5) 12) (= (y stone5) 4)) (and (= (x stone5) 12) (= (y stone5) 5)) (and (= (x stone5) 12) (= (y stone5) 7)) (and (= (x stone5) 12) (= (y stone5) 8)) (and (= (x stone5) 12) (= (y stone5) 9)) (and (= (x stone5) 12) (= (y stone5) 10)) (and (= (x stone5) 12) (= (y stone5) 11)))
	(or (and (= (x stone6) 1) (= (y stone6) 6)) (and (= (x stone6) 12) (= (y stone6) 3)) (and (= (x stone6) 12) (= (y stone6) 4)) (and (= (x stone6) 12) (= (y stone6) 5)) (and (= (x stone6) 12) (= (y stone6) 7)) (and (= (x stone6) 12) (= (y stone6) 8)) (and (= (x stone6) 12) (= (y stone6) 9)) (and (= (x stone6) 12) (= (y stone6) 10)) (and (= (x stone6) 12) (= (y stone6) 11)))
	(or (and (= (x stone7) 1) (= (y stone7) 6)) (and (= (x stone7) 12) (= (y stone7) 3)) (and (= (x stone7) 12) (= (y stone7) 4)) (and (= (x stone7) 12) (= (y stone7) 5)) (and (= (x stone7) 12) (= (y stone7) 7)) (and (= (x stone7) 12) (= (y stone7) 8)) (and (= (x stone7) 12) (= (y stone7) 9)) (and (= (x stone7) 12) (= (y stone7) 10)) (and (= (x stone7) 12) (= (y stone7) 11)))
	(or (and (= (x stone8) 1) (= (y stone8) 6)) (and (= (x stone8) 12) (= (y stone8) 3)) (and (= (x stone8) 12) (= (y stone8) 4)) (and (= (x stone8) 12) (= (y stone8) 5)) (and (= (x stone8) 12) (= (y stone8) 7)) (and (= (x stone8) 12) (= (y stone8) 8)) (and (= (x stone8) 12) (= (y stone8) 9)) (and (= (x stone8) 12) (= (y stone8) 10)) (and (= (x stone8) 12) (= (y stone8) 11)))
	(or (and (= (x stone9) 1) (= (y stone9) 6)) (and (= (x stone9) 12) (= (y stone9) 3)) (and (= (x stone9) 12) (= (y stone9) 4)) (and (= (x stone9) 12) (= (y stone9) 5)) (and (= (x stone9) 12) (= (y stone9) 7)) (and (= (x stone9) 12) (= (y stone9) 8)) (and (= (x stone9) 12) (= (y stone9) 9)) (and (= (x stone9) 12) (= (y stone9) 10)) (and (= (x stone9) 12) (= (y stone9) 11)))
  ))

  
  

  
)
