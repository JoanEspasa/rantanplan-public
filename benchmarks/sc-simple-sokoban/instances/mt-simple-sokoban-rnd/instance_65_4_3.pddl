(define (problem instance_65_4_3)
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
	(= (x player1) 53)
	(= (y player1) 14)
	(= (x stone1) 55)
	(= (y stone1) 49)
	(= (x stone2) 22)
	(= (y stone2) 7)
	(= (x stone3) 45)
	(= (y stone3) 26)
	(= (x stone4) 52)
	(= (y stone4) 11)
  )

  (:goal (and 
    (or (and (= (x stone1) 64) (= (y stone1) 19)) (and (= (x stone1) 26) (= (y stone1) 25)) (and (= (x stone1) 13) (= (y stone1) 21)) (and (= (x stone1) 42) (= (y stone1) 47)))
	(or (and (= (x stone2) 64) (= (y stone2) 19)) (and (= (x stone2) 26) (= (y stone2) 25)) (and (= (x stone2) 13) (= (y stone2) 21)) (and (= (x stone2) 42) (= (y stone2) 47)))
	(or (and (= (x stone3) 64) (= (y stone3) 19)) (and (= (x stone3) 26) (= (y stone3) 25)) (and (= (x stone3) 13) (= (y stone3) 21)) (and (= (x stone3) 42) (= (y stone3) 47)))
	(or (and (= (x stone4) 64) (= (y stone4) 19)) (and (= (x stone4) 26) (= (y stone4) 25)) (and (= (x stone4) 13) (= (y stone4) 21)) (and (= (x stone4) 42) (= (y stone4) 47)))
  ))

  
  

  
)
