(define (problem instance_65_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 65)
	(= (min_x) 1)
	(= (max_y) 65)
	(= (min_y) 1)
	(= (x player1) 41)
	(= (y player1) 7)
	(= (x stone1) 29)
	(= (y stone1) 53)
	(= (x stone2) 30)
	(= (y stone2) 26)
	(= (x stone3) 36)
	(= (y stone3) 62)
	(= (x stone4) 13)
	(= (y stone4) 41)
	(= (x stone5) 59)
	(= (y stone5) 7)
	(= (x stone6) 12)
	(= (y stone6) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 27) (= (y stone1) 11)) (and (= (x stone1) 30) (= (y stone1) 40)) (and (= (x stone1) 8) (= (y stone1) 48)) (and (= (x stone1) 40) (= (y stone1) 32)) (and (= (x stone1) 47) (= (y stone1) 32)) (and (= (x stone1) 55) (= (y stone1) 15)))
	(or (and (= (x stone2) 27) (= (y stone2) 11)) (and (= (x stone2) 30) (= (y stone2) 40)) (and (= (x stone2) 8) (= (y stone2) 48)) (and (= (x stone2) 40) (= (y stone2) 32)) (and (= (x stone2) 47) (= (y stone2) 32)) (and (= (x stone2) 55) (= (y stone2) 15)))
	(or (and (= (x stone3) 27) (= (y stone3) 11)) (and (= (x stone3) 30) (= (y stone3) 40)) (and (= (x stone3) 8) (= (y stone3) 48)) (and (= (x stone3) 40) (= (y stone3) 32)) (and (= (x stone3) 47) (= (y stone3) 32)) (and (= (x stone3) 55) (= (y stone3) 15)))
	(or (and (= (x stone4) 27) (= (y stone4) 11)) (and (= (x stone4) 30) (= (y stone4) 40)) (and (= (x stone4) 8) (= (y stone4) 48)) (and (= (x stone4) 40) (= (y stone4) 32)) (and (= (x stone4) 47) (= (y stone4) 32)) (and (= (x stone4) 55) (= (y stone4) 15)))
	(or (and (= (x stone5) 27) (= (y stone5) 11)) (and (= (x stone5) 30) (= (y stone5) 40)) (and (= (x stone5) 8) (= (y stone5) 48)) (and (= (x stone5) 40) (= (y stone5) 32)) (and (= (x stone5) 47) (= (y stone5) 32)) (and (= (x stone5) 55) (= (y stone5) 15)))
	(or (and (= (x stone6) 27) (= (y stone6) 11)) (and (= (x stone6) 30) (= (y stone6) 40)) (and (= (x stone6) 8) (= (y stone6) 48)) (and (= (x stone6) 40) (= (y stone6) 32)) (and (= (x stone6) 47) (= (y stone6) 32)) (and (= (x stone6) 55) (= (y stone6) 15)))
  ))

  
  

  
)
