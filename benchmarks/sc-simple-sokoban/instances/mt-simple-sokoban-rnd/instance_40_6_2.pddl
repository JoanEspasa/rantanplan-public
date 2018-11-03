(define (problem instance_40_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 40)
	(= (min_x) 1)
	(= (max_y) 40)
	(= (min_y) 1)
	(= (x player1) 27)
	(= (y player1) 6)
	(= (x stone1) 26)
	(= (y stone1) 33)
	(= (x stone2) 34)
	(= (y stone2) 15)
	(= (x stone3) 7)
	(= (y stone3) 24)
	(= (x stone4) 7)
	(= (y stone4) 23)
	(= (x stone5) 39)
	(= (y stone5) 34)
	(= (x stone6) 35)
	(= (y stone6) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 4)) (and (= (x stone1) 27) (= (y stone1) 1)) (and (= (x stone1) 31) (= (y stone1) 4)) (and (= (x stone1) 6) (= (y stone1) 15)) (and (= (x stone1) 40) (= (y stone1) 3)) (and (= (x stone1) 30) (= (y stone1) 8)))
	(or (and (= (x stone2) 1) (= (y stone2) 4)) (and (= (x stone2) 27) (= (y stone2) 1)) (and (= (x stone2) 31) (= (y stone2) 4)) (and (= (x stone2) 6) (= (y stone2) 15)) (and (= (x stone2) 40) (= (y stone2) 3)) (and (= (x stone2) 30) (= (y stone2) 8)))
	(or (and (= (x stone3) 1) (= (y stone3) 4)) (and (= (x stone3) 27) (= (y stone3) 1)) (and (= (x stone3) 31) (= (y stone3) 4)) (and (= (x stone3) 6) (= (y stone3) 15)) (and (= (x stone3) 40) (= (y stone3) 3)) (and (= (x stone3) 30) (= (y stone3) 8)))
	(or (and (= (x stone4) 1) (= (y stone4) 4)) (and (= (x stone4) 27) (= (y stone4) 1)) (and (= (x stone4) 31) (= (y stone4) 4)) (and (= (x stone4) 6) (= (y stone4) 15)) (and (= (x stone4) 40) (= (y stone4) 3)) (and (= (x stone4) 30) (= (y stone4) 8)))
	(or (and (= (x stone5) 1) (= (y stone5) 4)) (and (= (x stone5) 27) (= (y stone5) 1)) (and (= (x stone5) 31) (= (y stone5) 4)) (and (= (x stone5) 6) (= (y stone5) 15)) (and (= (x stone5) 40) (= (y stone5) 3)) (and (= (x stone5) 30) (= (y stone5) 8)))
	(or (and (= (x stone6) 1) (= (y stone6) 4)) (and (= (x stone6) 27) (= (y stone6) 1)) (and (= (x stone6) 31) (= (y stone6) 4)) (and (= (x stone6) 6) (= (y stone6) 15)) (and (= (x stone6) 40) (= (y stone6) 3)) (and (= (x stone6) 30) (= (y stone6) 8)))
  ))

  
  

  
)
