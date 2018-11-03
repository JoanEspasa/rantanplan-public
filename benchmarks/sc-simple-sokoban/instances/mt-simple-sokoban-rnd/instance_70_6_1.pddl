(define (problem instance_70_6_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 70)
	(= (min_x) 1)
	(= (max_y) 70)
	(= (min_y) 1)
	(= (x player1) 37)
	(= (y player1) 56)
	(= (x stone1) 34)
	(= (y stone1) 68)
	(= (x stone2) 34)
	(= (y stone2) 18)
	(= (x stone3) 67)
	(= (y stone3) 8)
	(= (x stone4) 35)
	(= (y stone4) 34)
	(= (x stone5) 58)
	(= (y stone5) 11)
	(= (x stone6) 31)
	(= (y stone6) 57)
  )

  (:goal (and 
    (or (and (= (x stone1) 46) (= (y stone1) 61)) (and (= (x stone1) 65) (= (y stone1) 10)) (and (= (x stone1) 63) (= (y stone1) 19)) (and (= (x stone1) 64) (= (y stone1) 33)) (and (= (x stone1) 32) (= (y stone1) 11)) (and (= (x stone1) 37) (= (y stone1) 38)))
	(or (and (= (x stone2) 46) (= (y stone2) 61)) (and (= (x stone2) 65) (= (y stone2) 10)) (and (= (x stone2) 63) (= (y stone2) 19)) (and (= (x stone2) 64) (= (y stone2) 33)) (and (= (x stone2) 32) (= (y stone2) 11)) (and (= (x stone2) 37) (= (y stone2) 38)))
	(or (and (= (x stone3) 46) (= (y stone3) 61)) (and (= (x stone3) 65) (= (y stone3) 10)) (and (= (x stone3) 63) (= (y stone3) 19)) (and (= (x stone3) 64) (= (y stone3) 33)) (and (= (x stone3) 32) (= (y stone3) 11)) (and (= (x stone3) 37) (= (y stone3) 38)))
	(or (and (= (x stone4) 46) (= (y stone4) 61)) (and (= (x stone4) 65) (= (y stone4) 10)) (and (= (x stone4) 63) (= (y stone4) 19)) (and (= (x stone4) 64) (= (y stone4) 33)) (and (= (x stone4) 32) (= (y stone4) 11)) (and (= (x stone4) 37) (= (y stone4) 38)))
	(or (and (= (x stone5) 46) (= (y stone5) 61)) (and (= (x stone5) 65) (= (y stone5) 10)) (and (= (x stone5) 63) (= (y stone5) 19)) (and (= (x stone5) 64) (= (y stone5) 33)) (and (= (x stone5) 32) (= (y stone5) 11)) (and (= (x stone5) 37) (= (y stone5) 38)))
	(or (and (= (x stone6) 46) (= (y stone6) 61)) (and (= (x stone6) 65) (= (y stone6) 10)) (and (= (x stone6) 63) (= (y stone6) 19)) (and (= (x stone6) 64) (= (y stone6) 33)) (and (= (x stone6) 32) (= (y stone6) 11)) (and (= (x stone6) 37) (= (y stone6) 38)))
  ))

  
  

  
)
