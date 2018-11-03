(define (problem instance_90_6_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 90)
	(= (min_x) 1)
	(= (max_y) 90)
	(= (min_y) 1)
	(= (x player1) 68)
	(= (y player1) 7)
	(= (x stone1) 77)
	(= (y stone1) 51)
	(= (x stone2) 53)
	(= (y stone2) 56)
	(= (x stone3) 81)
	(= (y stone3) 49)
	(= (x stone4) 76)
	(= (y stone4) 36)
	(= (x stone5) 18)
	(= (y stone5) 57)
	(= (x stone6) 88)
	(= (y stone6) 55)
  )

  (:goal (and 
    (or (and (= (x stone1) 4) (= (y stone1) 62)) (and (= (x stone1) 29) (= (y stone1) 12)) (and (= (x stone1) 48) (= (y stone1) 15)) (and (= (x stone1) 18) (= (y stone1) 81)) (and (= (x stone1) 41) (= (y stone1) 75)) (and (= (x stone1) 79) (= (y stone1) 71)))
	(or (and (= (x stone2) 4) (= (y stone2) 62)) (and (= (x stone2) 29) (= (y stone2) 12)) (and (= (x stone2) 48) (= (y stone2) 15)) (and (= (x stone2) 18) (= (y stone2) 81)) (and (= (x stone2) 41) (= (y stone2) 75)) (and (= (x stone2) 79) (= (y stone2) 71)))
	(or (and (= (x stone3) 4) (= (y stone3) 62)) (and (= (x stone3) 29) (= (y stone3) 12)) (and (= (x stone3) 48) (= (y stone3) 15)) (and (= (x stone3) 18) (= (y stone3) 81)) (and (= (x stone3) 41) (= (y stone3) 75)) (and (= (x stone3) 79) (= (y stone3) 71)))
	(or (and (= (x stone4) 4) (= (y stone4) 62)) (and (= (x stone4) 29) (= (y stone4) 12)) (and (= (x stone4) 48) (= (y stone4) 15)) (and (= (x stone4) 18) (= (y stone4) 81)) (and (= (x stone4) 41) (= (y stone4) 75)) (and (= (x stone4) 79) (= (y stone4) 71)))
	(or (and (= (x stone5) 4) (= (y stone5) 62)) (and (= (x stone5) 29) (= (y stone5) 12)) (and (= (x stone5) 48) (= (y stone5) 15)) (and (= (x stone5) 18) (= (y stone5) 81)) (and (= (x stone5) 41) (= (y stone5) 75)) (and (= (x stone5) 79) (= (y stone5) 71)))
	(or (and (= (x stone6) 4) (= (y stone6) 62)) (and (= (x stone6) 29) (= (y stone6) 12)) (and (= (x stone6) 48) (= (y stone6) 15)) (and (= (x stone6) 18) (= (y stone6) 81)) (and (= (x stone6) 41) (= (y stone6) 75)) (and (= (x stone6) 79) (= (y stone6) 71)))
  ))

  
  

  
)
