(define (problem instance_50_6_1)
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
	(= (x player1) 5)
	(= (y player1) 19)
	(= (x stone1) 40)
	(= (y stone1) 9)
	(= (x stone2) 29)
	(= (y stone2) 26)
	(= (x stone3) 47)
	(= (y stone3) 36)
	(= (x stone4) 31)
	(= (y stone4) 46)
	(= (x stone5) 29)
	(= (y stone5) 30)
	(= (x stone6) 2)
	(= (y stone6) 14)
  )

  (:goal (and 
    (or (and (= (x stone1) 10) (= (y stone1) 13)) (and (= (x stone1) 42) (= (y stone1) 42)) (and (= (x stone1) 27) (= (y stone1) 23)) (and (= (x stone1) 27) (= (y stone1) 49)) (and (= (x stone1) 27) (= (y stone1) 50)) (and (= (x stone1) 33) (= (y stone1) 50)))
	(or (and (= (x stone2) 10) (= (y stone2) 13)) (and (= (x stone2) 42) (= (y stone2) 42)) (and (= (x stone2) 27) (= (y stone2) 23)) (and (= (x stone2) 27) (= (y stone2) 49)) (and (= (x stone2) 27) (= (y stone2) 50)) (and (= (x stone2) 33) (= (y stone2) 50)))
	(or (and (= (x stone3) 10) (= (y stone3) 13)) (and (= (x stone3) 42) (= (y stone3) 42)) (and (= (x stone3) 27) (= (y stone3) 23)) (and (= (x stone3) 27) (= (y stone3) 49)) (and (= (x stone3) 27) (= (y stone3) 50)) (and (= (x stone3) 33) (= (y stone3) 50)))
	(or (and (= (x stone4) 10) (= (y stone4) 13)) (and (= (x stone4) 42) (= (y stone4) 42)) (and (= (x stone4) 27) (= (y stone4) 23)) (and (= (x stone4) 27) (= (y stone4) 49)) (and (= (x stone4) 27) (= (y stone4) 50)) (and (= (x stone4) 33) (= (y stone4) 50)))
	(or (and (= (x stone5) 10) (= (y stone5) 13)) (and (= (x stone5) 42) (= (y stone5) 42)) (and (= (x stone5) 27) (= (y stone5) 23)) (and (= (x stone5) 27) (= (y stone5) 49)) (and (= (x stone5) 27) (= (y stone5) 50)) (and (= (x stone5) 33) (= (y stone5) 50)))
	(or (and (= (x stone6) 10) (= (y stone6) 13)) (and (= (x stone6) 42) (= (y stone6) 42)) (and (= (x stone6) 27) (= (y stone6) 23)) (and (= (x stone6) 27) (= (y stone6) 49)) (and (= (x stone6) 27) (= (y stone6) 50)) (and (= (x stone6) 33) (= (y stone6) 50)))
  ))

  
  

  
)
