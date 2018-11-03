(define (problem instance_75_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 75)
	(= (min_x) 1)
	(= (max_y) 75)
	(= (min_y) 1)
	(= (x player1) 28)
	(= (y player1) 14)
	(= (x stone1) 65)
	(= (y stone1) 68)
	(= (x stone2) 24)
	(= (y stone2) 37)
	(= (x stone3) 29)
	(= (y stone3) 39)
	(= (x stone4) 62)
	(= (y stone4) 20)
  )

  (:goal (and 
    (or (and (= (x stone1) 5) (= (y stone1) 73)) (and (= (x stone1) 59) (= (y stone1) 46)) (and (= (x stone1) 40) (= (y stone1) 58)) (and (= (x stone1) 12) (= (y stone1) 62)))
	(or (and (= (x stone2) 5) (= (y stone2) 73)) (and (= (x stone2) 59) (= (y stone2) 46)) (and (= (x stone2) 40) (= (y stone2) 58)) (and (= (x stone2) 12) (= (y stone2) 62)))
	(or (and (= (x stone3) 5) (= (y stone3) 73)) (and (= (x stone3) 59) (= (y stone3) 46)) (and (= (x stone3) 40) (= (y stone3) 58)) (and (= (x stone3) 12) (= (y stone3) 62)))
	(or (and (= (x stone4) 5) (= (y stone4) 73)) (and (= (x stone4) 59) (= (y stone4) 46)) (and (= (x stone4) 40) (= (y stone4) 58)) (and (= (x stone4) 12) (= (y stone4) 62)))
  ))

  
  

  
)
