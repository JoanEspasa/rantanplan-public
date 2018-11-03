(define (problem instance_80_10_1)
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
	(= (x player1) 24)
	(= (y player1) 35)
	(= (x stone1) 42)
	(= (y stone1) 54)
	(= (x stone2) 61)
	(= (y stone2) 21)
	(= (x stone3) 61)
	(= (y stone3) 61)
	(= (x stone4) 65)
	(= (y stone4) 16)
	(= (x stone5) 2)
	(= (y stone5) 34)
	(= (x stone6) 72)
	(= (y stone6) 35)
	(= (x stone7) 78)
	(= (y stone7) 56)
	(= (x stone8) 30)
	(= (y stone8) 29)
	(= (x stone9) 54)
	(= (y stone9) 65)
	(= (x stone10) 79)
	(= (y stone10) 63)
  )

  (:goal (and 
    (or (and (= (x stone1) 73) (= (y stone1) 72)) (and (= (x stone1) 5) (= (y stone1) 42)) (and (= (x stone1) 69) (= (y stone1) 42)) (and (= (x stone1) 10) (= (y stone1) 23)) (and (= (x stone1) 42) (= (y stone1) 10)) (and (= (x stone1) 25) (= (y stone1) 66)) (and (= (x stone1) 69) (= (y stone1) 28)) (and (= (x stone1) 28) (= (y stone1) 2)) (and (= (x stone1) 42) (= (y stone1) 27)) (and (= (x stone1) 27) (= (y stone1) 31)))
	(or (and (= (x stone2) 73) (= (y stone2) 72)) (and (= (x stone2) 5) (= (y stone2) 42)) (and (= (x stone2) 69) (= (y stone2) 42)) (and (= (x stone2) 10) (= (y stone2) 23)) (and (= (x stone2) 42) (= (y stone2) 10)) (and (= (x stone2) 25) (= (y stone2) 66)) (and (= (x stone2) 69) (= (y stone2) 28)) (and (= (x stone2) 28) (= (y stone2) 2)) (and (= (x stone2) 42) (= (y stone2) 27)) (and (= (x stone2) 27) (= (y stone2) 31)))
	(or (and (= (x stone3) 73) (= (y stone3) 72)) (and (= (x stone3) 5) (= (y stone3) 42)) (and (= (x stone3) 69) (= (y stone3) 42)) (and (= (x stone3) 10) (= (y stone3) 23)) (and (= (x stone3) 42) (= (y stone3) 10)) (and (= (x stone3) 25) (= (y stone3) 66)) (and (= (x stone3) 69) (= (y stone3) 28)) (and (= (x stone3) 28) (= (y stone3) 2)) (and (= (x stone3) 42) (= (y stone3) 27)) (and (= (x stone3) 27) (= (y stone3) 31)))
	(or (and (= (x stone4) 73) (= (y stone4) 72)) (and (= (x stone4) 5) (= (y stone4) 42)) (and (= (x stone4) 69) (= (y stone4) 42)) (and (= (x stone4) 10) (= (y stone4) 23)) (and (= (x stone4) 42) (= (y stone4) 10)) (and (= (x stone4) 25) (= (y stone4) 66)) (and (= (x stone4) 69) (= (y stone4) 28)) (and (= (x stone4) 28) (= (y stone4) 2)) (and (= (x stone4) 42) (= (y stone4) 27)) (and (= (x stone4) 27) (= (y stone4) 31)))
	(or (and (= (x stone5) 73) (= (y stone5) 72)) (and (= (x stone5) 5) (= (y stone5) 42)) (and (= (x stone5) 69) (= (y stone5) 42)) (and (= (x stone5) 10) (= (y stone5) 23)) (and (= (x stone5) 42) (= (y stone5) 10)) (and (= (x stone5) 25) (= (y stone5) 66)) (and (= (x stone5) 69) (= (y stone5) 28)) (and (= (x stone5) 28) (= (y stone5) 2)) (and (= (x stone5) 42) (= (y stone5) 27)) (and (= (x stone5) 27) (= (y stone5) 31)))
	(or (and (= (x stone6) 73) (= (y stone6) 72)) (and (= (x stone6) 5) (= (y stone6) 42)) (and (= (x stone6) 69) (= (y stone6) 42)) (and (= (x stone6) 10) (= (y stone6) 23)) (and (= (x stone6) 42) (= (y stone6) 10)) (and (= (x stone6) 25) (= (y stone6) 66)) (and (= (x stone6) 69) (= (y stone6) 28)) (and (= (x stone6) 28) (= (y stone6) 2)) (and (= (x stone6) 42) (= (y stone6) 27)) (and (= (x stone6) 27) (= (y stone6) 31)))
	(or (and (= (x stone7) 73) (= (y stone7) 72)) (and (= (x stone7) 5) (= (y stone7) 42)) (and (= (x stone7) 69) (= (y stone7) 42)) (and (= (x stone7) 10) (= (y stone7) 23)) (and (= (x stone7) 42) (= (y stone7) 10)) (and (= (x stone7) 25) (= (y stone7) 66)) (and (= (x stone7) 69) (= (y stone7) 28)) (and (= (x stone7) 28) (= (y stone7) 2)) (and (= (x stone7) 42) (= (y stone7) 27)) (and (= (x stone7) 27) (= (y stone7) 31)))
	(or (and (= (x stone8) 73) (= (y stone8) 72)) (and (= (x stone8) 5) (= (y stone8) 42)) (and (= (x stone8) 69) (= (y stone8) 42)) (and (= (x stone8) 10) (= (y stone8) 23)) (and (= (x stone8) 42) (= (y stone8) 10)) (and (= (x stone8) 25) (= (y stone8) 66)) (and (= (x stone8) 69) (= (y stone8) 28)) (and (= (x stone8) 28) (= (y stone8) 2)) (and (= (x stone8) 42) (= (y stone8) 27)) (and (= (x stone8) 27) (= (y stone8) 31)))
	(or (and (= (x stone9) 73) (= (y stone9) 72)) (and (= (x stone9) 5) (= (y stone9) 42)) (and (= (x stone9) 69) (= (y stone9) 42)) (and (= (x stone9) 10) (= (y stone9) 23)) (and (= (x stone9) 42) (= (y stone9) 10)) (and (= (x stone9) 25) (= (y stone9) 66)) (and (= (x stone9) 69) (= (y stone9) 28)) (and (= (x stone9) 28) (= (y stone9) 2)) (and (= (x stone9) 42) (= (y stone9) 27)) (and (= (x stone9) 27) (= (y stone9) 31)))
	(or (and (= (x stone10) 73) (= (y stone10) 72)) (and (= (x stone10) 5) (= (y stone10) 42)) (and (= (x stone10) 69) (= (y stone10) 42)) (and (= (x stone10) 10) (= (y stone10) 23)) (and (= (x stone10) 42) (= (y stone10) 10)) (and (= (x stone10) 25) (= (y stone10) 66)) (and (= (x stone10) 69) (= (y stone10) 28)) (and (= (x stone10) 28) (= (y stone10) 2)) (and (= (x stone10) 42) (= (y stone10) 27)) (and (= (x stone10) 27) (= (y stone10) 31)))
  ))

  
  

  
)
