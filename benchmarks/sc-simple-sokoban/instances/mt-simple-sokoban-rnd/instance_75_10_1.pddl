(define (problem instance_75_10_1)
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
	(= (x player1) 14)
	(= (y player1) 9)
	(= (x stone1) 30)
	(= (y stone1) 8)
	(= (x stone2) 53)
	(= (y stone2) 19)
	(= (x stone3) 16)
	(= (y stone3) 36)
	(= (x stone4) 29)
	(= (y stone4) 30)
	(= (x stone5) 21)
	(= (y stone5) 48)
	(= (x stone6) 27)
	(= (y stone6) 71)
	(= (x stone7) 69)
	(= (y stone7) 36)
	(= (x stone8) 70)
	(= (y stone8) 60)
	(= (x stone9) 4)
	(= (y stone9) 41)
	(= (x stone10) 44)
	(= (y stone10) 69)
  )

  (:goal (and 
    (or (and (= (x stone1) 12) (= (y stone1) 57)) (and (= (x stone1) 16) (= (y stone1) 53)) (and (= (x stone1) 41) (= (y stone1) 40)) (and (= (x stone1) 13) (= (y stone1) 38)) (and (= (x stone1) 39) (= (y stone1) 26)) (and (= (x stone1) 4) (= (y stone1) 59)) (and (= (x stone1) 49) (= (y stone1) 41)) (and (= (x stone1) 65) (= (y stone1) 43)) (and (= (x stone1) 61) (= (y stone1) 27)) (and (= (x stone1) 25) (= (y stone1) 60)))
	(or (and (= (x stone2) 12) (= (y stone2) 57)) (and (= (x stone2) 16) (= (y stone2) 53)) (and (= (x stone2) 41) (= (y stone2) 40)) (and (= (x stone2) 13) (= (y stone2) 38)) (and (= (x stone2) 39) (= (y stone2) 26)) (and (= (x stone2) 4) (= (y stone2) 59)) (and (= (x stone2) 49) (= (y stone2) 41)) (and (= (x stone2) 65) (= (y stone2) 43)) (and (= (x stone2) 61) (= (y stone2) 27)) (and (= (x stone2) 25) (= (y stone2) 60)))
	(or (and (= (x stone3) 12) (= (y stone3) 57)) (and (= (x stone3) 16) (= (y stone3) 53)) (and (= (x stone3) 41) (= (y stone3) 40)) (and (= (x stone3) 13) (= (y stone3) 38)) (and (= (x stone3) 39) (= (y stone3) 26)) (and (= (x stone3) 4) (= (y stone3) 59)) (and (= (x stone3) 49) (= (y stone3) 41)) (and (= (x stone3) 65) (= (y stone3) 43)) (and (= (x stone3) 61) (= (y stone3) 27)) (and (= (x stone3) 25) (= (y stone3) 60)))
	(or (and (= (x stone4) 12) (= (y stone4) 57)) (and (= (x stone4) 16) (= (y stone4) 53)) (and (= (x stone4) 41) (= (y stone4) 40)) (and (= (x stone4) 13) (= (y stone4) 38)) (and (= (x stone4) 39) (= (y stone4) 26)) (and (= (x stone4) 4) (= (y stone4) 59)) (and (= (x stone4) 49) (= (y stone4) 41)) (and (= (x stone4) 65) (= (y stone4) 43)) (and (= (x stone4) 61) (= (y stone4) 27)) (and (= (x stone4) 25) (= (y stone4) 60)))
	(or (and (= (x stone5) 12) (= (y stone5) 57)) (and (= (x stone5) 16) (= (y stone5) 53)) (and (= (x stone5) 41) (= (y stone5) 40)) (and (= (x stone5) 13) (= (y stone5) 38)) (and (= (x stone5) 39) (= (y stone5) 26)) (and (= (x stone5) 4) (= (y stone5) 59)) (and (= (x stone5) 49) (= (y stone5) 41)) (and (= (x stone5) 65) (= (y stone5) 43)) (and (= (x stone5) 61) (= (y stone5) 27)) (and (= (x stone5) 25) (= (y stone5) 60)))
	(or (and (= (x stone6) 12) (= (y stone6) 57)) (and (= (x stone6) 16) (= (y stone6) 53)) (and (= (x stone6) 41) (= (y stone6) 40)) (and (= (x stone6) 13) (= (y stone6) 38)) (and (= (x stone6) 39) (= (y stone6) 26)) (and (= (x stone6) 4) (= (y stone6) 59)) (and (= (x stone6) 49) (= (y stone6) 41)) (and (= (x stone6) 65) (= (y stone6) 43)) (and (= (x stone6) 61) (= (y stone6) 27)) (and (= (x stone6) 25) (= (y stone6) 60)))
	(or (and (= (x stone7) 12) (= (y stone7) 57)) (and (= (x stone7) 16) (= (y stone7) 53)) (and (= (x stone7) 41) (= (y stone7) 40)) (and (= (x stone7) 13) (= (y stone7) 38)) (and (= (x stone7) 39) (= (y stone7) 26)) (and (= (x stone7) 4) (= (y stone7) 59)) (and (= (x stone7) 49) (= (y stone7) 41)) (and (= (x stone7) 65) (= (y stone7) 43)) (and (= (x stone7) 61) (= (y stone7) 27)) (and (= (x stone7) 25) (= (y stone7) 60)))
	(or (and (= (x stone8) 12) (= (y stone8) 57)) (and (= (x stone8) 16) (= (y stone8) 53)) (and (= (x stone8) 41) (= (y stone8) 40)) (and (= (x stone8) 13) (= (y stone8) 38)) (and (= (x stone8) 39) (= (y stone8) 26)) (and (= (x stone8) 4) (= (y stone8) 59)) (and (= (x stone8) 49) (= (y stone8) 41)) (and (= (x stone8) 65) (= (y stone8) 43)) (and (= (x stone8) 61) (= (y stone8) 27)) (and (= (x stone8) 25) (= (y stone8) 60)))
	(or (and (= (x stone9) 12) (= (y stone9) 57)) (and (= (x stone9) 16) (= (y stone9) 53)) (and (= (x stone9) 41) (= (y stone9) 40)) (and (= (x stone9) 13) (= (y stone9) 38)) (and (= (x stone9) 39) (= (y stone9) 26)) (and (= (x stone9) 4) (= (y stone9) 59)) (and (= (x stone9) 49) (= (y stone9) 41)) (and (= (x stone9) 65) (= (y stone9) 43)) (and (= (x stone9) 61) (= (y stone9) 27)) (and (= (x stone9) 25) (= (y stone9) 60)))
	(or (and (= (x stone10) 12) (= (y stone10) 57)) (and (= (x stone10) 16) (= (y stone10) 53)) (and (= (x stone10) 41) (= (y stone10) 40)) (and (= (x stone10) 13) (= (y stone10) 38)) (and (= (x stone10) 39) (= (y stone10) 26)) (and (= (x stone10) 4) (= (y stone10) 59)) (and (= (x stone10) 49) (= (y stone10) 41)) (and (= (x stone10) 65) (= (y stone10) 43)) (and (= (x stone10) 61) (= (y stone10) 27)) (and (= (x stone10) 25) (= (y stone10) 60)))
  ))

  
  

  
)
