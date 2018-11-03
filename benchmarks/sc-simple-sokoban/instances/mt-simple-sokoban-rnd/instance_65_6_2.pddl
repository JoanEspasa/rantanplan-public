(define (problem instance_65_6_2)
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
	(= (x player1) 22)
	(= (y player1) 36)
	(= (x stone1) 13)
	(= (y stone1) 54)
	(= (x stone2) 32)
	(= (y stone2) 38)
	(= (x stone3) 26)
	(= (y stone3) 61)
	(= (x stone4) 35)
	(= (y stone4) 28)
	(= (x stone5) 7)
	(= (y stone5) 59)
	(= (x stone6) 49)
	(= (y stone6) 45)
  )

  (:goal (and 
    (or (and (= (x stone1) 14) (= (y stone1) 57)) (and (= (x stone1) 37) (= (y stone1) 20)) (and (= (x stone1) 17) (= (y stone1) 15)) (and (= (x stone1) 43) (= (y stone1) 52)) (and (= (x stone1) 27) (= (y stone1) 32)) (and (= (x stone1) 48) (= (y stone1) 4)))
	(or (and (= (x stone2) 14) (= (y stone2) 57)) (and (= (x stone2) 37) (= (y stone2) 20)) (and (= (x stone2) 17) (= (y stone2) 15)) (and (= (x stone2) 43) (= (y stone2) 52)) (and (= (x stone2) 27) (= (y stone2) 32)) (and (= (x stone2) 48) (= (y stone2) 4)))
	(or (and (= (x stone3) 14) (= (y stone3) 57)) (and (= (x stone3) 37) (= (y stone3) 20)) (and (= (x stone3) 17) (= (y stone3) 15)) (and (= (x stone3) 43) (= (y stone3) 52)) (and (= (x stone3) 27) (= (y stone3) 32)) (and (= (x stone3) 48) (= (y stone3) 4)))
	(or (and (= (x stone4) 14) (= (y stone4) 57)) (and (= (x stone4) 37) (= (y stone4) 20)) (and (= (x stone4) 17) (= (y stone4) 15)) (and (= (x stone4) 43) (= (y stone4) 52)) (and (= (x stone4) 27) (= (y stone4) 32)) (and (= (x stone4) 48) (= (y stone4) 4)))
	(or (and (= (x stone5) 14) (= (y stone5) 57)) (and (= (x stone5) 37) (= (y stone5) 20)) (and (= (x stone5) 17) (= (y stone5) 15)) (and (= (x stone5) 43) (= (y stone5) 52)) (and (= (x stone5) 27) (= (y stone5) 32)) (and (= (x stone5) 48) (= (y stone5) 4)))
	(or (and (= (x stone6) 14) (= (y stone6) 57)) (and (= (x stone6) 37) (= (y stone6) 20)) (and (= (x stone6) 17) (= (y stone6) 15)) (and (= (x stone6) 43) (= (y stone6) 52)) (and (= (x stone6) 27) (= (y stone6) 32)) (and (= (x stone6) 48) (= (y stone6) 4)))
  ))

  
  

  
)
