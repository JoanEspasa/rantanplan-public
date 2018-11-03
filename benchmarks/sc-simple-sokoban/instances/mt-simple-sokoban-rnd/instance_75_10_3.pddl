(define (problem instance_75_10_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 75)
	(= (min_x) 1)
	(= (max_y) 75)
	(= (min_y) 1)
	(= (x player1) 17)
	(= (y player1) 56)
	(= (x stone1) 5)
	(= (y stone1) 51)
	(= (x stone2) 26)
	(= (y stone2) 30)
	(= (x stone3) 72)
	(= (y stone3) 35)
	(= (x stone4) 71)
	(= (y stone4) 49)
	(= (x stone5) 2)
	(= (y stone5) 12)
	(= (x stone6) 39)
	(= (y stone6) 11)
	(= (x stone7) 23)
	(= (y stone7) 62)
	(= (x stone8) 53)
	(= (y stone8) 42)
	(= (x stone9) 22)
	(= (y stone9) 38)
	(= (x stone10) 58)
	(= (y stone10) 71)
  )

  (:goal (and 
    (or (and (= (x stone1) 73) (= (y stone1) 31)) (and (= (x stone1) 29) (= (y stone1) 43)) (and (= (x stone1) 55) (= (y stone1) 41)) (and (= (x stone1) 4) (= (y stone1) 19)) (and (= (x stone1) 31) (= (y stone1) 33)) (and (= (x stone1) 64) (= (y stone1) 14)) (and (= (x stone1) 66) (= (y stone1) 26)) (and (= (x stone1) 50) (= (y stone1) 67)) (and (= (x stone1) 7) (= (y stone1) 60)) (and (= (x stone1) 10) (= (y stone1) 40)))
	(or (and (= (x stone2) 73) (= (y stone2) 31)) (and (= (x stone2) 29) (= (y stone2) 43)) (and (= (x stone2) 55) (= (y stone2) 41)) (and (= (x stone2) 4) (= (y stone2) 19)) (and (= (x stone2) 31) (= (y stone2) 33)) (and (= (x stone2) 64) (= (y stone2) 14)) (and (= (x stone2) 66) (= (y stone2) 26)) (and (= (x stone2) 50) (= (y stone2) 67)) (and (= (x stone2) 7) (= (y stone2) 60)) (and (= (x stone2) 10) (= (y stone2) 40)))
	(or (and (= (x stone3) 73) (= (y stone3) 31)) (and (= (x stone3) 29) (= (y stone3) 43)) (and (= (x stone3) 55) (= (y stone3) 41)) (and (= (x stone3) 4) (= (y stone3) 19)) (and (= (x stone3) 31) (= (y stone3) 33)) (and (= (x stone3) 64) (= (y stone3) 14)) (and (= (x stone3) 66) (= (y stone3) 26)) (and (= (x stone3) 50) (= (y stone3) 67)) (and (= (x stone3) 7) (= (y stone3) 60)) (and (= (x stone3) 10) (= (y stone3) 40)))
	(or (and (= (x stone4) 73) (= (y stone4) 31)) (and (= (x stone4) 29) (= (y stone4) 43)) (and (= (x stone4) 55) (= (y stone4) 41)) (and (= (x stone4) 4) (= (y stone4) 19)) (and (= (x stone4) 31) (= (y stone4) 33)) (and (= (x stone4) 64) (= (y stone4) 14)) (and (= (x stone4) 66) (= (y stone4) 26)) (and (= (x stone4) 50) (= (y stone4) 67)) (and (= (x stone4) 7) (= (y stone4) 60)) (and (= (x stone4) 10) (= (y stone4) 40)))
	(or (and (= (x stone5) 73) (= (y stone5) 31)) (and (= (x stone5) 29) (= (y stone5) 43)) (and (= (x stone5) 55) (= (y stone5) 41)) (and (= (x stone5) 4) (= (y stone5) 19)) (and (= (x stone5) 31) (= (y stone5) 33)) (and (= (x stone5) 64) (= (y stone5) 14)) (and (= (x stone5) 66) (= (y stone5) 26)) (and (= (x stone5) 50) (= (y stone5) 67)) (and (= (x stone5) 7) (= (y stone5) 60)) (and (= (x stone5) 10) (= (y stone5) 40)))
	(or (and (= (x stone6) 73) (= (y stone6) 31)) (and (= (x stone6) 29) (= (y stone6) 43)) (and (= (x stone6) 55) (= (y stone6) 41)) (and (= (x stone6) 4) (= (y stone6) 19)) (and (= (x stone6) 31) (= (y stone6) 33)) (and (= (x stone6) 64) (= (y stone6) 14)) (and (= (x stone6) 66) (= (y stone6) 26)) (and (= (x stone6) 50) (= (y stone6) 67)) (and (= (x stone6) 7) (= (y stone6) 60)) (and (= (x stone6) 10) (= (y stone6) 40)))
	(or (and (= (x stone7) 73) (= (y stone7) 31)) (and (= (x stone7) 29) (= (y stone7) 43)) (and (= (x stone7) 55) (= (y stone7) 41)) (and (= (x stone7) 4) (= (y stone7) 19)) (and (= (x stone7) 31) (= (y stone7) 33)) (and (= (x stone7) 64) (= (y stone7) 14)) (and (= (x stone7) 66) (= (y stone7) 26)) (and (= (x stone7) 50) (= (y stone7) 67)) (and (= (x stone7) 7) (= (y stone7) 60)) (and (= (x stone7) 10) (= (y stone7) 40)))
	(or (and (= (x stone8) 73) (= (y stone8) 31)) (and (= (x stone8) 29) (= (y stone8) 43)) (and (= (x stone8) 55) (= (y stone8) 41)) (and (= (x stone8) 4) (= (y stone8) 19)) (and (= (x stone8) 31) (= (y stone8) 33)) (and (= (x stone8) 64) (= (y stone8) 14)) (and (= (x stone8) 66) (= (y stone8) 26)) (and (= (x stone8) 50) (= (y stone8) 67)) (and (= (x stone8) 7) (= (y stone8) 60)) (and (= (x stone8) 10) (= (y stone8) 40)))
	(or (and (= (x stone9) 73) (= (y stone9) 31)) (and (= (x stone9) 29) (= (y stone9) 43)) (and (= (x stone9) 55) (= (y stone9) 41)) (and (= (x stone9) 4) (= (y stone9) 19)) (and (= (x stone9) 31) (= (y stone9) 33)) (and (= (x stone9) 64) (= (y stone9) 14)) (and (= (x stone9) 66) (= (y stone9) 26)) (and (= (x stone9) 50) (= (y stone9) 67)) (and (= (x stone9) 7) (= (y stone9) 60)) (and (= (x stone9) 10) (= (y stone9) 40)))
	(or (and (= (x stone10) 73) (= (y stone10) 31)) (and (= (x stone10) 29) (= (y stone10) 43)) (and (= (x stone10) 55) (= (y stone10) 41)) (and (= (x stone10) 4) (= (y stone10) 19)) (and (= (x stone10) 31) (= (y stone10) 33)) (and (= (x stone10) 64) (= (y stone10) 14)) (and (= (x stone10) 66) (= (y stone10) 26)) (and (= (x stone10) 50) (= (y stone10) 67)) (and (= (x stone10) 7) (= (y stone10) 60)) (and (= (x stone10) 10) (= (y stone10) 40)))
  ))

  
  

  
)
