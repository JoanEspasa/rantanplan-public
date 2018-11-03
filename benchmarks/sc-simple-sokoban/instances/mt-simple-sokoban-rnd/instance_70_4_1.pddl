(define (problem instance_70_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 70)
	(= (min_x) 1)
	(= (max_y) 70)
	(= (min_y) 1)
	(= (x player1) 13)
	(= (y player1) 53)
	(= (x stone1) 18)
	(= (y stone1) 46)
	(= (x stone2) 55)
	(= (y stone2) 28)
	(= (x stone3) 20)
	(= (y stone3) 13)
	(= (x stone4) 37)
	(= (y stone4) 21)
  )

  (:goal (and 
    (or (and (= (x stone1) 45) (= (y stone1) 13)) (and (= (x stone1) 17) (= (y stone1) 18)) (and (= (x stone1) 59) (= (y stone1) 4)) (and (= (x stone1) 65) (= (y stone1) 14)))
	(or (and (= (x stone2) 45) (= (y stone2) 13)) (and (= (x stone2) 17) (= (y stone2) 18)) (and (= (x stone2) 59) (= (y stone2) 4)) (and (= (x stone2) 65) (= (y stone2) 14)))
	(or (and (= (x stone3) 45) (= (y stone3) 13)) (and (= (x stone3) 17) (= (y stone3) 18)) (and (= (x stone3) 59) (= (y stone3) 4)) (and (= (x stone3) 65) (= (y stone3) 14)))
	(or (and (= (x stone4) 45) (= (y stone4) 13)) (and (= (x stone4) 17) (= (y stone4) 18)) (and (= (x stone4) 59) (= (y stone4) 4)) (and (= (x stone4) 65) (= (y stone4) 14)))
  ))

  
  

  
)
