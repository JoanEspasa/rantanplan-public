(define (problem instance_70_10_2)
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
	(= (x player1) 11)
	(= (y player1) 29)
	(= (x stone1) 8)
	(= (y stone1) 39)
	(= (x stone2) 53)
	(= (y stone2) 53)
	(= (x stone3) 21)
	(= (y stone3) 15)
	(= (x stone4) 8)
	(= (y stone4) 38)
	(= (x stone5) 69)
	(= (y stone5) 16)
	(= (x stone6) 29)
	(= (y stone6) 59)
	(= (x stone7) 56)
	(= (y stone7) 39)
	(= (x stone8) 2)
	(= (y stone8) 57)
	(= (x stone9) 11)
	(= (y stone9) 31)
	(= (x stone10) 51)
	(= (y stone10) 47)
  )

  (:goal (and 
    (or (and (= (x stone1) 63) (= (y stone1) 24)) (and (= (x stone1) 35) (= (y stone1) 7)) (and (= (x stone1) 25) (= (y stone1) 53)) (and (= (x stone1) 17) (= (y stone1) 24)) (and (= (x stone1) 41) (= (y stone1) 60)) (and (= (x stone1) 29) (= (y stone1) 58)) (and (= (x stone1) 64) (= (y stone1) 35)) (and (= (x stone1) 16) (= (y stone1) 37)) (and (= (x stone1) 12) (= (y stone1) 59)) (and (= (x stone1) 41) (= (y stone1) 52)))
	(or (and (= (x stone2) 63) (= (y stone2) 24)) (and (= (x stone2) 35) (= (y stone2) 7)) (and (= (x stone2) 25) (= (y stone2) 53)) (and (= (x stone2) 17) (= (y stone2) 24)) (and (= (x stone2) 41) (= (y stone2) 60)) (and (= (x stone2) 29) (= (y stone2) 58)) (and (= (x stone2) 64) (= (y stone2) 35)) (and (= (x stone2) 16) (= (y stone2) 37)) (and (= (x stone2) 12) (= (y stone2) 59)) (and (= (x stone2) 41) (= (y stone2) 52)))
	(or (and (= (x stone3) 63) (= (y stone3) 24)) (and (= (x stone3) 35) (= (y stone3) 7)) (and (= (x stone3) 25) (= (y stone3) 53)) (and (= (x stone3) 17) (= (y stone3) 24)) (and (= (x stone3) 41) (= (y stone3) 60)) (and (= (x stone3) 29) (= (y stone3) 58)) (and (= (x stone3) 64) (= (y stone3) 35)) (and (= (x stone3) 16) (= (y stone3) 37)) (and (= (x stone3) 12) (= (y stone3) 59)) (and (= (x stone3) 41) (= (y stone3) 52)))
	(or (and (= (x stone4) 63) (= (y stone4) 24)) (and (= (x stone4) 35) (= (y stone4) 7)) (and (= (x stone4) 25) (= (y stone4) 53)) (and (= (x stone4) 17) (= (y stone4) 24)) (and (= (x stone4) 41) (= (y stone4) 60)) (and (= (x stone4) 29) (= (y stone4) 58)) (and (= (x stone4) 64) (= (y stone4) 35)) (and (= (x stone4) 16) (= (y stone4) 37)) (and (= (x stone4) 12) (= (y stone4) 59)) (and (= (x stone4) 41) (= (y stone4) 52)))
	(or (and (= (x stone5) 63) (= (y stone5) 24)) (and (= (x stone5) 35) (= (y stone5) 7)) (and (= (x stone5) 25) (= (y stone5) 53)) (and (= (x stone5) 17) (= (y stone5) 24)) (and (= (x stone5) 41) (= (y stone5) 60)) (and (= (x stone5) 29) (= (y stone5) 58)) (and (= (x stone5) 64) (= (y stone5) 35)) (and (= (x stone5) 16) (= (y stone5) 37)) (and (= (x stone5) 12) (= (y stone5) 59)) (and (= (x stone5) 41) (= (y stone5) 52)))
	(or (and (= (x stone6) 63) (= (y stone6) 24)) (and (= (x stone6) 35) (= (y stone6) 7)) (and (= (x stone6) 25) (= (y stone6) 53)) (and (= (x stone6) 17) (= (y stone6) 24)) (and (= (x stone6) 41) (= (y stone6) 60)) (and (= (x stone6) 29) (= (y stone6) 58)) (and (= (x stone6) 64) (= (y stone6) 35)) (and (= (x stone6) 16) (= (y stone6) 37)) (and (= (x stone6) 12) (= (y stone6) 59)) (and (= (x stone6) 41) (= (y stone6) 52)))
	(or (and (= (x stone7) 63) (= (y stone7) 24)) (and (= (x stone7) 35) (= (y stone7) 7)) (and (= (x stone7) 25) (= (y stone7) 53)) (and (= (x stone7) 17) (= (y stone7) 24)) (and (= (x stone7) 41) (= (y stone7) 60)) (and (= (x stone7) 29) (= (y stone7) 58)) (and (= (x stone7) 64) (= (y stone7) 35)) (and (= (x stone7) 16) (= (y stone7) 37)) (and (= (x stone7) 12) (= (y stone7) 59)) (and (= (x stone7) 41) (= (y stone7) 52)))
	(or (and (= (x stone8) 63) (= (y stone8) 24)) (and (= (x stone8) 35) (= (y stone8) 7)) (and (= (x stone8) 25) (= (y stone8) 53)) (and (= (x stone8) 17) (= (y stone8) 24)) (and (= (x stone8) 41) (= (y stone8) 60)) (and (= (x stone8) 29) (= (y stone8) 58)) (and (= (x stone8) 64) (= (y stone8) 35)) (and (= (x stone8) 16) (= (y stone8) 37)) (and (= (x stone8) 12) (= (y stone8) 59)) (and (= (x stone8) 41) (= (y stone8) 52)))
	(or (and (= (x stone9) 63) (= (y stone9) 24)) (and (= (x stone9) 35) (= (y stone9) 7)) (and (= (x stone9) 25) (= (y stone9) 53)) (and (= (x stone9) 17) (= (y stone9) 24)) (and (= (x stone9) 41) (= (y stone9) 60)) (and (= (x stone9) 29) (= (y stone9) 58)) (and (= (x stone9) 64) (= (y stone9) 35)) (and (= (x stone9) 16) (= (y stone9) 37)) (and (= (x stone9) 12) (= (y stone9) 59)) (and (= (x stone9) 41) (= (y stone9) 52)))
	(or (and (= (x stone10) 63) (= (y stone10) 24)) (and (= (x stone10) 35) (= (y stone10) 7)) (and (= (x stone10) 25) (= (y stone10) 53)) (and (= (x stone10) 17) (= (y stone10) 24)) (and (= (x stone10) 41) (= (y stone10) 60)) (and (= (x stone10) 29) (= (y stone10) 58)) (and (= (x stone10) 64) (= (y stone10) 35)) (and (= (x stone10) 16) (= (y stone10) 37)) (and (= (x stone10) 12) (= (y stone10) 59)) (and (= (x stone10) 41) (= (y stone10) 52)))
  ))

  
  

  
)
