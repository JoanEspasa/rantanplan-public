(define (problem instance_50_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 50)
	(= (min_x) 1)
	(= (max_y) 50)
	(= (min_y) 1)
	(= (x player1) 24)
	(= (y player1) 49)
	(= (x stone1) 29)
	(= (y stone1) 29)
	(= (x stone2) 36)
	(= (y stone2) 21)
	(= (x stone3) 35)
	(= (y stone3) 47)
	(= (x stone4) 46)
	(= (y stone4) 23)
	(= (x stone5) 24)
	(= (y stone5) 45)
	(= (x stone6) 5)
	(= (y stone6) 48)
  )

  (:goal (and 
    (or (and (= (x stone1) 6) (= (y stone1) 21)) (and (= (x stone1) 14) (= (y stone1) 16)) (and (= (x stone1) 36) (= (y stone1) 20)) (and (= (x stone1) 47) (= (y stone1) 17)) (and (= (x stone1) 47) (= (y stone1) 10)) (and (= (x stone1) 15) (= (y stone1) 32)))
	(or (and (= (x stone2) 6) (= (y stone2) 21)) (and (= (x stone2) 14) (= (y stone2) 16)) (and (= (x stone2) 36) (= (y stone2) 20)) (and (= (x stone2) 47) (= (y stone2) 17)) (and (= (x stone2) 47) (= (y stone2) 10)) (and (= (x stone2) 15) (= (y stone2) 32)))
	(or (and (= (x stone3) 6) (= (y stone3) 21)) (and (= (x stone3) 14) (= (y stone3) 16)) (and (= (x stone3) 36) (= (y stone3) 20)) (and (= (x stone3) 47) (= (y stone3) 17)) (and (= (x stone3) 47) (= (y stone3) 10)) (and (= (x stone3) 15) (= (y stone3) 32)))
	(or (and (= (x stone4) 6) (= (y stone4) 21)) (and (= (x stone4) 14) (= (y stone4) 16)) (and (= (x stone4) 36) (= (y stone4) 20)) (and (= (x stone4) 47) (= (y stone4) 17)) (and (= (x stone4) 47) (= (y stone4) 10)) (and (= (x stone4) 15) (= (y stone4) 32)))
	(or (and (= (x stone5) 6) (= (y stone5) 21)) (and (= (x stone5) 14) (= (y stone5) 16)) (and (= (x stone5) 36) (= (y stone5) 20)) (and (= (x stone5) 47) (= (y stone5) 17)) (and (= (x stone5) 47) (= (y stone5) 10)) (and (= (x stone5) 15) (= (y stone5) 32)))
	(or (and (= (x stone6) 6) (= (y stone6) 21)) (and (= (x stone6) 14) (= (y stone6) 16)) (and (= (x stone6) 36) (= (y stone6) 20)) (and (= (x stone6) 47) (= (y stone6) 17)) (and (= (x stone6) 47) (= (y stone6) 10)) (and (= (x stone6) 15) (= (y stone6) 32)))
  ))

  
  

  
)
