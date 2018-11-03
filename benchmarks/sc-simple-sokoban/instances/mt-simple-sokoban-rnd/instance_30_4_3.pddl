(define (problem instance_30_4_3)
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
	(= (x player1) 25)
	(= (y player1) 3)
	(= (x stone1) 17)
	(= (y stone1) 20)
	(= (x stone2) 19)
	(= (y stone2) 24)
	(= (x stone3) 10)
	(= (y stone3) 24)
	(= (x stone4) 22)
	(= (y stone4) 20)
  )

  (:goal (and 
    (or (and (= (x stone1) 27) (= (y stone1) 3)) (and (= (x stone1) 27) (= (y stone1) 12)) (and (= (x stone1) 27) (= (y stone1) 29)) (and (= (x stone1) 6) (= (y stone1) 7)))
	(or (and (= (x stone2) 27) (= (y stone2) 3)) (and (= (x stone2) 27) (= (y stone2) 12)) (and (= (x stone2) 27) (= (y stone2) 29)) (and (= (x stone2) 6) (= (y stone2) 7)))
	(or (and (= (x stone3) 27) (= (y stone3) 3)) (and (= (x stone3) 27) (= (y stone3) 12)) (and (= (x stone3) 27) (= (y stone3) 29)) (and (= (x stone3) 6) (= (y stone3) 7)))
	(or (and (= (x stone4) 27) (= (y stone4) 3)) (and (= (x stone4) 27) (= (y stone4) 12)) (and (= (x stone4) 27) (= (y stone4) 29)) (and (= (x stone4) 6) (= (y stone4) 7)))
  ))

  
  

  
)
