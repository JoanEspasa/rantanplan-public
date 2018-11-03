(define (problem instance_80_10_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 80)
	(= (min_x) 1)
	(= (max_y) 80)
	(= (min_y) 1)
	(= (x player1) 41)
	(= (y player1) 47)
	(= (x stone1) 31)
	(= (y stone1) 12)
	(= (x stone2) 28)
	(= (y stone2) 12)
	(= (x stone3) 33)
	(= (y stone3) 36)
	(= (x stone4) 42)
	(= (y stone4) 75)
	(= (x stone5) 37)
	(= (y stone5) 45)
	(= (x stone6) 62)
	(= (y stone6) 69)
	(= (x stone7) 63)
	(= (y stone7) 46)
	(= (x stone8) 75)
	(= (y stone8) 70)
	(= (x stone9) 22)
	(= (y stone9) 61)
	(= (x stone10) 70)
	(= (y stone10) 47)
  )

  (:goal (and 
    (or (and (= (x stone1) 77) (= (y stone1) 23)) (and (= (x stone1) 30) (= (y stone1) 63)) (and (= (x stone1) 52) (= (y stone1) 45)) (and (= (x stone1) 23) (= (y stone1) 7)) (and (= (x stone1) 30) (= (y stone1) 40)) (and (= (x stone1) 32) (= (y stone1) 23)) (and (= (x stone1) 39) (= (y stone1) 30)) (and (= (x stone1) 74) (= (y stone1) 52)) (and (= (x stone1) 44) (= (y stone1) 56)) (and (= (x stone1) 22) (= (y stone1) 62)))
	(or (and (= (x stone2) 77) (= (y stone2) 23)) (and (= (x stone2) 30) (= (y stone2) 63)) (and (= (x stone2) 52) (= (y stone2) 45)) (and (= (x stone2) 23) (= (y stone2) 7)) (and (= (x stone2) 30) (= (y stone2) 40)) (and (= (x stone2) 32) (= (y stone2) 23)) (and (= (x stone2) 39) (= (y stone2) 30)) (and (= (x stone2) 74) (= (y stone2) 52)) (and (= (x stone2) 44) (= (y stone2) 56)) (and (= (x stone2) 22) (= (y stone2) 62)))
	(or (and (= (x stone3) 77) (= (y stone3) 23)) (and (= (x stone3) 30) (= (y stone3) 63)) (and (= (x stone3) 52) (= (y stone3) 45)) (and (= (x stone3) 23) (= (y stone3) 7)) (and (= (x stone3) 30) (= (y stone3) 40)) (and (= (x stone3) 32) (= (y stone3) 23)) (and (= (x stone3) 39) (= (y stone3) 30)) (and (= (x stone3) 74) (= (y stone3) 52)) (and (= (x stone3) 44) (= (y stone3) 56)) (and (= (x stone3) 22) (= (y stone3) 62)))
	(or (and (= (x stone4) 77) (= (y stone4) 23)) (and (= (x stone4) 30) (= (y stone4) 63)) (and (= (x stone4) 52) (= (y stone4) 45)) (and (= (x stone4) 23) (= (y stone4) 7)) (and (= (x stone4) 30) (= (y stone4) 40)) (and (= (x stone4) 32) (= (y stone4) 23)) (and (= (x stone4) 39) (= (y stone4) 30)) (and (= (x stone4) 74) (= (y stone4) 52)) (and (= (x stone4) 44) (= (y stone4) 56)) (and (= (x stone4) 22) (= (y stone4) 62)))
	(or (and (= (x stone5) 77) (= (y stone5) 23)) (and (= (x stone5) 30) (= (y stone5) 63)) (and (= (x stone5) 52) (= (y stone5) 45)) (and (= (x stone5) 23) (= (y stone5) 7)) (and (= (x stone5) 30) (= (y stone5) 40)) (and (= (x stone5) 32) (= (y stone5) 23)) (and (= (x stone5) 39) (= (y stone5) 30)) (and (= (x stone5) 74) (= (y stone5) 52)) (and (= (x stone5) 44) (= (y stone5) 56)) (and (= (x stone5) 22) (= (y stone5) 62)))
	(or (and (= (x stone6) 77) (= (y stone6) 23)) (and (= (x stone6) 30) (= (y stone6) 63)) (and (= (x stone6) 52) (= (y stone6) 45)) (and (= (x stone6) 23) (= (y stone6) 7)) (and (= (x stone6) 30) (= (y stone6) 40)) (and (= (x stone6) 32) (= (y stone6) 23)) (and (= (x stone6) 39) (= (y stone6) 30)) (and (= (x stone6) 74) (= (y stone6) 52)) (and (= (x stone6) 44) (= (y stone6) 56)) (and (= (x stone6) 22) (= (y stone6) 62)))
	(or (and (= (x stone7) 77) (= (y stone7) 23)) (and (= (x stone7) 30) (= (y stone7) 63)) (and (= (x stone7) 52) (= (y stone7) 45)) (and (= (x stone7) 23) (= (y stone7) 7)) (and (= (x stone7) 30) (= (y stone7) 40)) (and (= (x stone7) 32) (= (y stone7) 23)) (and (= (x stone7) 39) (= (y stone7) 30)) (and (= (x stone7) 74) (= (y stone7) 52)) (and (= (x stone7) 44) (= (y stone7) 56)) (and (= (x stone7) 22) (= (y stone7) 62)))
	(or (and (= (x stone8) 77) (= (y stone8) 23)) (and (= (x stone8) 30) (= (y stone8) 63)) (and (= (x stone8) 52) (= (y stone8) 45)) (and (= (x stone8) 23) (= (y stone8) 7)) (and (= (x stone8) 30) (= (y stone8) 40)) (and (= (x stone8) 32) (= (y stone8) 23)) (and (= (x stone8) 39) (= (y stone8) 30)) (and (= (x stone8) 74) (= (y stone8) 52)) (and (= (x stone8) 44) (= (y stone8) 56)) (and (= (x stone8) 22) (= (y stone8) 62)))
	(or (and (= (x stone9) 77) (= (y stone9) 23)) (and (= (x stone9) 30) (= (y stone9) 63)) (and (= (x stone9) 52) (= (y stone9) 45)) (and (= (x stone9) 23) (= (y stone9) 7)) (and (= (x stone9) 30) (= (y stone9) 40)) (and (= (x stone9) 32) (= (y stone9) 23)) (and (= (x stone9) 39) (= (y stone9) 30)) (and (= (x stone9) 74) (= (y stone9) 52)) (and (= (x stone9) 44) (= (y stone9) 56)) (and (= (x stone9) 22) (= (y stone9) 62)))
	(or (and (= (x stone10) 77) (= (y stone10) 23)) (and (= (x stone10) 30) (= (y stone10) 63)) (and (= (x stone10) 52) (= (y stone10) 45)) (and (= (x stone10) 23) (= (y stone10) 7)) (and (= (x stone10) 30) (= (y stone10) 40)) (and (= (x stone10) 32) (= (y stone10) 23)) (and (= (x stone10) 39) (= (y stone10) 30)) (and (= (x stone10) 74) (= (y stone10) 52)) (and (= (x stone10) 44) (= (y stone10) 56)) (and (= (x stone10) 22) (= (y stone10) 62)))
  ))

  
  

  
)
