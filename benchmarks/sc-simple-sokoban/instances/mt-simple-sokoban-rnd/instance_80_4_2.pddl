(define (problem instance_80_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 80)
	(= (min_x) 1)
	(= (max_y) 80)
	(= (min_y) 1)
	(= (x player1) 50)
	(= (y player1) 66)
	(= (x stone1) 13)
	(= (y stone1) 12)
	(= (x stone2) 34)
	(= (y stone2) 4)
	(= (x stone3) 66)
	(= (y stone3) 35)
	(= (x stone4) 21)
	(= (y stone4) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 33) (= (y stone1) 13)) (and (= (x stone1) 2) (= (y stone1) 64)) (and (= (x stone1) 49) (= (y stone1) 1)) (and (= (x stone1) 52) (= (y stone1) 46)))
	(or (and (= (x stone2) 33) (= (y stone2) 13)) (and (= (x stone2) 2) (= (y stone2) 64)) (and (= (x stone2) 49) (= (y stone2) 1)) (and (= (x stone2) 52) (= (y stone2) 46)))
	(or (and (= (x stone3) 33) (= (y stone3) 13)) (and (= (x stone3) 2) (= (y stone3) 64)) (and (= (x stone3) 49) (= (y stone3) 1)) (and (= (x stone3) 52) (= (y stone3) 46)))
	(or (and (= (x stone4) 33) (= (y stone4) 13)) (and (= (x stone4) 2) (= (y stone4) 64)) (and (= (x stone4) 49) (= (y stone4) 1)) (and (= (x stone4) 52) (= (y stone4) 46)))
  ))

  
  

  
)
