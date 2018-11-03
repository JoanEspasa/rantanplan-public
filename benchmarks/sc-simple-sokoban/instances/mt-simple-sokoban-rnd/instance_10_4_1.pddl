(define (problem instance_10_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 10)
	(= (min_x) 1)
	(= (max_y) 10)
	(= (min_y) 1)
	(= (x player1) 1)
	(= (y player1) 10)
	(= (x stone1) 5)
	(= (y stone1) 5)
	(= (x stone2) 9)
	(= (y stone2) 9)
	(= (x stone3) 2)
	(= (y stone3) 7)
	(= (x stone4) 4)
	(= (y stone4) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 2) (= (y stone1) 4)) (and (= (x stone1) 9) (= (y stone1) 10)) (and (= (x stone1) 5) (= (y stone1) 8)) (and (= (x stone1) 9) (= (y stone1) 7)))
	(or (and (= (x stone2) 2) (= (y stone2) 4)) (and (= (x stone2) 9) (= (y stone2) 10)) (and (= (x stone2) 5) (= (y stone2) 8)) (and (= (x stone2) 9) (= (y stone2) 7)))
	(or (and (= (x stone3) 2) (= (y stone3) 4)) (and (= (x stone3) 9) (= (y stone3) 10)) (and (= (x stone3) 5) (= (y stone3) 8)) (and (= (x stone3) 9) (= (y stone3) 7)))
	(or (and (= (x stone4) 2) (= (y stone4) 4)) (and (= (x stone4) 9) (= (y stone4) 10)) (and (= (x stone4) 5) (= (y stone4) 8)) (and (= (x stone4) 9) (= (y stone4) 7)))
  ))

  
  

  
)
