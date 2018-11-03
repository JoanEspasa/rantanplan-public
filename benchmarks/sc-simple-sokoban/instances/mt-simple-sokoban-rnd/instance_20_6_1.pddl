(define (problem instance_20_6_1)
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
	(= (x player1) 16)
	(= (y player1) 19)
	(= (x stone1) 5)
	(= (y stone1) 11)
	(= (x stone2) 5)
	(= (y stone2) 4)
	(= (x stone3) 10)
	(= (y stone3) 15)
	(= (x stone4) 16)
	(= (y stone4) 3)
	(= (x stone5) 17)
	(= (y stone5) 18)
	(= (x stone6) 2)
	(= (y stone6) 5)
  )

  (:goal (and 
    (or (and (= (x stone1) 4) (= (y stone1) 8)) (and (= (x stone1) 2) (= (y stone1) 13)) (and (= (x stone1) 9) (= (y stone1) 8)) (and (= (x stone1) 19) (= (y stone1) 5)) (and (= (x stone1) 20) (= (y stone1) 2)) (and (= (x stone1) 15) (= (y stone1) 9)))
	(or (and (= (x stone2) 4) (= (y stone2) 8)) (and (= (x stone2) 2) (= (y stone2) 13)) (and (= (x stone2) 9) (= (y stone2) 8)) (and (= (x stone2) 19) (= (y stone2) 5)) (and (= (x stone2) 20) (= (y stone2) 2)) (and (= (x stone2) 15) (= (y stone2) 9)))
	(or (and (= (x stone3) 4) (= (y stone3) 8)) (and (= (x stone3) 2) (= (y stone3) 13)) (and (= (x stone3) 9) (= (y stone3) 8)) (and (= (x stone3) 19) (= (y stone3) 5)) (and (= (x stone3) 20) (= (y stone3) 2)) (and (= (x stone3) 15) (= (y stone3) 9)))
	(or (and (= (x stone4) 4) (= (y stone4) 8)) (and (= (x stone4) 2) (= (y stone4) 13)) (and (= (x stone4) 9) (= (y stone4) 8)) (and (= (x stone4) 19) (= (y stone4) 5)) (and (= (x stone4) 20) (= (y stone4) 2)) (and (= (x stone4) 15) (= (y stone4) 9)))
	(or (and (= (x stone5) 4) (= (y stone5) 8)) (and (= (x stone5) 2) (= (y stone5) 13)) (and (= (x stone5) 9) (= (y stone5) 8)) (and (= (x stone5) 19) (= (y stone5) 5)) (and (= (x stone5) 20) (= (y stone5) 2)) (and (= (x stone5) 15) (= (y stone5) 9)))
	(or (and (= (x stone6) 4) (= (y stone6) 8)) (and (= (x stone6) 2) (= (y stone6) 13)) (and (= (x stone6) 9) (= (y stone6) 8)) (and (= (x stone6) 19) (= (y stone6) 5)) (and (= (x stone6) 20) (= (y stone6) 2)) (and (= (x stone6) 15) (= (y stone6) 9)))
  ))

  
  

  
)
