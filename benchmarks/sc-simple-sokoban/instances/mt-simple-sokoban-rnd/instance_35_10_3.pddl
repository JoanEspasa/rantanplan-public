(define (problem instance_35_10_3)
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
	(= (x player1) 14)
	(= (y player1) 8)
	(= (x stone1) 8)
	(= (y stone1) 12)
	(= (x stone2) 21)
	(= (y stone2) 15)
	(= (x stone3) 19)
	(= (y stone3) 21)
	(= (x stone4) 13)
	(= (y stone4) 19)
	(= (x stone5) 29)
	(= (y stone5) 23)
	(= (x stone6) 24)
	(= (y stone6) 24)
	(= (x stone7) 4)
	(= (y stone7) 33)
	(= (x stone8) 19)
	(= (y stone8) 31)
	(= (x stone9) 23)
	(= (y stone9) 11)
	(= (x stone10) 34)
	(= (y stone10) 21)
  )

  (:goal (and 
    (or (and (= (x stone1) 2) (= (y stone1) 26)) (and (= (x stone1) 16) (= (y stone1) 28)) (and (= (x stone1) 1) (= (y stone1) 15)) (and (= (x stone1) 32) (= (y stone1) 1)) (and (= (x stone1) 9) (= (y stone1) 15)) (and (= (x stone1) 25) (= (y stone1) 18)) (and (= (x stone1) 2) (= (y stone1) 29)) (and (= (x stone1) 8) (= (y stone1) 21)) (and (= (x stone1) 15) (= (y stone1) 27)) (and (= (x stone1) 13) (= (y stone1) 11)))
	(or (and (= (x stone2) 2) (= (y stone2) 26)) (and (= (x stone2) 16) (= (y stone2) 28)) (and (= (x stone2) 1) (= (y stone2) 15)) (and (= (x stone2) 32) (= (y stone2) 1)) (and (= (x stone2) 9) (= (y stone2) 15)) (and (= (x stone2) 25) (= (y stone2) 18)) (and (= (x stone2) 2) (= (y stone2) 29)) (and (= (x stone2) 8) (= (y stone2) 21)) (and (= (x stone2) 15) (= (y stone2) 27)) (and (= (x stone2) 13) (= (y stone2) 11)))
	(or (and (= (x stone3) 2) (= (y stone3) 26)) (and (= (x stone3) 16) (= (y stone3) 28)) (and (= (x stone3) 1) (= (y stone3) 15)) (and (= (x stone3) 32) (= (y stone3) 1)) (and (= (x stone3) 9) (= (y stone3) 15)) (and (= (x stone3) 25) (= (y stone3) 18)) (and (= (x stone3) 2) (= (y stone3) 29)) (and (= (x stone3) 8) (= (y stone3) 21)) (and (= (x stone3) 15) (= (y stone3) 27)) (and (= (x stone3) 13) (= (y stone3) 11)))
	(or (and (= (x stone4) 2) (= (y stone4) 26)) (and (= (x stone4) 16) (= (y stone4) 28)) (and (= (x stone4) 1) (= (y stone4) 15)) (and (= (x stone4) 32) (= (y stone4) 1)) (and (= (x stone4) 9) (= (y stone4) 15)) (and (= (x stone4) 25) (= (y stone4) 18)) (and (= (x stone4) 2) (= (y stone4) 29)) (and (= (x stone4) 8) (= (y stone4) 21)) (and (= (x stone4) 15) (= (y stone4) 27)) (and (= (x stone4) 13) (= (y stone4) 11)))
	(or (and (= (x stone5) 2) (= (y stone5) 26)) (and (= (x stone5) 16) (= (y stone5) 28)) (and (= (x stone5) 1) (= (y stone5) 15)) (and (= (x stone5) 32) (= (y stone5) 1)) (and (= (x stone5) 9) (= (y stone5) 15)) (and (= (x stone5) 25) (= (y stone5) 18)) (and (= (x stone5) 2) (= (y stone5) 29)) (and (= (x stone5) 8) (= (y stone5) 21)) (and (= (x stone5) 15) (= (y stone5) 27)) (and (= (x stone5) 13) (= (y stone5) 11)))
	(or (and (= (x stone6) 2) (= (y stone6) 26)) (and (= (x stone6) 16) (= (y stone6) 28)) (and (= (x stone6) 1) (= (y stone6) 15)) (and (= (x stone6) 32) (= (y stone6) 1)) (and (= (x stone6) 9) (= (y stone6) 15)) (and (= (x stone6) 25) (= (y stone6) 18)) (and (= (x stone6) 2) (= (y stone6) 29)) (and (= (x stone6) 8) (= (y stone6) 21)) (and (= (x stone6) 15) (= (y stone6) 27)) (and (= (x stone6) 13) (= (y stone6) 11)))
	(or (and (= (x stone7) 2) (= (y stone7) 26)) (and (= (x stone7) 16) (= (y stone7) 28)) (and (= (x stone7) 1) (= (y stone7) 15)) (and (= (x stone7) 32) (= (y stone7) 1)) (and (= (x stone7) 9) (= (y stone7) 15)) (and (= (x stone7) 25) (= (y stone7) 18)) (and (= (x stone7) 2) (= (y stone7) 29)) (and (= (x stone7) 8) (= (y stone7) 21)) (and (= (x stone7) 15) (= (y stone7) 27)) (and (= (x stone7) 13) (= (y stone7) 11)))
	(or (and (= (x stone8) 2) (= (y stone8) 26)) (and (= (x stone8) 16) (= (y stone8) 28)) (and (= (x stone8) 1) (= (y stone8) 15)) (and (= (x stone8) 32) (= (y stone8) 1)) (and (= (x stone8) 9) (= (y stone8) 15)) (and (= (x stone8) 25) (= (y stone8) 18)) (and (= (x stone8) 2) (= (y stone8) 29)) (and (= (x stone8) 8) (= (y stone8) 21)) (and (= (x stone8) 15) (= (y stone8) 27)) (and (= (x stone8) 13) (= (y stone8) 11)))
	(or (and (= (x stone9) 2) (= (y stone9) 26)) (and (= (x stone9) 16) (= (y stone9) 28)) (and (= (x stone9) 1) (= (y stone9) 15)) (and (= (x stone9) 32) (= (y stone9) 1)) (and (= (x stone9) 9) (= (y stone9) 15)) (and (= (x stone9) 25) (= (y stone9) 18)) (and (= (x stone9) 2) (= (y stone9) 29)) (and (= (x stone9) 8) (= (y stone9) 21)) (and (= (x stone9) 15) (= (y stone9) 27)) (and (= (x stone9) 13) (= (y stone9) 11)))
	(or (and (= (x stone10) 2) (= (y stone10) 26)) (and (= (x stone10) 16) (= (y stone10) 28)) (and (= (x stone10) 1) (= (y stone10) 15)) (and (= (x stone10) 32) (= (y stone10) 1)) (and (= (x stone10) 9) (= (y stone10) 15)) (and (= (x stone10) 25) (= (y stone10) 18)) (and (= (x stone10) 2) (= (y stone10) 29)) (and (= (x stone10) 8) (= (y stone10) 21)) (and (= (x stone10) 15) (= (y stone10) 27)) (and (= (x stone10) 13) (= (y stone10) 11)))
  ))

  
  

  
)
