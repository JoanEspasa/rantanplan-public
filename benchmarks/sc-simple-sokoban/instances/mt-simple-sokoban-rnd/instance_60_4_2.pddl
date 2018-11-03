(define (problem instance_60_4_2)
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
	(= (x player1) 11)
	(= (y player1) 26)
	(= (x stone1) 42)
	(= (y stone1) 18)
	(= (x stone2) 29)
	(= (y stone2) 28)
	(= (x stone3) 10)
	(= (y stone3) 13)
	(= (x stone4) 9)
	(= (y stone4) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 26) (= (y stone1) 17)) (and (= (x stone1) 58) (= (y stone1) 55)) (and (= (x stone1) 44) (= (y stone1) 37)) (and (= (x stone1) 51) (= (y stone1) 1)))
	(or (and (= (x stone2) 26) (= (y stone2) 17)) (and (= (x stone2) 58) (= (y stone2) 55)) (and (= (x stone2) 44) (= (y stone2) 37)) (and (= (x stone2) 51) (= (y stone2) 1)))
	(or (and (= (x stone3) 26) (= (y stone3) 17)) (and (= (x stone3) 58) (= (y stone3) 55)) (and (= (x stone3) 44) (= (y stone3) 37)) (and (= (x stone3) 51) (= (y stone3) 1)))
	(or (and (= (x stone4) 26) (= (y stone4) 17)) (and (= (x stone4) 58) (= (y stone4) 55)) (and (= (x stone4) 44) (= (y stone4) 37)) (and (= (x stone4) 51) (= (y stone4) 1)))
  ))

  
  

  
)
