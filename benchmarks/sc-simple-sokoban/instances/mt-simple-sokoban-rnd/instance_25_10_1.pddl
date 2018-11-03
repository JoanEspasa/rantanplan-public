(define (problem instance_25_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 25)
	(= (min_x) 1)
	(= (max_y) 25)
	(= (min_y) 1)
	(= (x player1) 20)
	(= (y player1) 14)
	(= (x stone1) 6)
	(= (y stone1) 4)
	(= (x stone2) 5)
	(= (y stone2) 16)
	(= (x stone3) 13)
	(= (y stone3) 2)
	(= (x stone4) 21)
	(= (y stone4) 24)
	(= (x stone5) 18)
	(= (y stone5) 10)
	(= (x stone6) 11)
	(= (y stone6) 11)
	(= (x stone7) 24)
	(= (y stone7) 7)
	(= (x stone8) 10)
	(= (y stone8) 10)
	(= (x stone9) 10)
	(= (y stone9) 23)
	(= (x stone10) 16)
	(= (y stone10) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 15) (= (y stone1) 25)) (and (= (x stone1) 6) (= (y stone1) 22)) (and (= (x stone1) 16) (= (y stone1) 24)) (and (= (x stone1) 3) (= (y stone1) 13)) (and (= (x stone1) 8) (= (y stone1) 15)) (and (= (x stone1) 20) (= (y stone1) 23)) (and (= (x stone1) 19) (= (y stone1) 8)) (and (= (x stone1) 25) (= (y stone1) 1)) (and (= (x stone1) 15) (= (y stone1) 24)) (and (= (x stone1) 19) (= (y stone1) 24)))
	(or (and (= (x stone2) 15) (= (y stone2) 25)) (and (= (x stone2) 6) (= (y stone2) 22)) (and (= (x stone2) 16) (= (y stone2) 24)) (and (= (x stone2) 3) (= (y stone2) 13)) (and (= (x stone2) 8) (= (y stone2) 15)) (and (= (x stone2) 20) (= (y stone2) 23)) (and (= (x stone2) 19) (= (y stone2) 8)) (and (= (x stone2) 25) (= (y stone2) 1)) (and (= (x stone2) 15) (= (y stone2) 24)) (and (= (x stone2) 19) (= (y stone2) 24)))
	(or (and (= (x stone3) 15) (= (y stone3) 25)) (and (= (x stone3) 6) (= (y stone3) 22)) (and (= (x stone3) 16) (= (y stone3) 24)) (and (= (x stone3) 3) (= (y stone3) 13)) (and (= (x stone3) 8) (= (y stone3) 15)) (and (= (x stone3) 20) (= (y stone3) 23)) (and (= (x stone3) 19) (= (y stone3) 8)) (and (= (x stone3) 25) (= (y stone3) 1)) (and (= (x stone3) 15) (= (y stone3) 24)) (and (= (x stone3) 19) (= (y stone3) 24)))
	(or (and (= (x stone4) 15) (= (y stone4) 25)) (and (= (x stone4) 6) (= (y stone4) 22)) (and (= (x stone4) 16) (= (y stone4) 24)) (and (= (x stone4) 3) (= (y stone4) 13)) (and (= (x stone4) 8) (= (y stone4) 15)) (and (= (x stone4) 20) (= (y stone4) 23)) (and (= (x stone4) 19) (= (y stone4) 8)) (and (= (x stone4) 25) (= (y stone4) 1)) (and (= (x stone4) 15) (= (y stone4) 24)) (and (= (x stone4) 19) (= (y stone4) 24)))
	(or (and (= (x stone5) 15) (= (y stone5) 25)) (and (= (x stone5) 6) (= (y stone5) 22)) (and (= (x stone5) 16) (= (y stone5) 24)) (and (= (x stone5) 3) (= (y stone5) 13)) (and (= (x stone5) 8) (= (y stone5) 15)) (and (= (x stone5) 20) (= (y stone5) 23)) (and (= (x stone5) 19) (= (y stone5) 8)) (and (= (x stone5) 25) (= (y stone5) 1)) (and (= (x stone5) 15) (= (y stone5) 24)) (and (= (x stone5) 19) (= (y stone5) 24)))
	(or (and (= (x stone6) 15) (= (y stone6) 25)) (and (= (x stone6) 6) (= (y stone6) 22)) (and (= (x stone6) 16) (= (y stone6) 24)) (and (= (x stone6) 3) (= (y stone6) 13)) (and (= (x stone6) 8) (= (y stone6) 15)) (and (= (x stone6) 20) (= (y stone6) 23)) (and (= (x stone6) 19) (= (y stone6) 8)) (and (= (x stone6) 25) (= (y stone6) 1)) (and (= (x stone6) 15) (= (y stone6) 24)) (and (= (x stone6) 19) (= (y stone6) 24)))
	(or (and (= (x stone7) 15) (= (y stone7) 25)) (and (= (x stone7) 6) (= (y stone7) 22)) (and (= (x stone7) 16) (= (y stone7) 24)) (and (= (x stone7) 3) (= (y stone7) 13)) (and (= (x stone7) 8) (= (y stone7) 15)) (and (= (x stone7) 20) (= (y stone7) 23)) (and (= (x stone7) 19) (= (y stone7) 8)) (and (= (x stone7) 25) (= (y stone7) 1)) (and (= (x stone7) 15) (= (y stone7) 24)) (and (= (x stone7) 19) (= (y stone7) 24)))
	(or (and (= (x stone8) 15) (= (y stone8) 25)) (and (= (x stone8) 6) (= (y stone8) 22)) (and (= (x stone8) 16) (= (y stone8) 24)) (and (= (x stone8) 3) (= (y stone8) 13)) (and (= (x stone8) 8) (= (y stone8) 15)) (and (= (x stone8) 20) (= (y stone8) 23)) (and (= (x stone8) 19) (= (y stone8) 8)) (and (= (x stone8) 25) (= (y stone8) 1)) (and (= (x stone8) 15) (= (y stone8) 24)) (and (= (x stone8) 19) (= (y stone8) 24)))
	(or (and (= (x stone9) 15) (= (y stone9) 25)) (and (= (x stone9) 6) (= (y stone9) 22)) (and (= (x stone9) 16) (= (y stone9) 24)) (and (= (x stone9) 3) (= (y stone9) 13)) (and (= (x stone9) 8) (= (y stone9) 15)) (and (= (x stone9) 20) (= (y stone9) 23)) (and (= (x stone9) 19) (= (y stone9) 8)) (and (= (x stone9) 25) (= (y stone9) 1)) (and (= (x stone9) 15) (= (y stone9) 24)) (and (= (x stone9) 19) (= (y stone9) 24)))
	(or (and (= (x stone10) 15) (= (y stone10) 25)) (and (= (x stone10) 6) (= (y stone10) 22)) (and (= (x stone10) 16) (= (y stone10) 24)) (and (= (x stone10) 3) (= (y stone10) 13)) (and (= (x stone10) 8) (= (y stone10) 15)) (and (= (x stone10) 20) (= (y stone10) 23)) (and (= (x stone10) 19) (= (y stone10) 8)) (and (= (x stone10) 25) (= (y stone10) 1)) (and (= (x stone10) 15) (= (y stone10) 24)) (and (= (x stone10) 19) (= (y stone10) 24)))
  ))

  
  

  
)
