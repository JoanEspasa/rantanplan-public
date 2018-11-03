(define (problem instance_7)
  (:domain mt-simple-sokoban)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 7)
	(= (min_x) 1)
	(= (max_y) 7)
	(= (min_y) 1)
	(= (x player1) 2)
	(= (y player1) 3)
	(= (x stone1) 2)
	(= (y stone1) 2)
	(= (x stone2) 2)
	(= (y stone2) 4)
	(= (x stone3) 2)
	(= (y stone3) 5)
	(= (x stone4) 2)
	(= (y stone4) 6)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 3)) (and (= (x stone1) 7) (= (y stone1) 4)) (and (= (x stone1) 7) (= (y stone1) 5)) (and (= (x stone1) 7) (= (y stone1) 6)))
	(or (and (= (x stone2) 1) (= (y stone2) 3)) (and (= (x stone2) 7) (= (y stone2) 4)) (and (= (x stone2) 7) (= (y stone2) 5)) (and (= (x stone2) 7) (= (y stone2) 6)))
	(or (and (= (x stone3) 1) (= (y stone3) 3)) (and (= (x stone3) 7) (= (y stone3) 4)) (and (= (x stone3) 7) (= (y stone3) 5)) (and (= (x stone3) 7) (= (y stone3) 6)))
	(or (and (= (x stone4) 1) (= (y stone4) 3)) (and (= (x stone4) 7) (= (y stone4) 4)) (and (= (x stone4) 7) (= (y stone4) 5)) (and (= (x stone4) 7) (= (y stone4) 6)))
  ))

  
  

  
)
