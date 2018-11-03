(define (problem instance_75_4_1)
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
	(= (x player1) 67)
	(= (y player1) 38)
	(= (x stone1) 11)
	(= (y stone1) 62)
	(= (x stone2) 58)
	(= (y stone2) 3)
	(= (x stone3) 26)
	(= (y stone3) 20)
	(= (x stone4) 69)
	(= (y stone4) 57)
  )

  (:goal (and 
    (or (and (= (x stone1) 71) (= (y stone1) 62)) (and (= (x stone1) 7) (= (y stone1) 33)) (and (= (x stone1) 23) (= (y stone1) 33)) (and (= (x stone1) 2) (= (y stone1) 60)))
	(or (and (= (x stone2) 71) (= (y stone2) 62)) (and (= (x stone2) 7) (= (y stone2) 33)) (and (= (x stone2) 23) (= (y stone2) 33)) (and (= (x stone2) 2) (= (y stone2) 60)))
	(or (and (= (x stone3) 71) (= (y stone3) 62)) (and (= (x stone3) 7) (= (y stone3) 33)) (and (= (x stone3) 23) (= (y stone3) 33)) (and (= (x stone3) 2) (= (y stone3) 60)))
	(or (and (= (x stone4) 71) (= (y stone4) 62)) (and (= (x stone4) 7) (= (y stone4) 33)) (and (= (x stone4) 23) (= (y stone4) 33)) (and (= (x stone4) 2) (= (y stone4) 60)))
  ))

  
  

  
)
