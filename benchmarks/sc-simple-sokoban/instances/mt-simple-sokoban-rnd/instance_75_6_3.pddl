(define (problem instance_75_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 75)
	(= (min_x) 1)
	(= (max_y) 75)
	(= (min_y) 1)
	(= (x player1) 36)
	(= (y player1) 68)
	(= (x stone1) 4)
	(= (y stone1) 71)
	(= (x stone2) 23)
	(= (y stone2) 10)
	(= (x stone3) 10)
	(= (y stone3) 48)
	(= (x stone4) 51)
	(= (y stone4) 21)
	(= (x stone5) 65)
	(= (y stone5) 23)
	(= (x stone6) 2)
	(= (y stone6) 67)
  )

  (:goal (and 
    (or (and (= (x stone1) 25) (= (y stone1) 50)) (and (= (x stone1) 31) (= (y stone1) 7)) (and (= (x stone1) 25) (= (y stone1) 41)) (and (= (x stone1) 3) (= (y stone1) 30)) (and (= (x stone1) 19) (= (y stone1) 45)) (and (= (x stone1) 65) (= (y stone1) 47)))
	(or (and (= (x stone2) 25) (= (y stone2) 50)) (and (= (x stone2) 31) (= (y stone2) 7)) (and (= (x stone2) 25) (= (y stone2) 41)) (and (= (x stone2) 3) (= (y stone2) 30)) (and (= (x stone2) 19) (= (y stone2) 45)) (and (= (x stone2) 65) (= (y stone2) 47)))
	(or (and (= (x stone3) 25) (= (y stone3) 50)) (and (= (x stone3) 31) (= (y stone3) 7)) (and (= (x stone3) 25) (= (y stone3) 41)) (and (= (x stone3) 3) (= (y stone3) 30)) (and (= (x stone3) 19) (= (y stone3) 45)) (and (= (x stone3) 65) (= (y stone3) 47)))
	(or (and (= (x stone4) 25) (= (y stone4) 50)) (and (= (x stone4) 31) (= (y stone4) 7)) (and (= (x stone4) 25) (= (y stone4) 41)) (and (= (x stone4) 3) (= (y stone4) 30)) (and (= (x stone4) 19) (= (y stone4) 45)) (and (= (x stone4) 65) (= (y stone4) 47)))
	(or (and (= (x stone5) 25) (= (y stone5) 50)) (and (= (x stone5) 31) (= (y stone5) 7)) (and (= (x stone5) 25) (= (y stone5) 41)) (and (= (x stone5) 3) (= (y stone5) 30)) (and (= (x stone5) 19) (= (y stone5) 45)) (and (= (x stone5) 65) (= (y stone5) 47)))
	(or (and (= (x stone6) 25) (= (y stone6) 50)) (and (= (x stone6) 31) (= (y stone6) 7)) (and (= (x stone6) 25) (= (y stone6) 41)) (and (= (x stone6) 3) (= (y stone6) 30)) (and (= (x stone6) 19) (= (y stone6) 45)) (and (= (x stone6) 65) (= (y stone6) 47)))
  ))

  
  

  
)
