(define (problem instance_90_4_1)
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
	(= (x player1) 61)
	(= (y player1) 50)
	(= (x stone1) 38)
	(= (y stone1) 55)
	(= (x stone2) 65)
	(= (y stone2) 84)
	(= (x stone3) 56)
	(= (y stone3) 42)
	(= (x stone4) 42)
	(= (y stone4) 47)
  )

  (:goal (and 
    (or (and (= (x stone1) 86) (= (y stone1) 80)) (and (= (x stone1) 14) (= (y stone1) 66)) (and (= (x stone1) 59) (= (y stone1) 64)) (and (= (x stone1) 46) (= (y stone1) 27)))
	(or (and (= (x stone2) 86) (= (y stone2) 80)) (and (= (x stone2) 14) (= (y stone2) 66)) (and (= (x stone2) 59) (= (y stone2) 64)) (and (= (x stone2) 46) (= (y stone2) 27)))
	(or (and (= (x stone3) 86) (= (y stone3) 80)) (and (= (x stone3) 14) (= (y stone3) 66)) (and (= (x stone3) 59) (= (y stone3) 64)) (and (= (x stone3) 46) (= (y stone3) 27)))
	(or (and (= (x stone4) 86) (= (y stone4) 80)) (and (= (x stone4) 14) (= (y stone4) 66)) (and (= (x stone4) 59) (= (y stone4) 64)) (and (= (x stone4) 46) (= (y stone4) 27)))
  ))

  
  

  
)
