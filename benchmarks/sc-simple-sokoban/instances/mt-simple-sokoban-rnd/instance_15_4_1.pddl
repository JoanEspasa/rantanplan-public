(define (problem instance_15_4_1)
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
	(= (y player1) 14)
	(= (x stone1) 7)
	(= (y stone1) 6)
	(= (x stone2) 6)
	(= (y stone2) 6)
	(= (x stone3) 6)
	(= (y stone3) 4)
	(= (x stone4) 4)
	(= (y stone4) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 12) (= (y stone1) 11)) (and (= (x stone1) 8) (= (y stone1) 1)) (and (= (x stone1) 2) (= (y stone1) 7)) (and (= (x stone1) 9) (= (y stone1) 6)))
	(or (and (= (x stone2) 12) (= (y stone2) 11)) (and (= (x stone2) 8) (= (y stone2) 1)) (and (= (x stone2) 2) (= (y stone2) 7)) (and (= (x stone2) 9) (= (y stone2) 6)))
	(or (and (= (x stone3) 12) (= (y stone3) 11)) (and (= (x stone3) 8) (= (y stone3) 1)) (and (= (x stone3) 2) (= (y stone3) 7)) (and (= (x stone3) 9) (= (y stone3) 6)))
	(or (and (= (x stone4) 12) (= (y stone4) 11)) (and (= (x stone4) 8) (= (y stone4) 1)) (and (= (x stone4) 2) (= (y stone4) 7)) (and (= (x stone4) 9) (= (y stone4) 6)))
  ))

  
  

  
)
