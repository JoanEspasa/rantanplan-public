(define (problem instance_7_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 7)
	(= (min_x) 1)
	(= (max_y) 7)
	(= (min_y) 1)
	(= (x player1) 1)
	(= (y player1) 4)
	(= (x stone1) 2)
	(= (y stone1) 2)
	(= (x stone2) 2)
	(= (y stone2) 4)
	(= (x stone3) 4)
	(= (y stone3) 3)
	(= (x stone4) 6)
	(= (y stone4) 6)
  )

  (:goal (and 
    (or (and (= (x stone1) 2) (= (y stone1) 7)) (and (= (x stone1) 2) (= (y stone1) 1)) (and (= (x stone1) 6) (= (y stone1) 7)) (and (= (x stone1) 6) (= (y stone1) 4)))
	(or (and (= (x stone2) 2) (= (y stone2) 7)) (and (= (x stone2) 2) (= (y stone2) 1)) (and (= (x stone2) 6) (= (y stone2) 7)) (and (= (x stone2) 6) (= (y stone2) 4)))
	(or (and (= (x stone3) 2) (= (y stone3) 7)) (and (= (x stone3) 2) (= (y stone3) 1)) (and (= (x stone3) 6) (= (y stone3) 7)) (and (= (x stone3) 6) (= (y stone3) 4)))
	(or (and (= (x stone4) 2) (= (y stone4) 7)) (and (= (x stone4) 2) (= (y stone4) 1)) (and (= (x stone4) 6) (= (y stone4) 7)) (and (= (x stone4) 6) (= (y stone4) 4)))
  ))

  
  

  
)
