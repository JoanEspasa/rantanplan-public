(define (problem instance_80_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 80)
	(= (min_x) 1)
	(= (max_y) 80)
	(= (min_y) 1)
	(= (x player1) 18)
	(= (y player1) 7)
	(= (x stone1) 7)
	(= (y stone1) 29)
	(= (x stone2) 66)
	(= (y stone2) 7)
	(= (x stone3) 45)
	(= (y stone3) 6)
	(= (x stone4) 67)
	(= (y stone4) 46)
	(= (x stone5) 24)
	(= (y stone5) 16)
	(= (x stone6) 38)
	(= (y stone6) 40)
  )

  (:goal (and 
    (or (and (= (x stone1) 15) (= (y stone1) 32)) (and (= (x stone1) 42) (= (y stone1) 39)) (and (= (x stone1) 41) (= (y stone1) 13)) (and (= (x stone1) 36) (= (y stone1) 30)) (and (= (x stone1) 47) (= (y stone1) 21)) (and (= (x stone1) 56) (= (y stone1) 6)))
	(or (and (= (x stone2) 15) (= (y stone2) 32)) (and (= (x stone2) 42) (= (y stone2) 39)) (and (= (x stone2) 41) (= (y stone2) 13)) (and (= (x stone2) 36) (= (y stone2) 30)) (and (= (x stone2) 47) (= (y stone2) 21)) (and (= (x stone2) 56) (= (y stone2) 6)))
	(or (and (= (x stone3) 15) (= (y stone3) 32)) (and (= (x stone3) 42) (= (y stone3) 39)) (and (= (x stone3) 41) (= (y stone3) 13)) (and (= (x stone3) 36) (= (y stone3) 30)) (and (= (x stone3) 47) (= (y stone3) 21)) (and (= (x stone3) 56) (= (y stone3) 6)))
	(or (and (= (x stone4) 15) (= (y stone4) 32)) (and (= (x stone4) 42) (= (y stone4) 39)) (and (= (x stone4) 41) (= (y stone4) 13)) (and (= (x stone4) 36) (= (y stone4) 30)) (and (= (x stone4) 47) (= (y stone4) 21)) (and (= (x stone4) 56) (= (y stone4) 6)))
	(or (and (= (x stone5) 15) (= (y stone5) 32)) (and (= (x stone5) 42) (= (y stone5) 39)) (and (= (x stone5) 41) (= (y stone5) 13)) (and (= (x stone5) 36) (= (y stone5) 30)) (and (= (x stone5) 47) (= (y stone5) 21)) (and (= (x stone5) 56) (= (y stone5) 6)))
	(or (and (= (x stone6) 15) (= (y stone6) 32)) (and (= (x stone6) 42) (= (y stone6) 39)) (and (= (x stone6) 41) (= (y stone6) 13)) (and (= (x stone6) 36) (= (y stone6) 30)) (and (= (x stone6) 47) (= (y stone6) 21)) (and (= (x stone6) 56) (= (y stone6) 6)))
  ))

  
  

  
)
