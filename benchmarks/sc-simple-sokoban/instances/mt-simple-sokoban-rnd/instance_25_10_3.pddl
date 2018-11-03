(define (problem instance_25_10_3)
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
	(= (y player1) 23)
	(= (x stone1) 5)
	(= (y stone1) 5)
	(= (x stone2) 8)
	(= (y stone2) 3)
	(= (x stone3) 22)
	(= (y stone3) 24)
	(= (x stone4) 16)
	(= (y stone4) 22)
	(= (x stone5) 17)
	(= (y stone5) 14)
	(= (x stone6) 19)
	(= (y stone6) 24)
	(= (x stone7) 21)
	(= (y stone7) 6)
	(= (x stone8) 23)
	(= (y stone8) 7)
	(= (x stone9) 11)
	(= (y stone9) 9)
	(= (x stone10) 9)
	(= (y stone10) 23)
  )

  (:goal (and 
    (or (and (= (x stone1) 14) (= (y stone1) 9)) (and (= (x stone1) 19) (= (y stone1) 11)) (and (= (x stone1) 1) (= (y stone1) 16)) (and (= (x stone1) 2) (= (y stone1) 10)) (and (= (x stone1) 4) (= (y stone1) 13)) (and (= (x stone1) 2) (= (y stone1) 2)) (and (= (x stone1) 20) (= (y stone1) 3)) (and (= (x stone1) 19) (= (y stone1) 3)) (and (= (x stone1) 1) (= (y stone1) 22)) (and (= (x stone1) 17) (= (y stone1) 19)))
	(or (and (= (x stone2) 14) (= (y stone2) 9)) (and (= (x stone2) 19) (= (y stone2) 11)) (and (= (x stone2) 1) (= (y stone2) 16)) (and (= (x stone2) 2) (= (y stone2) 10)) (and (= (x stone2) 4) (= (y stone2) 13)) (and (= (x stone2) 2) (= (y stone2) 2)) (and (= (x stone2) 20) (= (y stone2) 3)) (and (= (x stone2) 19) (= (y stone2) 3)) (and (= (x stone2) 1) (= (y stone2) 22)) (and (= (x stone2) 17) (= (y stone2) 19)))
	(or (and (= (x stone3) 14) (= (y stone3) 9)) (and (= (x stone3) 19) (= (y stone3) 11)) (and (= (x stone3) 1) (= (y stone3) 16)) (and (= (x stone3) 2) (= (y stone3) 10)) (and (= (x stone3) 4) (= (y stone3) 13)) (and (= (x stone3) 2) (= (y stone3) 2)) (and (= (x stone3) 20) (= (y stone3) 3)) (and (= (x stone3) 19) (= (y stone3) 3)) (and (= (x stone3) 1) (= (y stone3) 22)) (and (= (x stone3) 17) (= (y stone3) 19)))
	(or (and (= (x stone4) 14) (= (y stone4) 9)) (and (= (x stone4) 19) (= (y stone4) 11)) (and (= (x stone4) 1) (= (y stone4) 16)) (and (= (x stone4) 2) (= (y stone4) 10)) (and (= (x stone4) 4) (= (y stone4) 13)) (and (= (x stone4) 2) (= (y stone4) 2)) (and (= (x stone4) 20) (= (y stone4) 3)) (and (= (x stone4) 19) (= (y stone4) 3)) (and (= (x stone4) 1) (= (y stone4) 22)) (and (= (x stone4) 17) (= (y stone4) 19)))
	(or (and (= (x stone5) 14) (= (y stone5) 9)) (and (= (x stone5) 19) (= (y stone5) 11)) (and (= (x stone5) 1) (= (y stone5) 16)) (and (= (x stone5) 2) (= (y stone5) 10)) (and (= (x stone5) 4) (= (y stone5) 13)) (and (= (x stone5) 2) (= (y stone5) 2)) (and (= (x stone5) 20) (= (y stone5) 3)) (and (= (x stone5) 19) (= (y stone5) 3)) (and (= (x stone5) 1) (= (y stone5) 22)) (and (= (x stone5) 17) (= (y stone5) 19)))
	(or (and (= (x stone6) 14) (= (y stone6) 9)) (and (= (x stone6) 19) (= (y stone6) 11)) (and (= (x stone6) 1) (= (y stone6) 16)) (and (= (x stone6) 2) (= (y stone6) 10)) (and (= (x stone6) 4) (= (y stone6) 13)) (and (= (x stone6) 2) (= (y stone6) 2)) (and (= (x stone6) 20) (= (y stone6) 3)) (and (= (x stone6) 19) (= (y stone6) 3)) (and (= (x stone6) 1) (= (y stone6) 22)) (and (= (x stone6) 17) (= (y stone6) 19)))
	(or (and (= (x stone7) 14) (= (y stone7) 9)) (and (= (x stone7) 19) (= (y stone7) 11)) (and (= (x stone7) 1) (= (y stone7) 16)) (and (= (x stone7) 2) (= (y stone7) 10)) (and (= (x stone7) 4) (= (y stone7) 13)) (and (= (x stone7) 2) (= (y stone7) 2)) (and (= (x stone7) 20) (= (y stone7) 3)) (and (= (x stone7) 19) (= (y stone7) 3)) (and (= (x stone7) 1) (= (y stone7) 22)) (and (= (x stone7) 17) (= (y stone7) 19)))
	(or (and (= (x stone8) 14) (= (y stone8) 9)) (and (= (x stone8) 19) (= (y stone8) 11)) (and (= (x stone8) 1) (= (y stone8) 16)) (and (= (x stone8) 2) (= (y stone8) 10)) (and (= (x stone8) 4) (= (y stone8) 13)) (and (= (x stone8) 2) (= (y stone8) 2)) (and (= (x stone8) 20) (= (y stone8) 3)) (and (= (x stone8) 19) (= (y stone8) 3)) (and (= (x stone8) 1) (= (y stone8) 22)) (and (= (x stone8) 17) (= (y stone8) 19)))
	(or (and (= (x stone9) 14) (= (y stone9) 9)) (and (= (x stone9) 19) (= (y stone9) 11)) (and (= (x stone9) 1) (= (y stone9) 16)) (and (= (x stone9) 2) (= (y stone9) 10)) (and (= (x stone9) 4) (= (y stone9) 13)) (and (= (x stone9) 2) (= (y stone9) 2)) (and (= (x stone9) 20) (= (y stone9) 3)) (and (= (x stone9) 19) (= (y stone9) 3)) (and (= (x stone9) 1) (= (y stone9) 22)) (and (= (x stone9) 17) (= (y stone9) 19)))
	(or (and (= (x stone10) 14) (= (y stone10) 9)) (and (= (x stone10) 19) (= (y stone10) 11)) (and (= (x stone10) 1) (= (y stone10) 16)) (and (= (x stone10) 2) (= (y stone10) 10)) (and (= (x stone10) 4) (= (y stone10) 13)) (and (= (x stone10) 2) (= (y stone10) 2)) (and (= (x stone10) 20) (= (y stone10) 3)) (and (= (x stone10) 19) (= (y stone10) 3)) (and (= (x stone10) 1) (= (y stone10) 22)) (and (= (x stone10) 17) (= (y stone10) 19)))
  ))

  
  

  
)
