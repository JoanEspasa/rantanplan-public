(define (problem instance_20_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 20)
	(= (min_x) 1)
	(= (max_y) 20)
	(= (min_y) 1)
	(= (x player1) 6)
	(= (y player1) 7)
	(= (x stone1) 19)
	(= (y stone1) 10)
	(= (x stone2) 8)
	(= (y stone2) 11)
	(= (x stone3) 3)
	(= (y stone3) 7)
	(= (x stone4) 14)
	(= (y stone4) 11)
	(= (x stone5) 7)
	(= (y stone5) 2)
	(= (x stone6) 12)
	(= (y stone6) 13)
	(= (x stone7) 4)
	(= (y stone7) 9)
	(= (x stone8) 9)
	(= (y stone8) 19)
	(= (x stone9) 4)
	(= (y stone9) 11)
	(= (x stone10) 15)
	(= (y stone10) 7)
  )

  (:goal (and 
    (or (and (= (x stone1) 15) (= (y stone1) 4)) (and (= (x stone1) 1) (= (y stone1) 19)) (and (= (x stone1) 16) (= (y stone1) 12)) (and (= (x stone1) 10) (= (y stone1) 13)) (and (= (x stone1) 6) (= (y stone1) 4)) (and (= (x stone1) 9) (= (y stone1) 1)) (and (= (x stone1) 16) (= (y stone1) 4)) (and (= (x stone1) 17) (= (y stone1) 18)) (and (= (x stone1) 18) (= (y stone1) 12)) (and (= (x stone1) 12) (= (y stone1) 18)))
	(or (and (= (x stone2) 15) (= (y stone2) 4)) (and (= (x stone2) 1) (= (y stone2) 19)) (and (= (x stone2) 16) (= (y stone2) 12)) (and (= (x stone2) 10) (= (y stone2) 13)) (and (= (x stone2) 6) (= (y stone2) 4)) (and (= (x stone2) 9) (= (y stone2) 1)) (and (= (x stone2) 16) (= (y stone2) 4)) (and (= (x stone2) 17) (= (y stone2) 18)) (and (= (x stone2) 18) (= (y stone2) 12)) (and (= (x stone2) 12) (= (y stone2) 18)))
	(or (and (= (x stone3) 15) (= (y stone3) 4)) (and (= (x stone3) 1) (= (y stone3) 19)) (and (= (x stone3) 16) (= (y stone3) 12)) (and (= (x stone3) 10) (= (y stone3) 13)) (and (= (x stone3) 6) (= (y stone3) 4)) (and (= (x stone3) 9) (= (y stone3) 1)) (and (= (x stone3) 16) (= (y stone3) 4)) (and (= (x stone3) 17) (= (y stone3) 18)) (and (= (x stone3) 18) (= (y stone3) 12)) (and (= (x stone3) 12) (= (y stone3) 18)))
	(or (and (= (x stone4) 15) (= (y stone4) 4)) (and (= (x stone4) 1) (= (y stone4) 19)) (and (= (x stone4) 16) (= (y stone4) 12)) (and (= (x stone4) 10) (= (y stone4) 13)) (and (= (x stone4) 6) (= (y stone4) 4)) (and (= (x stone4) 9) (= (y stone4) 1)) (and (= (x stone4) 16) (= (y stone4) 4)) (and (= (x stone4) 17) (= (y stone4) 18)) (and (= (x stone4) 18) (= (y stone4) 12)) (and (= (x stone4) 12) (= (y stone4) 18)))
	(or (and (= (x stone5) 15) (= (y stone5) 4)) (and (= (x stone5) 1) (= (y stone5) 19)) (and (= (x stone5) 16) (= (y stone5) 12)) (and (= (x stone5) 10) (= (y stone5) 13)) (and (= (x stone5) 6) (= (y stone5) 4)) (and (= (x stone5) 9) (= (y stone5) 1)) (and (= (x stone5) 16) (= (y stone5) 4)) (and (= (x stone5) 17) (= (y stone5) 18)) (and (= (x stone5) 18) (= (y stone5) 12)) (and (= (x stone5) 12) (= (y stone5) 18)))
	(or (and (= (x stone6) 15) (= (y stone6) 4)) (and (= (x stone6) 1) (= (y stone6) 19)) (and (= (x stone6) 16) (= (y stone6) 12)) (and (= (x stone6) 10) (= (y stone6) 13)) (and (= (x stone6) 6) (= (y stone6) 4)) (and (= (x stone6) 9) (= (y stone6) 1)) (and (= (x stone6) 16) (= (y stone6) 4)) (and (= (x stone6) 17) (= (y stone6) 18)) (and (= (x stone6) 18) (= (y stone6) 12)) (and (= (x stone6) 12) (= (y stone6) 18)))
	(or (and (= (x stone7) 15) (= (y stone7) 4)) (and (= (x stone7) 1) (= (y stone7) 19)) (and (= (x stone7) 16) (= (y stone7) 12)) (and (= (x stone7) 10) (= (y stone7) 13)) (and (= (x stone7) 6) (= (y stone7) 4)) (and (= (x stone7) 9) (= (y stone7) 1)) (and (= (x stone7) 16) (= (y stone7) 4)) (and (= (x stone7) 17) (= (y stone7) 18)) (and (= (x stone7) 18) (= (y stone7) 12)) (and (= (x stone7) 12) (= (y stone7) 18)))
	(or (and (= (x stone8) 15) (= (y stone8) 4)) (and (= (x stone8) 1) (= (y stone8) 19)) (and (= (x stone8) 16) (= (y stone8) 12)) (and (= (x stone8) 10) (= (y stone8) 13)) (and (= (x stone8) 6) (= (y stone8) 4)) (and (= (x stone8) 9) (= (y stone8) 1)) (and (= (x stone8) 16) (= (y stone8) 4)) (and (= (x stone8) 17) (= (y stone8) 18)) (and (= (x stone8) 18) (= (y stone8) 12)) (and (= (x stone8) 12) (= (y stone8) 18)))
	(or (and (= (x stone9) 15) (= (y stone9) 4)) (and (= (x stone9) 1) (= (y stone9) 19)) (and (= (x stone9) 16) (= (y stone9) 12)) (and (= (x stone9) 10) (= (y stone9) 13)) (and (= (x stone9) 6) (= (y stone9) 4)) (and (= (x stone9) 9) (= (y stone9) 1)) (and (= (x stone9) 16) (= (y stone9) 4)) (and (= (x stone9) 17) (= (y stone9) 18)) (and (= (x stone9) 18) (= (y stone9) 12)) (and (= (x stone9) 12) (= (y stone9) 18)))
	(or (and (= (x stone10) 15) (= (y stone10) 4)) (and (= (x stone10) 1) (= (y stone10) 19)) (and (= (x stone10) 16) (= (y stone10) 12)) (and (= (x stone10) 10) (= (y stone10) 13)) (and (= (x stone10) 6) (= (y stone10) 4)) (and (= (x stone10) 9) (= (y stone10) 1)) (and (= (x stone10) 16) (= (y stone10) 4)) (and (= (x stone10) 17) (= (y stone10) 18)) (and (= (x stone10) 18) (= (y stone10) 12)) (and (= (x stone10) 12) (= (y stone10) 18)))
  ))

  
  

  
)
