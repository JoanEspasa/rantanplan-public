(define (problem instance_25_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 25)
	(= (min_x) 1)
	(= (max_y) 25)
	(= (min_y) 1)
	(= (x player1) 19)
	(= (y player1) 15)
	(= (x stone1) 24)
	(= (y stone1) 6)
	(= (x stone2) 16)
	(= (y stone2) 6)
	(= (x stone3) 2)
	(= (y stone3) 15)
	(= (x stone4) 5)
	(= (y stone4) 10)
  )

  (:goal (and 
    (or (and (= (x stone1) 21) (= (y stone1) 10)) (and (= (x stone1) 20) (= (y stone1) 6)) (and (= (x stone1) 22) (= (y stone1) 21)) (and (= (x stone1) 3) (= (y stone1) 6)))
	(or (and (= (x stone2) 21) (= (y stone2) 10)) (and (= (x stone2) 20) (= (y stone2) 6)) (and (= (x stone2) 22) (= (y stone2) 21)) (and (= (x stone2) 3) (= (y stone2) 6)))
	(or (and (= (x stone3) 21) (= (y stone3) 10)) (and (= (x stone3) 20) (= (y stone3) 6)) (and (= (x stone3) 22) (= (y stone3) 21)) (and (= (x stone3) 3) (= (y stone3) 6)))
	(or (and (= (x stone4) 21) (= (y stone4) 10)) (and (= (x stone4) 20) (= (y stone4) 6)) (and (= (x stone4) 22) (= (y stone4) 21)) (and (= (x stone4) 3) (= (y stone4) 6)))
  ))

  
  

  
)
