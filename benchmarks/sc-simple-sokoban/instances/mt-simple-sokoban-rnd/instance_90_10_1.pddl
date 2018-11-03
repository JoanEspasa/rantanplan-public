(define (problem instance_90_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 90)
	(= (min_x) 1)
	(= (max_y) 90)
	(= (min_y) 1)
	(= (x player1) 14)
	(= (y player1) 17)
	(= (x stone1) 69)
	(= (y stone1) 69)
	(= (x stone2) 55)
	(= (y stone2) 25)
	(= (x stone3) 69)
	(= (y stone3) 49)
	(= (x stone4) 76)
	(= (y stone4) 17)
	(= (x stone5) 48)
	(= (y stone5) 28)
	(= (x stone6) 8)
	(= (y stone6) 67)
	(= (x stone7) 77)
	(= (y stone7) 33)
	(= (x stone8) 50)
	(= (y stone8) 11)
	(= (x stone9) 67)
	(= (y stone9) 31)
	(= (x stone10) 64)
	(= (y stone10) 7)
  )

  (:goal (and 
    (or (and (= (x stone1) 81) (= (y stone1) 20)) (and (= (x stone1) 30) (= (y stone1) 5)) (and (= (x stone1) 33) (= (y stone1) 33)) (and (= (x stone1) 54) (= (y stone1) 59)) (and (= (x stone1) 17) (= (y stone1) 33)) (and (= (x stone1) 21) (= (y stone1) 85)) (and (= (x stone1) 9) (= (y stone1) 83)) (and (= (x stone1) 16) (= (y stone1) 70)) (and (= (x stone1) 60) (= (y stone1) 22)) (and (= (x stone1) 4) (= (y stone1) 70)))
	(or (and (= (x stone2) 81) (= (y stone2) 20)) (and (= (x stone2) 30) (= (y stone2) 5)) (and (= (x stone2) 33) (= (y stone2) 33)) (and (= (x stone2) 54) (= (y stone2) 59)) (and (= (x stone2) 17) (= (y stone2) 33)) (and (= (x stone2) 21) (= (y stone2) 85)) (and (= (x stone2) 9) (= (y stone2) 83)) (and (= (x stone2) 16) (= (y stone2) 70)) (and (= (x stone2) 60) (= (y stone2) 22)) (and (= (x stone2) 4) (= (y stone2) 70)))
	(or (and (= (x stone3) 81) (= (y stone3) 20)) (and (= (x stone3) 30) (= (y stone3) 5)) (and (= (x stone3) 33) (= (y stone3) 33)) (and (= (x stone3) 54) (= (y stone3) 59)) (and (= (x stone3) 17) (= (y stone3) 33)) (and (= (x stone3) 21) (= (y stone3) 85)) (and (= (x stone3) 9) (= (y stone3) 83)) (and (= (x stone3) 16) (= (y stone3) 70)) (and (= (x stone3) 60) (= (y stone3) 22)) (and (= (x stone3) 4) (= (y stone3) 70)))
	(or (and (= (x stone4) 81) (= (y stone4) 20)) (and (= (x stone4) 30) (= (y stone4) 5)) (and (= (x stone4) 33) (= (y stone4) 33)) (and (= (x stone4) 54) (= (y stone4) 59)) (and (= (x stone4) 17) (= (y stone4) 33)) (and (= (x stone4) 21) (= (y stone4) 85)) (and (= (x stone4) 9) (= (y stone4) 83)) (and (= (x stone4) 16) (= (y stone4) 70)) (and (= (x stone4) 60) (= (y stone4) 22)) (and (= (x stone4) 4) (= (y stone4) 70)))
	(or (and (= (x stone5) 81) (= (y stone5) 20)) (and (= (x stone5) 30) (= (y stone5) 5)) (and (= (x stone5) 33) (= (y stone5) 33)) (and (= (x stone5) 54) (= (y stone5) 59)) (and (= (x stone5) 17) (= (y stone5) 33)) (and (= (x stone5) 21) (= (y stone5) 85)) (and (= (x stone5) 9) (= (y stone5) 83)) (and (= (x stone5) 16) (= (y stone5) 70)) (and (= (x stone5) 60) (= (y stone5) 22)) (and (= (x stone5) 4) (= (y stone5) 70)))
	(or (and (= (x stone6) 81) (= (y stone6) 20)) (and (= (x stone6) 30) (= (y stone6) 5)) (and (= (x stone6) 33) (= (y stone6) 33)) (and (= (x stone6) 54) (= (y stone6) 59)) (and (= (x stone6) 17) (= (y stone6) 33)) (and (= (x stone6) 21) (= (y stone6) 85)) (and (= (x stone6) 9) (= (y stone6) 83)) (and (= (x stone6) 16) (= (y stone6) 70)) (and (= (x stone6) 60) (= (y stone6) 22)) (and (= (x stone6) 4) (= (y stone6) 70)))
	(or (and (= (x stone7) 81) (= (y stone7) 20)) (and (= (x stone7) 30) (= (y stone7) 5)) (and (= (x stone7) 33) (= (y stone7) 33)) (and (= (x stone7) 54) (= (y stone7) 59)) (and (= (x stone7) 17) (= (y stone7) 33)) (and (= (x stone7) 21) (= (y stone7) 85)) (and (= (x stone7) 9) (= (y stone7) 83)) (and (= (x stone7) 16) (= (y stone7) 70)) (and (= (x stone7) 60) (= (y stone7) 22)) (and (= (x stone7) 4) (= (y stone7) 70)))
	(or (and (= (x stone8) 81) (= (y stone8) 20)) (and (= (x stone8) 30) (= (y stone8) 5)) (and (= (x stone8) 33) (= (y stone8) 33)) (and (= (x stone8) 54) (= (y stone8) 59)) (and (= (x stone8) 17) (= (y stone8) 33)) (and (= (x stone8) 21) (= (y stone8) 85)) (and (= (x stone8) 9) (= (y stone8) 83)) (and (= (x stone8) 16) (= (y stone8) 70)) (and (= (x stone8) 60) (= (y stone8) 22)) (and (= (x stone8) 4) (= (y stone8) 70)))
	(or (and (= (x stone9) 81) (= (y stone9) 20)) (and (= (x stone9) 30) (= (y stone9) 5)) (and (= (x stone9) 33) (= (y stone9) 33)) (and (= (x stone9) 54) (= (y stone9) 59)) (and (= (x stone9) 17) (= (y stone9) 33)) (and (= (x stone9) 21) (= (y stone9) 85)) (and (= (x stone9) 9) (= (y stone9) 83)) (and (= (x stone9) 16) (= (y stone9) 70)) (and (= (x stone9) 60) (= (y stone9) 22)) (and (= (x stone9) 4) (= (y stone9) 70)))
	(or (and (= (x stone10) 81) (= (y stone10) 20)) (and (= (x stone10) 30) (= (y stone10) 5)) (and (= (x stone10) 33) (= (y stone10) 33)) (and (= (x stone10) 54) (= (y stone10) 59)) (and (= (x stone10) 17) (= (y stone10) 33)) (and (= (x stone10) 21) (= (y stone10) 85)) (and (= (x stone10) 9) (= (y stone10) 83)) (and (= (x stone10) 16) (= (y stone10) 70)) (and (= (x stone10) 60) (= (y stone10) 22)) (and (= (x stone10) 4) (= (y stone10) 70)))
  ))

  
  

  
)
