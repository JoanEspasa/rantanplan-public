(define (problem instance_55_4_3)
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
	(= (x player1) 37)
	(= (y player1) 30)
	(= (x stone1) 38)
	(= (y stone1) 24)
	(= (x stone2) 44)
	(= (y stone2) 22)
	(= (x stone3) 27)
	(= (y stone3) 16)
	(= (x stone4) 33)
	(= (y stone4) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 25) (= (y stone1) 26)) (and (= (x stone1) 41) (= (y stone1) 41)) (and (= (x stone1) 34) (= (y stone1) 30)) (and (= (x stone1) 16) (= (y stone1) 23)))
	(or (and (= (x stone2) 25) (= (y stone2) 26)) (and (= (x stone2) 41) (= (y stone2) 41)) (and (= (x stone2) 34) (= (y stone2) 30)) (and (= (x stone2) 16) (= (y stone2) 23)))
	(or (and (= (x stone3) 25) (= (y stone3) 26)) (and (= (x stone3) 41) (= (y stone3) 41)) (and (= (x stone3) 34) (= (y stone3) 30)) (and (= (x stone3) 16) (= (y stone3) 23)))
	(or (and (= (x stone4) 25) (= (y stone4) 26)) (and (= (x stone4) 41) (= (y stone4) 41)) (and (= (x stone4) 34) (= (y stone4) 30)) (and (= (x stone4) 16) (= (y stone4) 23)))
  ))

  
  

  
)
