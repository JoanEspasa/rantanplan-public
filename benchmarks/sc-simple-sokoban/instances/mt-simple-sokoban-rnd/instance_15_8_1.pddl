(define (problem instance_15_8_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 - stone
	player1 - player
  )

  (:init
    (= (max_x) 15)
	(= (min_x) 1)
	(= (max_y) 15)
	(= (min_y) 1)
	(= (x player1) 10)
	(= (y player1) 12)
	(= (x stone1) 3)
	(= (y stone1) 4)
	(= (x stone2) 2)
	(= (y stone2) 11)
	(= (x stone3) 11)
	(= (y stone3) 14)
	(= (x stone4) 3)
	(= (y stone4) 7)
	(= (x stone5) 10)
	(= (y stone5) 7)
	(= (x stone6) 4)
	(= (y stone6) 11)
	(= (x stone7) 9)
	(= (y stone7) 4)
	(= (x stone8) 4)
	(= (y stone8) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 13) (= (y stone1) 2)) (and (= (x stone1) 6) (= (y stone1) 13)) (and (= (x stone1) 1) (= (y stone1) 11)) (and (= (x stone1) 1) (= (y stone1) 12)) (and (= (x stone1) 4) (= (y stone1) 8)) (and (= (x stone1) 12) (= (y stone1) 6)) (and (= (x stone1) 8) (= (y stone1) 2)) (and (= (x stone1) 7) (= (y stone1) 9)))
	(or (and (= (x stone2) 13) (= (y stone2) 2)) (and (= (x stone2) 6) (= (y stone2) 13)) (and (= (x stone2) 1) (= (y stone2) 11)) (and (= (x stone2) 1) (= (y stone2) 12)) (and (= (x stone2) 4) (= (y stone2) 8)) (and (= (x stone2) 12) (= (y stone2) 6)) (and (= (x stone2) 8) (= (y stone2) 2)) (and (= (x stone2) 7) (= (y stone2) 9)))
	(or (and (= (x stone3) 13) (= (y stone3) 2)) (and (= (x stone3) 6) (= (y stone3) 13)) (and (= (x stone3) 1) (= (y stone3) 11)) (and (= (x stone3) 1) (= (y stone3) 12)) (and (= (x stone3) 4) (= (y stone3) 8)) (and (= (x stone3) 12) (= (y stone3) 6)) (and (= (x stone3) 8) (= (y stone3) 2)) (and (= (x stone3) 7) (= (y stone3) 9)))
	(or (and (= (x stone4) 13) (= (y stone4) 2)) (and (= (x stone4) 6) (= (y stone4) 13)) (and (= (x stone4) 1) (= (y stone4) 11)) (and (= (x stone4) 1) (= (y stone4) 12)) (and (= (x stone4) 4) (= (y stone4) 8)) (and (= (x stone4) 12) (= (y stone4) 6)) (and (= (x stone4) 8) (= (y stone4) 2)) (and (= (x stone4) 7) (= (y stone4) 9)))
	(or (and (= (x stone5) 13) (= (y stone5) 2)) (and (= (x stone5) 6) (= (y stone5) 13)) (and (= (x stone5) 1) (= (y stone5) 11)) (and (= (x stone5) 1) (= (y stone5) 12)) (and (= (x stone5) 4) (= (y stone5) 8)) (and (= (x stone5) 12) (= (y stone5) 6)) (and (= (x stone5) 8) (= (y stone5) 2)) (and (= (x stone5) 7) (= (y stone5) 9)))
	(or (and (= (x stone6) 13) (= (y stone6) 2)) (and (= (x stone6) 6) (= (y stone6) 13)) (and (= (x stone6) 1) (= (y stone6) 11)) (and (= (x stone6) 1) (= (y stone6) 12)) (and (= (x stone6) 4) (= (y stone6) 8)) (and (= (x stone6) 12) (= (y stone6) 6)) (and (= (x stone6) 8) (= (y stone6) 2)) (and (= (x stone6) 7) (= (y stone6) 9)))
	(or (and (= (x stone7) 13) (= (y stone7) 2)) (and (= (x stone7) 6) (= (y stone7) 13)) (and (= (x stone7) 1) (= (y stone7) 11)) (and (= (x stone7) 1) (= (y stone7) 12)) (and (= (x stone7) 4) (= (y stone7) 8)) (and (= (x stone7) 12) (= (y stone7) 6)) (and (= (x stone7) 8) (= (y stone7) 2)) (and (= (x stone7) 7) (= (y stone7) 9)))
	(or (and (= (x stone8) 13) (= (y stone8) 2)) (and (= (x stone8) 6) (= (y stone8) 13)) (and (= (x stone8) 1) (= (y stone8) 11)) (and (= (x stone8) 1) (= (y stone8) 12)) (and (= (x stone8) 4) (= (y stone8) 8)) (and (= (x stone8) 12) (= (y stone8) 6)) (and (= (x stone8) 8) (= (y stone8) 2)) (and (= (x stone8) 7) (= (y stone8) 9)))
  ))

  
  

  
)
