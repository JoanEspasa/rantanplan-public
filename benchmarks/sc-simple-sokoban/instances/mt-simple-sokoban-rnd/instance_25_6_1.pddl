(define (problem instance_25_6_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 25)
	(= (min_x) 1)
	(= (max_y) 25)
	(= (min_y) 1)
	(= (x player1) 15)
	(= (y player1) 9)
	(= (x stone1) 11)
	(= (y stone1) 17)
	(= (x stone2) 19)
	(= (y stone2) 19)
	(= (x stone3) 13)
	(= (y stone3) 23)
	(= (x stone4) 23)
	(= (y stone4) 2)
	(= (x stone5) 8)
	(= (y stone5) 20)
	(= (x stone6) 2)
	(= (y stone6) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 11) (= (y stone1) 23)) (and (= (x stone1) 16) (= (y stone1) 8)) (and (= (x stone1) 3) (= (y stone1) 11)) (and (= (x stone1) 15) (= (y stone1) 5)) (and (= (x stone1) 11) (= (y stone1) 10)) (and (= (x stone1) 10) (= (y stone1) 5)))
	(or (and (= (x stone2) 11) (= (y stone2) 23)) (and (= (x stone2) 16) (= (y stone2) 8)) (and (= (x stone2) 3) (= (y stone2) 11)) (and (= (x stone2) 15) (= (y stone2) 5)) (and (= (x stone2) 11) (= (y stone2) 10)) (and (= (x stone2) 10) (= (y stone2) 5)))
	(or (and (= (x stone3) 11) (= (y stone3) 23)) (and (= (x stone3) 16) (= (y stone3) 8)) (and (= (x stone3) 3) (= (y stone3) 11)) (and (= (x stone3) 15) (= (y stone3) 5)) (and (= (x stone3) 11) (= (y stone3) 10)) (and (= (x stone3) 10) (= (y stone3) 5)))
	(or (and (= (x stone4) 11) (= (y stone4) 23)) (and (= (x stone4) 16) (= (y stone4) 8)) (and (= (x stone4) 3) (= (y stone4) 11)) (and (= (x stone4) 15) (= (y stone4) 5)) (and (= (x stone4) 11) (= (y stone4) 10)) (and (= (x stone4) 10) (= (y stone4) 5)))
	(or (and (= (x stone5) 11) (= (y stone5) 23)) (and (= (x stone5) 16) (= (y stone5) 8)) (and (= (x stone5) 3) (= (y stone5) 11)) (and (= (x stone5) 15) (= (y stone5) 5)) (and (= (x stone5) 11) (= (y stone5) 10)) (and (= (x stone5) 10) (= (y stone5) 5)))
	(or (and (= (x stone6) 11) (= (y stone6) 23)) (and (= (x stone6) 16) (= (y stone6) 8)) (and (= (x stone6) 3) (= (y stone6) 11)) (and (= (x stone6) 15) (= (y stone6) 5)) (and (= (x stone6) 11) (= (y stone6) 10)) (and (= (x stone6) 10) (= (y stone6) 5)))
  ))

  
  

  
)
