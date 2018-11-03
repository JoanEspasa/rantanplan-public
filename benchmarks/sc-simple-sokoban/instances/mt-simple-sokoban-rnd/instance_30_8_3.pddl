(define (problem instance_30_8_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 - stone
	player1 - player
  )

  (:init
    (= (max_x) 30)
	(= (min_x) 1)
	(= (max_y) 30)
	(= (min_y) 1)
	(= (x player1) 1)
	(= (y player1) 10)
	(= (x stone1) 22)
	(= (y stone1) 10)
	(= (x stone2) 23)
	(= (y stone2) 26)
	(= (x stone3) 22)
	(= (y stone3) 19)
	(= (x stone4) 23)
	(= (y stone4) 12)
	(= (x stone5) 27)
	(= (y stone5) 14)
	(= (x stone6) 6)
	(= (y stone6) 10)
	(= (x stone7) 2)
	(= (y stone7) 9)
	(= (x stone8) 6)
	(= (y stone8) 18)
  )

  (:goal (and 
    (or (and (= (x stone1) 22) (= (y stone1) 2)) (and (= (x stone1) 4) (= (y stone1) 30)) (and (= (x stone1) 3) (= (y stone1) 11)) (and (= (x stone1) 1) (= (y stone1) 3)) (and (= (x stone1) 21) (= (y stone1) 17)) (and (= (x stone1) 21) (= (y stone1) 11)) (and (= (x stone1) 26) (= (y stone1) 8)) (and (= (x stone1) 27) (= (y stone1) 28)))
	(or (and (= (x stone2) 22) (= (y stone2) 2)) (and (= (x stone2) 4) (= (y stone2) 30)) (and (= (x stone2) 3) (= (y stone2) 11)) (and (= (x stone2) 1) (= (y stone2) 3)) (and (= (x stone2) 21) (= (y stone2) 17)) (and (= (x stone2) 21) (= (y stone2) 11)) (and (= (x stone2) 26) (= (y stone2) 8)) (and (= (x stone2) 27) (= (y stone2) 28)))
	(or (and (= (x stone3) 22) (= (y stone3) 2)) (and (= (x stone3) 4) (= (y stone3) 30)) (and (= (x stone3) 3) (= (y stone3) 11)) (and (= (x stone3) 1) (= (y stone3) 3)) (and (= (x stone3) 21) (= (y stone3) 17)) (and (= (x stone3) 21) (= (y stone3) 11)) (and (= (x stone3) 26) (= (y stone3) 8)) (and (= (x stone3) 27) (= (y stone3) 28)))
	(or (and (= (x stone4) 22) (= (y stone4) 2)) (and (= (x stone4) 4) (= (y stone4) 30)) (and (= (x stone4) 3) (= (y stone4) 11)) (and (= (x stone4) 1) (= (y stone4) 3)) (and (= (x stone4) 21) (= (y stone4) 17)) (and (= (x stone4) 21) (= (y stone4) 11)) (and (= (x stone4) 26) (= (y stone4) 8)) (and (= (x stone4) 27) (= (y stone4) 28)))
	(or (and (= (x stone5) 22) (= (y stone5) 2)) (and (= (x stone5) 4) (= (y stone5) 30)) (and (= (x stone5) 3) (= (y stone5) 11)) (and (= (x stone5) 1) (= (y stone5) 3)) (and (= (x stone5) 21) (= (y stone5) 17)) (and (= (x stone5) 21) (= (y stone5) 11)) (and (= (x stone5) 26) (= (y stone5) 8)) (and (= (x stone5) 27) (= (y stone5) 28)))
	(or (and (= (x stone6) 22) (= (y stone6) 2)) (and (= (x stone6) 4) (= (y stone6) 30)) (and (= (x stone6) 3) (= (y stone6) 11)) (and (= (x stone6) 1) (= (y stone6) 3)) (and (= (x stone6) 21) (= (y stone6) 17)) (and (= (x stone6) 21) (= (y stone6) 11)) (and (= (x stone6) 26) (= (y stone6) 8)) (and (= (x stone6) 27) (= (y stone6) 28)))
	(or (and (= (x stone7) 22) (= (y stone7) 2)) (and (= (x stone7) 4) (= (y stone7) 30)) (and (= (x stone7) 3) (= (y stone7) 11)) (and (= (x stone7) 1) (= (y stone7) 3)) (and (= (x stone7) 21) (= (y stone7) 17)) (and (= (x stone7) 21) (= (y stone7) 11)) (and (= (x stone7) 26) (= (y stone7) 8)) (and (= (x stone7) 27) (= (y stone7) 28)))
	(or (and (= (x stone8) 22) (= (y stone8) 2)) (and (= (x stone8) 4) (= (y stone8) 30)) (and (= (x stone8) 3) (= (y stone8) 11)) (and (= (x stone8) 1) (= (y stone8) 3)) (and (= (x stone8) 21) (= (y stone8) 17)) (and (= (x stone8) 21) (= (y stone8) 11)) (and (= (x stone8) 26) (= (y stone8) 8)) (and (= (x stone8) 27) (= (y stone8) 28)))
  ))

  
  

  
)
