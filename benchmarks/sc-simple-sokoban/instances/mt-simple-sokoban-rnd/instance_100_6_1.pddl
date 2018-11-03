(define (problem instance_100_6_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 100)
	(= (min_x) 1)
	(= (max_y) 100)
	(= (min_y) 1)
	(= (x player1) 36)
	(= (y player1) 93)
	(= (x stone1) 28)
	(= (y stone1) 63)
	(= (x stone2) 67)
	(= (y stone2) 38)
	(= (x stone3) 90)
	(= (y stone3) 10)
	(= (x stone4) 87)
	(= (y stone4) 19)
	(= (x stone5) 27)
	(= (y stone5) 64)
	(= (x stone6) 7)
	(= (y stone6) 90)
  )

  (:goal (and 
    (or (and (= (x stone1) 79) (= (y stone1) 25)) (and (= (x stone1) 75) (= (y stone1) 15)) (and (= (x stone1) 41) (= (y stone1) 33)) (and (= (x stone1) 46) (= (y stone1) 39)) (and (= (x stone1) 66) (= (y stone1) 29)) (and (= (x stone1) 2) (= (y stone1) 30)))
	(or (and (= (x stone2) 79) (= (y stone2) 25)) (and (= (x stone2) 75) (= (y stone2) 15)) (and (= (x stone2) 41) (= (y stone2) 33)) (and (= (x stone2) 46) (= (y stone2) 39)) (and (= (x stone2) 66) (= (y stone2) 29)) (and (= (x stone2) 2) (= (y stone2) 30)))
	(or (and (= (x stone3) 79) (= (y stone3) 25)) (and (= (x stone3) 75) (= (y stone3) 15)) (and (= (x stone3) 41) (= (y stone3) 33)) (and (= (x stone3) 46) (= (y stone3) 39)) (and (= (x stone3) 66) (= (y stone3) 29)) (and (= (x stone3) 2) (= (y stone3) 30)))
	(or (and (= (x stone4) 79) (= (y stone4) 25)) (and (= (x stone4) 75) (= (y stone4) 15)) (and (= (x stone4) 41) (= (y stone4) 33)) (and (= (x stone4) 46) (= (y stone4) 39)) (and (= (x stone4) 66) (= (y stone4) 29)) (and (= (x stone4) 2) (= (y stone4) 30)))
	(or (and (= (x stone5) 79) (= (y stone5) 25)) (and (= (x stone5) 75) (= (y stone5) 15)) (and (= (x stone5) 41) (= (y stone5) 33)) (and (= (x stone5) 46) (= (y stone5) 39)) (and (= (x stone5) 66) (= (y stone5) 29)) (and (= (x stone5) 2) (= (y stone5) 30)))
	(or (and (= (x stone6) 79) (= (y stone6) 25)) (and (= (x stone6) 75) (= (y stone6) 15)) (and (= (x stone6) 41) (= (y stone6) 33)) (and (= (x stone6) 46) (= (y stone6) 39)) (and (= (x stone6) 66) (= (y stone6) 29)) (and (= (x stone6) 2) (= (y stone6) 30)))
  ))

  
  

  
)
