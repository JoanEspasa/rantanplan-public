(define (problem instance_20_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 20)
	(= (min_x) 1)
	(= (max_y) 20)
	(= (min_y) 1)
	(= (x player1) 9)
	(= (y player1) 19)
	(= (x stone1) 5)
	(= (y stone1) 5)
	(= (x stone2) 6)
	(= (y stone2) 9)
	(= (x stone3) 12)
	(= (y stone3) 15)
	(= (x stone4) 12)
	(= (y stone4) 12)
	(= (x stone5) 14)
	(= (y stone5) 8)
	(= (x stone6) 6)
	(= (y stone6) 6)
  )

  (:goal (and 
    (or (and (= (x stone1) 19) (= (y stone1) 13)) (and (= (x stone1) 9) (= (y stone1) 17)) (and (= (x stone1) 16) (= (y stone1) 16)) (and (= (x stone1) 16) (= (y stone1) 17)) (and (= (x stone1) 16) (= (y stone1) 10)) (and (= (x stone1) 7) (= (y stone1) 14)))
	(or (and (= (x stone2) 19) (= (y stone2) 13)) (and (= (x stone2) 9) (= (y stone2) 17)) (and (= (x stone2) 16) (= (y stone2) 16)) (and (= (x stone2) 16) (= (y stone2) 17)) (and (= (x stone2) 16) (= (y stone2) 10)) (and (= (x stone2) 7) (= (y stone2) 14)))
	(or (and (= (x stone3) 19) (= (y stone3) 13)) (and (= (x stone3) 9) (= (y stone3) 17)) (and (= (x stone3) 16) (= (y stone3) 16)) (and (= (x stone3) 16) (= (y stone3) 17)) (and (= (x stone3) 16) (= (y stone3) 10)) (and (= (x stone3) 7) (= (y stone3) 14)))
	(or (and (= (x stone4) 19) (= (y stone4) 13)) (and (= (x stone4) 9) (= (y stone4) 17)) (and (= (x stone4) 16) (= (y stone4) 16)) (and (= (x stone4) 16) (= (y stone4) 17)) (and (= (x stone4) 16) (= (y stone4) 10)) (and (= (x stone4) 7) (= (y stone4) 14)))
	(or (and (= (x stone5) 19) (= (y stone5) 13)) (and (= (x stone5) 9) (= (y stone5) 17)) (and (= (x stone5) 16) (= (y stone5) 16)) (and (= (x stone5) 16) (= (y stone5) 17)) (and (= (x stone5) 16) (= (y stone5) 10)) (and (= (x stone5) 7) (= (y stone5) 14)))
	(or (and (= (x stone6) 19) (= (y stone6) 13)) (and (= (x stone6) 9) (= (y stone6) 17)) (and (= (x stone6) 16) (= (y stone6) 16)) (and (= (x stone6) 16) (= (y stone6) 17)) (and (= (x stone6) 16) (= (y stone6) 10)) (and (= (x stone6) 7) (= (y stone6) 14)))
  ))

  
  

  
)
