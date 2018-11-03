(define (problem instance_50_6_2)
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
	(= (x player1) 4)
	(= (y player1) 45)
	(= (x stone1) 24)
	(= (y stone1) 34)
	(= (x stone2) 39)
	(= (y stone2) 14)
	(= (x stone3) 9)
	(= (y stone3) 47)
	(= (x stone4) 26)
	(= (y stone4) 49)
	(= (x stone5) 6)
	(= (y stone5) 8)
	(= (x stone6) 38)
	(= (y stone6) 26)
  )

  (:goal (and 
    (or (and (= (x stone1) 10) (= (y stone1) 24)) (and (= (x stone1) 14) (= (y stone1) 22)) (and (= (x stone1) 24) (= (y stone1) 41)) (and (= (x stone1) 7) (= (y stone1) 37)) (and (= (x stone1) 32) (= (y stone1) 25)) (and (= (x stone1) 43) (= (y stone1) 23)))
	(or (and (= (x stone2) 10) (= (y stone2) 24)) (and (= (x stone2) 14) (= (y stone2) 22)) (and (= (x stone2) 24) (= (y stone2) 41)) (and (= (x stone2) 7) (= (y stone2) 37)) (and (= (x stone2) 32) (= (y stone2) 25)) (and (= (x stone2) 43) (= (y stone2) 23)))
	(or (and (= (x stone3) 10) (= (y stone3) 24)) (and (= (x stone3) 14) (= (y stone3) 22)) (and (= (x stone3) 24) (= (y stone3) 41)) (and (= (x stone3) 7) (= (y stone3) 37)) (and (= (x stone3) 32) (= (y stone3) 25)) (and (= (x stone3) 43) (= (y stone3) 23)))
	(or (and (= (x stone4) 10) (= (y stone4) 24)) (and (= (x stone4) 14) (= (y stone4) 22)) (and (= (x stone4) 24) (= (y stone4) 41)) (and (= (x stone4) 7) (= (y stone4) 37)) (and (= (x stone4) 32) (= (y stone4) 25)) (and (= (x stone4) 43) (= (y stone4) 23)))
	(or (and (= (x stone5) 10) (= (y stone5) 24)) (and (= (x stone5) 14) (= (y stone5) 22)) (and (= (x stone5) 24) (= (y stone5) 41)) (and (= (x stone5) 7) (= (y stone5) 37)) (and (= (x stone5) 32) (= (y stone5) 25)) (and (= (x stone5) 43) (= (y stone5) 23)))
	(or (and (= (x stone6) 10) (= (y stone6) 24)) (and (= (x stone6) 14) (= (y stone6) 22)) (and (= (x stone6) 24) (= (y stone6) 41)) (and (= (x stone6) 7) (= (y stone6) 37)) (and (= (x stone6) 32) (= (y stone6) 25)) (and (= (x stone6) 43) (= (y stone6) 23)))
  ))

  
  

  
)
