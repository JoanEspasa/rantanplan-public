(define (problem instance_55_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 55)
	(= (min_x) 1)
	(= (max_y) 55)
	(= (min_y) 1)
	(= (x player1) 49)
	(= (y player1) 23)
	(= (x stone1) 17)
	(= (y stone1) 5)
	(= (x stone2) 49)
	(= (y stone2) 14)
	(= (x stone3) 25)
	(= (y stone3) 19)
	(= (x stone4) 29)
	(= (y stone4) 36)
  )

  (:goal (and 
    (or (and (= (x stone1) 9) (= (y stone1) 35)) (and (= (x stone1) 4) (= (y stone1) 55)) (and (= (x stone1) 49) (= (y stone1) 6)) (and (= (x stone1) 29) (= (y stone1) 7)))
	(or (and (= (x stone2) 9) (= (y stone2) 35)) (and (= (x stone2) 4) (= (y stone2) 55)) (and (= (x stone2) 49) (= (y stone2) 6)) (and (= (x stone2) 29) (= (y stone2) 7)))
	(or (and (= (x stone3) 9) (= (y stone3) 35)) (and (= (x stone3) 4) (= (y stone3) 55)) (and (= (x stone3) 49) (= (y stone3) 6)) (and (= (x stone3) 29) (= (y stone3) 7)))
	(or (and (= (x stone4) 9) (= (y stone4) 35)) (and (= (x stone4) 4) (= (y stone4) 55)) (and (= (x stone4) 49) (= (y stone4) 6)) (and (= (x stone4) 29) (= (y stone4) 7)))
  ))

  
  

  
)
