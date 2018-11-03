(define (problem instance_100_4_2)
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
	(= (x player1) 14)
	(= (y player1) 92)
	(= (x stone1) 8)
	(= (y stone1) 54)
	(= (x stone2) 99)
	(= (y stone2) 19)
	(= (x stone3) 69)
	(= (y stone3) 48)
	(= (x stone4) 64)
	(= (y stone4) 93)
  )

  (:goal (and 
    (or (and (= (x stone1) 50) (= (y stone1) 61)) (and (= (x stone1) 63) (= (y stone1) 94)) (and (= (x stone1) 22) (= (y stone1) 10)) (and (= (x stone1) 30) (= (y stone1) 10)))
	(or (and (= (x stone2) 50) (= (y stone2) 61)) (and (= (x stone2) 63) (= (y stone2) 94)) (and (= (x stone2) 22) (= (y stone2) 10)) (and (= (x stone2) 30) (= (y stone2) 10)))
	(or (and (= (x stone3) 50) (= (y stone3) 61)) (and (= (x stone3) 63) (= (y stone3) 94)) (and (= (x stone3) 22) (= (y stone3) 10)) (and (= (x stone3) 30) (= (y stone3) 10)))
	(or (and (= (x stone4) 50) (= (y stone4) 61)) (and (= (x stone4) 63) (= (y stone4) 94)) (and (= (x stone4) 22) (= (y stone4) 10)) (and (= (x stone4) 30) (= (y stone4) 10)))
  ))

  
  

  
)
