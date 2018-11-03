(define (problem instance_95_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 95)
	(= (min_x) 1)
	(= (max_y) 95)
	(= (min_y) 1)
	(= (x player1) 87)
	(= (y player1) 17)
	(= (x stone1) 72)
	(= (y stone1) 93)
	(= (x stone2) 49)
	(= (y stone2) 28)
	(= (x stone3) 6)
	(= (y stone3) 61)
	(= (x stone4) 63)
	(= (y stone4) 26)
  )

  (:goal (and 
    (or (and (= (x stone1) 88) (= (y stone1) 64)) (and (= (x stone1) 45) (= (y stone1) 33)) (and (= (x stone1) 20) (= (y stone1) 13)) (and (= (x stone1) 73) (= (y stone1) 43)))
	(or (and (= (x stone2) 88) (= (y stone2) 64)) (and (= (x stone2) 45) (= (y stone2) 33)) (and (= (x stone2) 20) (= (y stone2) 13)) (and (= (x stone2) 73) (= (y stone2) 43)))
	(or (and (= (x stone3) 88) (= (y stone3) 64)) (and (= (x stone3) 45) (= (y stone3) 33)) (and (= (x stone3) 20) (= (y stone3) 13)) (and (= (x stone3) 73) (= (y stone3) 43)))
	(or (and (= (x stone4) 88) (= (y stone4) 64)) (and (= (x stone4) 45) (= (y stone4) 33)) (and (= (x stone4) 20) (= (y stone4) 13)) (and (= (x stone4) 73) (= (y stone4) 43)))
  ))

  
  

  
)
