(define (problem instance_95_10_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 95)
	(= (min_x) 1)
	(= (max_y) 95)
	(= (min_y) 1)
	(= (x player1) 13)
	(= (y player1) 32)
	(= (x stone1) 5)
	(= (y stone1) 79)
	(= (x stone2) 39)
	(= (y stone2) 84)
	(= (x stone3) 85)
	(= (y stone3) 51)
	(= (x stone4) 30)
	(= (y stone4) 63)
	(= (x stone5) 9)
	(= (y stone5) 37)
	(= (x stone6) 3)
	(= (y stone6) 28)
	(= (x stone7) 42)
	(= (y stone7) 70)
	(= (x stone8) 55)
	(= (y stone8) 40)
	(= (x stone9) 11)
	(= (y stone9) 40)
	(= (x stone10) 47)
	(= (y stone10) 23)
  )

  (:goal (and 
    (or (and (= (x stone1) 85) (= (y stone1) 30)) (and (= (x stone1) 26) (= (y stone1) 47)) (and (= (x stone1) 12) (= (y stone1) 90)) (and (= (x stone1) 90) (= (y stone1) 55)) (and (= (x stone1) 57) (= (y stone1) 62)) (and (= (x stone1) 19) (= (y stone1) 36)) (and (= (x stone1) 65) (= (y stone1) 2)) (and (= (x stone1) 29) (= (y stone1) 36)) (and (= (x stone1) 67) (= (y stone1) 19)) (and (= (x stone1) 79) (= (y stone1) 65)))
	(or (and (= (x stone2) 85) (= (y stone2) 30)) (and (= (x stone2) 26) (= (y stone2) 47)) (and (= (x stone2) 12) (= (y stone2) 90)) (and (= (x stone2) 90) (= (y stone2) 55)) (and (= (x stone2) 57) (= (y stone2) 62)) (and (= (x stone2) 19) (= (y stone2) 36)) (and (= (x stone2) 65) (= (y stone2) 2)) (and (= (x stone2) 29) (= (y stone2) 36)) (and (= (x stone2) 67) (= (y stone2) 19)) (and (= (x stone2) 79) (= (y stone2) 65)))
	(or (and (= (x stone3) 85) (= (y stone3) 30)) (and (= (x stone3) 26) (= (y stone3) 47)) (and (= (x stone3) 12) (= (y stone3) 90)) (and (= (x stone3) 90) (= (y stone3) 55)) (and (= (x stone3) 57) (= (y stone3) 62)) (and (= (x stone3) 19) (= (y stone3) 36)) (and (= (x stone3) 65) (= (y stone3) 2)) (and (= (x stone3) 29) (= (y stone3) 36)) (and (= (x stone3) 67) (= (y stone3) 19)) (and (= (x stone3) 79) (= (y stone3) 65)))
	(or (and (= (x stone4) 85) (= (y stone4) 30)) (and (= (x stone4) 26) (= (y stone4) 47)) (and (= (x stone4) 12) (= (y stone4) 90)) (and (= (x stone4) 90) (= (y stone4) 55)) (and (= (x stone4) 57) (= (y stone4) 62)) (and (= (x stone4) 19) (= (y stone4) 36)) (and (= (x stone4) 65) (= (y stone4) 2)) (and (= (x stone4) 29) (= (y stone4) 36)) (and (= (x stone4) 67) (= (y stone4) 19)) (and (= (x stone4) 79) (= (y stone4) 65)))
	(or (and (= (x stone5) 85) (= (y stone5) 30)) (and (= (x stone5) 26) (= (y stone5) 47)) (and (= (x stone5) 12) (= (y stone5) 90)) (and (= (x stone5) 90) (= (y stone5) 55)) (and (= (x stone5) 57) (= (y stone5) 62)) (and (= (x stone5) 19) (= (y stone5) 36)) (and (= (x stone5) 65) (= (y stone5) 2)) (and (= (x stone5) 29) (= (y stone5) 36)) (and (= (x stone5) 67) (= (y stone5) 19)) (and (= (x stone5) 79) (= (y stone5) 65)))
	(or (and (= (x stone6) 85) (= (y stone6) 30)) (and (= (x stone6) 26) (= (y stone6) 47)) (and (= (x stone6) 12) (= (y stone6) 90)) (and (= (x stone6) 90) (= (y stone6) 55)) (and (= (x stone6) 57) (= (y stone6) 62)) (and (= (x stone6) 19) (= (y stone6) 36)) (and (= (x stone6) 65) (= (y stone6) 2)) (and (= (x stone6) 29) (= (y stone6) 36)) (and (= (x stone6) 67) (= (y stone6) 19)) (and (= (x stone6) 79) (= (y stone6) 65)))
	(or (and (= (x stone7) 85) (= (y stone7) 30)) (and (= (x stone7) 26) (= (y stone7) 47)) (and (= (x stone7) 12) (= (y stone7) 90)) (and (= (x stone7) 90) (= (y stone7) 55)) (and (= (x stone7) 57) (= (y stone7) 62)) (and (= (x stone7) 19) (= (y stone7) 36)) (and (= (x stone7) 65) (= (y stone7) 2)) (and (= (x stone7) 29) (= (y stone7) 36)) (and (= (x stone7) 67) (= (y stone7) 19)) (and (= (x stone7) 79) (= (y stone7) 65)))
	(or (and (= (x stone8) 85) (= (y stone8) 30)) (and (= (x stone8) 26) (= (y stone8) 47)) (and (= (x stone8) 12) (= (y stone8) 90)) (and (= (x stone8) 90) (= (y stone8) 55)) (and (= (x stone8) 57) (= (y stone8) 62)) (and (= (x stone8) 19) (= (y stone8) 36)) (and (= (x stone8) 65) (= (y stone8) 2)) (and (= (x stone8) 29) (= (y stone8) 36)) (and (= (x stone8) 67) (= (y stone8) 19)) (and (= (x stone8) 79) (= (y stone8) 65)))
	(or (and (= (x stone9) 85) (= (y stone9) 30)) (and (= (x stone9) 26) (= (y stone9) 47)) (and (= (x stone9) 12) (= (y stone9) 90)) (and (= (x stone9) 90) (= (y stone9) 55)) (and (= (x stone9) 57) (= (y stone9) 62)) (and (= (x stone9) 19) (= (y stone9) 36)) (and (= (x stone9) 65) (= (y stone9) 2)) (and (= (x stone9) 29) (= (y stone9) 36)) (and (= (x stone9) 67) (= (y stone9) 19)) (and (= (x stone9) 79) (= (y stone9) 65)))
	(or (and (= (x stone10) 85) (= (y stone10) 30)) (and (= (x stone10) 26) (= (y stone10) 47)) (and (= (x stone10) 12) (= (y stone10) 90)) (and (= (x stone10) 90) (= (y stone10) 55)) (and (= (x stone10) 57) (= (y stone10) 62)) (and (= (x stone10) 19) (= (y stone10) 36)) (and (= (x stone10) 65) (= (y stone10) 2)) (and (= (x stone10) 29) (= (y stone10) 36)) (and (= (x stone10) 67) (= (y stone10) 19)) (and (= (x stone10) 79) (= (y stone10) 65)))
  ))

  
  

  
)
