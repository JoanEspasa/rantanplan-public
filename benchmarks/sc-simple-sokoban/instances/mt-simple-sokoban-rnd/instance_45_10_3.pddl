(define (problem instance_45_10_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 45)
	(= (min_x) 1)
	(= (max_y) 45)
	(= (min_y) 1)
	(= (x player1) 42)
	(= (y player1) 32)
	(= (x stone1) 4)
	(= (y stone1) 15)
	(= (x stone2) 44)
	(= (y stone2) 36)
	(= (x stone3) 24)
	(= (y stone3) 39)
	(= (x stone4) 31)
	(= (y stone4) 20)
	(= (x stone5) 8)
	(= (y stone5) 3)
	(= (x stone6) 41)
	(= (y stone6) 13)
	(= (x stone7) 14)
	(= (y stone7) 13)
	(= (x stone8) 35)
	(= (y stone8) 40)
	(= (x stone9) 15)
	(= (y stone9) 9)
	(= (x stone10) 32)
	(= (y stone10) 25)
  )

  (:goal (and 
    (or (and (= (x stone1) 43) (= (y stone1) 6)) (and (= (x stone1) 14) (= (y stone1) 37)) (and (= (x stone1) 32) (= (y stone1) 14)) (and (= (x stone1) 23) (= (y stone1) 25)) (and (= (x stone1) 34) (= (y stone1) 1)) (and (= (x stone1) 38) (= (y stone1) 26)) (and (= (x stone1) 18) (= (y stone1) 23)) (and (= (x stone1) 42) (= (y stone1) 43)) (and (= (x stone1) 15) (= (y stone1) 18)) (and (= (x stone1) 33) (= (y stone1) 34)))
	(or (and (= (x stone2) 43) (= (y stone2) 6)) (and (= (x stone2) 14) (= (y stone2) 37)) (and (= (x stone2) 32) (= (y stone2) 14)) (and (= (x stone2) 23) (= (y stone2) 25)) (and (= (x stone2) 34) (= (y stone2) 1)) (and (= (x stone2) 38) (= (y stone2) 26)) (and (= (x stone2) 18) (= (y stone2) 23)) (and (= (x stone2) 42) (= (y stone2) 43)) (and (= (x stone2) 15) (= (y stone2) 18)) (and (= (x stone2) 33) (= (y stone2) 34)))
	(or (and (= (x stone3) 43) (= (y stone3) 6)) (and (= (x stone3) 14) (= (y stone3) 37)) (and (= (x stone3) 32) (= (y stone3) 14)) (and (= (x stone3) 23) (= (y stone3) 25)) (and (= (x stone3) 34) (= (y stone3) 1)) (and (= (x stone3) 38) (= (y stone3) 26)) (and (= (x stone3) 18) (= (y stone3) 23)) (and (= (x stone3) 42) (= (y stone3) 43)) (and (= (x stone3) 15) (= (y stone3) 18)) (and (= (x stone3) 33) (= (y stone3) 34)))
	(or (and (= (x stone4) 43) (= (y stone4) 6)) (and (= (x stone4) 14) (= (y stone4) 37)) (and (= (x stone4) 32) (= (y stone4) 14)) (and (= (x stone4) 23) (= (y stone4) 25)) (and (= (x stone4) 34) (= (y stone4) 1)) (and (= (x stone4) 38) (= (y stone4) 26)) (and (= (x stone4) 18) (= (y stone4) 23)) (and (= (x stone4) 42) (= (y stone4) 43)) (and (= (x stone4) 15) (= (y stone4) 18)) (and (= (x stone4) 33) (= (y stone4) 34)))
	(or (and (= (x stone5) 43) (= (y stone5) 6)) (and (= (x stone5) 14) (= (y stone5) 37)) (and (= (x stone5) 32) (= (y stone5) 14)) (and (= (x stone5) 23) (= (y stone5) 25)) (and (= (x stone5) 34) (= (y stone5) 1)) (and (= (x stone5) 38) (= (y stone5) 26)) (and (= (x stone5) 18) (= (y stone5) 23)) (and (= (x stone5) 42) (= (y stone5) 43)) (and (= (x stone5) 15) (= (y stone5) 18)) (and (= (x stone5) 33) (= (y stone5) 34)))
	(or (and (= (x stone6) 43) (= (y stone6) 6)) (and (= (x stone6) 14) (= (y stone6) 37)) (and (= (x stone6) 32) (= (y stone6) 14)) (and (= (x stone6) 23) (= (y stone6) 25)) (and (= (x stone6) 34) (= (y stone6) 1)) (and (= (x stone6) 38) (= (y stone6) 26)) (and (= (x stone6) 18) (= (y stone6) 23)) (and (= (x stone6) 42) (= (y stone6) 43)) (and (= (x stone6) 15) (= (y stone6) 18)) (and (= (x stone6) 33) (= (y stone6) 34)))
	(or (and (= (x stone7) 43) (= (y stone7) 6)) (and (= (x stone7) 14) (= (y stone7) 37)) (and (= (x stone7) 32) (= (y stone7) 14)) (and (= (x stone7) 23) (= (y stone7) 25)) (and (= (x stone7) 34) (= (y stone7) 1)) (and (= (x stone7) 38) (= (y stone7) 26)) (and (= (x stone7) 18) (= (y stone7) 23)) (and (= (x stone7) 42) (= (y stone7) 43)) (and (= (x stone7) 15) (= (y stone7) 18)) (and (= (x stone7) 33) (= (y stone7) 34)))
	(or (and (= (x stone8) 43) (= (y stone8) 6)) (and (= (x stone8) 14) (= (y stone8) 37)) (and (= (x stone8) 32) (= (y stone8) 14)) (and (= (x stone8) 23) (= (y stone8) 25)) (and (= (x stone8) 34) (= (y stone8) 1)) (and (= (x stone8) 38) (= (y stone8) 26)) (and (= (x stone8) 18) (= (y stone8) 23)) (and (= (x stone8) 42) (= (y stone8) 43)) (and (= (x stone8) 15) (= (y stone8) 18)) (and (= (x stone8) 33) (= (y stone8) 34)))
	(or (and (= (x stone9) 43) (= (y stone9) 6)) (and (= (x stone9) 14) (= (y stone9) 37)) (and (= (x stone9) 32) (= (y stone9) 14)) (and (= (x stone9) 23) (= (y stone9) 25)) (and (= (x stone9) 34) (= (y stone9) 1)) (and (= (x stone9) 38) (= (y stone9) 26)) (and (= (x stone9) 18) (= (y stone9) 23)) (and (= (x stone9) 42) (= (y stone9) 43)) (and (= (x stone9) 15) (= (y stone9) 18)) (and (= (x stone9) 33) (= (y stone9) 34)))
	(or (and (= (x stone10) 43) (= (y stone10) 6)) (and (= (x stone10) 14) (= (y stone10) 37)) (and (= (x stone10) 32) (= (y stone10) 14)) (and (= (x stone10) 23) (= (y stone10) 25)) (and (= (x stone10) 34) (= (y stone10) 1)) (and (= (x stone10) 38) (= (y stone10) 26)) (and (= (x stone10) 18) (= (y stone10) 23)) (and (= (x stone10) 42) (= (y stone10) 43)) (and (= (x stone10) 15) (= (y stone10) 18)) (and (= (x stone10) 33) (= (y stone10) 34)))
  ))

  
  

  
)
