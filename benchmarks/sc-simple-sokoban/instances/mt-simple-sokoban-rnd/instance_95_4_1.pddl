(define (problem instance_95_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 95)
	(= (min_x) 1)
	(= (max_y) 95)
	(= (min_y) 1)
	(= (x player1) 3)
	(= (y player1) 79)
	(= (x stone1) 87)
	(= (y stone1) 78)
	(= (x stone2) 68)
	(= (y stone2) 83)
	(= (x stone3) 51)
	(= (y stone3) 36)
	(= (x stone4) 91)
	(= (y stone4) 82)
  )

  (:goal (and 
    (or (and (= (x stone1) 69) (= (y stone1) 58)) (and (= (x stone1) 10) (= (y stone1) 57)) (and (= (x stone1) 16) (= (y stone1) 78)) (and (= (x stone1) 43) (= (y stone1) 15)))
	(or (and (= (x stone2) 69) (= (y stone2) 58)) (and (= (x stone2) 10) (= (y stone2) 57)) (and (= (x stone2) 16) (= (y stone2) 78)) (and (= (x stone2) 43) (= (y stone2) 15)))
	(or (and (= (x stone3) 69) (= (y stone3) 58)) (and (= (x stone3) 10) (= (y stone3) 57)) (and (= (x stone3) 16) (= (y stone3) 78)) (and (= (x stone3) 43) (= (y stone3) 15)))
	(or (and (= (x stone4) 69) (= (y stone4) 58)) (and (= (x stone4) 10) (= (y stone4) 57)) (and (= (x stone4) 16) (= (y stone4) 78)) (and (= (x stone4) 43) (= (y stone4) 15)))
  ))

  
  

  
)
