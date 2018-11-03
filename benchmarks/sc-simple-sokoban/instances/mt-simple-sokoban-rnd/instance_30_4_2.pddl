(define (problem instance_30_4_2)
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
	(= (x player1) 12)
	(= (y player1) 23)
	(= (x stone1) 2)
	(= (y stone1) 26)
	(= (x stone2) 29)
	(= (y stone2) 11)
	(= (x stone3) 24)
	(= (y stone3) 2)
	(= (x stone4) 28)
	(= (y stone4) 8)
  )

  (:goal (and 
    (or (and (= (x stone1) 13) (= (y stone1) 13)) (and (= (x stone1) 16) (= (y stone1) 23)) (and (= (x stone1) 14) (= (y stone1) 4)) (and (= (x stone1) 3) (= (y stone1) 3)))
	(or (and (= (x stone2) 13) (= (y stone2) 13)) (and (= (x stone2) 16) (= (y stone2) 23)) (and (= (x stone2) 14) (= (y stone2) 4)) (and (= (x stone2) 3) (= (y stone2) 3)))
	(or (and (= (x stone3) 13) (= (y stone3) 13)) (and (= (x stone3) 16) (= (y stone3) 23)) (and (= (x stone3) 14) (= (y stone3) 4)) (and (= (x stone3) 3) (= (y stone3) 3)))
	(or (and (= (x stone4) 13) (= (y stone4) 13)) (and (= (x stone4) 16) (= (y stone4) 23)) (and (= (x stone4) 14) (= (y stone4) 4)) (and (= (x stone4) 3) (= (y stone4) 3)))
  ))

  
  

  
)
