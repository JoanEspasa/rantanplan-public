(define (problem instance_85_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 85)
	(= (min_x) 1)
	(= (max_y) 85)
	(= (min_y) 1)
	(= (x player1) 3)
	(= (y player1) 26)
	(= (x stone1) 69)
	(= (y stone1) 21)
	(= (x stone2) 26)
	(= (y stone2) 10)
	(= (x stone3) 33)
	(= (y stone3) 9)
	(= (x stone4) 30)
	(= (y stone4) 54)
  )

  (:goal (and 
    (or (and (= (x stone1) 70) (= (y stone1) 63)) (and (= (x stone1) 65) (= (y stone1) 3)) (and (= (x stone1) 56) (= (y stone1) 41)) (and (= (x stone1) 46) (= (y stone1) 23)))
	(or (and (= (x stone2) 70) (= (y stone2) 63)) (and (= (x stone2) 65) (= (y stone2) 3)) (and (= (x stone2) 56) (= (y stone2) 41)) (and (= (x stone2) 46) (= (y stone2) 23)))
	(or (and (= (x stone3) 70) (= (y stone3) 63)) (and (= (x stone3) 65) (= (y stone3) 3)) (and (= (x stone3) 56) (= (y stone3) 41)) (and (= (x stone3) 46) (= (y stone3) 23)))
	(or (and (= (x stone4) 70) (= (y stone4) 63)) (and (= (x stone4) 65) (= (y stone4) 3)) (and (= (x stone4) 56) (= (y stone4) 41)) (and (= (x stone4) 46) (= (y stone4) 23)))
  ))

  
  

  
)
