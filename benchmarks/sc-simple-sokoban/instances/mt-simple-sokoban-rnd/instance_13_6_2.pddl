(define (problem instance_13_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 13)
	(= (min_x) 1)
	(= (max_y) 13)
	(= (min_y) 1)
	(= (x player1) 11)
	(= (y player1) 7)
	(= (x stone1) 3)
	(= (y stone1) 11)
	(= (x stone2) 8)
	(= (y stone2) 4)
	(= (x stone3) 10)
	(= (y stone3) 8)
	(= (x stone4) 6)
	(= (y stone4) 12)
	(= (x stone5) 2)
	(= (y stone5) 3)
	(= (x stone6) 3)
	(= (y stone6) 10)
  )

  (:goal (and 
    (or (and (= (x stone1) 11) (= (y stone1) 4)) (and (= (x stone1) 5) (= (y stone1) 7)) (and (= (x stone1) 1) (= (y stone1) 6)) (and (= (x stone1) 9) (= (y stone1) 13)) (and (= (x stone1) 3) (= (y stone1) 12)) (and (= (x stone1) 12) (= (y stone1) 13)))
	(or (and (= (x stone2) 11) (= (y stone2) 4)) (and (= (x stone2) 5) (= (y stone2) 7)) (and (= (x stone2) 1) (= (y stone2) 6)) (and (= (x stone2) 9) (= (y stone2) 13)) (and (= (x stone2) 3) (= (y stone2) 12)) (and (= (x stone2) 12) (= (y stone2) 13)))
	(or (and (= (x stone3) 11) (= (y stone3) 4)) (and (= (x stone3) 5) (= (y stone3) 7)) (and (= (x stone3) 1) (= (y stone3) 6)) (and (= (x stone3) 9) (= (y stone3) 13)) (and (= (x stone3) 3) (= (y stone3) 12)) (and (= (x stone3) 12) (= (y stone3) 13)))
	(or (and (= (x stone4) 11) (= (y stone4) 4)) (and (= (x stone4) 5) (= (y stone4) 7)) (and (= (x stone4) 1) (= (y stone4) 6)) (and (= (x stone4) 9) (= (y stone4) 13)) (and (= (x stone4) 3) (= (y stone4) 12)) (and (= (x stone4) 12) (= (y stone4) 13)))
	(or (and (= (x stone5) 11) (= (y stone5) 4)) (and (= (x stone5) 5) (= (y stone5) 7)) (and (= (x stone5) 1) (= (y stone5) 6)) (and (= (x stone5) 9) (= (y stone5) 13)) (and (= (x stone5) 3) (= (y stone5) 12)) (and (= (x stone5) 12) (= (y stone5) 13)))
	(or (and (= (x stone6) 11) (= (y stone6) 4)) (and (= (x stone6) 5) (= (y stone6) 7)) (and (= (x stone6) 1) (= (y stone6) 6)) (and (= (x stone6) 9) (= (y stone6) 13)) (and (= (x stone6) 3) (= (y stone6) 12)) (and (= (x stone6) 12) (= (y stone6) 13)))
  ))

  
  

  
)
