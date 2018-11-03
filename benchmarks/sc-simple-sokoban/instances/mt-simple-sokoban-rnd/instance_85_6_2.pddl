(define (problem instance_85_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 85)
	(= (min_x) 1)
	(= (max_y) 85)
	(= (min_y) 1)
	(= (x player1) 44)
	(= (y player1) 79)
	(= (x stone1) 16)
	(= (y stone1) 17)
	(= (x stone2) 40)
	(= (y stone2) 76)
	(= (x stone3) 66)
	(= (y stone3) 79)
	(= (x stone4) 36)
	(= (y stone4) 76)
	(= (x stone5) 30)
	(= (y stone5) 38)
	(= (x stone6) 38)
	(= (y stone6) 26)
  )

  (:goal (and 
    (or (and (= (x stone1) 25) (= (y stone1) 68)) (and (= (x stone1) 76) (= (y stone1) 44)) (and (= (x stone1) 35) (= (y stone1) 63)) (and (= (x stone1) 44) (= (y stone1) 53)) (and (= (x stone1) 81) (= (y stone1) 56)) (and (= (x stone1) 57) (= (y stone1) 57)))
	(or (and (= (x stone2) 25) (= (y stone2) 68)) (and (= (x stone2) 76) (= (y stone2) 44)) (and (= (x stone2) 35) (= (y stone2) 63)) (and (= (x stone2) 44) (= (y stone2) 53)) (and (= (x stone2) 81) (= (y stone2) 56)) (and (= (x stone2) 57) (= (y stone2) 57)))
	(or (and (= (x stone3) 25) (= (y stone3) 68)) (and (= (x stone3) 76) (= (y stone3) 44)) (and (= (x stone3) 35) (= (y stone3) 63)) (and (= (x stone3) 44) (= (y stone3) 53)) (and (= (x stone3) 81) (= (y stone3) 56)) (and (= (x stone3) 57) (= (y stone3) 57)))
	(or (and (= (x stone4) 25) (= (y stone4) 68)) (and (= (x stone4) 76) (= (y stone4) 44)) (and (= (x stone4) 35) (= (y stone4) 63)) (and (= (x stone4) 44) (= (y stone4) 53)) (and (= (x stone4) 81) (= (y stone4) 56)) (and (= (x stone4) 57) (= (y stone4) 57)))
	(or (and (= (x stone5) 25) (= (y stone5) 68)) (and (= (x stone5) 76) (= (y stone5) 44)) (and (= (x stone5) 35) (= (y stone5) 63)) (and (= (x stone5) 44) (= (y stone5) 53)) (and (= (x stone5) 81) (= (y stone5) 56)) (and (= (x stone5) 57) (= (y stone5) 57)))
	(or (and (= (x stone6) 25) (= (y stone6) 68)) (and (= (x stone6) 76) (= (y stone6) 44)) (and (= (x stone6) 35) (= (y stone6) 63)) (and (= (x stone6) 44) (= (y stone6) 53)) (and (= (x stone6) 81) (= (y stone6) 56)) (and (= (x stone6) 57) (= (y stone6) 57)))
  ))

  
  

  
)
