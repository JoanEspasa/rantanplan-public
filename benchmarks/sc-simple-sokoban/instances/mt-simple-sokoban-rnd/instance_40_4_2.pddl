(define (problem instance_40_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 40)
	(= (min_x) 1)
	(= (max_y) 40)
	(= (min_y) 1)
	(= (x player1) 2)
	(= (y player1) 28)
	(= (x stone1) 3)
	(= (y stone1) 26)
	(= (x stone2) 17)
	(= (y stone2) 17)
	(= (x stone3) 38)
	(= (y stone3) 6)
	(= (x stone4) 27)
	(= (y stone4) 14)
  )

  (:goal (and 
    (or (and (= (x stone1) 11) (= (y stone1) 7)) (and (= (x stone1) 25) (= (y stone1) 19)) (and (= (x stone1) 12) (= (y stone1) 37)) (and (= (x stone1) 33) (= (y stone1) 8)))
	(or (and (= (x stone2) 11) (= (y stone2) 7)) (and (= (x stone2) 25) (= (y stone2) 19)) (and (= (x stone2) 12) (= (y stone2) 37)) (and (= (x stone2) 33) (= (y stone2) 8)))
	(or (and (= (x stone3) 11) (= (y stone3) 7)) (and (= (x stone3) 25) (= (y stone3) 19)) (and (= (x stone3) 12) (= (y stone3) 37)) (and (= (x stone3) 33) (= (y stone3) 8)))
	(or (and (= (x stone4) 11) (= (y stone4) 7)) (and (= (x stone4) 25) (= (y stone4) 19)) (and (= (x stone4) 12) (= (y stone4) 37)) (and (= (x stone4) 33) (= (y stone4) 8)))
  ))

  
  

  
)
