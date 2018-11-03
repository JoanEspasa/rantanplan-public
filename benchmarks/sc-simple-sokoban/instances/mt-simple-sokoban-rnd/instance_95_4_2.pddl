(define (problem instance_95_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 95)
	(= (min_x) 1)
	(= (max_y) 95)
	(= (min_y) 1)
	(= (x player1) 62)
	(= (y player1) 65)
	(= (x stone1) 80)
	(= (y stone1) 43)
	(= (x stone2) 21)
	(= (y stone2) 36)
	(= (x stone3) 34)
	(= (y stone3) 43)
	(= (x stone4) 89)
	(= (y stone4) 81)
  )

  (:goal (and 
    (or (and (= (x stone1) 53) (= (y stone1) 24)) (and (= (x stone1) 49) (= (y stone1) 75)) (and (= (x stone1) 87) (= (y stone1) 86)) (and (= (x stone1) 47) (= (y stone1) 23)))
	(or (and (= (x stone2) 53) (= (y stone2) 24)) (and (= (x stone2) 49) (= (y stone2) 75)) (and (= (x stone2) 87) (= (y stone2) 86)) (and (= (x stone2) 47) (= (y stone2) 23)))
	(or (and (= (x stone3) 53) (= (y stone3) 24)) (and (= (x stone3) 49) (= (y stone3) 75)) (and (= (x stone3) 87) (= (y stone3) 86)) (and (= (x stone3) 47) (= (y stone3) 23)))
	(or (and (= (x stone4) 53) (= (y stone4) 24)) (and (= (x stone4) 49) (= (y stone4) 75)) (and (= (x stone4) 87) (= (y stone4) 86)) (and (= (x stone4) 47) (= (y stone4) 23)))
  ))

  
  

  
)
