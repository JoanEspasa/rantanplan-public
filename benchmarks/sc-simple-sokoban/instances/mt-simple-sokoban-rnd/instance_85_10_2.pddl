(define (problem instance_85_10_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 85)
	(= (min_x) 1)
	(= (max_y) 85)
	(= (min_y) 1)
	(= (x player1) 57)
	(= (y player1) 51)
	(= (x stone1) 59)
	(= (y stone1) 43)
	(= (x stone2) 31)
	(= (y stone2) 49)
	(= (x stone3) 44)
	(= (y stone3) 6)
	(= (x stone4) 2)
	(= (y stone4) 7)
	(= (x stone5) 8)
	(= (y stone5) 54)
	(= (x stone6) 81)
	(= (y stone6) 35)
	(= (x stone7) 58)
	(= (y stone7) 79)
	(= (x stone8) 17)
	(= (y stone8) 10)
	(= (x stone9) 51)
	(= (y stone9) 66)
	(= (x stone10) 15)
	(= (y stone10) 50)
  )

  (:goal (and 
    (or (and (= (x stone1) 66) (= (y stone1) 70)) (and (= (x stone1) 65) (= (y stone1) 19)) (and (= (x stone1) 8) (= (y stone1) 10)) (and (= (x stone1) 81) (= (y stone1) 47)) (and (= (x stone1) 18) (= (y stone1) 33)) (and (= (x stone1) 67) (= (y stone1) 19)) (and (= (x stone1) 31) (= (y stone1) 39)) (and (= (x stone1) 3) (= (y stone1) 80)) (and (= (x stone1) 18) (= (y stone1) 76)) (and (= (x stone1) 1) (= (y stone1) 5)))
	(or (and (= (x stone2) 66) (= (y stone2) 70)) (and (= (x stone2) 65) (= (y stone2) 19)) (and (= (x stone2) 8) (= (y stone2) 10)) (and (= (x stone2) 81) (= (y stone2) 47)) (and (= (x stone2) 18) (= (y stone2) 33)) (and (= (x stone2) 67) (= (y stone2) 19)) (and (= (x stone2) 31) (= (y stone2) 39)) (and (= (x stone2) 3) (= (y stone2) 80)) (and (= (x stone2) 18) (= (y stone2) 76)) (and (= (x stone2) 1) (= (y stone2) 5)))
	(or (and (= (x stone3) 66) (= (y stone3) 70)) (and (= (x stone3) 65) (= (y stone3) 19)) (and (= (x stone3) 8) (= (y stone3) 10)) (and (= (x stone3) 81) (= (y stone3) 47)) (and (= (x stone3) 18) (= (y stone3) 33)) (and (= (x stone3) 67) (= (y stone3) 19)) (and (= (x stone3) 31) (= (y stone3) 39)) (and (= (x stone3) 3) (= (y stone3) 80)) (and (= (x stone3) 18) (= (y stone3) 76)) (and (= (x stone3) 1) (= (y stone3) 5)))
	(or (and (= (x stone4) 66) (= (y stone4) 70)) (and (= (x stone4) 65) (= (y stone4) 19)) (and (= (x stone4) 8) (= (y stone4) 10)) (and (= (x stone4) 81) (= (y stone4) 47)) (and (= (x stone4) 18) (= (y stone4) 33)) (and (= (x stone4) 67) (= (y stone4) 19)) (and (= (x stone4) 31) (= (y stone4) 39)) (and (= (x stone4) 3) (= (y stone4) 80)) (and (= (x stone4) 18) (= (y stone4) 76)) (and (= (x stone4) 1) (= (y stone4) 5)))
	(or (and (= (x stone5) 66) (= (y stone5) 70)) (and (= (x stone5) 65) (= (y stone5) 19)) (and (= (x stone5) 8) (= (y stone5) 10)) (and (= (x stone5) 81) (= (y stone5) 47)) (and (= (x stone5) 18) (= (y stone5) 33)) (and (= (x stone5) 67) (= (y stone5) 19)) (and (= (x stone5) 31) (= (y stone5) 39)) (and (= (x stone5) 3) (= (y stone5) 80)) (and (= (x stone5) 18) (= (y stone5) 76)) (and (= (x stone5) 1) (= (y stone5) 5)))
	(or (and (= (x stone6) 66) (= (y stone6) 70)) (and (= (x stone6) 65) (= (y stone6) 19)) (and (= (x stone6) 8) (= (y stone6) 10)) (and (= (x stone6) 81) (= (y stone6) 47)) (and (= (x stone6) 18) (= (y stone6) 33)) (and (= (x stone6) 67) (= (y stone6) 19)) (and (= (x stone6) 31) (= (y stone6) 39)) (and (= (x stone6) 3) (= (y stone6) 80)) (and (= (x stone6) 18) (= (y stone6) 76)) (and (= (x stone6) 1) (= (y stone6) 5)))
	(or (and (= (x stone7) 66) (= (y stone7) 70)) (and (= (x stone7) 65) (= (y stone7) 19)) (and (= (x stone7) 8) (= (y stone7) 10)) (and (= (x stone7) 81) (= (y stone7) 47)) (and (= (x stone7) 18) (= (y stone7) 33)) (and (= (x stone7) 67) (= (y stone7) 19)) (and (= (x stone7) 31) (= (y stone7) 39)) (and (= (x stone7) 3) (= (y stone7) 80)) (and (= (x stone7) 18) (= (y stone7) 76)) (and (= (x stone7) 1) (= (y stone7) 5)))
	(or (and (= (x stone8) 66) (= (y stone8) 70)) (and (= (x stone8) 65) (= (y stone8) 19)) (and (= (x stone8) 8) (= (y stone8) 10)) (and (= (x stone8) 81) (= (y stone8) 47)) (and (= (x stone8) 18) (= (y stone8) 33)) (and (= (x stone8) 67) (= (y stone8) 19)) (and (= (x stone8) 31) (= (y stone8) 39)) (and (= (x stone8) 3) (= (y stone8) 80)) (and (= (x stone8) 18) (= (y stone8) 76)) (and (= (x stone8) 1) (= (y stone8) 5)))
	(or (and (= (x stone9) 66) (= (y stone9) 70)) (and (= (x stone9) 65) (= (y stone9) 19)) (and (= (x stone9) 8) (= (y stone9) 10)) (and (= (x stone9) 81) (= (y stone9) 47)) (and (= (x stone9) 18) (= (y stone9) 33)) (and (= (x stone9) 67) (= (y stone9) 19)) (and (= (x stone9) 31) (= (y stone9) 39)) (and (= (x stone9) 3) (= (y stone9) 80)) (and (= (x stone9) 18) (= (y stone9) 76)) (and (= (x stone9) 1) (= (y stone9) 5)))
	(or (and (= (x stone10) 66) (= (y stone10) 70)) (and (= (x stone10) 65) (= (y stone10) 19)) (and (= (x stone10) 8) (= (y stone10) 10)) (and (= (x stone10) 81) (= (y stone10) 47)) (and (= (x stone10) 18) (= (y stone10) 33)) (and (= (x stone10) 67) (= (y stone10) 19)) (and (= (x stone10) 31) (= (y stone10) 39)) (and (= (x stone10) 3) (= (y stone10) 80)) (and (= (x stone10) 18) (= (y stone10) 76)) (and (= (x stone10) 1) (= (y stone10) 5)))
  ))

  
  

  
)
