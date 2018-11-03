(define (problem instance_60_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 60)
	(= (min_x) 1)
	(= (max_y) 60)
	(= (min_y) 1)
	(= (x player1) 40)
	(= (y player1) 21)
	(= (x stone1) 7)
	(= (y stone1) 12)
	(= (x stone2) 40)
	(= (y stone2) 19)
	(= (x stone3) 37)
	(= (y stone3) 17)
	(= (x stone4) 55)
	(= (y stone4) 31)
  )

  (:goal (and 
    (or (and (= (x stone1) 24) (= (y stone1) 27)) (and (= (x stone1) 34) (= (y stone1) 11)) (and (= (x stone1) 53) (= (y stone1) 24)) (and (= (x stone1) 33) (= (y stone1) 29)))
	(or (and (= (x stone2) 24) (= (y stone2) 27)) (and (= (x stone2) 34) (= (y stone2) 11)) (and (= (x stone2) 53) (= (y stone2) 24)) (and (= (x stone2) 33) (= (y stone2) 29)))
	(or (and (= (x stone3) 24) (= (y stone3) 27)) (and (= (x stone3) 34) (= (y stone3) 11)) (and (= (x stone3) 53) (= (y stone3) 24)) (and (= (x stone3) 33) (= (y stone3) 29)))
	(or (and (= (x stone4) 24) (= (y stone4) 27)) (and (= (x stone4) 34) (= (y stone4) 11)) (and (= (x stone4) 53) (= (y stone4) 24)) (and (= (x stone4) 33) (= (y stone4) 29)))
  ))

  
  

  
)
