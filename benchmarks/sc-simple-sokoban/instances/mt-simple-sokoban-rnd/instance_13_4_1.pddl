(define (problem instance_13_4_1)
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
	(= (x player1) 6)
	(= (y player1) 6)
	(= (x stone1) 11)
	(= (y stone1) 6)
	(= (x stone2) 10)
	(= (y stone2) 2)
	(= (x stone3) 2)
	(= (y stone3) 9)
	(= (x stone4) 4)
	(= (y stone4) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 8)) (and (= (x stone1) 5) (= (y stone1) 6)) (and (= (x stone1) 10) (= (y stone1) 13)) (and (= (x stone1) 1) (= (y stone1) 11)))
	(or (and (= (x stone2) 1) (= (y stone2) 8)) (and (= (x stone2) 5) (= (y stone2) 6)) (and (= (x stone2) 10) (= (y stone2) 13)) (and (= (x stone2) 1) (= (y stone2) 11)))
	(or (and (= (x stone3) 1) (= (y stone3) 8)) (and (= (x stone3) 5) (= (y stone3) 6)) (and (= (x stone3) 10) (= (y stone3) 13)) (and (= (x stone3) 1) (= (y stone3) 11)))
	(or (and (= (x stone4) 1) (= (y stone4) 8)) (and (= (x stone4) 5) (= (y stone4) 6)) (and (= (x stone4) 10) (= (y stone4) 13)) (and (= (x stone4) 1) (= (y stone4) 11)))
  ))

  
  

  
)
