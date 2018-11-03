(define (problem instance_90_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 90)
	(= (min_x) 1)
	(= (max_y) 90)
	(= (min_y) 1)
	(= (x player1) 45)
	(= (y player1) 2)
	(= (x stone1) 56)
	(= (y stone1) 71)
	(= (x stone2) 33)
	(= (y stone2) 85)
	(= (x stone3) 71)
	(= (y stone3) 55)
	(= (x stone4) 89)
	(= (y stone4) 48)
  )

  (:goal (and 
    (or (and (= (x stone1) 60) (= (y stone1) 10)) (and (= (x stone1) 14) (= (y stone1) 69)) (and (= (x stone1) 33) (= (y stone1) 5)) (and (= (x stone1) 5) (= (y stone1) 55)))
	(or (and (= (x stone2) 60) (= (y stone2) 10)) (and (= (x stone2) 14) (= (y stone2) 69)) (and (= (x stone2) 33) (= (y stone2) 5)) (and (= (x stone2) 5) (= (y stone2) 55)))
	(or (and (= (x stone3) 60) (= (y stone3) 10)) (and (= (x stone3) 14) (= (y stone3) 69)) (and (= (x stone3) 33) (= (y stone3) 5)) (and (= (x stone3) 5) (= (y stone3) 55)))
	(or (and (= (x stone4) 60) (= (y stone4) 10)) (and (= (x stone4) 14) (= (y stone4) 69)) (and (= (x stone4) 33) (= (y stone4) 5)) (and (= (x stone4) 5) (= (y stone4) 55)))
  ))

  
  

  
)
