(define (problem instance_45_6_2)
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
	(= (x player1) 35)
	(= (y player1) 45)
	(= (x stone1) 3)
	(= (y stone1) 37)
	(= (x stone2) 6)
	(= (y stone2) 32)
	(= (x stone3) 43)
	(= (y stone3) 22)
	(= (x stone4) 11)
	(= (y stone4) 43)
	(= (x stone5) 21)
	(= (y stone5) 41)
	(= (x stone6) 20)
	(= (y stone6) 43)
  )

  (:goal (and 
    (or (and (= (x stone1) 34) (= (y stone1) 29)) (and (= (x stone1) 24) (= (y stone1) 9)) (and (= (x stone1) 26) (= (y stone1) 34)) (and (= (x stone1) 41) (= (y stone1) 33)) (and (= (x stone1) 37) (= (y stone1) 29)) (and (= (x stone1) 11) (= (y stone1) 28)))
	(or (and (= (x stone2) 34) (= (y stone2) 29)) (and (= (x stone2) 24) (= (y stone2) 9)) (and (= (x stone2) 26) (= (y stone2) 34)) (and (= (x stone2) 41) (= (y stone2) 33)) (and (= (x stone2) 37) (= (y stone2) 29)) (and (= (x stone2) 11) (= (y stone2) 28)))
	(or (and (= (x stone3) 34) (= (y stone3) 29)) (and (= (x stone3) 24) (= (y stone3) 9)) (and (= (x stone3) 26) (= (y stone3) 34)) (and (= (x stone3) 41) (= (y stone3) 33)) (and (= (x stone3) 37) (= (y stone3) 29)) (and (= (x stone3) 11) (= (y stone3) 28)))
	(or (and (= (x stone4) 34) (= (y stone4) 29)) (and (= (x stone4) 24) (= (y stone4) 9)) (and (= (x stone4) 26) (= (y stone4) 34)) (and (= (x stone4) 41) (= (y stone4) 33)) (and (= (x stone4) 37) (= (y stone4) 29)) (and (= (x stone4) 11) (= (y stone4) 28)))
	(or (and (= (x stone5) 34) (= (y stone5) 29)) (and (= (x stone5) 24) (= (y stone5) 9)) (and (= (x stone5) 26) (= (y stone5) 34)) (and (= (x stone5) 41) (= (y stone5) 33)) (and (= (x stone5) 37) (= (y stone5) 29)) (and (= (x stone5) 11) (= (y stone5) 28)))
	(or (and (= (x stone6) 34) (= (y stone6) 29)) (and (= (x stone6) 24) (= (y stone6) 9)) (and (= (x stone6) 26) (= (y stone6) 34)) (and (= (x stone6) 41) (= (y stone6) 33)) (and (= (x stone6) 37) (= (y stone6) 29)) (and (= (x stone6) 11) (= (y stone6) 28)))
  ))

  
  

  
)
