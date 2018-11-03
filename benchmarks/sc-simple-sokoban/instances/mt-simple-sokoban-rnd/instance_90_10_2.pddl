(define (problem instance_90_10_2)
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
	(= (x player1) 59)
	(= (y player1) 35)
	(= (x stone1) 15)
	(= (y stone1) 76)
	(= (x stone2) 41)
	(= (y stone2) 40)
	(= (x stone3) 41)
	(= (y stone3) 3)
	(= (x stone4) 39)
	(= (y stone4) 18)
	(= (x stone5) 85)
	(= (y stone5) 20)
	(= (x stone6) 75)
	(= (y stone6) 53)
	(= (x stone7) 66)
	(= (y stone7) 3)
	(= (x stone8) 18)
	(= (y stone8) 76)
	(= (x stone9) 61)
	(= (y stone9) 3)
	(= (x stone10) 89)
	(= (y stone10) 66)
  )

  (:goal (and 
    (or (and (= (x stone1) 36) (= (y stone1) 60)) (and (= (x stone1) 59) (= (y stone1) 57)) (and (= (x stone1) 73) (= (y stone1) 15)) (and (= (x stone1) 40) (= (y stone1) 79)) (and (= (x stone1) 64) (= (y stone1) 33)) (and (= (x stone1) 52) (= (y stone1) 80)) (and (= (x stone1) 80) (= (y stone1) 90)) (and (= (x stone1) 90) (= (y stone1) 32)) (and (= (x stone1) 16) (= (y stone1) 10)) (and (= (x stone1) 5) (= (y stone1) 51)))
	(or (and (= (x stone2) 36) (= (y stone2) 60)) (and (= (x stone2) 59) (= (y stone2) 57)) (and (= (x stone2) 73) (= (y stone2) 15)) (and (= (x stone2) 40) (= (y stone2) 79)) (and (= (x stone2) 64) (= (y stone2) 33)) (and (= (x stone2) 52) (= (y stone2) 80)) (and (= (x stone2) 80) (= (y stone2) 90)) (and (= (x stone2) 90) (= (y stone2) 32)) (and (= (x stone2) 16) (= (y stone2) 10)) (and (= (x stone2) 5) (= (y stone2) 51)))
	(or (and (= (x stone3) 36) (= (y stone3) 60)) (and (= (x stone3) 59) (= (y stone3) 57)) (and (= (x stone3) 73) (= (y stone3) 15)) (and (= (x stone3) 40) (= (y stone3) 79)) (and (= (x stone3) 64) (= (y stone3) 33)) (and (= (x stone3) 52) (= (y stone3) 80)) (and (= (x stone3) 80) (= (y stone3) 90)) (and (= (x stone3) 90) (= (y stone3) 32)) (and (= (x stone3) 16) (= (y stone3) 10)) (and (= (x stone3) 5) (= (y stone3) 51)))
	(or (and (= (x stone4) 36) (= (y stone4) 60)) (and (= (x stone4) 59) (= (y stone4) 57)) (and (= (x stone4) 73) (= (y stone4) 15)) (and (= (x stone4) 40) (= (y stone4) 79)) (and (= (x stone4) 64) (= (y stone4) 33)) (and (= (x stone4) 52) (= (y stone4) 80)) (and (= (x stone4) 80) (= (y stone4) 90)) (and (= (x stone4) 90) (= (y stone4) 32)) (and (= (x stone4) 16) (= (y stone4) 10)) (and (= (x stone4) 5) (= (y stone4) 51)))
	(or (and (= (x stone5) 36) (= (y stone5) 60)) (and (= (x stone5) 59) (= (y stone5) 57)) (and (= (x stone5) 73) (= (y stone5) 15)) (and (= (x stone5) 40) (= (y stone5) 79)) (and (= (x stone5) 64) (= (y stone5) 33)) (and (= (x stone5) 52) (= (y stone5) 80)) (and (= (x stone5) 80) (= (y stone5) 90)) (and (= (x stone5) 90) (= (y stone5) 32)) (and (= (x stone5) 16) (= (y stone5) 10)) (and (= (x stone5) 5) (= (y stone5) 51)))
	(or (and (= (x stone6) 36) (= (y stone6) 60)) (and (= (x stone6) 59) (= (y stone6) 57)) (and (= (x stone6) 73) (= (y stone6) 15)) (and (= (x stone6) 40) (= (y stone6) 79)) (and (= (x stone6) 64) (= (y stone6) 33)) (and (= (x stone6) 52) (= (y stone6) 80)) (and (= (x stone6) 80) (= (y stone6) 90)) (and (= (x stone6) 90) (= (y stone6) 32)) (and (= (x stone6) 16) (= (y stone6) 10)) (and (= (x stone6) 5) (= (y stone6) 51)))
	(or (and (= (x stone7) 36) (= (y stone7) 60)) (and (= (x stone7) 59) (= (y stone7) 57)) (and (= (x stone7) 73) (= (y stone7) 15)) (and (= (x stone7) 40) (= (y stone7) 79)) (and (= (x stone7) 64) (= (y stone7) 33)) (and (= (x stone7) 52) (= (y stone7) 80)) (and (= (x stone7) 80) (= (y stone7) 90)) (and (= (x stone7) 90) (= (y stone7) 32)) (and (= (x stone7) 16) (= (y stone7) 10)) (and (= (x stone7) 5) (= (y stone7) 51)))
	(or (and (= (x stone8) 36) (= (y stone8) 60)) (and (= (x stone8) 59) (= (y stone8) 57)) (and (= (x stone8) 73) (= (y stone8) 15)) (and (= (x stone8) 40) (= (y stone8) 79)) (and (= (x stone8) 64) (= (y stone8) 33)) (and (= (x stone8) 52) (= (y stone8) 80)) (and (= (x stone8) 80) (= (y stone8) 90)) (and (= (x stone8) 90) (= (y stone8) 32)) (and (= (x stone8) 16) (= (y stone8) 10)) (and (= (x stone8) 5) (= (y stone8) 51)))
	(or (and (= (x stone9) 36) (= (y stone9) 60)) (and (= (x stone9) 59) (= (y stone9) 57)) (and (= (x stone9) 73) (= (y stone9) 15)) (and (= (x stone9) 40) (= (y stone9) 79)) (and (= (x stone9) 64) (= (y stone9) 33)) (and (= (x stone9) 52) (= (y stone9) 80)) (and (= (x stone9) 80) (= (y stone9) 90)) (and (= (x stone9) 90) (= (y stone9) 32)) (and (= (x stone9) 16) (= (y stone9) 10)) (and (= (x stone9) 5) (= (y stone9) 51)))
	(or (and (= (x stone10) 36) (= (y stone10) 60)) (and (= (x stone10) 59) (= (y stone10) 57)) (and (= (x stone10) 73) (= (y stone10) 15)) (and (= (x stone10) 40) (= (y stone10) 79)) (and (= (x stone10) 64) (= (y stone10) 33)) (and (= (x stone10) 52) (= (y stone10) 80)) (and (= (x stone10) 80) (= (y stone10) 90)) (and (= (x stone10) 90) (= (y stone10) 32)) (and (= (x stone10) 16) (= (y stone10) 10)) (and (= (x stone10) 5) (= (y stone10) 51)))
  ))

  
  

  
)
