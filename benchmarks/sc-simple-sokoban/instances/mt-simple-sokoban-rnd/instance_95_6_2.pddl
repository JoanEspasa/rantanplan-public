(define (problem instance_95_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 95)
	(= (min_x) 1)
	(= (max_y) 95)
	(= (min_y) 1)
	(= (x player1) 67)
	(= (y player1) 36)
	(= (x stone1) 15)
	(= (y stone1) 79)
	(= (x stone2) 31)
	(= (y stone2) 9)
	(= (x stone3) 10)
	(= (y stone3) 9)
	(= (x stone4) 32)
	(= (y stone4) 32)
	(= (x stone5) 27)
	(= (y stone5) 39)
	(= (x stone6) 62)
	(= (y stone6) 64)
  )

  (:goal (and 
    (or (and (= (x stone1) 80) (= (y stone1) 79)) (and (= (x stone1) 87) (= (y stone1) 95)) (and (= (x stone1) 40) (= (y stone1) 56)) (and (= (x stone1) 62) (= (y stone1) 55)) (and (= (x stone1) 10) (= (y stone1) 75)) (and (= (x stone1) 5) (= (y stone1) 28)))
	(or (and (= (x stone2) 80) (= (y stone2) 79)) (and (= (x stone2) 87) (= (y stone2) 95)) (and (= (x stone2) 40) (= (y stone2) 56)) (and (= (x stone2) 62) (= (y stone2) 55)) (and (= (x stone2) 10) (= (y stone2) 75)) (and (= (x stone2) 5) (= (y stone2) 28)))
	(or (and (= (x stone3) 80) (= (y stone3) 79)) (and (= (x stone3) 87) (= (y stone3) 95)) (and (= (x stone3) 40) (= (y stone3) 56)) (and (= (x stone3) 62) (= (y stone3) 55)) (and (= (x stone3) 10) (= (y stone3) 75)) (and (= (x stone3) 5) (= (y stone3) 28)))
	(or (and (= (x stone4) 80) (= (y stone4) 79)) (and (= (x stone4) 87) (= (y stone4) 95)) (and (= (x stone4) 40) (= (y stone4) 56)) (and (= (x stone4) 62) (= (y stone4) 55)) (and (= (x stone4) 10) (= (y stone4) 75)) (and (= (x stone4) 5) (= (y stone4) 28)))
	(or (and (= (x stone5) 80) (= (y stone5) 79)) (and (= (x stone5) 87) (= (y stone5) 95)) (and (= (x stone5) 40) (= (y stone5) 56)) (and (= (x stone5) 62) (= (y stone5) 55)) (and (= (x stone5) 10) (= (y stone5) 75)) (and (= (x stone5) 5) (= (y stone5) 28)))
	(or (and (= (x stone6) 80) (= (y stone6) 79)) (and (= (x stone6) 87) (= (y stone6) 95)) (and (= (x stone6) 40) (= (y stone6) 56)) (and (= (x stone6) 62) (= (y stone6) 55)) (and (= (x stone6) 10) (= (y stone6) 75)) (and (= (x stone6) 5) (= (y stone6) 28)))
  ))

  
  

  
)
