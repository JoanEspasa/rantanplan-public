(define (problem instance_50_10_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 50)
	(= (min_x) 1)
	(= (max_y) 50)
	(= (min_y) 1)
	(= (x player1) 39)
	(= (y player1) 28)
	(= (x stone1) 31)
	(= (y stone1) 23)
	(= (x stone2) 18)
	(= (y stone2) 22)
	(= (x stone3) 13)
	(= (y stone3) 46)
	(= (x stone4) 44)
	(= (y stone4) 38)
	(= (x stone5) 34)
	(= (y stone5) 20)
	(= (x stone6) 26)
	(= (y stone6) 8)
	(= (x stone7) 27)
	(= (y stone7) 30)
	(= (x stone8) 4)
	(= (y stone8) 29)
	(= (x stone9) 30)
	(= (y stone9) 33)
	(= (x stone10) 9)
	(= (y stone10) 48)
  )

  (:goal (and 
    (or (and (= (x stone1) 30) (= (y stone1) 31)) (and (= (x stone1) 26) (= (y stone1) 22)) (and (= (x stone1) 20) (= (y stone1) 37)) (and (= (x stone1) 31) (= (y stone1) 16)) (and (= (x stone1) 23) (= (y stone1) 5)) (and (= (x stone1) 36) (= (y stone1) 30)) (and (= (x stone1) 47) (= (y stone1) 27)) (and (= (x stone1) 20) (= (y stone1) 10)) (and (= (x stone1) 43) (= (y stone1) 34)) (and (= (x stone1) 6) (= (y stone1) 4)))
	(or (and (= (x stone2) 30) (= (y stone2) 31)) (and (= (x stone2) 26) (= (y stone2) 22)) (and (= (x stone2) 20) (= (y stone2) 37)) (and (= (x stone2) 31) (= (y stone2) 16)) (and (= (x stone2) 23) (= (y stone2) 5)) (and (= (x stone2) 36) (= (y stone2) 30)) (and (= (x stone2) 47) (= (y stone2) 27)) (and (= (x stone2) 20) (= (y stone2) 10)) (and (= (x stone2) 43) (= (y stone2) 34)) (and (= (x stone2) 6) (= (y stone2) 4)))
	(or (and (= (x stone3) 30) (= (y stone3) 31)) (and (= (x stone3) 26) (= (y stone3) 22)) (and (= (x stone3) 20) (= (y stone3) 37)) (and (= (x stone3) 31) (= (y stone3) 16)) (and (= (x stone3) 23) (= (y stone3) 5)) (and (= (x stone3) 36) (= (y stone3) 30)) (and (= (x stone3) 47) (= (y stone3) 27)) (and (= (x stone3) 20) (= (y stone3) 10)) (and (= (x stone3) 43) (= (y stone3) 34)) (and (= (x stone3) 6) (= (y stone3) 4)))
	(or (and (= (x stone4) 30) (= (y stone4) 31)) (and (= (x stone4) 26) (= (y stone4) 22)) (and (= (x stone4) 20) (= (y stone4) 37)) (and (= (x stone4) 31) (= (y stone4) 16)) (and (= (x stone4) 23) (= (y stone4) 5)) (and (= (x stone4) 36) (= (y stone4) 30)) (and (= (x stone4) 47) (= (y stone4) 27)) (and (= (x stone4) 20) (= (y stone4) 10)) (and (= (x stone4) 43) (= (y stone4) 34)) (and (= (x stone4) 6) (= (y stone4) 4)))
	(or (and (= (x stone5) 30) (= (y stone5) 31)) (and (= (x stone5) 26) (= (y stone5) 22)) (and (= (x stone5) 20) (= (y stone5) 37)) (and (= (x stone5) 31) (= (y stone5) 16)) (and (= (x stone5) 23) (= (y stone5) 5)) (and (= (x stone5) 36) (= (y stone5) 30)) (and (= (x stone5) 47) (= (y stone5) 27)) (and (= (x stone5) 20) (= (y stone5) 10)) (and (= (x stone5) 43) (= (y stone5) 34)) (and (= (x stone5) 6) (= (y stone5) 4)))
	(or (and (= (x stone6) 30) (= (y stone6) 31)) (and (= (x stone6) 26) (= (y stone6) 22)) (and (= (x stone6) 20) (= (y stone6) 37)) (and (= (x stone6) 31) (= (y stone6) 16)) (and (= (x stone6) 23) (= (y stone6) 5)) (and (= (x stone6) 36) (= (y stone6) 30)) (and (= (x stone6) 47) (= (y stone6) 27)) (and (= (x stone6) 20) (= (y stone6) 10)) (and (= (x stone6) 43) (= (y stone6) 34)) (and (= (x stone6) 6) (= (y stone6) 4)))
	(or (and (= (x stone7) 30) (= (y stone7) 31)) (and (= (x stone7) 26) (= (y stone7) 22)) (and (= (x stone7) 20) (= (y stone7) 37)) (and (= (x stone7) 31) (= (y stone7) 16)) (and (= (x stone7) 23) (= (y stone7) 5)) (and (= (x stone7) 36) (= (y stone7) 30)) (and (= (x stone7) 47) (= (y stone7) 27)) (and (= (x stone7) 20) (= (y stone7) 10)) (and (= (x stone7) 43) (= (y stone7) 34)) (and (= (x stone7) 6) (= (y stone7) 4)))
	(or (and (= (x stone8) 30) (= (y stone8) 31)) (and (= (x stone8) 26) (= (y stone8) 22)) (and (= (x stone8) 20) (= (y stone8) 37)) (and (= (x stone8) 31) (= (y stone8) 16)) (and (= (x stone8) 23) (= (y stone8) 5)) (and (= (x stone8) 36) (= (y stone8) 30)) (and (= (x stone8) 47) (= (y stone8) 27)) (and (= (x stone8) 20) (= (y stone8) 10)) (and (= (x stone8) 43) (= (y stone8) 34)) (and (= (x stone8) 6) (= (y stone8) 4)))
	(or (and (= (x stone9) 30) (= (y stone9) 31)) (and (= (x stone9) 26) (= (y stone9) 22)) (and (= (x stone9) 20) (= (y stone9) 37)) (and (= (x stone9) 31) (= (y stone9) 16)) (and (= (x stone9) 23) (= (y stone9) 5)) (and (= (x stone9) 36) (= (y stone9) 30)) (and (= (x stone9) 47) (= (y stone9) 27)) (and (= (x stone9) 20) (= (y stone9) 10)) (and (= (x stone9) 43) (= (y stone9) 34)) (and (= (x stone9) 6) (= (y stone9) 4)))
	(or (and (= (x stone10) 30) (= (y stone10) 31)) (and (= (x stone10) 26) (= (y stone10) 22)) (and (= (x stone10) 20) (= (y stone10) 37)) (and (= (x stone10) 31) (= (y stone10) 16)) (and (= (x stone10) 23) (= (y stone10) 5)) (and (= (x stone10) 36) (= (y stone10) 30)) (and (= (x stone10) 47) (= (y stone10) 27)) (and (= (x stone10) 20) (= (y stone10) 10)) (and (= (x stone10) 43) (= (y stone10) 34)) (and (= (x stone10) 6) (= (y stone10) 4)))
  ))

  
  

  
)
