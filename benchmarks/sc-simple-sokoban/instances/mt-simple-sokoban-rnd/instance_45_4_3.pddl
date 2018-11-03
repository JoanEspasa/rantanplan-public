(define (problem instance_45_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 45)
	(= (min_x) 1)
	(= (max_y) 45)
	(= (min_y) 1)
	(= (x player1) 18)
	(= (y player1) 45)
	(= (x stone1) 11)
	(= (y stone1) 14)
	(= (x stone2) 30)
	(= (y stone2) 27)
	(= (x stone3) 11)
	(= (y stone3) 43)
	(= (x stone4) 29)
	(= (y stone4) 39)
  )

  (:goal (and 
    (or (and (= (x stone1) 25) (= (y stone1) 10)) (and (= (x stone1) 16) (= (y stone1) 31)) (and (= (x stone1) 14) (= (y stone1) 21)) (and (= (x stone1) 44) (= (y stone1) 28)))
	(or (and (= (x stone2) 25) (= (y stone2) 10)) (and (= (x stone2) 16) (= (y stone2) 31)) (and (= (x stone2) 14) (= (y stone2) 21)) (and (= (x stone2) 44) (= (y stone2) 28)))
	(or (and (= (x stone3) 25) (= (y stone3) 10)) (and (= (x stone3) 16) (= (y stone3) 31)) (and (= (x stone3) 14) (= (y stone3) 21)) (and (= (x stone3) 44) (= (y stone3) 28)))
	(or (and (= (x stone4) 25) (= (y stone4) 10)) (and (= (x stone4) 16) (= (y stone4) 31)) (and (= (x stone4) 14) (= (y stone4) 21)) (and (= (x stone4) 44) (= (y stone4) 28)))
  ))

  
  

  
)
