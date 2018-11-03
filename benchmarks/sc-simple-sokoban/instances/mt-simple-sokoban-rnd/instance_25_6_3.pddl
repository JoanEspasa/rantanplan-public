(define (problem instance_25_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 25)
	(= (min_x) 1)
	(= (max_y) 25)
	(= (min_y) 1)
	(= (x player1) 7)
	(= (y player1) 25)
	(= (x stone1) 19)
	(= (y stone1) 8)
	(= (x stone2) 8)
	(= (y stone2) 14)
	(= (x stone3) 22)
	(= (y stone3) 24)
	(= (x stone4) 8)
	(= (y stone4) 7)
	(= (x stone5) 5)
	(= (y stone5) 4)
	(= (x stone6) 15)
	(= (y stone6) 13)
  )

  (:goal (and 
    (or (and (= (x stone1) 13) (= (y stone1) 8)) (and (= (x stone1) 7) (= (y stone1) 22)) (and (= (x stone1) 23) (= (y stone1) 7)) (and (= (x stone1) 4) (= (y stone1) 5)) (and (= (x stone1) 2) (= (y stone1) 12)) (and (= (x stone1) 11) (= (y stone1) 25)))
	(or (and (= (x stone2) 13) (= (y stone2) 8)) (and (= (x stone2) 7) (= (y stone2) 22)) (and (= (x stone2) 23) (= (y stone2) 7)) (and (= (x stone2) 4) (= (y stone2) 5)) (and (= (x stone2) 2) (= (y stone2) 12)) (and (= (x stone2) 11) (= (y stone2) 25)))
	(or (and (= (x stone3) 13) (= (y stone3) 8)) (and (= (x stone3) 7) (= (y stone3) 22)) (and (= (x stone3) 23) (= (y stone3) 7)) (and (= (x stone3) 4) (= (y stone3) 5)) (and (= (x stone3) 2) (= (y stone3) 12)) (and (= (x stone3) 11) (= (y stone3) 25)))
	(or (and (= (x stone4) 13) (= (y stone4) 8)) (and (= (x stone4) 7) (= (y stone4) 22)) (and (= (x stone4) 23) (= (y stone4) 7)) (and (= (x stone4) 4) (= (y stone4) 5)) (and (= (x stone4) 2) (= (y stone4) 12)) (and (= (x stone4) 11) (= (y stone4) 25)))
	(or (and (= (x stone5) 13) (= (y stone5) 8)) (and (= (x stone5) 7) (= (y stone5) 22)) (and (= (x stone5) 23) (= (y stone5) 7)) (and (= (x stone5) 4) (= (y stone5) 5)) (and (= (x stone5) 2) (= (y stone5) 12)) (and (= (x stone5) 11) (= (y stone5) 25)))
	(or (and (= (x stone6) 13) (= (y stone6) 8)) (and (= (x stone6) 7) (= (y stone6) 22)) (and (= (x stone6) 23) (= (y stone6) 7)) (and (= (x stone6) 4) (= (y stone6) 5)) (and (= (x stone6) 2) (= (y stone6) 12)) (and (= (x stone6) 11) (= (y stone6) 25)))
  ))

  
  

  
)
