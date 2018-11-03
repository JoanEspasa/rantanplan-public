(define (problem instance_30_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 30)
	(= (min_x) 1)
	(= (max_y) 30)
	(= (min_y) 1)
	(= (x player1) 7)
	(= (y player1) 15)
	(= (x stone1) 17)
	(= (y stone1) 7)
	(= (x stone2) 10)
	(= (y stone2) 28)
	(= (x stone3) 23)
	(= (y stone3) 24)
	(= (x stone4) 20)
	(= (y stone4) 19)
  )

  (:goal (and 
    (or (and (= (x stone1) 30) (= (y stone1) 22)) (and (= (x stone1) 5) (= (y stone1) 23)) (and (= (x stone1) 29) (= (y stone1) 14)) (and (= (x stone1) 2) (= (y stone1) 20)))
	(or (and (= (x stone2) 30) (= (y stone2) 22)) (and (= (x stone2) 5) (= (y stone2) 23)) (and (= (x stone2) 29) (= (y stone2) 14)) (and (= (x stone2) 2) (= (y stone2) 20)))
	(or (and (= (x stone3) 30) (= (y stone3) 22)) (and (= (x stone3) 5) (= (y stone3) 23)) (and (= (x stone3) 29) (= (y stone3) 14)) (and (= (x stone3) 2) (= (y stone3) 20)))
	(or (and (= (x stone4) 30) (= (y stone4) 22)) (and (= (x stone4) 5) (= (y stone4) 23)) (and (= (x stone4) 29) (= (y stone4) 14)) (and (= (x stone4) 2) (= (y stone4) 20)))
  ))

  
  

  
)
