(define (problem instance_90_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 90)
	(= (min_x) 1)
	(= (max_y) 90)
	(= (min_y) 1)
	(= (x player1) 64)
	(= (y player1) 90)
	(= (x stone1) 74)
	(= (y stone1) 42)
	(= (x stone2) 44)
	(= (y stone2) 26)
	(= (x stone3) 53)
	(= (y stone3) 79)
	(= (x stone4) 85)
	(= (y stone4) 56)
	(= (x stone5) 43)
	(= (y stone5) 67)
	(= (x stone6) 14)
	(= (y stone6) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 66) (= (y stone1) 60)) (and (= (x stone1) 50) (= (y stone1) 5)) (and (= (x stone1) 47) (= (y stone1) 60)) (and (= (x stone1) 78) (= (y stone1) 52)) (and (= (x stone1) 78) (= (y stone1) 50)) (and (= (x stone1) 81) (= (y stone1) 29)))
	(or (and (= (x stone2) 66) (= (y stone2) 60)) (and (= (x stone2) 50) (= (y stone2) 5)) (and (= (x stone2) 47) (= (y stone2) 60)) (and (= (x stone2) 78) (= (y stone2) 52)) (and (= (x stone2) 78) (= (y stone2) 50)) (and (= (x stone2) 81) (= (y stone2) 29)))
	(or (and (= (x stone3) 66) (= (y stone3) 60)) (and (= (x stone3) 50) (= (y stone3) 5)) (and (= (x stone3) 47) (= (y stone3) 60)) (and (= (x stone3) 78) (= (y stone3) 52)) (and (= (x stone3) 78) (= (y stone3) 50)) (and (= (x stone3) 81) (= (y stone3) 29)))
	(or (and (= (x stone4) 66) (= (y stone4) 60)) (and (= (x stone4) 50) (= (y stone4) 5)) (and (= (x stone4) 47) (= (y stone4) 60)) (and (= (x stone4) 78) (= (y stone4) 52)) (and (= (x stone4) 78) (= (y stone4) 50)) (and (= (x stone4) 81) (= (y stone4) 29)))
	(or (and (= (x stone5) 66) (= (y stone5) 60)) (and (= (x stone5) 50) (= (y stone5) 5)) (and (= (x stone5) 47) (= (y stone5) 60)) (and (= (x stone5) 78) (= (y stone5) 52)) (and (= (x stone5) 78) (= (y stone5) 50)) (and (= (x stone5) 81) (= (y stone5) 29)))
	(or (and (= (x stone6) 66) (= (y stone6) 60)) (and (= (x stone6) 50) (= (y stone6) 5)) (and (= (x stone6) 47) (= (y stone6) 60)) (and (= (x stone6) 78) (= (y stone6) 52)) (and (= (x stone6) 78) (= (y stone6) 50)) (and (= (x stone6) 81) (= (y stone6) 29)))
  ))

  
  

  
)
