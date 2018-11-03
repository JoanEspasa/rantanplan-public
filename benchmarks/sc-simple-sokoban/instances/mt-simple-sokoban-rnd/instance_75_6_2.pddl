(define (problem instance_75_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 75)
	(= (min_x) 1)
	(= (max_y) 75)
	(= (min_y) 1)
	(= (x player1) 25)
	(= (y player1) 66)
	(= (x stone1) 3)
	(= (y stone1) 43)
	(= (x stone2) 39)
	(= (y stone2) 38)
	(= (x stone3) 64)
	(= (y stone3) 36)
	(= (x stone4) 65)
	(= (y stone4) 14)
	(= (x stone5) 60)
	(= (y stone5) 42)
	(= (x stone6) 36)
	(= (y stone6) 15)
  )

  (:goal (and 
    (or (and (= (x stone1) 8) (= (y stone1) 65)) (and (= (x stone1) 55) (= (y stone1) 9)) (and (= (x stone1) 6) (= (y stone1) 40)) (and (= (x stone1) 59) (= (y stone1) 10)) (and (= (x stone1) 68) (= (y stone1) 56)) (and (= (x stone1) 44) (= (y stone1) 15)))
	(or (and (= (x stone2) 8) (= (y stone2) 65)) (and (= (x stone2) 55) (= (y stone2) 9)) (and (= (x stone2) 6) (= (y stone2) 40)) (and (= (x stone2) 59) (= (y stone2) 10)) (and (= (x stone2) 68) (= (y stone2) 56)) (and (= (x stone2) 44) (= (y stone2) 15)))
	(or (and (= (x stone3) 8) (= (y stone3) 65)) (and (= (x stone3) 55) (= (y stone3) 9)) (and (= (x stone3) 6) (= (y stone3) 40)) (and (= (x stone3) 59) (= (y stone3) 10)) (and (= (x stone3) 68) (= (y stone3) 56)) (and (= (x stone3) 44) (= (y stone3) 15)))
	(or (and (= (x stone4) 8) (= (y stone4) 65)) (and (= (x stone4) 55) (= (y stone4) 9)) (and (= (x stone4) 6) (= (y stone4) 40)) (and (= (x stone4) 59) (= (y stone4) 10)) (and (= (x stone4) 68) (= (y stone4) 56)) (and (= (x stone4) 44) (= (y stone4) 15)))
	(or (and (= (x stone5) 8) (= (y stone5) 65)) (and (= (x stone5) 55) (= (y stone5) 9)) (and (= (x stone5) 6) (= (y stone5) 40)) (and (= (x stone5) 59) (= (y stone5) 10)) (and (= (x stone5) 68) (= (y stone5) 56)) (and (= (x stone5) 44) (= (y stone5) 15)))
	(or (and (= (x stone6) 8) (= (y stone6) 65)) (and (= (x stone6) 55) (= (y stone6) 9)) (and (= (x stone6) 6) (= (y stone6) 40)) (and (= (x stone6) 59) (= (y stone6) 10)) (and (= (x stone6) 68) (= (y stone6) 56)) (and (= (x stone6) 44) (= (y stone6) 15)))
  ))

  
  

  
)
