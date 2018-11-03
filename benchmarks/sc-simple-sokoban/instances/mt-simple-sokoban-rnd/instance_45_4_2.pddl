(define (problem instance_45_4_2)
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
	(= (x player1) 45)
	(= (y player1) 6)
	(= (x stone1) 18)
	(= (y stone1) 30)
	(= (x stone2) 3)
	(= (y stone2) 34)
	(= (x stone3) 39)
	(= (y stone3) 16)
	(= (x stone4) 42)
	(= (y stone4) 41)
  )

  (:goal (and 
    (or (and (= (x stone1) 29) (= (y stone1) 43)) (and (= (x stone1) 38) (= (y stone1) 28)) (and (= (x stone1) 21) (= (y stone1) 36)) (and (= (x stone1) 2) (= (y stone1) 17)))
	(or (and (= (x stone2) 29) (= (y stone2) 43)) (and (= (x stone2) 38) (= (y stone2) 28)) (and (= (x stone2) 21) (= (y stone2) 36)) (and (= (x stone2) 2) (= (y stone2) 17)))
	(or (and (= (x stone3) 29) (= (y stone3) 43)) (and (= (x stone3) 38) (= (y stone3) 28)) (and (= (x stone3) 21) (= (y stone3) 36)) (and (= (x stone3) 2) (= (y stone3) 17)))
	(or (and (= (x stone4) 29) (= (y stone4) 43)) (and (= (x stone4) 38) (= (y stone4) 28)) (and (= (x stone4) 21) (= (y stone4) 36)) (and (= (x stone4) 2) (= (y stone4) 17)))
  ))

  
  

  
)
