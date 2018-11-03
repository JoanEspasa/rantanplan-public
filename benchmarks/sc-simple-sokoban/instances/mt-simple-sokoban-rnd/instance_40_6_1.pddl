(define (problem instance_40_6_1)
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
	(= (x player1) 30)
	(= (y player1) 6)
	(= (x stone1) 29)
	(= (y stone1) 17)
	(= (x stone2) 14)
	(= (y stone2) 11)
	(= (x stone3) 37)
	(= (y stone3) 16)
	(= (x stone4) 5)
	(= (y stone4) 30)
	(= (x stone5) 30)
	(= (y stone5) 13)
	(= (x stone6) 3)
	(= (y stone6) 7)
  )

  (:goal (and 
    (or (and (= (x stone1) 28) (= (y stone1) 10)) (and (= (x stone1) 34) (= (y stone1) 1)) (and (= (x stone1) 33) (= (y stone1) 40)) (and (= (x stone1) 17) (= (y stone1) 29)) (and (= (x stone1) 1) (= (y stone1) 19)) (and (= (x stone1) 26) (= (y stone1) 31)))
	(or (and (= (x stone2) 28) (= (y stone2) 10)) (and (= (x stone2) 34) (= (y stone2) 1)) (and (= (x stone2) 33) (= (y stone2) 40)) (and (= (x stone2) 17) (= (y stone2) 29)) (and (= (x stone2) 1) (= (y stone2) 19)) (and (= (x stone2) 26) (= (y stone2) 31)))
	(or (and (= (x stone3) 28) (= (y stone3) 10)) (and (= (x stone3) 34) (= (y stone3) 1)) (and (= (x stone3) 33) (= (y stone3) 40)) (and (= (x stone3) 17) (= (y stone3) 29)) (and (= (x stone3) 1) (= (y stone3) 19)) (and (= (x stone3) 26) (= (y stone3) 31)))
	(or (and (= (x stone4) 28) (= (y stone4) 10)) (and (= (x stone4) 34) (= (y stone4) 1)) (and (= (x stone4) 33) (= (y stone4) 40)) (and (= (x stone4) 17) (= (y stone4) 29)) (and (= (x stone4) 1) (= (y stone4) 19)) (and (= (x stone4) 26) (= (y stone4) 31)))
	(or (and (= (x stone5) 28) (= (y stone5) 10)) (and (= (x stone5) 34) (= (y stone5) 1)) (and (= (x stone5) 33) (= (y stone5) 40)) (and (= (x stone5) 17) (= (y stone5) 29)) (and (= (x stone5) 1) (= (y stone5) 19)) (and (= (x stone5) 26) (= (y stone5) 31)))
	(or (and (= (x stone6) 28) (= (y stone6) 10)) (and (= (x stone6) 34) (= (y stone6) 1)) (and (= (x stone6) 33) (= (y stone6) 40)) (and (= (x stone6) 17) (= (y stone6) 29)) (and (= (x stone6) 1) (= (y stone6) 19)) (and (= (x stone6) 26) (= (y stone6) 31)))
  ))

  
  

  
)
