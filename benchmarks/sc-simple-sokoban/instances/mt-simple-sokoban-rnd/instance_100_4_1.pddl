(define (problem instance_100_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 100)
	(= (min_x) 1)
	(= (max_y) 100)
	(= (min_y) 1)
	(= (x player1) 56)
	(= (y player1) 28)
	(= (x stone1) 67)
	(= (y stone1) 52)
	(= (x stone2) 10)
	(= (y stone2) 58)
	(= (x stone3) 60)
	(= (y stone3) 96)
	(= (x stone4) 85)
	(= (y stone4) 2)
  )

  (:goal (and 
    (or (and (= (x stone1) 63) (= (y stone1) 77)) (and (= (x stone1) 19) (= (y stone1) 10)) (and (= (x stone1) 1) (= (y stone1) 75)) (and (= (x stone1) 63) (= (y stone1) 64)))
	(or (and (= (x stone2) 63) (= (y stone2) 77)) (and (= (x stone2) 19) (= (y stone2) 10)) (and (= (x stone2) 1) (= (y stone2) 75)) (and (= (x stone2) 63) (= (y stone2) 64)))
	(or (and (= (x stone3) 63) (= (y stone3) 77)) (and (= (x stone3) 19) (= (y stone3) 10)) (and (= (x stone3) 1) (= (y stone3) 75)) (and (= (x stone3) 63) (= (y stone3) 64)))
	(or (and (= (x stone4) 63) (= (y stone4) 77)) (and (= (x stone4) 19) (= (y stone4) 10)) (and (= (x stone4) 1) (= (y stone4) 75)) (and (= (x stone4) 63) (= (y stone4) 64)))
  ))

  
  

  
)
