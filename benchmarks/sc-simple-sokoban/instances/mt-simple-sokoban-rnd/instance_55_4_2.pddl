(define (problem instance_55_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 55)
	(= (min_x) 1)
	(= (max_y) 55)
	(= (min_y) 1)
	(= (x player1) 46)
	(= (y player1) 28)
	(= (x stone1) 49)
	(= (y stone1) 40)
	(= (x stone2) 33)
	(= (y stone2) 20)
	(= (x stone3) 38)
	(= (y stone3) 48)
	(= (x stone4) 45)
	(= (y stone4) 34)
  )

  (:goal (and 
    (or (and (= (x stone1) 8) (= (y stone1) 22)) (and (= (x stone1) 36) (= (y stone1) 47)) (and (= (x stone1) 32) (= (y stone1) 2)) (and (= (x stone1) 3) (= (y stone1) 41)))
	(or (and (= (x stone2) 8) (= (y stone2) 22)) (and (= (x stone2) 36) (= (y stone2) 47)) (and (= (x stone2) 32) (= (y stone2) 2)) (and (= (x stone2) 3) (= (y stone2) 41)))
	(or (and (= (x stone3) 8) (= (y stone3) 22)) (and (= (x stone3) 36) (= (y stone3) 47)) (and (= (x stone3) 32) (= (y stone3) 2)) (and (= (x stone3) 3) (= (y stone3) 41)))
	(or (and (= (x stone4) 8) (= (y stone4) 22)) (and (= (x stone4) 36) (= (y stone4) 47)) (and (= (x stone4) 32) (= (y stone4) 2)) (and (= (x stone4) 3) (= (y stone4) 41)))
  ))

  
  

  
)
