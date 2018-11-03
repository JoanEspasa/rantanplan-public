(define (problem instance_25_4_1)
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
	(= (x player1) 11)
	(= (y player1) 21)
	(= (x stone1) 9)
	(= (y stone1) 3)
	(= (x stone2) 17)
	(= (y stone2) 15)
	(= (x stone3) 22)
	(= (y stone3) 5)
	(= (x stone4) 15)
	(= (y stone4) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 15)) (and (= (x stone1) 18) (= (y stone1) 11)) (and (= (x stone1) 3) (= (y stone1) 11)) (and (= (x stone1) 11) (= (y stone1) 11)))
	(or (and (= (x stone2) 1) (= (y stone2) 15)) (and (= (x stone2) 18) (= (y stone2) 11)) (and (= (x stone2) 3) (= (y stone2) 11)) (and (= (x stone2) 11) (= (y stone2) 11)))
	(or (and (= (x stone3) 1) (= (y stone3) 15)) (and (= (x stone3) 18) (= (y stone3) 11)) (and (= (x stone3) 3) (= (y stone3) 11)) (and (= (x stone3) 11) (= (y stone3) 11)))
	(or (and (= (x stone4) 1) (= (y stone4) 15)) (and (= (x stone4) 18) (= (y stone4) 11)) (and (= (x stone4) 3) (= (y stone4) 11)) (and (= (x stone4) 11) (= (y stone4) 11)))
  ))

  
  

  
)
