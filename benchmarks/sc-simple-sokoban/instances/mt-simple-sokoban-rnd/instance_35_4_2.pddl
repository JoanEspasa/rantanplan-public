(define (problem instance_35_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 35)
	(= (min_x) 1)
	(= (max_y) 35)
	(= (min_y) 1)
	(= (x player1) 18)
	(= (y player1) 13)
	(= (x stone1) 18)
	(= (y stone1) 15)
	(= (x stone2) 17)
	(= (y stone2) 10)
	(= (x stone3) 29)
	(= (y stone3) 27)
	(= (x stone4) 27)
	(= (y stone4) 17)
  )

  (:goal (and 
    (or (and (= (x stone1) 11) (= (y stone1) 26)) (and (= (x stone1) 31) (= (y stone1) 13)) (and (= (x stone1) 26) (= (y stone1) 35)) (and (= (x stone1) 20) (= (y stone1) 22)))
	(or (and (= (x stone2) 11) (= (y stone2) 26)) (and (= (x stone2) 31) (= (y stone2) 13)) (and (= (x stone2) 26) (= (y stone2) 35)) (and (= (x stone2) 20) (= (y stone2) 22)))
	(or (and (= (x stone3) 11) (= (y stone3) 26)) (and (= (x stone3) 31) (= (y stone3) 13)) (and (= (x stone3) 26) (= (y stone3) 35)) (and (= (x stone3) 20) (= (y stone3) 22)))
	(or (and (= (x stone4) 11) (= (y stone4) 26)) (and (= (x stone4) 31) (= (y stone4) 13)) (and (= (x stone4) 26) (= (y stone4) 35)) (and (= (x stone4) 20) (= (y stone4) 22)))
  ))

  
  

  
)
