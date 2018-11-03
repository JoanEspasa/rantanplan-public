(define (problem instance_13_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 13)
	(= (min_x) 1)
	(= (max_y) 13)
	(= (min_y) 1)
	(= (x player1) 2)
	(= (y player1) 6)
	(= (x stone1) 3)
	(= (y stone1) 9)
	(= (x stone2) 2)
	(= (y stone2) 11)
	(= (x stone3) 3)
	(= (y stone3) 4)
	(= (x stone4) 12)
	(= (y stone4) 7)
  )

  (:goal (and 
    (or (and (= (x stone1) 8) (= (y stone1) 1)) (and (= (x stone1) 9) (= (y stone1) 12)) (and (= (x stone1) 4) (= (y stone1) 9)) (and (= (x stone1) 9) (= (y stone1) 1)))
	(or (and (= (x stone2) 8) (= (y stone2) 1)) (and (= (x stone2) 9) (= (y stone2) 12)) (and (= (x stone2) 4) (= (y stone2) 9)) (and (= (x stone2) 9) (= (y stone2) 1)))
	(or (and (= (x stone3) 8) (= (y stone3) 1)) (and (= (x stone3) 9) (= (y stone3) 12)) (and (= (x stone3) 4) (= (y stone3) 9)) (and (= (x stone3) 9) (= (y stone3) 1)))
	(or (and (= (x stone4) 8) (= (y stone4) 1)) (and (= (x stone4) 9) (= (y stone4) 12)) (and (= (x stone4) 4) (= (y stone4) 9)) (and (= (x stone4) 9) (= (y stone4) 1)))
  ))

  
  

  
)
