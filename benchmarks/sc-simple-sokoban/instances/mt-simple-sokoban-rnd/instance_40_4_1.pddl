(define (problem instance_40_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 40)
	(= (min_x) 1)
	(= (max_y) 40)
	(= (min_y) 1)
	(= (x player1) 6)
	(= (y player1) 24)
	(= (x stone1) 28)
	(= (y stone1) 19)
	(= (x stone2) 8)
	(= (y stone2) 20)
	(= (x stone3) 37)
	(= (y stone3) 5)
	(= (x stone4) 13)
	(= (y stone4) 14)
  )

  (:goal (and 
    (or (and (= (x stone1) 27) (= (y stone1) 2)) (and (= (x stone1) 2) (= (y stone1) 6)) (and (= (x stone1) 24) (= (y stone1) 13)) (and (= (x stone1) 15) (= (y stone1) 9)))
	(or (and (= (x stone2) 27) (= (y stone2) 2)) (and (= (x stone2) 2) (= (y stone2) 6)) (and (= (x stone2) 24) (= (y stone2) 13)) (and (= (x stone2) 15) (= (y stone2) 9)))
	(or (and (= (x stone3) 27) (= (y stone3) 2)) (and (= (x stone3) 2) (= (y stone3) 6)) (and (= (x stone3) 24) (= (y stone3) 13)) (and (= (x stone3) 15) (= (y stone3) 9)))
	(or (and (= (x stone4) 27) (= (y stone4) 2)) (and (= (x stone4) 2) (= (y stone4) 6)) (and (= (x stone4) 24) (= (y stone4) 13)) (and (= (x stone4) 15) (= (y stone4) 9)))
  ))

  
  

  
)
