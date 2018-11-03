(define (problem instance_60_4_1)
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
	(= (x player1) 42)
	(= (y player1) 35)
	(= (x stone1) 48)
	(= (y stone1) 12)
	(= (x stone2) 11)
	(= (y stone2) 43)
	(= (x stone3) 42)
	(= (y stone3) 43)
	(= (x stone4) 7)
	(= (y stone4) 13)
  )

  (:goal (and 
    (or (and (= (x stone1) 13) (= (y stone1) 59)) (and (= (x stone1) 23) (= (y stone1) 26)) (and (= (x stone1) 46) (= (y stone1) 19)) (and (= (x stone1) 34) (= (y stone1) 53)))
	(or (and (= (x stone2) 13) (= (y stone2) 59)) (and (= (x stone2) 23) (= (y stone2) 26)) (and (= (x stone2) 46) (= (y stone2) 19)) (and (= (x stone2) 34) (= (y stone2) 53)))
	(or (and (= (x stone3) 13) (= (y stone3) 59)) (and (= (x stone3) 23) (= (y stone3) 26)) (and (= (x stone3) 46) (= (y stone3) 19)) (and (= (x stone3) 34) (= (y stone3) 53)))
	(or (and (= (x stone4) 13) (= (y stone4) 59)) (and (= (x stone4) 23) (= (y stone4) 26)) (and (= (x stone4) 46) (= (y stone4) 19)) (and (= (x stone4) 34) (= (y stone4) 53)))
  ))

  
  

  
)
