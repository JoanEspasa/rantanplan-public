(define (problem instance_15_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 15)
	(= (min_x) 1)
	(= (max_y) 15)
	(= (min_y) 1)
	(= (x player1) 7)
	(= (y player1) 7)
	(= (x stone1) 8)
	(= (y stone1) 9)
	(= (x stone2) 6)
	(= (y stone2) 8)
	(= (x stone3) 10)
	(= (y stone3) 11)
	(= (x stone4) 13)
	(= (y stone4) 7)
  )

  (:goal (and 
    (or (and (= (x stone1) 10) (= (y stone1) 4)) (and (= (x stone1) 15) (= (y stone1) 6)) (and (= (x stone1) 3) (= (y stone1) 12)) (and (= (x stone1) 8) (= (y stone1) 8)))
	(or (and (= (x stone2) 10) (= (y stone2) 4)) (and (= (x stone2) 15) (= (y stone2) 6)) (and (= (x stone2) 3) (= (y stone2) 12)) (and (= (x stone2) 8) (= (y stone2) 8)))
	(or (and (= (x stone3) 10) (= (y stone3) 4)) (and (= (x stone3) 15) (= (y stone3) 6)) (and (= (x stone3) 3) (= (y stone3) 12)) (and (= (x stone3) 8) (= (y stone3) 8)))
	(or (and (= (x stone4) 10) (= (y stone4) 4)) (and (= (x stone4) 15) (= (y stone4) 6)) (and (= (x stone4) 3) (= (y stone4) 12)) (and (= (x stone4) 8) (= (y stone4) 8)))
  ))

  
  

  
)
