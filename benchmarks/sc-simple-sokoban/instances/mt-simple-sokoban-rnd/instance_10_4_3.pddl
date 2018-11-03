(define (problem instance_10_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 10)
	(= (min_x) 1)
	(= (max_y) 10)
	(= (min_y) 1)
	(= (x player1) 4)
	(= (y player1) 4)
	(= (x stone1) 2)
	(= (y stone1) 2)
	(= (x stone2) 5)
	(= (y stone2) 9)
	(= (x stone3) 6)
	(= (y stone3) 9)
	(= (x stone4) 8)
	(= (y stone4) 3)
  )

  (:goal (and 
    (or (and (= (x stone1) 4) (= (y stone1) 9)) (and (= (x stone1) 7) (= (y stone1) 1)) (and (= (x stone1) 8) (= (y stone1) 6)) (and (= (x stone1) 9) (= (y stone1) 5)))
	(or (and (= (x stone2) 4) (= (y stone2) 9)) (and (= (x stone2) 7) (= (y stone2) 1)) (and (= (x stone2) 8) (= (y stone2) 6)) (and (= (x stone2) 9) (= (y stone2) 5)))
	(or (and (= (x stone3) 4) (= (y stone3) 9)) (and (= (x stone3) 7) (= (y stone3) 1)) (and (= (x stone3) 8) (= (y stone3) 6)) (and (= (x stone3) 9) (= (y stone3) 5)))
	(or (and (= (x stone4) 4) (= (y stone4) 9)) (and (= (x stone4) 7) (= (y stone4) 1)) (and (= (x stone4) 8) (= (y stone4) 6)) (and (= (x stone4) 9) (= (y stone4) 5)))
  ))

  
  

  
)
