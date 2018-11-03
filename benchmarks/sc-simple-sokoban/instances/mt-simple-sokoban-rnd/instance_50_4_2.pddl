(define (problem instance_50_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 50)
	(= (min_x) 1)
	(= (max_y) 50)
	(= (min_y) 1)
	(= (x player1) 20)
	(= (y player1) 28)
	(= (x stone1) 37)
	(= (y stone1) 13)
	(= (x stone2) 12)
	(= (y stone2) 34)
	(= (x stone3) 19)
	(= (y stone3) 16)
	(= (x stone4) 33)
	(= (y stone4) 19)
  )

  (:goal (and 
    (or (and (= (x stone1) 11) (= (y stone1) 27)) (and (= (x stone1) 49) (= (y stone1) 11)) (and (= (x stone1) 17) (= (y stone1) 39)) (and (= (x stone1) 22) (= (y stone1) 3)))
	(or (and (= (x stone2) 11) (= (y stone2) 27)) (and (= (x stone2) 49) (= (y stone2) 11)) (and (= (x stone2) 17) (= (y stone2) 39)) (and (= (x stone2) 22) (= (y stone2) 3)))
	(or (and (= (x stone3) 11) (= (y stone3) 27)) (and (= (x stone3) 49) (= (y stone3) 11)) (and (= (x stone3) 17) (= (y stone3) 39)) (and (= (x stone3) 22) (= (y stone3) 3)))
	(or (and (= (x stone4) 11) (= (y stone4) 27)) (and (= (x stone4) 49) (= (y stone4) 11)) (and (= (x stone4) 17) (= (y stone4) 39)) (and (= (x stone4) 22) (= (y stone4) 3)))
  ))

  
  

  
)
