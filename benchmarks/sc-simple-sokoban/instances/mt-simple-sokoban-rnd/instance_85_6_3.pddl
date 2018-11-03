(define (problem instance_85_6_3)
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
	(= (x player1) 11)
	(= (y player1) 72)
	(= (x stone1) 71)
	(= (y stone1) 65)
	(= (x stone2) 19)
	(= (y stone2) 32)
	(= (x stone3) 48)
	(= (y stone3) 49)
	(= (x stone4) 40)
	(= (y stone4) 82)
	(= (x stone5) 43)
	(= (y stone5) 70)
	(= (x stone6) 71)
	(= (y stone6) 34)
  )

  (:goal (and 
    (or (and (= (x stone1) 52) (= (y stone1) 35)) (and (= (x stone1) 67) (= (y stone1) 33)) (and (= (x stone1) 44) (= (y stone1) 84)) (and (= (x stone1) 49) (= (y stone1) 17)) (and (= (x stone1) 36) (= (y stone1) 56)) (and (= (x stone1) 13) (= (y stone1) 52)))
	(or (and (= (x stone2) 52) (= (y stone2) 35)) (and (= (x stone2) 67) (= (y stone2) 33)) (and (= (x stone2) 44) (= (y stone2) 84)) (and (= (x stone2) 49) (= (y stone2) 17)) (and (= (x stone2) 36) (= (y stone2) 56)) (and (= (x stone2) 13) (= (y stone2) 52)))
	(or (and (= (x stone3) 52) (= (y stone3) 35)) (and (= (x stone3) 67) (= (y stone3) 33)) (and (= (x stone3) 44) (= (y stone3) 84)) (and (= (x stone3) 49) (= (y stone3) 17)) (and (= (x stone3) 36) (= (y stone3) 56)) (and (= (x stone3) 13) (= (y stone3) 52)))
	(or (and (= (x stone4) 52) (= (y stone4) 35)) (and (= (x stone4) 67) (= (y stone4) 33)) (and (= (x stone4) 44) (= (y stone4) 84)) (and (= (x stone4) 49) (= (y stone4) 17)) (and (= (x stone4) 36) (= (y stone4) 56)) (and (= (x stone4) 13) (= (y stone4) 52)))
	(or (and (= (x stone5) 52) (= (y stone5) 35)) (and (= (x stone5) 67) (= (y stone5) 33)) (and (= (x stone5) 44) (= (y stone5) 84)) (and (= (x stone5) 49) (= (y stone5) 17)) (and (= (x stone5) 36) (= (y stone5) 56)) (and (= (x stone5) 13) (= (y stone5) 52)))
	(or (and (= (x stone6) 52) (= (y stone6) 35)) (and (= (x stone6) 67) (= (y stone6) 33)) (and (= (x stone6) 44) (= (y stone6) 84)) (and (= (x stone6) 49) (= (y stone6) 17)) (and (= (x stone6) 36) (= (y stone6) 56)) (and (= (x stone6) 13) (= (y stone6) 52)))
  ))

  
  

  
)
