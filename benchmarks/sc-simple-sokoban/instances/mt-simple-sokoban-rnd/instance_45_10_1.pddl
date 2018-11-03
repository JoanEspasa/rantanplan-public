(define (problem instance_45_10_1)
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
	(= (x player1) 4)
	(= (y player1) 40)
	(= (x stone1) 27)
	(= (y stone1) 4)
	(= (x stone2) 24)
	(= (y stone2) 29)
	(= (x stone3) 10)
	(= (y stone3) 23)
	(= (x stone4) 41)
	(= (y stone4) 26)
	(= (x stone5) 6)
	(= (y stone5) 25)
	(= (x stone6) 3)
	(= (y stone6) 42)
	(= (x stone7) 27)
	(= (y stone7) 44)
	(= (x stone8) 24)
	(= (y stone8) 14)
	(= (x stone9) 2)
	(= (y stone9) 3)
	(= (x stone10) 27)
	(= (y stone10) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 14) (= (y stone1) 39)) (and (= (x stone1) 2) (= (y stone1) 33)) (and (= (x stone1) 18) (= (y stone1) 12)) (and (= (x stone1) 8) (= (y stone1) 45)) (and (= (x stone1) 42) (= (y stone1) 11)) (and (= (x stone1) 25) (= (y stone1) 1)) (and (= (x stone1) 27) (= (y stone1) 39)) (and (= (x stone1) 6) (= (y stone1) 42)) (and (= (x stone1) 43) (= (y stone1) 11)) (and (= (x stone1) 12) (= (y stone1) 14)))
	(or (and (= (x stone2) 14) (= (y stone2) 39)) (and (= (x stone2) 2) (= (y stone2) 33)) (and (= (x stone2) 18) (= (y stone2) 12)) (and (= (x stone2) 8) (= (y stone2) 45)) (and (= (x stone2) 42) (= (y stone2) 11)) (and (= (x stone2) 25) (= (y stone2) 1)) (and (= (x stone2) 27) (= (y stone2) 39)) (and (= (x stone2) 6) (= (y stone2) 42)) (and (= (x stone2) 43) (= (y stone2) 11)) (and (= (x stone2) 12) (= (y stone2) 14)))
	(or (and (= (x stone3) 14) (= (y stone3) 39)) (and (= (x stone3) 2) (= (y stone3) 33)) (and (= (x stone3) 18) (= (y stone3) 12)) (and (= (x stone3) 8) (= (y stone3) 45)) (and (= (x stone3) 42) (= (y stone3) 11)) (and (= (x stone3) 25) (= (y stone3) 1)) (and (= (x stone3) 27) (= (y stone3) 39)) (and (= (x stone3) 6) (= (y stone3) 42)) (and (= (x stone3) 43) (= (y stone3) 11)) (and (= (x stone3) 12) (= (y stone3) 14)))
	(or (and (= (x stone4) 14) (= (y stone4) 39)) (and (= (x stone4) 2) (= (y stone4) 33)) (and (= (x stone4) 18) (= (y stone4) 12)) (and (= (x stone4) 8) (= (y stone4) 45)) (and (= (x stone4) 42) (= (y stone4) 11)) (and (= (x stone4) 25) (= (y stone4) 1)) (and (= (x stone4) 27) (= (y stone4) 39)) (and (= (x stone4) 6) (= (y stone4) 42)) (and (= (x stone4) 43) (= (y stone4) 11)) (and (= (x stone4) 12) (= (y stone4) 14)))
	(or (and (= (x stone5) 14) (= (y stone5) 39)) (and (= (x stone5) 2) (= (y stone5) 33)) (and (= (x stone5) 18) (= (y stone5) 12)) (and (= (x stone5) 8) (= (y stone5) 45)) (and (= (x stone5) 42) (= (y stone5) 11)) (and (= (x stone5) 25) (= (y stone5) 1)) (and (= (x stone5) 27) (= (y stone5) 39)) (and (= (x stone5) 6) (= (y stone5) 42)) (and (= (x stone5) 43) (= (y stone5) 11)) (and (= (x stone5) 12) (= (y stone5) 14)))
	(or (and (= (x stone6) 14) (= (y stone6) 39)) (and (= (x stone6) 2) (= (y stone6) 33)) (and (= (x stone6) 18) (= (y stone6) 12)) (and (= (x stone6) 8) (= (y stone6) 45)) (and (= (x stone6) 42) (= (y stone6) 11)) (and (= (x stone6) 25) (= (y stone6) 1)) (and (= (x stone6) 27) (= (y stone6) 39)) (and (= (x stone6) 6) (= (y stone6) 42)) (and (= (x stone6) 43) (= (y stone6) 11)) (and (= (x stone6) 12) (= (y stone6) 14)))
	(or (and (= (x stone7) 14) (= (y stone7) 39)) (and (= (x stone7) 2) (= (y stone7) 33)) (and (= (x stone7) 18) (= (y stone7) 12)) (and (= (x stone7) 8) (= (y stone7) 45)) (and (= (x stone7) 42) (= (y stone7) 11)) (and (= (x stone7) 25) (= (y stone7) 1)) (and (= (x stone7) 27) (= (y stone7) 39)) (and (= (x stone7) 6) (= (y stone7) 42)) (and (= (x stone7) 43) (= (y stone7) 11)) (and (= (x stone7) 12) (= (y stone7) 14)))
	(or (and (= (x stone8) 14) (= (y stone8) 39)) (and (= (x stone8) 2) (= (y stone8) 33)) (and (= (x stone8) 18) (= (y stone8) 12)) (and (= (x stone8) 8) (= (y stone8) 45)) (and (= (x stone8) 42) (= (y stone8) 11)) (and (= (x stone8) 25) (= (y stone8) 1)) (and (= (x stone8) 27) (= (y stone8) 39)) (and (= (x stone8) 6) (= (y stone8) 42)) (and (= (x stone8) 43) (= (y stone8) 11)) (and (= (x stone8) 12) (= (y stone8) 14)))
	(or (and (= (x stone9) 14) (= (y stone9) 39)) (and (= (x stone9) 2) (= (y stone9) 33)) (and (= (x stone9) 18) (= (y stone9) 12)) (and (= (x stone9) 8) (= (y stone9) 45)) (and (= (x stone9) 42) (= (y stone9) 11)) (and (= (x stone9) 25) (= (y stone9) 1)) (and (= (x stone9) 27) (= (y stone9) 39)) (and (= (x stone9) 6) (= (y stone9) 42)) (and (= (x stone9) 43) (= (y stone9) 11)) (and (= (x stone9) 12) (= (y stone9) 14)))
	(or (and (= (x stone10) 14) (= (y stone10) 39)) (and (= (x stone10) 2) (= (y stone10) 33)) (and (= (x stone10) 18) (= (y stone10) 12)) (and (= (x stone10) 8) (= (y stone10) 45)) (and (= (x stone10) 42) (= (y stone10) 11)) (and (= (x stone10) 25) (= (y stone10) 1)) (and (= (x stone10) 27) (= (y stone10) 39)) (and (= (x stone10) 6) (= (y stone10) 42)) (and (= (x stone10) 43) (= (y stone10) 11)) (and (= (x stone10) 12) (= (y stone10) 14)))
  ))

  
  

  
)
