(define (problem instance_15_8_2)
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
	(= (x player1) 7)
	(= (y player1) 6)
	(= (x stone1) 9)
	(= (y stone1) 2)
	(= (x stone2) 11)
	(= (y stone2) 6)
	(= (x stone3) 3)
	(= (y stone3) 7)
	(= (x stone4) 8)
	(= (y stone4) 7)
	(= (x stone5) 14)
	(= (y stone5) 9)
	(= (x stone6) 6)
	(= (y stone6) 13)
	(= (x stone7) 3)
	(= (y stone7) 5)
	(= (x stone8) 9)
	(= (y stone8) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 12) (= (y stone1) 11)) (and (= (x stone1) 3) (= (y stone1) 8)) (and (= (x stone1) 14) (= (y stone1) 15)) (and (= (x stone1) 2) (= (y stone1) 4)) (and (= (x stone1) 8) (= (y stone1) 1)) (and (= (x stone1) 12) (= (y stone1) 2)) (and (= (x stone1) 5) (= (y stone1) 7)) (and (= (x stone1) 5) (= (y stone1) 12)))
	(or (and (= (x stone2) 12) (= (y stone2) 11)) (and (= (x stone2) 3) (= (y stone2) 8)) (and (= (x stone2) 14) (= (y stone2) 15)) (and (= (x stone2) 2) (= (y stone2) 4)) (and (= (x stone2) 8) (= (y stone2) 1)) (and (= (x stone2) 12) (= (y stone2) 2)) (and (= (x stone2) 5) (= (y stone2) 7)) (and (= (x stone2) 5) (= (y stone2) 12)))
	(or (and (= (x stone3) 12) (= (y stone3) 11)) (and (= (x stone3) 3) (= (y stone3) 8)) (and (= (x stone3) 14) (= (y stone3) 15)) (and (= (x stone3) 2) (= (y stone3) 4)) (and (= (x stone3) 8) (= (y stone3) 1)) (and (= (x stone3) 12) (= (y stone3) 2)) (and (= (x stone3) 5) (= (y stone3) 7)) (and (= (x stone3) 5) (= (y stone3) 12)))
	(or (and (= (x stone4) 12) (= (y stone4) 11)) (and (= (x stone4) 3) (= (y stone4) 8)) (and (= (x stone4) 14) (= (y stone4) 15)) (and (= (x stone4) 2) (= (y stone4) 4)) (and (= (x stone4) 8) (= (y stone4) 1)) (and (= (x stone4) 12) (= (y stone4) 2)) (and (= (x stone4) 5) (= (y stone4) 7)) (and (= (x stone4) 5) (= (y stone4) 12)))
	(or (and (= (x stone5) 12) (= (y stone5) 11)) (and (= (x stone5) 3) (= (y stone5) 8)) (and (= (x stone5) 14) (= (y stone5) 15)) (and (= (x stone5) 2) (= (y stone5) 4)) (and (= (x stone5) 8) (= (y stone5) 1)) (and (= (x stone5) 12) (= (y stone5) 2)) (and (= (x stone5) 5) (= (y stone5) 7)) (and (= (x stone5) 5) (= (y stone5) 12)))
	(or (and (= (x stone6) 12) (= (y stone6) 11)) (and (= (x stone6) 3) (= (y stone6) 8)) (and (= (x stone6) 14) (= (y stone6) 15)) (and (= (x stone6) 2) (= (y stone6) 4)) (and (= (x stone6) 8) (= (y stone6) 1)) (and (= (x stone6) 12) (= (y stone6) 2)) (and (= (x stone6) 5) (= (y stone6) 7)) (and (= (x stone6) 5) (= (y stone6) 12)))
	(or (and (= (x stone7) 12) (= (y stone7) 11)) (and (= (x stone7) 3) (= (y stone7) 8)) (and (= (x stone7) 14) (= (y stone7) 15)) (and (= (x stone7) 2) (= (y stone7) 4)) (and (= (x stone7) 8) (= (y stone7) 1)) (and (= (x stone7) 12) (= (y stone7) 2)) (and (= (x stone7) 5) (= (y stone7) 7)) (and (= (x stone7) 5) (= (y stone7) 12)))
	(or (and (= (x stone8) 12) (= (y stone8) 11)) (and (= (x stone8) 3) (= (y stone8) 8)) (and (= (x stone8) 14) (= (y stone8) 15)) (and (= (x stone8) 2) (= (y stone8) 4)) (and (= (x stone8) 8) (= (y stone8) 1)) (and (= (x stone8) 12) (= (y stone8) 2)) (and (= (x stone8) 5) (= (y stone8) 7)) (and (= (x stone8) 5) (= (y stone8) 12)))
  ))

  
  

  
)
