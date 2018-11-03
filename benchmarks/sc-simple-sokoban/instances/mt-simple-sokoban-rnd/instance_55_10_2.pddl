(define (problem instance_55_10_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 55)
	(= (min_x) 1)
	(= (max_y) 55)
	(= (min_y) 1)
	(= (x player1) 40)
	(= (y player1) 48)
	(= (x stone1) 6)
	(= (y stone1) 26)
	(= (x stone2) 41)
	(= (y stone2) 50)
	(= (x stone3) 38)
	(= (y stone3) 12)
	(= (x stone4) 47)
	(= (y stone4) 27)
	(= (x stone5) 34)
	(= (y stone5) 37)
	(= (x stone6) 26)
	(= (y stone6) 32)
	(= (x stone7) 21)
	(= (y stone7) 53)
	(= (x stone8) 23)
	(= (y stone8) 18)
	(= (x stone9) 12)
	(= (y stone9) 23)
	(= (x stone10) 7)
	(= (y stone10) 15)
  )

  (:goal (and 
    (or (and (= (x stone1) 24) (= (y stone1) 15)) (and (= (x stone1) 36) (= (y stone1) 27)) (and (= (x stone1) 14) (= (y stone1) 21)) (and (= (x stone1) 22) (= (y stone1) 2)) (and (= (x stone1) 6) (= (y stone1) 3)) (and (= (x stone1) 11) (= (y stone1) 37)) (and (= (x stone1) 37) (= (y stone1) 3)) (and (= (x stone1) 24) (= (y stone1) 14)) (and (= (x stone1) 22) (= (y stone1) 8)) (and (= (x stone1) 19) (= (y stone1) 14)))
	(or (and (= (x stone2) 24) (= (y stone2) 15)) (and (= (x stone2) 36) (= (y stone2) 27)) (and (= (x stone2) 14) (= (y stone2) 21)) (and (= (x stone2) 22) (= (y stone2) 2)) (and (= (x stone2) 6) (= (y stone2) 3)) (and (= (x stone2) 11) (= (y stone2) 37)) (and (= (x stone2) 37) (= (y stone2) 3)) (and (= (x stone2) 24) (= (y stone2) 14)) (and (= (x stone2) 22) (= (y stone2) 8)) (and (= (x stone2) 19) (= (y stone2) 14)))
	(or (and (= (x stone3) 24) (= (y stone3) 15)) (and (= (x stone3) 36) (= (y stone3) 27)) (and (= (x stone3) 14) (= (y stone3) 21)) (and (= (x stone3) 22) (= (y stone3) 2)) (and (= (x stone3) 6) (= (y stone3) 3)) (and (= (x stone3) 11) (= (y stone3) 37)) (and (= (x stone3) 37) (= (y stone3) 3)) (and (= (x stone3) 24) (= (y stone3) 14)) (and (= (x stone3) 22) (= (y stone3) 8)) (and (= (x stone3) 19) (= (y stone3) 14)))
	(or (and (= (x stone4) 24) (= (y stone4) 15)) (and (= (x stone4) 36) (= (y stone4) 27)) (and (= (x stone4) 14) (= (y stone4) 21)) (and (= (x stone4) 22) (= (y stone4) 2)) (and (= (x stone4) 6) (= (y stone4) 3)) (and (= (x stone4) 11) (= (y stone4) 37)) (and (= (x stone4) 37) (= (y stone4) 3)) (and (= (x stone4) 24) (= (y stone4) 14)) (and (= (x stone4) 22) (= (y stone4) 8)) (and (= (x stone4) 19) (= (y stone4) 14)))
	(or (and (= (x stone5) 24) (= (y stone5) 15)) (and (= (x stone5) 36) (= (y stone5) 27)) (and (= (x stone5) 14) (= (y stone5) 21)) (and (= (x stone5) 22) (= (y stone5) 2)) (and (= (x stone5) 6) (= (y stone5) 3)) (and (= (x stone5) 11) (= (y stone5) 37)) (and (= (x stone5) 37) (= (y stone5) 3)) (and (= (x stone5) 24) (= (y stone5) 14)) (and (= (x stone5) 22) (= (y stone5) 8)) (and (= (x stone5) 19) (= (y stone5) 14)))
	(or (and (= (x stone6) 24) (= (y stone6) 15)) (and (= (x stone6) 36) (= (y stone6) 27)) (and (= (x stone6) 14) (= (y stone6) 21)) (and (= (x stone6) 22) (= (y stone6) 2)) (and (= (x stone6) 6) (= (y stone6) 3)) (and (= (x stone6) 11) (= (y stone6) 37)) (and (= (x stone6) 37) (= (y stone6) 3)) (and (= (x stone6) 24) (= (y stone6) 14)) (and (= (x stone6) 22) (= (y stone6) 8)) (and (= (x stone6) 19) (= (y stone6) 14)))
	(or (and (= (x stone7) 24) (= (y stone7) 15)) (and (= (x stone7) 36) (= (y stone7) 27)) (and (= (x stone7) 14) (= (y stone7) 21)) (and (= (x stone7) 22) (= (y stone7) 2)) (and (= (x stone7) 6) (= (y stone7) 3)) (and (= (x stone7) 11) (= (y stone7) 37)) (and (= (x stone7) 37) (= (y stone7) 3)) (and (= (x stone7) 24) (= (y stone7) 14)) (and (= (x stone7) 22) (= (y stone7) 8)) (and (= (x stone7) 19) (= (y stone7) 14)))
	(or (and (= (x stone8) 24) (= (y stone8) 15)) (and (= (x stone8) 36) (= (y stone8) 27)) (and (= (x stone8) 14) (= (y stone8) 21)) (and (= (x stone8) 22) (= (y stone8) 2)) (and (= (x stone8) 6) (= (y stone8) 3)) (and (= (x stone8) 11) (= (y stone8) 37)) (and (= (x stone8) 37) (= (y stone8) 3)) (and (= (x stone8) 24) (= (y stone8) 14)) (and (= (x stone8) 22) (= (y stone8) 8)) (and (= (x stone8) 19) (= (y stone8) 14)))
	(or (and (= (x stone9) 24) (= (y stone9) 15)) (and (= (x stone9) 36) (= (y stone9) 27)) (and (= (x stone9) 14) (= (y stone9) 21)) (and (= (x stone9) 22) (= (y stone9) 2)) (and (= (x stone9) 6) (= (y stone9) 3)) (and (= (x stone9) 11) (= (y stone9) 37)) (and (= (x stone9) 37) (= (y stone9) 3)) (and (= (x stone9) 24) (= (y stone9) 14)) (and (= (x stone9) 22) (= (y stone9) 8)) (and (= (x stone9) 19) (= (y stone9) 14)))
	(or (and (= (x stone10) 24) (= (y stone10) 15)) (and (= (x stone10) 36) (= (y stone10) 27)) (and (= (x stone10) 14) (= (y stone10) 21)) (and (= (x stone10) 22) (= (y stone10) 2)) (and (= (x stone10) 6) (= (y stone10) 3)) (and (= (x stone10) 11) (= (y stone10) 37)) (and (= (x stone10) 37) (= (y stone10) 3)) (and (= (x stone10) 24) (= (y stone10) 14)) (and (= (x stone10) 22) (= (y stone10) 8)) (and (= (x stone10) 19) (= (y stone10) 14)))
  ))

  
  

  
)
