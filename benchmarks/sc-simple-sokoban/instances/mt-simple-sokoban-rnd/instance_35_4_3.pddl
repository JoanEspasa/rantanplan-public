(define (problem instance_35_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 35)
	(= (min_x) 1)
	(= (max_y) 35)
	(= (min_y) 1)
	(= (x player1) 10)
	(= (y player1) 19)
	(= (x stone1) 10)
	(= (y stone1) 24)
	(= (x stone2) 20)
	(= (y stone2) 14)
	(= (x stone3) 5)
	(= (y stone3) 30)
	(= (x stone4) 23)
	(= (y stone4) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 5) (= (y stone1) 3)) (and (= (x stone1) 20) (= (y stone1) 6)) (and (= (x stone1) 5) (= (y stone1) 29)) (and (= (x stone1) 11) (= (y stone1) 32)))
	(or (and (= (x stone2) 5) (= (y stone2) 3)) (and (= (x stone2) 20) (= (y stone2) 6)) (and (= (x stone2) 5) (= (y stone2) 29)) (and (= (x stone2) 11) (= (y stone2) 32)))
	(or (and (= (x stone3) 5) (= (y stone3) 3)) (and (= (x stone3) 20) (= (y stone3) 6)) (and (= (x stone3) 5) (= (y stone3) 29)) (and (= (x stone3) 11) (= (y stone3) 32)))
	(or (and (= (x stone4) 5) (= (y stone4) 3)) (and (= (x stone4) 20) (= (y stone4) 6)) (and (= (x stone4) 5) (= (y stone4) 29)) (and (= (x stone4) 11) (= (y stone4) 32)))
  ))

  
  

  
)
