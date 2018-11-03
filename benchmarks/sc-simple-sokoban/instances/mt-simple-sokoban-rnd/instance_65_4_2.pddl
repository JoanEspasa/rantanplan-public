(define (problem instance_65_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 65)
	(= (min_x) 1)
	(= (max_y) 65)
	(= (min_y) 1)
	(= (x player1) 61)
	(= (y player1) 3)
	(= (x stone1) 27)
	(= (y stone1) 15)
	(= (x stone2) 23)
	(= (y stone2) 3)
	(= (x stone3) 28)
	(= (y stone3) 42)
	(= (x stone4) 7)
	(= (y stone4) 55)
  )

  (:goal (and 
    (or (and (= (x stone1) 49) (= (y stone1) 1)) (and (= (x stone1) 62) (= (y stone1) 55)) (and (= (x stone1) 3) (= (y stone1) 63)) (and (= (x stone1) 28) (= (y stone1) 31)))
	(or (and (= (x stone2) 49) (= (y stone2) 1)) (and (= (x stone2) 62) (= (y stone2) 55)) (and (= (x stone2) 3) (= (y stone2) 63)) (and (= (x stone2) 28) (= (y stone2) 31)))
	(or (and (= (x stone3) 49) (= (y stone3) 1)) (and (= (x stone3) 62) (= (y stone3) 55)) (and (= (x stone3) 3) (= (y stone3) 63)) (and (= (x stone3) 28) (= (y stone3) 31)))
	(or (and (= (x stone4) 49) (= (y stone4) 1)) (and (= (x stone4) 62) (= (y stone4) 55)) (and (= (x stone4) 3) (= (y stone4) 63)) (and (= (x stone4) 28) (= (y stone4) 31)))
  ))

  
  

  
)
