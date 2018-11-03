(define (problem instance_85_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 85)
	(= (min_x) 1)
	(= (max_y) 85)
	(= (min_y) 1)
	(= (x player1) 84)
	(= (y player1) 30)
	(= (x stone1) 32)
	(= (y stone1) 49)
	(= (x stone2) 64)
	(= (y stone2) 22)
	(= (x stone3) 49)
	(= (y stone3) 62)
	(= (x stone4) 24)
	(= (y stone4) 35)
  )

  (:goal (and 
    (or (and (= (x stone1) 44) (= (y stone1) 83)) (and (= (x stone1) 8) (= (y stone1) 7)) (and (= (x stone1) 45) (= (y stone1) 54)) (and (= (x stone1) 65) (= (y stone1) 5)))
	(or (and (= (x stone2) 44) (= (y stone2) 83)) (and (= (x stone2) 8) (= (y stone2) 7)) (and (= (x stone2) 45) (= (y stone2) 54)) (and (= (x stone2) 65) (= (y stone2) 5)))
	(or (and (= (x stone3) 44) (= (y stone3) 83)) (and (= (x stone3) 8) (= (y stone3) 7)) (and (= (x stone3) 45) (= (y stone3) 54)) (and (= (x stone3) 65) (= (y stone3) 5)))
	(or (and (= (x stone4) 44) (= (y stone4) 83)) (and (= (x stone4) 8) (= (y stone4) 7)) (and (= (x stone4) 45) (= (y stone4) 54)) (and (= (x stone4) 65) (= (y stone4) 5)))
  ))

  
  

  
)
