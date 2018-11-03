(define (problem instance_100_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 100)
	(= (min_x) 1)
	(= (max_y) 100)
	(= (min_y) 1)
	(= (x player1) 63)
	(= (y player1) 34)
	(= (x stone1) 99)
	(= (y stone1) 75)
	(= (x stone2) 11)
	(= (y stone2) 9)
	(= (x stone3) 94)
	(= (y stone3) 79)
	(= (x stone4) 38)
	(= (y stone4) 8)
	(= (x stone5) 15)
	(= (y stone5) 90)
	(= (x stone6) 69)
	(= (y stone6) 93)
  )

  (:goal (and 
    (or (and (= (x stone1) 98) (= (y stone1) 77)) (and (= (x stone1) 38) (= (y stone1) 28)) (and (= (x stone1) 45) (= (y stone1) 31)) (and (= (x stone1) 30) (= (y stone1) 82)) (and (= (x stone1) 46) (= (y stone1) 3)) (and (= (x stone1) 46) (= (y stone1) 21)))
	(or (and (= (x stone2) 98) (= (y stone2) 77)) (and (= (x stone2) 38) (= (y stone2) 28)) (and (= (x stone2) 45) (= (y stone2) 31)) (and (= (x stone2) 30) (= (y stone2) 82)) (and (= (x stone2) 46) (= (y stone2) 3)) (and (= (x stone2) 46) (= (y stone2) 21)))
	(or (and (= (x stone3) 98) (= (y stone3) 77)) (and (= (x stone3) 38) (= (y stone3) 28)) (and (= (x stone3) 45) (= (y stone3) 31)) (and (= (x stone3) 30) (= (y stone3) 82)) (and (= (x stone3) 46) (= (y stone3) 3)) (and (= (x stone3) 46) (= (y stone3) 21)))
	(or (and (= (x stone4) 98) (= (y stone4) 77)) (and (= (x stone4) 38) (= (y stone4) 28)) (and (= (x stone4) 45) (= (y stone4) 31)) (and (= (x stone4) 30) (= (y stone4) 82)) (and (= (x stone4) 46) (= (y stone4) 3)) (and (= (x stone4) 46) (= (y stone4) 21)))
	(or (and (= (x stone5) 98) (= (y stone5) 77)) (and (= (x stone5) 38) (= (y stone5) 28)) (and (= (x stone5) 45) (= (y stone5) 31)) (and (= (x stone5) 30) (= (y stone5) 82)) (and (= (x stone5) 46) (= (y stone5) 3)) (and (= (x stone5) 46) (= (y stone5) 21)))
	(or (and (= (x stone6) 98) (= (y stone6) 77)) (and (= (x stone6) 38) (= (y stone6) 28)) (and (= (x stone6) 45) (= (y stone6) 31)) (and (= (x stone6) 30) (= (y stone6) 82)) (and (= (x stone6) 46) (= (y stone6) 3)) (and (= (x stone6) 46) (= (y stone6) 21)))
  ))

  
  

  
)
