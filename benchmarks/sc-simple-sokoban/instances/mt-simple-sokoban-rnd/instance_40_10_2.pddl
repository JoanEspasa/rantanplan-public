(define (problem instance_40_10_2)
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
	(= (x player1) 12)
	(= (y player1) 35)
	(= (x stone1) 36)
	(= (y stone1) 26)
	(= (x stone2) 2)
	(= (y stone2) 36)
	(= (x stone3) 14)
	(= (y stone3) 24)
	(= (x stone4) 33)
	(= (y stone4) 11)
	(= (x stone5) 14)
	(= (y stone5) 25)
	(= (x stone6) 28)
	(= (y stone6) 19)
	(= (x stone7) 9)
	(= (y stone7) 20)
	(= (x stone8) 2)
	(= (y stone8) 11)
	(= (x stone9) 26)
	(= (y stone9) 25)
	(= (x stone10) 20)
	(= (y stone10) 7)
  )

  (:goal (and 
    (or (and (= (x stone1) 4) (= (y stone1) 21)) (and (= (x stone1) 32) (= (y stone1) 15)) (and (= (x stone1) 21) (= (y stone1) 26)) (and (= (x stone1) 14) (= (y stone1) 30)) (and (= (x stone1) 19) (= (y stone1) 31)) (and (= (x stone1) 13) (= (y stone1) 35)) (and (= (x stone1) 38) (= (y stone1) 35)) (and (= (x stone1) 22) (= (y stone1) 36)) (and (= (x stone1) 5) (= (y stone1) 17)) (and (= (x stone1) 15) (= (y stone1) 9)))
	(or (and (= (x stone2) 4) (= (y stone2) 21)) (and (= (x stone2) 32) (= (y stone2) 15)) (and (= (x stone2) 21) (= (y stone2) 26)) (and (= (x stone2) 14) (= (y stone2) 30)) (and (= (x stone2) 19) (= (y stone2) 31)) (and (= (x stone2) 13) (= (y stone2) 35)) (and (= (x stone2) 38) (= (y stone2) 35)) (and (= (x stone2) 22) (= (y stone2) 36)) (and (= (x stone2) 5) (= (y stone2) 17)) (and (= (x stone2) 15) (= (y stone2) 9)))
	(or (and (= (x stone3) 4) (= (y stone3) 21)) (and (= (x stone3) 32) (= (y stone3) 15)) (and (= (x stone3) 21) (= (y stone3) 26)) (and (= (x stone3) 14) (= (y stone3) 30)) (and (= (x stone3) 19) (= (y stone3) 31)) (and (= (x stone3) 13) (= (y stone3) 35)) (and (= (x stone3) 38) (= (y stone3) 35)) (and (= (x stone3) 22) (= (y stone3) 36)) (and (= (x stone3) 5) (= (y stone3) 17)) (and (= (x stone3) 15) (= (y stone3) 9)))
	(or (and (= (x stone4) 4) (= (y stone4) 21)) (and (= (x stone4) 32) (= (y stone4) 15)) (and (= (x stone4) 21) (= (y stone4) 26)) (and (= (x stone4) 14) (= (y stone4) 30)) (and (= (x stone4) 19) (= (y stone4) 31)) (and (= (x stone4) 13) (= (y stone4) 35)) (and (= (x stone4) 38) (= (y stone4) 35)) (and (= (x stone4) 22) (= (y stone4) 36)) (and (= (x stone4) 5) (= (y stone4) 17)) (and (= (x stone4) 15) (= (y stone4) 9)))
	(or (and (= (x stone5) 4) (= (y stone5) 21)) (and (= (x stone5) 32) (= (y stone5) 15)) (and (= (x stone5) 21) (= (y stone5) 26)) (and (= (x stone5) 14) (= (y stone5) 30)) (and (= (x stone5) 19) (= (y stone5) 31)) (and (= (x stone5) 13) (= (y stone5) 35)) (and (= (x stone5) 38) (= (y stone5) 35)) (and (= (x stone5) 22) (= (y stone5) 36)) (and (= (x stone5) 5) (= (y stone5) 17)) (and (= (x stone5) 15) (= (y stone5) 9)))
	(or (and (= (x stone6) 4) (= (y stone6) 21)) (and (= (x stone6) 32) (= (y stone6) 15)) (and (= (x stone6) 21) (= (y stone6) 26)) (and (= (x stone6) 14) (= (y stone6) 30)) (and (= (x stone6) 19) (= (y stone6) 31)) (and (= (x stone6) 13) (= (y stone6) 35)) (and (= (x stone6) 38) (= (y stone6) 35)) (and (= (x stone6) 22) (= (y stone6) 36)) (and (= (x stone6) 5) (= (y stone6) 17)) (and (= (x stone6) 15) (= (y stone6) 9)))
	(or (and (= (x stone7) 4) (= (y stone7) 21)) (and (= (x stone7) 32) (= (y stone7) 15)) (and (= (x stone7) 21) (= (y stone7) 26)) (and (= (x stone7) 14) (= (y stone7) 30)) (and (= (x stone7) 19) (= (y stone7) 31)) (and (= (x stone7) 13) (= (y stone7) 35)) (and (= (x stone7) 38) (= (y stone7) 35)) (and (= (x stone7) 22) (= (y stone7) 36)) (and (= (x stone7) 5) (= (y stone7) 17)) (and (= (x stone7) 15) (= (y stone7) 9)))
	(or (and (= (x stone8) 4) (= (y stone8) 21)) (and (= (x stone8) 32) (= (y stone8) 15)) (and (= (x stone8) 21) (= (y stone8) 26)) (and (= (x stone8) 14) (= (y stone8) 30)) (and (= (x stone8) 19) (= (y stone8) 31)) (and (= (x stone8) 13) (= (y stone8) 35)) (and (= (x stone8) 38) (= (y stone8) 35)) (and (= (x stone8) 22) (= (y stone8) 36)) (and (= (x stone8) 5) (= (y stone8) 17)) (and (= (x stone8) 15) (= (y stone8) 9)))
	(or (and (= (x stone9) 4) (= (y stone9) 21)) (and (= (x stone9) 32) (= (y stone9) 15)) (and (= (x stone9) 21) (= (y stone9) 26)) (and (= (x stone9) 14) (= (y stone9) 30)) (and (= (x stone9) 19) (= (y stone9) 31)) (and (= (x stone9) 13) (= (y stone9) 35)) (and (= (x stone9) 38) (= (y stone9) 35)) (and (= (x stone9) 22) (= (y stone9) 36)) (and (= (x stone9) 5) (= (y stone9) 17)) (and (= (x stone9) 15) (= (y stone9) 9)))
	(or (and (= (x stone10) 4) (= (y stone10) 21)) (and (= (x stone10) 32) (= (y stone10) 15)) (and (= (x stone10) 21) (= (y stone10) 26)) (and (= (x stone10) 14) (= (y stone10) 30)) (and (= (x stone10) 19) (= (y stone10) 31)) (and (= (x stone10) 13) (= (y stone10) 35)) (and (= (x stone10) 38) (= (y stone10) 35)) (and (= (x stone10) 22) (= (y stone10) 36)) (and (= (x stone10) 5) (= (y stone10) 17)) (and (= (x stone10) 15) (= (y stone10) 9)))
  ))

  
  

  
)
