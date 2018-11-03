(define (problem instance_95_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 95)
	(= (min_x) 1)
	(= (max_y) 95)
	(= (min_y) 1)
	(= (x player1) 80)
	(= (y player1) 75)
	(= (x stone1) 35)
	(= (y stone1) 39)
	(= (x stone2) 85)
	(= (y stone2) 51)
	(= (x stone3) 72)
	(= (y stone3) 19)
	(= (x stone4) 60)
	(= (y stone4) 16)
	(= (x stone5) 21)
	(= (y stone5) 16)
	(= (x stone6) 46)
	(= (y stone6) 84)
	(= (x stone7) 61)
	(= (y stone7) 6)
	(= (x stone8) 39)
	(= (y stone8) 74)
	(= (x stone9) 37)
	(= (y stone9) 50)
	(= (x stone10) 41)
	(= (y stone10) 74)
  )

  (:goal (and 
    (or (and (= (x stone1) 66) (= (y stone1) 56)) (and (= (x stone1) 59) (= (y stone1) 83)) (and (= (x stone1) 52) (= (y stone1) 88)) (and (= (x stone1) 18) (= (y stone1) 61)) (and (= (x stone1) 30) (= (y stone1) 54)) (and (= (x stone1) 10) (= (y stone1) 70)) (and (= (x stone1) 64) (= (y stone1) 80)) (and (= (x stone1) 16) (= (y stone1) 65)) (and (= (x stone1) 46) (= (y stone1) 93)) (and (= (x stone1) 84) (= (y stone1) 55)))
	(or (and (= (x stone2) 66) (= (y stone2) 56)) (and (= (x stone2) 59) (= (y stone2) 83)) (and (= (x stone2) 52) (= (y stone2) 88)) (and (= (x stone2) 18) (= (y stone2) 61)) (and (= (x stone2) 30) (= (y stone2) 54)) (and (= (x stone2) 10) (= (y stone2) 70)) (and (= (x stone2) 64) (= (y stone2) 80)) (and (= (x stone2) 16) (= (y stone2) 65)) (and (= (x stone2) 46) (= (y stone2) 93)) (and (= (x stone2) 84) (= (y stone2) 55)))
	(or (and (= (x stone3) 66) (= (y stone3) 56)) (and (= (x stone3) 59) (= (y stone3) 83)) (and (= (x stone3) 52) (= (y stone3) 88)) (and (= (x stone3) 18) (= (y stone3) 61)) (and (= (x stone3) 30) (= (y stone3) 54)) (and (= (x stone3) 10) (= (y stone3) 70)) (and (= (x stone3) 64) (= (y stone3) 80)) (and (= (x stone3) 16) (= (y stone3) 65)) (and (= (x stone3) 46) (= (y stone3) 93)) (and (= (x stone3) 84) (= (y stone3) 55)))
	(or (and (= (x stone4) 66) (= (y stone4) 56)) (and (= (x stone4) 59) (= (y stone4) 83)) (and (= (x stone4) 52) (= (y stone4) 88)) (and (= (x stone4) 18) (= (y stone4) 61)) (and (= (x stone4) 30) (= (y stone4) 54)) (and (= (x stone4) 10) (= (y stone4) 70)) (and (= (x stone4) 64) (= (y stone4) 80)) (and (= (x stone4) 16) (= (y stone4) 65)) (and (= (x stone4) 46) (= (y stone4) 93)) (and (= (x stone4) 84) (= (y stone4) 55)))
	(or (and (= (x stone5) 66) (= (y stone5) 56)) (and (= (x stone5) 59) (= (y stone5) 83)) (and (= (x stone5) 52) (= (y stone5) 88)) (and (= (x stone5) 18) (= (y stone5) 61)) (and (= (x stone5) 30) (= (y stone5) 54)) (and (= (x stone5) 10) (= (y stone5) 70)) (and (= (x stone5) 64) (= (y stone5) 80)) (and (= (x stone5) 16) (= (y stone5) 65)) (and (= (x stone5) 46) (= (y stone5) 93)) (and (= (x stone5) 84) (= (y stone5) 55)))
	(or (and (= (x stone6) 66) (= (y stone6) 56)) (and (= (x stone6) 59) (= (y stone6) 83)) (and (= (x stone6) 52) (= (y stone6) 88)) (and (= (x stone6) 18) (= (y stone6) 61)) (and (= (x stone6) 30) (= (y stone6) 54)) (and (= (x stone6) 10) (= (y stone6) 70)) (and (= (x stone6) 64) (= (y stone6) 80)) (and (= (x stone6) 16) (= (y stone6) 65)) (and (= (x stone6) 46) (= (y stone6) 93)) (and (= (x stone6) 84) (= (y stone6) 55)))
	(or (and (= (x stone7) 66) (= (y stone7) 56)) (and (= (x stone7) 59) (= (y stone7) 83)) (and (= (x stone7) 52) (= (y stone7) 88)) (and (= (x stone7) 18) (= (y stone7) 61)) (and (= (x stone7) 30) (= (y stone7) 54)) (and (= (x stone7) 10) (= (y stone7) 70)) (and (= (x stone7) 64) (= (y stone7) 80)) (and (= (x stone7) 16) (= (y stone7) 65)) (and (= (x stone7) 46) (= (y stone7) 93)) (and (= (x stone7) 84) (= (y stone7) 55)))
	(or (and (= (x stone8) 66) (= (y stone8) 56)) (and (= (x stone8) 59) (= (y stone8) 83)) (and (= (x stone8) 52) (= (y stone8) 88)) (and (= (x stone8) 18) (= (y stone8) 61)) (and (= (x stone8) 30) (= (y stone8) 54)) (and (= (x stone8) 10) (= (y stone8) 70)) (and (= (x stone8) 64) (= (y stone8) 80)) (and (= (x stone8) 16) (= (y stone8) 65)) (and (= (x stone8) 46) (= (y stone8) 93)) (and (= (x stone8) 84) (= (y stone8) 55)))
	(or (and (= (x stone9) 66) (= (y stone9) 56)) (and (= (x stone9) 59) (= (y stone9) 83)) (and (= (x stone9) 52) (= (y stone9) 88)) (and (= (x stone9) 18) (= (y stone9) 61)) (and (= (x stone9) 30) (= (y stone9) 54)) (and (= (x stone9) 10) (= (y stone9) 70)) (and (= (x stone9) 64) (= (y stone9) 80)) (and (= (x stone9) 16) (= (y stone9) 65)) (and (= (x stone9) 46) (= (y stone9) 93)) (and (= (x stone9) 84) (= (y stone9) 55)))
	(or (and (= (x stone10) 66) (= (y stone10) 56)) (and (= (x stone10) 59) (= (y stone10) 83)) (and (= (x stone10) 52) (= (y stone10) 88)) (and (= (x stone10) 18) (= (y stone10) 61)) (and (= (x stone10) 30) (= (y stone10) 54)) (and (= (x stone10) 10) (= (y stone10) 70)) (and (= (x stone10) 64) (= (y stone10) 80)) (and (= (x stone10) 16) (= (y stone10) 65)) (and (= (x stone10) 46) (= (y stone10) 93)) (and (= (x stone10) 84) (= (y stone10) 55)))
  ))

  
  

  
)
