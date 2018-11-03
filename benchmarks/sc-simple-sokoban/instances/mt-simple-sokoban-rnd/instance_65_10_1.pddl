(define (problem instance_65_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 65)
	(= (min_x) 1)
	(= (max_y) 65)
	(= (min_y) 1)
	(= (x player1) 42)
	(= (y player1) 35)
	(= (x stone1) 11)
	(= (y stone1) 42)
	(= (x stone2) 22)
	(= (y stone2) 25)
	(= (x stone3) 27)
	(= (y stone3) 9)
	(= (x stone4) 40)
	(= (y stone4) 60)
	(= (x stone5) 56)
	(= (y stone5) 45)
	(= (x stone6) 54)
	(= (y stone6) 58)
	(= (x stone7) 62)
	(= (y stone7) 21)
	(= (x stone8) 31)
	(= (y stone8) 64)
	(= (x stone9) 5)
	(= (y stone9) 7)
	(= (x stone10) 42)
	(= (y stone10) 58)
  )

  (:goal (and 
    (or (and (= (x stone1) 14) (= (y stone1) 27)) (and (= (x stone1) 22) (= (y stone1) 21)) (and (= (x stone1) 42) (= (y stone1) 25)) (and (= (x stone1) 43) (= (y stone1) 26)) (and (= (x stone1) 51) (= (y stone1) 40)) (and (= (x stone1) 39) (= (y stone1) 41)) (and (= (x stone1) 17) (= (y stone1) 26)) (and (= (x stone1) 24) (= (y stone1) 25)) (and (= (x stone1) 65) (= (y stone1) 57)) (and (= (x stone1) 53) (= (y stone1) 14)))
	(or (and (= (x stone2) 14) (= (y stone2) 27)) (and (= (x stone2) 22) (= (y stone2) 21)) (and (= (x stone2) 42) (= (y stone2) 25)) (and (= (x stone2) 43) (= (y stone2) 26)) (and (= (x stone2) 51) (= (y stone2) 40)) (and (= (x stone2) 39) (= (y stone2) 41)) (and (= (x stone2) 17) (= (y stone2) 26)) (and (= (x stone2) 24) (= (y stone2) 25)) (and (= (x stone2) 65) (= (y stone2) 57)) (and (= (x stone2) 53) (= (y stone2) 14)))
	(or (and (= (x stone3) 14) (= (y stone3) 27)) (and (= (x stone3) 22) (= (y stone3) 21)) (and (= (x stone3) 42) (= (y stone3) 25)) (and (= (x stone3) 43) (= (y stone3) 26)) (and (= (x stone3) 51) (= (y stone3) 40)) (and (= (x stone3) 39) (= (y stone3) 41)) (and (= (x stone3) 17) (= (y stone3) 26)) (and (= (x stone3) 24) (= (y stone3) 25)) (and (= (x stone3) 65) (= (y stone3) 57)) (and (= (x stone3) 53) (= (y stone3) 14)))
	(or (and (= (x stone4) 14) (= (y stone4) 27)) (and (= (x stone4) 22) (= (y stone4) 21)) (and (= (x stone4) 42) (= (y stone4) 25)) (and (= (x stone4) 43) (= (y stone4) 26)) (and (= (x stone4) 51) (= (y stone4) 40)) (and (= (x stone4) 39) (= (y stone4) 41)) (and (= (x stone4) 17) (= (y stone4) 26)) (and (= (x stone4) 24) (= (y stone4) 25)) (and (= (x stone4) 65) (= (y stone4) 57)) (and (= (x stone4) 53) (= (y stone4) 14)))
	(or (and (= (x stone5) 14) (= (y stone5) 27)) (and (= (x stone5) 22) (= (y stone5) 21)) (and (= (x stone5) 42) (= (y stone5) 25)) (and (= (x stone5) 43) (= (y stone5) 26)) (and (= (x stone5) 51) (= (y stone5) 40)) (and (= (x stone5) 39) (= (y stone5) 41)) (and (= (x stone5) 17) (= (y stone5) 26)) (and (= (x stone5) 24) (= (y stone5) 25)) (and (= (x stone5) 65) (= (y stone5) 57)) (and (= (x stone5) 53) (= (y stone5) 14)))
	(or (and (= (x stone6) 14) (= (y stone6) 27)) (and (= (x stone6) 22) (= (y stone6) 21)) (and (= (x stone6) 42) (= (y stone6) 25)) (and (= (x stone6) 43) (= (y stone6) 26)) (and (= (x stone6) 51) (= (y stone6) 40)) (and (= (x stone6) 39) (= (y stone6) 41)) (and (= (x stone6) 17) (= (y stone6) 26)) (and (= (x stone6) 24) (= (y stone6) 25)) (and (= (x stone6) 65) (= (y stone6) 57)) (and (= (x stone6) 53) (= (y stone6) 14)))
	(or (and (= (x stone7) 14) (= (y stone7) 27)) (and (= (x stone7) 22) (= (y stone7) 21)) (and (= (x stone7) 42) (= (y stone7) 25)) (and (= (x stone7) 43) (= (y stone7) 26)) (and (= (x stone7) 51) (= (y stone7) 40)) (and (= (x stone7) 39) (= (y stone7) 41)) (and (= (x stone7) 17) (= (y stone7) 26)) (and (= (x stone7) 24) (= (y stone7) 25)) (and (= (x stone7) 65) (= (y stone7) 57)) (and (= (x stone7) 53) (= (y stone7) 14)))
	(or (and (= (x stone8) 14) (= (y stone8) 27)) (and (= (x stone8) 22) (= (y stone8) 21)) (and (= (x stone8) 42) (= (y stone8) 25)) (and (= (x stone8) 43) (= (y stone8) 26)) (and (= (x stone8) 51) (= (y stone8) 40)) (and (= (x stone8) 39) (= (y stone8) 41)) (and (= (x stone8) 17) (= (y stone8) 26)) (and (= (x stone8) 24) (= (y stone8) 25)) (and (= (x stone8) 65) (= (y stone8) 57)) (and (= (x stone8) 53) (= (y stone8) 14)))
	(or (and (= (x stone9) 14) (= (y stone9) 27)) (and (= (x stone9) 22) (= (y stone9) 21)) (and (= (x stone9) 42) (= (y stone9) 25)) (and (= (x stone9) 43) (= (y stone9) 26)) (and (= (x stone9) 51) (= (y stone9) 40)) (and (= (x stone9) 39) (= (y stone9) 41)) (and (= (x stone9) 17) (= (y stone9) 26)) (and (= (x stone9) 24) (= (y stone9) 25)) (and (= (x stone9) 65) (= (y stone9) 57)) (and (= (x stone9) 53) (= (y stone9) 14)))
	(or (and (= (x stone10) 14) (= (y stone10) 27)) (and (= (x stone10) 22) (= (y stone10) 21)) (and (= (x stone10) 42) (= (y stone10) 25)) (and (= (x stone10) 43) (= (y stone10) 26)) (and (= (x stone10) 51) (= (y stone10) 40)) (and (= (x stone10) 39) (= (y stone10) 41)) (and (= (x stone10) 17) (= (y stone10) 26)) (and (= (x stone10) 24) (= (y stone10) 25)) (and (= (x stone10) 65) (= (y stone10) 57)) (and (= (x stone10) 53) (= (y stone10) 14)))
  ))

  
  

  
)
