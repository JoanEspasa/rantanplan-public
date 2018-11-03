(define (problem instance_95_10_2)
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
	(= (x player1) 40)
	(= (y player1) 60)
	(= (x stone1) 25)
	(= (y stone1) 47)
	(= (x stone2) 3)
	(= (y stone2) 59)
	(= (x stone3) 33)
	(= (y stone3) 56)
	(= (x stone4) 8)
	(= (y stone4) 66)
	(= (x stone5) 49)
	(= (y stone5) 86)
	(= (x stone6) 93)
	(= (y stone6) 80)
	(= (x stone7) 93)
	(= (y stone7) 47)
	(= (x stone8) 49)
	(= (y stone8) 10)
	(= (x stone9) 43)
	(= (y stone9) 62)
	(= (x stone10) 86)
	(= (y stone10) 25)
  )

  (:goal (and 
    (or (and (= (x stone1) 41) (= (y stone1) 89)) (and (= (x stone1) 3) (= (y stone1) 33)) (and (= (x stone1) 71) (= (y stone1) 74)) (and (= (x stone1) 65) (= (y stone1) 71)) (and (= (x stone1) 24) (= (y stone1) 57)) (and (= (x stone1) 22) (= (y stone1) 41)) (and (= (x stone1) 14) (= (y stone1) 40)) (and (= (x stone1) 25) (= (y stone1) 30)) (and (= (x stone1) 3) (= (y stone1) 12)) (and (= (x stone1) 34) (= (y stone1) 34)))
	(or (and (= (x stone2) 41) (= (y stone2) 89)) (and (= (x stone2) 3) (= (y stone2) 33)) (and (= (x stone2) 71) (= (y stone2) 74)) (and (= (x stone2) 65) (= (y stone2) 71)) (and (= (x stone2) 24) (= (y stone2) 57)) (and (= (x stone2) 22) (= (y stone2) 41)) (and (= (x stone2) 14) (= (y stone2) 40)) (and (= (x stone2) 25) (= (y stone2) 30)) (and (= (x stone2) 3) (= (y stone2) 12)) (and (= (x stone2) 34) (= (y stone2) 34)))
	(or (and (= (x stone3) 41) (= (y stone3) 89)) (and (= (x stone3) 3) (= (y stone3) 33)) (and (= (x stone3) 71) (= (y stone3) 74)) (and (= (x stone3) 65) (= (y stone3) 71)) (and (= (x stone3) 24) (= (y stone3) 57)) (and (= (x stone3) 22) (= (y stone3) 41)) (and (= (x stone3) 14) (= (y stone3) 40)) (and (= (x stone3) 25) (= (y stone3) 30)) (and (= (x stone3) 3) (= (y stone3) 12)) (and (= (x stone3) 34) (= (y stone3) 34)))
	(or (and (= (x stone4) 41) (= (y stone4) 89)) (and (= (x stone4) 3) (= (y stone4) 33)) (and (= (x stone4) 71) (= (y stone4) 74)) (and (= (x stone4) 65) (= (y stone4) 71)) (and (= (x stone4) 24) (= (y stone4) 57)) (and (= (x stone4) 22) (= (y stone4) 41)) (and (= (x stone4) 14) (= (y stone4) 40)) (and (= (x stone4) 25) (= (y stone4) 30)) (and (= (x stone4) 3) (= (y stone4) 12)) (and (= (x stone4) 34) (= (y stone4) 34)))
	(or (and (= (x stone5) 41) (= (y stone5) 89)) (and (= (x stone5) 3) (= (y stone5) 33)) (and (= (x stone5) 71) (= (y stone5) 74)) (and (= (x stone5) 65) (= (y stone5) 71)) (and (= (x stone5) 24) (= (y stone5) 57)) (and (= (x stone5) 22) (= (y stone5) 41)) (and (= (x stone5) 14) (= (y stone5) 40)) (and (= (x stone5) 25) (= (y stone5) 30)) (and (= (x stone5) 3) (= (y stone5) 12)) (and (= (x stone5) 34) (= (y stone5) 34)))
	(or (and (= (x stone6) 41) (= (y stone6) 89)) (and (= (x stone6) 3) (= (y stone6) 33)) (and (= (x stone6) 71) (= (y stone6) 74)) (and (= (x stone6) 65) (= (y stone6) 71)) (and (= (x stone6) 24) (= (y stone6) 57)) (and (= (x stone6) 22) (= (y stone6) 41)) (and (= (x stone6) 14) (= (y stone6) 40)) (and (= (x stone6) 25) (= (y stone6) 30)) (and (= (x stone6) 3) (= (y stone6) 12)) (and (= (x stone6) 34) (= (y stone6) 34)))
	(or (and (= (x stone7) 41) (= (y stone7) 89)) (and (= (x stone7) 3) (= (y stone7) 33)) (and (= (x stone7) 71) (= (y stone7) 74)) (and (= (x stone7) 65) (= (y stone7) 71)) (and (= (x stone7) 24) (= (y stone7) 57)) (and (= (x stone7) 22) (= (y stone7) 41)) (and (= (x stone7) 14) (= (y stone7) 40)) (and (= (x stone7) 25) (= (y stone7) 30)) (and (= (x stone7) 3) (= (y stone7) 12)) (and (= (x stone7) 34) (= (y stone7) 34)))
	(or (and (= (x stone8) 41) (= (y stone8) 89)) (and (= (x stone8) 3) (= (y stone8) 33)) (and (= (x stone8) 71) (= (y stone8) 74)) (and (= (x stone8) 65) (= (y stone8) 71)) (and (= (x stone8) 24) (= (y stone8) 57)) (and (= (x stone8) 22) (= (y stone8) 41)) (and (= (x stone8) 14) (= (y stone8) 40)) (and (= (x stone8) 25) (= (y stone8) 30)) (and (= (x stone8) 3) (= (y stone8) 12)) (and (= (x stone8) 34) (= (y stone8) 34)))
	(or (and (= (x stone9) 41) (= (y stone9) 89)) (and (= (x stone9) 3) (= (y stone9) 33)) (and (= (x stone9) 71) (= (y stone9) 74)) (and (= (x stone9) 65) (= (y stone9) 71)) (and (= (x stone9) 24) (= (y stone9) 57)) (and (= (x stone9) 22) (= (y stone9) 41)) (and (= (x stone9) 14) (= (y stone9) 40)) (and (= (x stone9) 25) (= (y stone9) 30)) (and (= (x stone9) 3) (= (y stone9) 12)) (and (= (x stone9) 34) (= (y stone9) 34)))
	(or (and (= (x stone10) 41) (= (y stone10) 89)) (and (= (x stone10) 3) (= (y stone10) 33)) (and (= (x stone10) 71) (= (y stone10) 74)) (and (= (x stone10) 65) (= (y stone10) 71)) (and (= (x stone10) 24) (= (y stone10) 57)) (and (= (x stone10) 22) (= (y stone10) 41)) (and (= (x stone10) 14) (= (y stone10) 40)) (and (= (x stone10) 25) (= (y stone10) 30)) (and (= (x stone10) 3) (= (y stone10) 12)) (and (= (x stone10) 34) (= (y stone10) 34)))
  ))

  
  

  
)
