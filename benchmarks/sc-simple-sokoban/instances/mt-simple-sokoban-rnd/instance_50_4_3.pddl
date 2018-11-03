(define (problem instance_50_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 50)
	(= (min_x) 1)
	(= (max_y) 50)
	(= (min_y) 1)
	(= (x player1) 6)
	(= (y player1) 4)
	(= (x stone1) 30)
	(= (y stone1) 31)
	(= (x stone2) 18)
	(= (y stone2) 32)
	(= (x stone3) 40)
	(= (y stone3) 45)
	(= (x stone4) 29)
	(= (y stone4) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 12) (= (y stone1) 14)) (and (= (x stone1) 23) (= (y stone1) 9)) (and (= (x stone1) 22) (= (y stone1) 38)) (and (= (x stone1) 45) (= (y stone1) 22)))
	(or (and (= (x stone2) 12) (= (y stone2) 14)) (and (= (x stone2) 23) (= (y stone2) 9)) (and (= (x stone2) 22) (= (y stone2) 38)) (and (= (x stone2) 45) (= (y stone2) 22)))
	(or (and (= (x stone3) 12) (= (y stone3) 14)) (and (= (x stone3) 23) (= (y stone3) 9)) (and (= (x stone3) 22) (= (y stone3) 38)) (and (= (x stone3) 45) (= (y stone3) 22)))
	(or (and (= (x stone4) 12) (= (y stone4) 14)) (and (= (x stone4) 23) (= (y stone4) 9)) (and (= (x stone4) 22) (= (y stone4) 38)) (and (= (x stone4) 45) (= (y stone4) 22)))
  ))

  
  

  
)
