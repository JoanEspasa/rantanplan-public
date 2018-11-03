(define (problem instance_45_6_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 45)
	(= (min_x) 1)
	(= (max_y) 45)
	(= (min_y) 1)
	(= (x player1) 21)
	(= (y player1) 36)
	(= (x stone1) 11)
	(= (y stone1) 28)
	(= (x stone2) 43)
	(= (y stone2) 17)
	(= (x stone3) 15)
	(= (y stone3) 17)
	(= (x stone4) 21)
	(= (y stone4) 44)
	(= (x stone5) 21)
	(= (y stone5) 41)
	(= (x stone6) 12)
	(= (y stone6) 20)
  )

  (:goal (and 
    (or (and (= (x stone1) 36) (= (y stone1) 20)) (and (= (x stone1) 5) (= (y stone1) 38)) (and (= (x stone1) 32) (= (y stone1) 10)) (and (= (x stone1) 12) (= (y stone1) 8)) (and (= (x stone1) 41) (= (y stone1) 15)) (and (= (x stone1) 32) (= (y stone1) 20)))
	(or (and (= (x stone2) 36) (= (y stone2) 20)) (and (= (x stone2) 5) (= (y stone2) 38)) (and (= (x stone2) 32) (= (y stone2) 10)) (and (= (x stone2) 12) (= (y stone2) 8)) (and (= (x stone2) 41) (= (y stone2) 15)) (and (= (x stone2) 32) (= (y stone2) 20)))
	(or (and (= (x stone3) 36) (= (y stone3) 20)) (and (= (x stone3) 5) (= (y stone3) 38)) (and (= (x stone3) 32) (= (y stone3) 10)) (and (= (x stone3) 12) (= (y stone3) 8)) (and (= (x stone3) 41) (= (y stone3) 15)) (and (= (x stone3) 32) (= (y stone3) 20)))
	(or (and (= (x stone4) 36) (= (y stone4) 20)) (and (= (x stone4) 5) (= (y stone4) 38)) (and (= (x stone4) 32) (= (y stone4) 10)) (and (= (x stone4) 12) (= (y stone4) 8)) (and (= (x stone4) 41) (= (y stone4) 15)) (and (= (x stone4) 32) (= (y stone4) 20)))
	(or (and (= (x stone5) 36) (= (y stone5) 20)) (and (= (x stone5) 5) (= (y stone5) 38)) (and (= (x stone5) 32) (= (y stone5) 10)) (and (= (x stone5) 12) (= (y stone5) 8)) (and (= (x stone5) 41) (= (y stone5) 15)) (and (= (x stone5) 32) (= (y stone5) 20)))
	(or (and (= (x stone6) 36) (= (y stone6) 20)) (and (= (x stone6) 5) (= (y stone6) 38)) (and (= (x stone6) 32) (= (y stone6) 10)) (and (= (x stone6) 12) (= (y stone6) 8)) (and (= (x stone6) 41) (= (y stone6) 15)) (and (= (x stone6) 32) (= (y stone6) 20)))
  ))

  
  

  
)
