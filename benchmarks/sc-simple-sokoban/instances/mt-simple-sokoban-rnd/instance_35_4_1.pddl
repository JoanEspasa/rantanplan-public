(define (problem instance_35_4_1)
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
	(= (x player1) 29)
	(= (y player1) 7)
	(= (x stone1) 10)
	(= (y stone1) 25)
	(= (x stone2) 17)
	(= (y stone2) 5)
	(= (x stone3) 10)
	(= (y stone3) 27)
	(= (x stone4) 10)
	(= (y stone4) 24)
  )

  (:goal (and 
    (or (and (= (x stone1) 33) (= (y stone1) 4)) (and (= (x stone1) 33) (= (y stone1) 23)) (and (= (x stone1) 18) (= (y stone1) 9)) (and (= (x stone1) 16) (= (y stone1) 1)))
	(or (and (= (x stone2) 33) (= (y stone2) 4)) (and (= (x stone2) 33) (= (y stone2) 23)) (and (= (x stone2) 18) (= (y stone2) 9)) (and (= (x stone2) 16) (= (y stone2) 1)))
	(or (and (= (x stone3) 33) (= (y stone3) 4)) (and (= (x stone3) 33) (= (y stone3) 23)) (and (= (x stone3) 18) (= (y stone3) 9)) (and (= (x stone3) 16) (= (y stone3) 1)))
	(or (and (= (x stone4) 33) (= (y stone4) 4)) (and (= (x stone4) 33) (= (y stone4) 23)) (and (= (x stone4) 18) (= (y stone4) 9)) (and (= (x stone4) 16) (= (y stone4) 1)))
  ))

  
  

  
)
