(define (problem instance_45_10_2)
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
	(= (x player1) 13)
	(= (y player1) 12)
	(= (x stone1) 21)
	(= (y stone1) 30)
	(= (x stone2) 32)
	(= (y stone2) 42)
	(= (x stone3) 15)
	(= (y stone3) 28)
	(= (x stone4) 31)
	(= (y stone4) 23)
	(= (x stone5) 32)
	(= (y stone5) 20)
	(= (x stone6) 7)
	(= (y stone6) 9)
	(= (x stone7) 34)
	(= (y stone7) 2)
	(= (x stone8) 8)
	(= (y stone8) 26)
	(= (x stone9) 35)
	(= (y stone9) 8)
	(= (x stone10) 28)
	(= (y stone10) 18)
  )

  (:goal (and 
    (or (and (= (x stone1) 29) (= (y stone1) 12)) (and (= (x stone1) 10) (= (y stone1) 11)) (and (= (x stone1) 31) (= (y stone1) 25)) (and (= (x stone1) 33) (= (y stone1) 35)) (and (= (x stone1) 17) (= (y stone1) 40)) (and (= (x stone1) 28) (= (y stone1) 7)) (and (= (x stone1) 43) (= (y stone1) 1)) (and (= (x stone1) 17) (= (y stone1) 21)) (and (= (x stone1) 9) (= (y stone1) 39)) (and (= (x stone1) 4) (= (y stone1) 39)))
	(or (and (= (x stone2) 29) (= (y stone2) 12)) (and (= (x stone2) 10) (= (y stone2) 11)) (and (= (x stone2) 31) (= (y stone2) 25)) (and (= (x stone2) 33) (= (y stone2) 35)) (and (= (x stone2) 17) (= (y stone2) 40)) (and (= (x stone2) 28) (= (y stone2) 7)) (and (= (x stone2) 43) (= (y stone2) 1)) (and (= (x stone2) 17) (= (y stone2) 21)) (and (= (x stone2) 9) (= (y stone2) 39)) (and (= (x stone2) 4) (= (y stone2) 39)))
	(or (and (= (x stone3) 29) (= (y stone3) 12)) (and (= (x stone3) 10) (= (y stone3) 11)) (and (= (x stone3) 31) (= (y stone3) 25)) (and (= (x stone3) 33) (= (y stone3) 35)) (and (= (x stone3) 17) (= (y stone3) 40)) (and (= (x stone3) 28) (= (y stone3) 7)) (and (= (x stone3) 43) (= (y stone3) 1)) (and (= (x stone3) 17) (= (y stone3) 21)) (and (= (x stone3) 9) (= (y stone3) 39)) (and (= (x stone3) 4) (= (y stone3) 39)))
	(or (and (= (x stone4) 29) (= (y stone4) 12)) (and (= (x stone4) 10) (= (y stone4) 11)) (and (= (x stone4) 31) (= (y stone4) 25)) (and (= (x stone4) 33) (= (y stone4) 35)) (and (= (x stone4) 17) (= (y stone4) 40)) (and (= (x stone4) 28) (= (y stone4) 7)) (and (= (x stone4) 43) (= (y stone4) 1)) (and (= (x stone4) 17) (= (y stone4) 21)) (and (= (x stone4) 9) (= (y stone4) 39)) (and (= (x stone4) 4) (= (y stone4) 39)))
	(or (and (= (x stone5) 29) (= (y stone5) 12)) (and (= (x stone5) 10) (= (y stone5) 11)) (and (= (x stone5) 31) (= (y stone5) 25)) (and (= (x stone5) 33) (= (y stone5) 35)) (and (= (x stone5) 17) (= (y stone5) 40)) (and (= (x stone5) 28) (= (y stone5) 7)) (and (= (x stone5) 43) (= (y stone5) 1)) (and (= (x stone5) 17) (= (y stone5) 21)) (and (= (x stone5) 9) (= (y stone5) 39)) (and (= (x stone5) 4) (= (y stone5) 39)))
	(or (and (= (x stone6) 29) (= (y stone6) 12)) (and (= (x stone6) 10) (= (y stone6) 11)) (and (= (x stone6) 31) (= (y stone6) 25)) (and (= (x stone6) 33) (= (y stone6) 35)) (and (= (x stone6) 17) (= (y stone6) 40)) (and (= (x stone6) 28) (= (y stone6) 7)) (and (= (x stone6) 43) (= (y stone6) 1)) (and (= (x stone6) 17) (= (y stone6) 21)) (and (= (x stone6) 9) (= (y stone6) 39)) (and (= (x stone6) 4) (= (y stone6) 39)))
	(or (and (= (x stone7) 29) (= (y stone7) 12)) (and (= (x stone7) 10) (= (y stone7) 11)) (and (= (x stone7) 31) (= (y stone7) 25)) (and (= (x stone7) 33) (= (y stone7) 35)) (and (= (x stone7) 17) (= (y stone7) 40)) (and (= (x stone7) 28) (= (y stone7) 7)) (and (= (x stone7) 43) (= (y stone7) 1)) (and (= (x stone7) 17) (= (y stone7) 21)) (and (= (x stone7) 9) (= (y stone7) 39)) (and (= (x stone7) 4) (= (y stone7) 39)))
	(or (and (= (x stone8) 29) (= (y stone8) 12)) (and (= (x stone8) 10) (= (y stone8) 11)) (and (= (x stone8) 31) (= (y stone8) 25)) (and (= (x stone8) 33) (= (y stone8) 35)) (and (= (x stone8) 17) (= (y stone8) 40)) (and (= (x stone8) 28) (= (y stone8) 7)) (and (= (x stone8) 43) (= (y stone8) 1)) (and (= (x stone8) 17) (= (y stone8) 21)) (and (= (x stone8) 9) (= (y stone8) 39)) (and (= (x stone8) 4) (= (y stone8) 39)))
	(or (and (= (x stone9) 29) (= (y stone9) 12)) (and (= (x stone9) 10) (= (y stone9) 11)) (and (= (x stone9) 31) (= (y stone9) 25)) (and (= (x stone9) 33) (= (y stone9) 35)) (and (= (x stone9) 17) (= (y stone9) 40)) (and (= (x stone9) 28) (= (y stone9) 7)) (and (= (x stone9) 43) (= (y stone9) 1)) (and (= (x stone9) 17) (= (y stone9) 21)) (and (= (x stone9) 9) (= (y stone9) 39)) (and (= (x stone9) 4) (= (y stone9) 39)))
	(or (and (= (x stone10) 29) (= (y stone10) 12)) (and (= (x stone10) 10) (= (y stone10) 11)) (and (= (x stone10) 31) (= (y stone10) 25)) (and (= (x stone10) 33) (= (y stone10) 35)) (and (= (x stone10) 17) (= (y stone10) 40)) (and (= (x stone10) 28) (= (y stone10) 7)) (and (= (x stone10) 43) (= (y stone10) 1)) (and (= (x stone10) 17) (= (y stone10) 21)) (and (= (x stone10) 9) (= (y stone10) 39)) (and (= (x stone10) 4) (= (y stone10) 39)))
  ))

  
  

  
)
