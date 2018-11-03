(define (problem instance_35_6_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 35)
	(= (min_x) 1)
	(= (max_y) 35)
	(= (min_y) 1)
	(= (x player1) 32)
	(= (y player1) 1)
	(= (x stone1) 24)
	(= (y stone1) 23)
	(= (x stone2) 9)
	(= (y stone2) 27)
	(= (x stone3) 24)
	(= (y stone3) 3)
	(= (x stone4) 11)
	(= (y stone4) 22)
	(= (x stone5) 21)
	(= (y stone5) 22)
	(= (x stone6) 13)
	(= (y stone6) 15)
  )

  (:goal (and 
    (or (and (= (x stone1) 23) (= (y stone1) 27)) (and (= (x stone1) 21) (= (y stone1) 2)) (and (= (x stone1) 22) (= (y stone1) 9)) (and (= (x stone1) 10) (= (y stone1) 5)) (and (= (x stone1) 14) (= (y stone1) 23)) (and (= (x stone1) 34) (= (y stone1) 13)))
	(or (and (= (x stone2) 23) (= (y stone2) 27)) (and (= (x stone2) 21) (= (y stone2) 2)) (and (= (x stone2) 22) (= (y stone2) 9)) (and (= (x stone2) 10) (= (y stone2) 5)) (and (= (x stone2) 14) (= (y stone2) 23)) (and (= (x stone2) 34) (= (y stone2) 13)))
	(or (and (= (x stone3) 23) (= (y stone3) 27)) (and (= (x stone3) 21) (= (y stone3) 2)) (and (= (x stone3) 22) (= (y stone3) 9)) (and (= (x stone3) 10) (= (y stone3) 5)) (and (= (x stone3) 14) (= (y stone3) 23)) (and (= (x stone3) 34) (= (y stone3) 13)))
	(or (and (= (x stone4) 23) (= (y stone4) 27)) (and (= (x stone4) 21) (= (y stone4) 2)) (and (= (x stone4) 22) (= (y stone4) 9)) (and (= (x stone4) 10) (= (y stone4) 5)) (and (= (x stone4) 14) (= (y stone4) 23)) (and (= (x stone4) 34) (= (y stone4) 13)))
	(or (and (= (x stone5) 23) (= (y stone5) 27)) (and (= (x stone5) 21) (= (y stone5) 2)) (and (= (x stone5) 22) (= (y stone5) 9)) (and (= (x stone5) 10) (= (y stone5) 5)) (and (= (x stone5) 14) (= (y stone5) 23)) (and (= (x stone5) 34) (= (y stone5) 13)))
	(or (and (= (x stone6) 23) (= (y stone6) 27)) (and (= (x stone6) 21) (= (y stone6) 2)) (and (= (x stone6) 22) (= (y stone6) 9)) (and (= (x stone6) 10) (= (y stone6) 5)) (and (= (x stone6) 14) (= (y stone6) 23)) (and (= (x stone6) 34) (= (y stone6) 13)))
  ))

  
  

  
)
