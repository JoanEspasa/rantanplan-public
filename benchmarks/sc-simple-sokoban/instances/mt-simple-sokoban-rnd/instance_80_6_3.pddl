(define (problem instance_80_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 80)
	(= (min_x) 1)
	(= (max_y) 80)
	(= (min_y) 1)
	(= (x player1) 34)
	(= (y player1) 3)
	(= (x stone1) 68)
	(= (y stone1) 4)
	(= (x stone2) 26)
	(= (y stone2) 60)
	(= (x stone3) 8)
	(= (y stone3) 78)
	(= (x stone4) 13)
	(= (y stone4) 7)
	(= (x stone5) 26)
	(= (y stone5) 39)
	(= (x stone6) 79)
	(= (y stone6) 66)
  )

  (:goal (and 
    (or (and (= (x stone1) 78) (= (y stone1) 74)) (and (= (x stone1) 50) (= (y stone1) 27)) (and (= (x stone1) 22) (= (y stone1) 41)) (and (= (x stone1) 69) (= (y stone1) 70)) (and (= (x stone1) 28) (= (y stone1) 68)) (and (= (x stone1) 74) (= (y stone1) 18)))
	(or (and (= (x stone2) 78) (= (y stone2) 74)) (and (= (x stone2) 50) (= (y stone2) 27)) (and (= (x stone2) 22) (= (y stone2) 41)) (and (= (x stone2) 69) (= (y stone2) 70)) (and (= (x stone2) 28) (= (y stone2) 68)) (and (= (x stone2) 74) (= (y stone2) 18)))
	(or (and (= (x stone3) 78) (= (y stone3) 74)) (and (= (x stone3) 50) (= (y stone3) 27)) (and (= (x stone3) 22) (= (y stone3) 41)) (and (= (x stone3) 69) (= (y stone3) 70)) (and (= (x stone3) 28) (= (y stone3) 68)) (and (= (x stone3) 74) (= (y stone3) 18)))
	(or (and (= (x stone4) 78) (= (y stone4) 74)) (and (= (x stone4) 50) (= (y stone4) 27)) (and (= (x stone4) 22) (= (y stone4) 41)) (and (= (x stone4) 69) (= (y stone4) 70)) (and (= (x stone4) 28) (= (y stone4) 68)) (and (= (x stone4) 74) (= (y stone4) 18)))
	(or (and (= (x stone5) 78) (= (y stone5) 74)) (and (= (x stone5) 50) (= (y stone5) 27)) (and (= (x stone5) 22) (= (y stone5) 41)) (and (= (x stone5) 69) (= (y stone5) 70)) (and (= (x stone5) 28) (= (y stone5) 68)) (and (= (x stone5) 74) (= (y stone5) 18)))
	(or (and (= (x stone6) 78) (= (y stone6) 74)) (and (= (x stone6) 50) (= (y stone6) 27)) (and (= (x stone6) 22) (= (y stone6) 41)) (and (= (x stone6) 69) (= (y stone6) 70)) (and (= (x stone6) 28) (= (y stone6) 68)) (and (= (x stone6) 74) (= (y stone6) 18)))
  ))

  
  

  
)
