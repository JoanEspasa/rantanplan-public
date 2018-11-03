(define (problem instance_70_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 70)
	(= (min_x) 1)
	(= (max_y) 70)
	(= (min_y) 1)
	(= (x player1) 8)
	(= (y player1) 67)
	(= (x stone1) 68)
	(= (y stone1) 67)
	(= (x stone2) 14)
	(= (y stone2) 20)
	(= (x stone3) 17)
	(= (y stone3) 47)
	(= (x stone4) 42)
	(= (y stone4) 54)
	(= (x stone5) 56)
	(= (y stone5) 11)
	(= (x stone6) 29)
	(= (y stone6) 27)
	(= (x stone7) 8)
	(= (y stone7) 28)
	(= (x stone8) 64)
	(= (y stone8) 51)
	(= (x stone9) 57)
	(= (y stone9) 46)
	(= (x stone10) 25)
	(= (y stone10) 5)
  )

  (:goal (and 
    (or (and (= (x stone1) 40) (= (y stone1) 9)) (and (= (x stone1) 26) (= (y stone1) 28)) (and (= (x stone1) 62) (= (y stone1) 60)) (and (= (x stone1) 4) (= (y stone1) 27)) (and (= (x stone1) 21) (= (y stone1) 15)) (and (= (x stone1) 64) (= (y stone1) 8)) (and (= (x stone1) 60) (= (y stone1) 66)) (and (= (x stone1) 54) (= (y stone1) 33)) (and (= (x stone1) 62) (= (y stone1) 59)) (and (= (x stone1) 42) (= (y stone1) 47)))
	(or (and (= (x stone2) 40) (= (y stone2) 9)) (and (= (x stone2) 26) (= (y stone2) 28)) (and (= (x stone2) 62) (= (y stone2) 60)) (and (= (x stone2) 4) (= (y stone2) 27)) (and (= (x stone2) 21) (= (y stone2) 15)) (and (= (x stone2) 64) (= (y stone2) 8)) (and (= (x stone2) 60) (= (y stone2) 66)) (and (= (x stone2) 54) (= (y stone2) 33)) (and (= (x stone2) 62) (= (y stone2) 59)) (and (= (x stone2) 42) (= (y stone2) 47)))
	(or (and (= (x stone3) 40) (= (y stone3) 9)) (and (= (x stone3) 26) (= (y stone3) 28)) (and (= (x stone3) 62) (= (y stone3) 60)) (and (= (x stone3) 4) (= (y stone3) 27)) (and (= (x stone3) 21) (= (y stone3) 15)) (and (= (x stone3) 64) (= (y stone3) 8)) (and (= (x stone3) 60) (= (y stone3) 66)) (and (= (x stone3) 54) (= (y stone3) 33)) (and (= (x stone3) 62) (= (y stone3) 59)) (and (= (x stone3) 42) (= (y stone3) 47)))
	(or (and (= (x stone4) 40) (= (y stone4) 9)) (and (= (x stone4) 26) (= (y stone4) 28)) (and (= (x stone4) 62) (= (y stone4) 60)) (and (= (x stone4) 4) (= (y stone4) 27)) (and (= (x stone4) 21) (= (y stone4) 15)) (and (= (x stone4) 64) (= (y stone4) 8)) (and (= (x stone4) 60) (= (y stone4) 66)) (and (= (x stone4) 54) (= (y stone4) 33)) (and (= (x stone4) 62) (= (y stone4) 59)) (and (= (x stone4) 42) (= (y stone4) 47)))
	(or (and (= (x stone5) 40) (= (y stone5) 9)) (and (= (x stone5) 26) (= (y stone5) 28)) (and (= (x stone5) 62) (= (y stone5) 60)) (and (= (x stone5) 4) (= (y stone5) 27)) (and (= (x stone5) 21) (= (y stone5) 15)) (and (= (x stone5) 64) (= (y stone5) 8)) (and (= (x stone5) 60) (= (y stone5) 66)) (and (= (x stone5) 54) (= (y stone5) 33)) (and (= (x stone5) 62) (= (y stone5) 59)) (and (= (x stone5) 42) (= (y stone5) 47)))
	(or (and (= (x stone6) 40) (= (y stone6) 9)) (and (= (x stone6) 26) (= (y stone6) 28)) (and (= (x stone6) 62) (= (y stone6) 60)) (and (= (x stone6) 4) (= (y stone6) 27)) (and (= (x stone6) 21) (= (y stone6) 15)) (and (= (x stone6) 64) (= (y stone6) 8)) (and (= (x stone6) 60) (= (y stone6) 66)) (and (= (x stone6) 54) (= (y stone6) 33)) (and (= (x stone6) 62) (= (y stone6) 59)) (and (= (x stone6) 42) (= (y stone6) 47)))
	(or (and (= (x stone7) 40) (= (y stone7) 9)) (and (= (x stone7) 26) (= (y stone7) 28)) (and (= (x stone7) 62) (= (y stone7) 60)) (and (= (x stone7) 4) (= (y stone7) 27)) (and (= (x stone7) 21) (= (y stone7) 15)) (and (= (x stone7) 64) (= (y stone7) 8)) (and (= (x stone7) 60) (= (y stone7) 66)) (and (= (x stone7) 54) (= (y stone7) 33)) (and (= (x stone7) 62) (= (y stone7) 59)) (and (= (x stone7) 42) (= (y stone7) 47)))
	(or (and (= (x stone8) 40) (= (y stone8) 9)) (and (= (x stone8) 26) (= (y stone8) 28)) (and (= (x stone8) 62) (= (y stone8) 60)) (and (= (x stone8) 4) (= (y stone8) 27)) (and (= (x stone8) 21) (= (y stone8) 15)) (and (= (x stone8) 64) (= (y stone8) 8)) (and (= (x stone8) 60) (= (y stone8) 66)) (and (= (x stone8) 54) (= (y stone8) 33)) (and (= (x stone8) 62) (= (y stone8) 59)) (and (= (x stone8) 42) (= (y stone8) 47)))
	(or (and (= (x stone9) 40) (= (y stone9) 9)) (and (= (x stone9) 26) (= (y stone9) 28)) (and (= (x stone9) 62) (= (y stone9) 60)) (and (= (x stone9) 4) (= (y stone9) 27)) (and (= (x stone9) 21) (= (y stone9) 15)) (and (= (x stone9) 64) (= (y stone9) 8)) (and (= (x stone9) 60) (= (y stone9) 66)) (and (= (x stone9) 54) (= (y stone9) 33)) (and (= (x stone9) 62) (= (y stone9) 59)) (and (= (x stone9) 42) (= (y stone9) 47)))
	(or (and (= (x stone10) 40) (= (y stone10) 9)) (and (= (x stone10) 26) (= (y stone10) 28)) (and (= (x stone10) 62) (= (y stone10) 60)) (and (= (x stone10) 4) (= (y stone10) 27)) (and (= (x stone10) 21) (= (y stone10) 15)) (and (= (x stone10) 64) (= (y stone10) 8)) (and (= (x stone10) 60) (= (y stone10) 66)) (and (= (x stone10) 54) (= (y stone10) 33)) (and (= (x stone10) 62) (= (y stone10) 59)) (and (= (x stone10) 42) (= (y stone10) 47)))
  ))

  
  

  
)
