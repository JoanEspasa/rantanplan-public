(define (problem instance_65_6_1)
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
	(= (x player1) 39)
	(= (y player1) 10)
	(= (x stone1) 11)
	(= (y stone1) 48)
	(= (x stone2) 26)
	(= (y stone2) 15)
	(= (x stone3) 18)
	(= (y stone3) 55)
	(= (x stone4) 37)
	(= (y stone4) 27)
	(= (x stone5) 22)
	(= (y stone5) 36)
	(= (x stone6) 57)
	(= (y stone6) 64)
  )

  (:goal (and 
    (or (and (= (x stone1) 5) (= (y stone1) 40)) (and (= (x stone1) 48) (= (y stone1) 12)) (and (= (x stone1) 59) (= (y stone1) 36)) (and (= (x stone1) 19) (= (y stone1) 46)) (and (= (x stone1) 61) (= (y stone1) 62)) (and (= (x stone1) 53) (= (y stone1) 4)))
	(or (and (= (x stone2) 5) (= (y stone2) 40)) (and (= (x stone2) 48) (= (y stone2) 12)) (and (= (x stone2) 59) (= (y stone2) 36)) (and (= (x stone2) 19) (= (y stone2) 46)) (and (= (x stone2) 61) (= (y stone2) 62)) (and (= (x stone2) 53) (= (y stone2) 4)))
	(or (and (= (x stone3) 5) (= (y stone3) 40)) (and (= (x stone3) 48) (= (y stone3) 12)) (and (= (x stone3) 59) (= (y stone3) 36)) (and (= (x stone3) 19) (= (y stone3) 46)) (and (= (x stone3) 61) (= (y stone3) 62)) (and (= (x stone3) 53) (= (y stone3) 4)))
	(or (and (= (x stone4) 5) (= (y stone4) 40)) (and (= (x stone4) 48) (= (y stone4) 12)) (and (= (x stone4) 59) (= (y stone4) 36)) (and (= (x stone4) 19) (= (y stone4) 46)) (and (= (x stone4) 61) (= (y stone4) 62)) (and (= (x stone4) 53) (= (y stone4) 4)))
	(or (and (= (x stone5) 5) (= (y stone5) 40)) (and (= (x stone5) 48) (= (y stone5) 12)) (and (= (x stone5) 59) (= (y stone5) 36)) (and (= (x stone5) 19) (= (y stone5) 46)) (and (= (x stone5) 61) (= (y stone5) 62)) (and (= (x stone5) 53) (= (y stone5) 4)))
	(or (and (= (x stone6) 5) (= (y stone6) 40)) (and (= (x stone6) 48) (= (y stone6) 12)) (and (= (x stone6) 59) (= (y stone6) 36)) (and (= (x stone6) 19) (= (y stone6) 46)) (and (= (x stone6) 61) (= (y stone6) 62)) (and (= (x stone6) 53) (= (y stone6) 4)))
  ))

  
  

  
)
