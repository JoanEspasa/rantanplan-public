(define (problem instance_90_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 90)
	(= (min_x) 1)
	(= (max_y) 90)
	(= (min_y) 1)
	(= (x player1) 64)
	(= (y player1) 69)
	(= (x stone1) 50)
	(= (y stone1) 80)
	(= (x stone2) 39)
	(= (y stone2) 45)
	(= (x stone3) 44)
	(= (y stone3) 20)
	(= (x stone4) 85)
	(= (y stone4) 19)
  )

  (:goal (and 
    (or (and (= (x stone1) 53) (= (y stone1) 1)) (and (= (x stone1) 48) (= (y stone1) 20)) (and (= (x stone1) 3) (= (y stone1) 54)) (and (= (x stone1) 32) (= (y stone1) 16)))
	(or (and (= (x stone2) 53) (= (y stone2) 1)) (and (= (x stone2) 48) (= (y stone2) 20)) (and (= (x stone2) 3) (= (y stone2) 54)) (and (= (x stone2) 32) (= (y stone2) 16)))
	(or (and (= (x stone3) 53) (= (y stone3) 1)) (and (= (x stone3) 48) (= (y stone3) 20)) (and (= (x stone3) 3) (= (y stone3) 54)) (and (= (x stone3) 32) (= (y stone3) 16)))
	(or (and (= (x stone4) 53) (= (y stone4) 1)) (and (= (x stone4) 48) (= (y stone4) 20)) (and (= (x stone4) 3) (= (y stone4) 54)) (and (= (x stone4) 32) (= (y stone4) 16)))
  ))

  
  

  
)
