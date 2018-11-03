(define (problem instance_40_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 40)
	(= (min_x) 1)
	(= (max_y) 40)
	(= (min_y) 1)
	(= (x player1) 37)
	(= (y player1) 25)
	(= (x stone1) 21)
	(= (y stone1) 4)
	(= (x stone2) 10)
	(= (y stone2) 21)
	(= (x stone3) 7)
	(= (y stone3) 36)
	(= (x stone4) 31)
	(= (y stone4) 12)
	(= (x stone5) 13)
	(= (y stone5) 29)
	(= (x stone6) 32)
	(= (y stone6) 18)
	(= (x stone7) 12)
	(= (y stone7) 8)
	(= (x stone8) 11)
	(= (y stone8) 29)
	(= (x stone9) 21)
	(= (y stone9) 39)
	(= (x stone10) 23)
	(= (y stone10) 37)
  )

  (:goal (and 
    (or (and (= (x stone1) 36) (= (y stone1) 36)) (and (= (x stone1) 3) (= (y stone1) 24)) (and (= (x stone1) 10) (= (y stone1) 40)) (and (= (x stone1) 40) (= (y stone1) 37)) (and (= (x stone1) 14) (= (y stone1) 23)) (and (= (x stone1) 13) (= (y stone1) 8)) (and (= (x stone1) 26) (= (y stone1) 7)) (and (= (x stone1) 24) (= (y stone1) 14)) (and (= (x stone1) 34) (= (y stone1) 20)) (and (= (x stone1) 28) (= (y stone1) 14)))
	(or (and (= (x stone2) 36) (= (y stone2) 36)) (and (= (x stone2) 3) (= (y stone2) 24)) (and (= (x stone2) 10) (= (y stone2) 40)) (and (= (x stone2) 40) (= (y stone2) 37)) (and (= (x stone2) 14) (= (y stone2) 23)) (and (= (x stone2) 13) (= (y stone2) 8)) (and (= (x stone2) 26) (= (y stone2) 7)) (and (= (x stone2) 24) (= (y stone2) 14)) (and (= (x stone2) 34) (= (y stone2) 20)) (and (= (x stone2) 28) (= (y stone2) 14)))
	(or (and (= (x stone3) 36) (= (y stone3) 36)) (and (= (x stone3) 3) (= (y stone3) 24)) (and (= (x stone3) 10) (= (y stone3) 40)) (and (= (x stone3) 40) (= (y stone3) 37)) (and (= (x stone3) 14) (= (y stone3) 23)) (and (= (x stone3) 13) (= (y stone3) 8)) (and (= (x stone3) 26) (= (y stone3) 7)) (and (= (x stone3) 24) (= (y stone3) 14)) (and (= (x stone3) 34) (= (y stone3) 20)) (and (= (x stone3) 28) (= (y stone3) 14)))
	(or (and (= (x stone4) 36) (= (y stone4) 36)) (and (= (x stone4) 3) (= (y stone4) 24)) (and (= (x stone4) 10) (= (y stone4) 40)) (and (= (x stone4) 40) (= (y stone4) 37)) (and (= (x stone4) 14) (= (y stone4) 23)) (and (= (x stone4) 13) (= (y stone4) 8)) (and (= (x stone4) 26) (= (y stone4) 7)) (and (= (x stone4) 24) (= (y stone4) 14)) (and (= (x stone4) 34) (= (y stone4) 20)) (and (= (x stone4) 28) (= (y stone4) 14)))
	(or (and (= (x stone5) 36) (= (y stone5) 36)) (and (= (x stone5) 3) (= (y stone5) 24)) (and (= (x stone5) 10) (= (y stone5) 40)) (and (= (x stone5) 40) (= (y stone5) 37)) (and (= (x stone5) 14) (= (y stone5) 23)) (and (= (x stone5) 13) (= (y stone5) 8)) (and (= (x stone5) 26) (= (y stone5) 7)) (and (= (x stone5) 24) (= (y stone5) 14)) (and (= (x stone5) 34) (= (y stone5) 20)) (and (= (x stone5) 28) (= (y stone5) 14)))
	(or (and (= (x stone6) 36) (= (y stone6) 36)) (and (= (x stone6) 3) (= (y stone6) 24)) (and (= (x stone6) 10) (= (y stone6) 40)) (and (= (x stone6) 40) (= (y stone6) 37)) (and (= (x stone6) 14) (= (y stone6) 23)) (and (= (x stone6) 13) (= (y stone6) 8)) (and (= (x stone6) 26) (= (y stone6) 7)) (and (= (x stone6) 24) (= (y stone6) 14)) (and (= (x stone6) 34) (= (y stone6) 20)) (and (= (x stone6) 28) (= (y stone6) 14)))
	(or (and (= (x stone7) 36) (= (y stone7) 36)) (and (= (x stone7) 3) (= (y stone7) 24)) (and (= (x stone7) 10) (= (y stone7) 40)) (and (= (x stone7) 40) (= (y stone7) 37)) (and (= (x stone7) 14) (= (y stone7) 23)) (and (= (x stone7) 13) (= (y stone7) 8)) (and (= (x stone7) 26) (= (y stone7) 7)) (and (= (x stone7) 24) (= (y stone7) 14)) (and (= (x stone7) 34) (= (y stone7) 20)) (and (= (x stone7) 28) (= (y stone7) 14)))
	(or (and (= (x stone8) 36) (= (y stone8) 36)) (and (= (x stone8) 3) (= (y stone8) 24)) (and (= (x stone8) 10) (= (y stone8) 40)) (and (= (x stone8) 40) (= (y stone8) 37)) (and (= (x stone8) 14) (= (y stone8) 23)) (and (= (x stone8) 13) (= (y stone8) 8)) (and (= (x stone8) 26) (= (y stone8) 7)) (and (= (x stone8) 24) (= (y stone8) 14)) (and (= (x stone8) 34) (= (y stone8) 20)) (and (= (x stone8) 28) (= (y stone8) 14)))
	(or (and (= (x stone9) 36) (= (y stone9) 36)) (and (= (x stone9) 3) (= (y stone9) 24)) (and (= (x stone9) 10) (= (y stone9) 40)) (and (= (x stone9) 40) (= (y stone9) 37)) (and (= (x stone9) 14) (= (y stone9) 23)) (and (= (x stone9) 13) (= (y stone9) 8)) (and (= (x stone9) 26) (= (y stone9) 7)) (and (= (x stone9) 24) (= (y stone9) 14)) (and (= (x stone9) 34) (= (y stone9) 20)) (and (= (x stone9) 28) (= (y stone9) 14)))
	(or (and (= (x stone10) 36) (= (y stone10) 36)) (and (= (x stone10) 3) (= (y stone10) 24)) (and (= (x stone10) 10) (= (y stone10) 40)) (and (= (x stone10) 40) (= (y stone10) 37)) (and (= (x stone10) 14) (= (y stone10) 23)) (and (= (x stone10) 13) (= (y stone10) 8)) (and (= (x stone10) 26) (= (y stone10) 7)) (and (= (x stone10) 24) (= (y stone10) 14)) (and (= (x stone10) 34) (= (y stone10) 20)) (and (= (x stone10) 28) (= (y stone10) 14)))
  ))

  
  

  
)
