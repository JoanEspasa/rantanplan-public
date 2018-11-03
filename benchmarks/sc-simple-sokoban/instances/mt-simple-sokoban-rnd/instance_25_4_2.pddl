(define (problem instance_25_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 25)
	(= (min_x) 1)
	(= (max_y) 25)
	(= (min_y) 1)
	(= (x player1) 2)
	(= (y player1) 19)
	(= (x stone1) 9)
	(= (y stone1) 5)
	(= (x stone2) 21)
	(= (y stone2) 16)
	(= (x stone3) 20)
	(= (y stone3) 22)
	(= (x stone4) 24)
	(= (y stone4) 11)
  )

  (:goal (and 
    (or (and (= (x stone1) 22) (= (y stone1) 14)) (and (= (x stone1) 5) (= (y stone1) 24)) (and (= (x stone1) 2) (= (y stone1) 11)) (and (= (x stone1) 18) (= (y stone1) 3)))
	(or (and (= (x stone2) 22) (= (y stone2) 14)) (and (= (x stone2) 5) (= (y stone2) 24)) (and (= (x stone2) 2) (= (y stone2) 11)) (and (= (x stone2) 18) (= (y stone2) 3)))
	(or (and (= (x stone3) 22) (= (y stone3) 14)) (and (= (x stone3) 5) (= (y stone3) 24)) (and (= (x stone3) 2) (= (y stone3) 11)) (and (= (x stone3) 18) (= (y stone3) 3)))
	(or (and (= (x stone4) 22) (= (y stone4) 14)) (and (= (x stone4) 5) (= (y stone4) 24)) (and (= (x stone4) 2) (= (y stone4) 11)) (and (= (x stone4) 18) (= (y stone4) 3)))
  ))

  
  

  
)
