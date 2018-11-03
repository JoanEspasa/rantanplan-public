(define (problem instance_65_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 65)
	(= (min_x) 1)
	(= (max_y) 65)
	(= (min_y) 1)
	(= (x player1) 3)
	(= (y player1) 61)
	(= (x stone1) 48)
	(= (y stone1) 19)
	(= (x stone2) 46)
	(= (y stone2) 55)
	(= (x stone3) 31)
	(= (y stone3) 40)
	(= (x stone4) 30)
	(= (y stone4) 57)
  )

  (:goal (and 
    (or (and (= (x stone1) 15) (= (y stone1) 22)) (and (= (x stone1) 20) (= (y stone1) 12)) (and (= (x stone1) 51) (= (y stone1) 25)) (and (= (x stone1) 33) (= (y stone1) 16)))
	(or (and (= (x stone2) 15) (= (y stone2) 22)) (and (= (x stone2) 20) (= (y stone2) 12)) (and (= (x stone2) 51) (= (y stone2) 25)) (and (= (x stone2) 33) (= (y stone2) 16)))
	(or (and (= (x stone3) 15) (= (y stone3) 22)) (and (= (x stone3) 20) (= (y stone3) 12)) (and (= (x stone3) 51) (= (y stone3) 25)) (and (= (x stone3) 33) (= (y stone3) 16)))
	(or (and (= (x stone4) 15) (= (y stone4) 22)) (and (= (x stone4) 20) (= (y stone4) 12)) (and (= (x stone4) 51) (= (y stone4) 25)) (and (= (x stone4) 33) (= (y stone4) 16)))
  ))

  
  

  
)
