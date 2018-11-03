(define (problem instance_15_4_2)
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
	(= (x player1) 15)
	(= (y player1) 2)
	(= (x stone1) 7)
	(= (y stone1) 14)
	(= (x stone2) 10)
	(= (y stone2) 10)
	(= (x stone3) 2)
	(= (y stone3) 7)
	(= (x stone4) 13)
	(= (y stone4) 10)
  )

  (:goal (and 
    (or (and (= (x stone1) 15) (= (y stone1) 13)) (and (= (x stone1) 9) (= (y stone1) 15)) (and (= (x stone1) 6) (= (y stone1) 8)) (and (= (x stone1) 5) (= (y stone1) 8)))
	(or (and (= (x stone2) 15) (= (y stone2) 13)) (and (= (x stone2) 9) (= (y stone2) 15)) (and (= (x stone2) 6) (= (y stone2) 8)) (and (= (x stone2) 5) (= (y stone2) 8)))
	(or (and (= (x stone3) 15) (= (y stone3) 13)) (and (= (x stone3) 9) (= (y stone3) 15)) (and (= (x stone3) 6) (= (y stone3) 8)) (and (= (x stone3) 5) (= (y stone3) 8)))
	(or (and (= (x stone4) 15) (= (y stone4) 13)) (and (= (x stone4) 9) (= (y stone4) 15)) (and (= (x stone4) 6) (= (y stone4) 8)) (and (= (x stone4) 5) (= (y stone4) 8)))
  ))

  
  

  
)
