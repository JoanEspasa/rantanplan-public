(define (problem instance_35_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 35)
	(= (min_x) 1)
	(= (max_y) 35)
	(= (min_y) 1)
	(= (x player1) 31)
	(= (y player1) 12)
	(= (x stone1) 21)
	(= (y stone1) 19)
	(= (x stone2) 11)
	(= (y stone2) 28)
	(= (x stone3) 2)
	(= (y stone3) 2)
	(= (x stone4) 19)
	(= (y stone4) 31)
	(= (x stone5) 14)
	(= (y stone5) 11)
	(= (x stone6) 19)
	(= (y stone6) 17)
	(= (x stone7) 13)
	(= (y stone7) 14)
	(= (x stone8) 19)
	(= (y stone8) 24)
	(= (x stone9) 6)
	(= (y stone9) 6)
	(= (x stone10) 16)
	(= (y stone10) 3)
  )

  (:goal (and 
    (or (and (= (x stone1) 8) (= (y stone1) 18)) (and (= (x stone1) 28) (= (y stone1) 12)) (and (= (x stone1) 17) (= (y stone1) 4)) (and (= (x stone1) 23) (= (y stone1) 27)) (and (= (x stone1) 11) (= (y stone1) 4)) (and (= (x stone1) 34) (= (y stone1) 6)) (and (= (x stone1) 3) (= (y stone1) 26)) (and (= (x stone1) 35) (= (y stone1) 21)) (and (= (x stone1) 3) (= (y stone1) 25)) (and (= (x stone1) 16) (= (y stone1) 21)))
	(or (and (= (x stone2) 8) (= (y stone2) 18)) (and (= (x stone2) 28) (= (y stone2) 12)) (and (= (x stone2) 17) (= (y stone2) 4)) (and (= (x stone2) 23) (= (y stone2) 27)) (and (= (x stone2) 11) (= (y stone2) 4)) (and (= (x stone2) 34) (= (y stone2) 6)) (and (= (x stone2) 3) (= (y stone2) 26)) (and (= (x stone2) 35) (= (y stone2) 21)) (and (= (x stone2) 3) (= (y stone2) 25)) (and (= (x stone2) 16) (= (y stone2) 21)))
	(or (and (= (x stone3) 8) (= (y stone3) 18)) (and (= (x stone3) 28) (= (y stone3) 12)) (and (= (x stone3) 17) (= (y stone3) 4)) (and (= (x stone3) 23) (= (y stone3) 27)) (and (= (x stone3) 11) (= (y stone3) 4)) (and (= (x stone3) 34) (= (y stone3) 6)) (and (= (x stone3) 3) (= (y stone3) 26)) (and (= (x stone3) 35) (= (y stone3) 21)) (and (= (x stone3) 3) (= (y stone3) 25)) (and (= (x stone3) 16) (= (y stone3) 21)))
	(or (and (= (x stone4) 8) (= (y stone4) 18)) (and (= (x stone4) 28) (= (y stone4) 12)) (and (= (x stone4) 17) (= (y stone4) 4)) (and (= (x stone4) 23) (= (y stone4) 27)) (and (= (x stone4) 11) (= (y stone4) 4)) (and (= (x stone4) 34) (= (y stone4) 6)) (and (= (x stone4) 3) (= (y stone4) 26)) (and (= (x stone4) 35) (= (y stone4) 21)) (and (= (x stone4) 3) (= (y stone4) 25)) (and (= (x stone4) 16) (= (y stone4) 21)))
	(or (and (= (x stone5) 8) (= (y stone5) 18)) (and (= (x stone5) 28) (= (y stone5) 12)) (and (= (x stone5) 17) (= (y stone5) 4)) (and (= (x stone5) 23) (= (y stone5) 27)) (and (= (x stone5) 11) (= (y stone5) 4)) (and (= (x stone5) 34) (= (y stone5) 6)) (and (= (x stone5) 3) (= (y stone5) 26)) (and (= (x stone5) 35) (= (y stone5) 21)) (and (= (x stone5) 3) (= (y stone5) 25)) (and (= (x stone5) 16) (= (y stone5) 21)))
	(or (and (= (x stone6) 8) (= (y stone6) 18)) (and (= (x stone6) 28) (= (y stone6) 12)) (and (= (x stone6) 17) (= (y stone6) 4)) (and (= (x stone6) 23) (= (y stone6) 27)) (and (= (x stone6) 11) (= (y stone6) 4)) (and (= (x stone6) 34) (= (y stone6) 6)) (and (= (x stone6) 3) (= (y stone6) 26)) (and (= (x stone6) 35) (= (y stone6) 21)) (and (= (x stone6) 3) (= (y stone6) 25)) (and (= (x stone6) 16) (= (y stone6) 21)))
	(or (and (= (x stone7) 8) (= (y stone7) 18)) (and (= (x stone7) 28) (= (y stone7) 12)) (and (= (x stone7) 17) (= (y stone7) 4)) (and (= (x stone7) 23) (= (y stone7) 27)) (and (= (x stone7) 11) (= (y stone7) 4)) (and (= (x stone7) 34) (= (y stone7) 6)) (and (= (x stone7) 3) (= (y stone7) 26)) (and (= (x stone7) 35) (= (y stone7) 21)) (and (= (x stone7) 3) (= (y stone7) 25)) (and (= (x stone7) 16) (= (y stone7) 21)))
	(or (and (= (x stone8) 8) (= (y stone8) 18)) (and (= (x stone8) 28) (= (y stone8) 12)) (and (= (x stone8) 17) (= (y stone8) 4)) (and (= (x stone8) 23) (= (y stone8) 27)) (and (= (x stone8) 11) (= (y stone8) 4)) (and (= (x stone8) 34) (= (y stone8) 6)) (and (= (x stone8) 3) (= (y stone8) 26)) (and (= (x stone8) 35) (= (y stone8) 21)) (and (= (x stone8) 3) (= (y stone8) 25)) (and (= (x stone8) 16) (= (y stone8) 21)))
	(or (and (= (x stone9) 8) (= (y stone9) 18)) (and (= (x stone9) 28) (= (y stone9) 12)) (and (= (x stone9) 17) (= (y stone9) 4)) (and (= (x stone9) 23) (= (y stone9) 27)) (and (= (x stone9) 11) (= (y stone9) 4)) (and (= (x stone9) 34) (= (y stone9) 6)) (and (= (x stone9) 3) (= (y stone9) 26)) (and (= (x stone9) 35) (= (y stone9) 21)) (and (= (x stone9) 3) (= (y stone9) 25)) (and (= (x stone9) 16) (= (y stone9) 21)))
	(or (and (= (x stone10) 8) (= (y stone10) 18)) (and (= (x stone10) 28) (= (y stone10) 12)) (and (= (x stone10) 17) (= (y stone10) 4)) (and (= (x stone10) 23) (= (y stone10) 27)) (and (= (x stone10) 11) (= (y stone10) 4)) (and (= (x stone10) 34) (= (y stone10) 6)) (and (= (x stone10) 3) (= (y stone10) 26)) (and (= (x stone10) 35) (= (y stone10) 21)) (and (= (x stone10) 3) (= (y stone10) 25)) (and (= (x stone10) 16) (= (y stone10) 21)))
  ))

  
  

  
)
