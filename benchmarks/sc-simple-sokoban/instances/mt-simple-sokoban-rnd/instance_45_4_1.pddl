(define (problem instance_45_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 45)
	(= (min_x) 1)
	(= (max_y) 45)
	(= (min_y) 1)
	(= (x player1) 12)
	(= (y player1) 39)
	(= (x stone1) 26)
	(= (y stone1) 39)
	(= (x stone2) 44)
	(= (y stone2) 41)
	(= (x stone3) 23)
	(= (y stone3) 9)
	(= (x stone4) 41)
	(= (y stone4) 28)
  )

  (:goal (and 
    (or (and (= (x stone1) 22) (= (y stone1) 16)) (and (= (x stone1) 33) (= (y stone1) 18)) (and (= (x stone1) 23) (= (y stone1) 13)) (and (= (x stone1) 3) (= (y stone1) 8)))
	(or (and (= (x stone2) 22) (= (y stone2) 16)) (and (= (x stone2) 33) (= (y stone2) 18)) (and (= (x stone2) 23) (= (y stone2) 13)) (and (= (x stone2) 3) (= (y stone2) 8)))
	(or (and (= (x stone3) 22) (= (y stone3) 16)) (and (= (x stone3) 33) (= (y stone3) 18)) (and (= (x stone3) 23) (= (y stone3) 13)) (and (= (x stone3) 3) (= (y stone3) 8)))
	(or (and (= (x stone4) 22) (= (y stone4) 16)) (and (= (x stone4) 33) (= (y stone4) 18)) (and (= (x stone4) 23) (= (y stone4) 13)) (and (= (x stone4) 3) (= (y stone4) 8)))
  ))

  
  

  
)
