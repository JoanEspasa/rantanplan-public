(define (problem instance_20_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 20)
	(= (min_x) 1)
	(= (max_y) 20)
	(= (min_y) 1)
	(= (x player1) 16)
	(= (y player1) 14)
	(= (x stone1) 15)
	(= (y stone1) 17)
	(= (x stone2) 18)
	(= (y stone2) 7)
	(= (x stone3) 18)
	(= (y stone3) 5)
	(= (x stone4) 5)
	(= (y stone4) 14)
  )

  (:goal (and 
    (or (and (= (x stone1) 18) (= (y stone1) 19)) (and (= (x stone1) 11) (= (y stone1) 12)) (and (= (x stone1) 1) (= (y stone1) 10)) (and (= (x stone1) 9) (= (y stone1) 9)))
	(or (and (= (x stone2) 18) (= (y stone2) 19)) (and (= (x stone2) 11) (= (y stone2) 12)) (and (= (x stone2) 1) (= (y stone2) 10)) (and (= (x stone2) 9) (= (y stone2) 9)))
	(or (and (= (x stone3) 18) (= (y stone3) 19)) (and (= (x stone3) 11) (= (y stone3) 12)) (and (= (x stone3) 1) (= (y stone3) 10)) (and (= (x stone3) 9) (= (y stone3) 9)))
	(or (and (= (x stone4) 18) (= (y stone4) 19)) (and (= (x stone4) 11) (= (y stone4) 12)) (and (= (x stone4) 1) (= (y stone4) 10)) (and (= (x stone4) 9) (= (y stone4) 9)))
  ))

  
  

  
)
