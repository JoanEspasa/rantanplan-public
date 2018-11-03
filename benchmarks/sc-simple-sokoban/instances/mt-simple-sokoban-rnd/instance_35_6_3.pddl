(define (problem instance_35_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 35)
	(= (min_x) 1)
	(= (max_y) 35)
	(= (min_y) 1)
	(= (x player1) 28)
	(= (y player1) 32)
	(= (x stone1) 17)
	(= (y stone1) 18)
	(= (x stone2) 4)
	(= (y stone2) 26)
	(= (x stone3) 12)
	(= (y stone3) 12)
	(= (x stone4) 19)
	(= (y stone4) 8)
	(= (x stone5) 33)
	(= (y stone5) 17)
	(= (x stone6) 30)
	(= (y stone6) 16)
  )

  (:goal (and 
    (or (and (= (x stone1) 26) (= (y stone1) 13)) (and (= (x stone1) 35) (= (y stone1) 18)) (and (= (x stone1) 13) (= (y stone1) 5)) (and (= (x stone1) 1) (= (y stone1) 33)) (and (= (x stone1) 29) (= (y stone1) 9)) (and (= (x stone1) 12) (= (y stone1) 30)))
	(or (and (= (x stone2) 26) (= (y stone2) 13)) (and (= (x stone2) 35) (= (y stone2) 18)) (and (= (x stone2) 13) (= (y stone2) 5)) (and (= (x stone2) 1) (= (y stone2) 33)) (and (= (x stone2) 29) (= (y stone2) 9)) (and (= (x stone2) 12) (= (y stone2) 30)))
	(or (and (= (x stone3) 26) (= (y stone3) 13)) (and (= (x stone3) 35) (= (y stone3) 18)) (and (= (x stone3) 13) (= (y stone3) 5)) (and (= (x stone3) 1) (= (y stone3) 33)) (and (= (x stone3) 29) (= (y stone3) 9)) (and (= (x stone3) 12) (= (y stone3) 30)))
	(or (and (= (x stone4) 26) (= (y stone4) 13)) (and (= (x stone4) 35) (= (y stone4) 18)) (and (= (x stone4) 13) (= (y stone4) 5)) (and (= (x stone4) 1) (= (y stone4) 33)) (and (= (x stone4) 29) (= (y stone4) 9)) (and (= (x stone4) 12) (= (y stone4) 30)))
	(or (and (= (x stone5) 26) (= (y stone5) 13)) (and (= (x stone5) 35) (= (y stone5) 18)) (and (= (x stone5) 13) (= (y stone5) 5)) (and (= (x stone5) 1) (= (y stone5) 33)) (and (= (x stone5) 29) (= (y stone5) 9)) (and (= (x stone5) 12) (= (y stone5) 30)))
	(or (and (= (x stone6) 26) (= (y stone6) 13)) (and (= (x stone6) 35) (= (y stone6) 18)) (and (= (x stone6) 13) (= (y stone6) 5)) (and (= (x stone6) 1) (= (y stone6) 33)) (and (= (x stone6) 29) (= (y stone6) 9)) (and (= (x stone6) 12) (= (y stone6) 30)))
  ))

  
  

  
)
