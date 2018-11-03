(define (problem instance_85_4_3)
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
	(= (x player1) 83)
	(= (y player1) 67)
	(= (x stone1) 25)
	(= (y stone1) 34)
	(= (x stone2) 33)
	(= (y stone2) 74)
	(= (x stone3) 72)
	(= (y stone3) 81)
	(= (x stone4) 43)
	(= (y stone4) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 40) (= (y stone1) 85)) (and (= (x stone1) 3) (= (y stone1) 15)) (and (= (x stone1) 65) (= (y stone1) 71)) (and (= (x stone1) 54) (= (y stone1) 84)))
	(or (and (= (x stone2) 40) (= (y stone2) 85)) (and (= (x stone2) 3) (= (y stone2) 15)) (and (= (x stone2) 65) (= (y stone2) 71)) (and (= (x stone2) 54) (= (y stone2) 84)))
	(or (and (= (x stone3) 40) (= (y stone3) 85)) (and (= (x stone3) 3) (= (y stone3) 15)) (and (= (x stone3) 65) (= (y stone3) 71)) (and (= (x stone3) 54) (= (y stone3) 84)))
	(or (and (= (x stone4) 40) (= (y stone4) 85)) (and (= (x stone4) 3) (= (y stone4) 15)) (and (= (x stone4) 65) (= (y stone4) 71)) (and (= (x stone4) 54) (= (y stone4) 84)))
  ))

  
  

  
)
