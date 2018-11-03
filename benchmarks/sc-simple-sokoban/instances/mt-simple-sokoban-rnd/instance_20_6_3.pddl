(define (problem instance_20_6_3)
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
	(= (x player1) 14)
	(= (y player1) 14)
	(= (x stone1) 8)
	(= (y stone1) 17)
	(= (x stone2) 16)
	(= (y stone2) 12)
	(= (x stone3) 11)
	(= (y stone3) 10)
	(= (x stone4) 15)
	(= (y stone4) 4)
	(= (x stone5) 4)
	(= (y stone5) 3)
	(= (x stone6) 15)
	(= (y stone6) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 7) (= (y stone1) 16)) (and (= (x stone1) 20) (= (y stone1) 15)) (and (= (x stone1) 14) (= (y stone1) 5)) (and (= (x stone1) 19) (= (y stone1) 20)) (and (= (x stone1) 4) (= (y stone1) 1)) (and (= (x stone1) 10) (= (y stone1) 3)))
	(or (and (= (x stone2) 7) (= (y stone2) 16)) (and (= (x stone2) 20) (= (y stone2) 15)) (and (= (x stone2) 14) (= (y stone2) 5)) (and (= (x stone2) 19) (= (y stone2) 20)) (and (= (x stone2) 4) (= (y stone2) 1)) (and (= (x stone2) 10) (= (y stone2) 3)))
	(or (and (= (x stone3) 7) (= (y stone3) 16)) (and (= (x stone3) 20) (= (y stone3) 15)) (and (= (x stone3) 14) (= (y stone3) 5)) (and (= (x stone3) 19) (= (y stone3) 20)) (and (= (x stone3) 4) (= (y stone3) 1)) (and (= (x stone3) 10) (= (y stone3) 3)))
	(or (and (= (x stone4) 7) (= (y stone4) 16)) (and (= (x stone4) 20) (= (y stone4) 15)) (and (= (x stone4) 14) (= (y stone4) 5)) (and (= (x stone4) 19) (= (y stone4) 20)) (and (= (x stone4) 4) (= (y stone4) 1)) (and (= (x stone4) 10) (= (y stone4) 3)))
	(or (and (= (x stone5) 7) (= (y stone5) 16)) (and (= (x stone5) 20) (= (y stone5) 15)) (and (= (x stone5) 14) (= (y stone5) 5)) (and (= (x stone5) 19) (= (y stone5) 20)) (and (= (x stone5) 4) (= (y stone5) 1)) (and (= (x stone5) 10) (= (y stone5) 3)))
	(or (and (= (x stone6) 7) (= (y stone6) 16)) (and (= (x stone6) 20) (= (y stone6) 15)) (and (= (x stone6) 14) (= (y stone6) 5)) (and (= (x stone6) 19) (= (y stone6) 20)) (and (= (x stone6) 4) (= (y stone6) 1)) (and (= (x stone6) 10) (= (y stone6) 3)))
  ))

  
  

  
)
