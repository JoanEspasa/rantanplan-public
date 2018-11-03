(define (problem instance_45_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 45)
	(= (min_x) 1)
	(= (max_y) 45)
	(= (min_y) 1)
	(= (x player1) 20)
	(= (y player1) 35)
	(= (x stone1) 33)
	(= (y stone1) 22)
	(= (x stone2) 39)
	(= (y stone2) 38)
	(= (x stone3) 10)
	(= (y stone3) 16)
	(= (x stone4) 13)
	(= (y stone4) 17)
	(= (x stone5) 15)
	(= (y stone5) 18)
	(= (x stone6) 32)
	(= (y stone6) 19)
  )

  (:goal (and 
    (or (and (= (x stone1) 40) (= (y stone1) 37)) (and (= (x stone1) 13) (= (y stone1) 15)) (and (= (x stone1) 15) (= (y stone1) 14)) (and (= (x stone1) 40) (= (y stone1) 24)) (and (= (x stone1) 42) (= (y stone1) 31)) (and (= (x stone1) 24) (= (y stone1) 26)))
	(or (and (= (x stone2) 40) (= (y stone2) 37)) (and (= (x stone2) 13) (= (y stone2) 15)) (and (= (x stone2) 15) (= (y stone2) 14)) (and (= (x stone2) 40) (= (y stone2) 24)) (and (= (x stone2) 42) (= (y stone2) 31)) (and (= (x stone2) 24) (= (y stone2) 26)))
	(or (and (= (x stone3) 40) (= (y stone3) 37)) (and (= (x stone3) 13) (= (y stone3) 15)) (and (= (x stone3) 15) (= (y stone3) 14)) (and (= (x stone3) 40) (= (y stone3) 24)) (and (= (x stone3) 42) (= (y stone3) 31)) (and (= (x stone3) 24) (= (y stone3) 26)))
	(or (and (= (x stone4) 40) (= (y stone4) 37)) (and (= (x stone4) 13) (= (y stone4) 15)) (and (= (x stone4) 15) (= (y stone4) 14)) (and (= (x stone4) 40) (= (y stone4) 24)) (and (= (x stone4) 42) (= (y stone4) 31)) (and (= (x stone4) 24) (= (y stone4) 26)))
	(or (and (= (x stone5) 40) (= (y stone5) 37)) (and (= (x stone5) 13) (= (y stone5) 15)) (and (= (x stone5) 15) (= (y stone5) 14)) (and (= (x stone5) 40) (= (y stone5) 24)) (and (= (x stone5) 42) (= (y stone5) 31)) (and (= (x stone5) 24) (= (y stone5) 26)))
	(or (and (= (x stone6) 40) (= (y stone6) 37)) (and (= (x stone6) 13) (= (y stone6) 15)) (and (= (x stone6) 15) (= (y stone6) 14)) (and (= (x stone6) 40) (= (y stone6) 24)) (and (= (x stone6) 42) (= (y stone6) 31)) (and (= (x stone6) 24) (= (y stone6) 26)))
  ))

  
  

  
)
