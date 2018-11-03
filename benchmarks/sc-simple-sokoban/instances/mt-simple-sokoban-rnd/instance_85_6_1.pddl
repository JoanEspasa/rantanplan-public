(define (problem instance_85_6_1)
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
	(= (x player1) 15)
	(= (y player1) 51)
	(= (x stone1) 84)
	(= (y stone1) 28)
	(= (x stone2) 81)
	(= (y stone2) 52)
	(= (x stone3) 13)
	(= (y stone3) 49)
	(= (x stone4) 24)
	(= (y stone4) 48)
	(= (x stone5) 8)
	(= (y stone5) 11)
	(= (x stone6) 49)
	(= (y stone6) 7)
  )

  (:goal (and 
    (or (and (= (x stone1) 64) (= (y stone1) 81)) (and (= (x stone1) 21) (= (y stone1) 1)) (and (= (x stone1) 3) (= (y stone1) 84)) (and (= (x stone1) 55) (= (y stone1) 60)) (and (= (x stone1) 73) (= (y stone1) 34)) (and (= (x stone1) 50) (= (y stone1) 72)))
	(or (and (= (x stone2) 64) (= (y stone2) 81)) (and (= (x stone2) 21) (= (y stone2) 1)) (and (= (x stone2) 3) (= (y stone2) 84)) (and (= (x stone2) 55) (= (y stone2) 60)) (and (= (x stone2) 73) (= (y stone2) 34)) (and (= (x stone2) 50) (= (y stone2) 72)))
	(or (and (= (x stone3) 64) (= (y stone3) 81)) (and (= (x stone3) 21) (= (y stone3) 1)) (and (= (x stone3) 3) (= (y stone3) 84)) (and (= (x stone3) 55) (= (y stone3) 60)) (and (= (x stone3) 73) (= (y stone3) 34)) (and (= (x stone3) 50) (= (y stone3) 72)))
	(or (and (= (x stone4) 64) (= (y stone4) 81)) (and (= (x stone4) 21) (= (y stone4) 1)) (and (= (x stone4) 3) (= (y stone4) 84)) (and (= (x stone4) 55) (= (y stone4) 60)) (and (= (x stone4) 73) (= (y stone4) 34)) (and (= (x stone4) 50) (= (y stone4) 72)))
	(or (and (= (x stone5) 64) (= (y stone5) 81)) (and (= (x stone5) 21) (= (y stone5) 1)) (and (= (x stone5) 3) (= (y stone5) 84)) (and (= (x stone5) 55) (= (y stone5) 60)) (and (= (x stone5) 73) (= (y stone5) 34)) (and (= (x stone5) 50) (= (y stone5) 72)))
	(or (and (= (x stone6) 64) (= (y stone6) 81)) (and (= (x stone6) 21) (= (y stone6) 1)) (and (= (x stone6) 3) (= (y stone6) 84)) (and (= (x stone6) 55) (= (y stone6) 60)) (and (= (x stone6) 73) (= (y stone6) 34)) (and (= (x stone6) 50) (= (y stone6) 72)))
  ))

  
  

  
)
