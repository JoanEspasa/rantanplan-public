(define (problem instance_50_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 50)
	(= (min_x) 1)
	(= (max_y) 50)
	(= (min_y) 1)
	(= (x player1) 14)
	(= (y player1) 33)
	(= (x stone1) 32)
	(= (y stone1) 44)
	(= (x stone2) 26)
	(= (y stone2) 31)
	(= (x stone3) 33)
	(= (y stone3) 24)
	(= (x stone4) 21)
	(= (y stone4) 30)
  )

  (:goal (and 
    (or (and (= (x stone1) 33) (= (y stone1) 1)) (and (= (x stone1) 13) (= (y stone1) 29)) (and (= (x stone1) 33) (= (y stone1) 10)) (and (= (x stone1) 42) (= (y stone1) 20)))
	(or (and (= (x stone2) 33) (= (y stone2) 1)) (and (= (x stone2) 13) (= (y stone2) 29)) (and (= (x stone2) 33) (= (y stone2) 10)) (and (= (x stone2) 42) (= (y stone2) 20)))
	(or (and (= (x stone3) 33) (= (y stone3) 1)) (and (= (x stone3) 13) (= (y stone3) 29)) (and (= (x stone3) 33) (= (y stone3) 10)) (and (= (x stone3) 42) (= (y stone3) 20)))
	(or (and (= (x stone4) 33) (= (y stone4) 1)) (and (= (x stone4) 13) (= (y stone4) 29)) (and (= (x stone4) 33) (= (y stone4) 10)) (and (= (x stone4) 42) (= (y stone4) 20)))
  ))

  
  

  
)
