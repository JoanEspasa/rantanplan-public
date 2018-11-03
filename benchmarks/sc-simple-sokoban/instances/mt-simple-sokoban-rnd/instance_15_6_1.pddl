(define (problem instance_15_6_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 15)
	(= (min_x) 1)
	(= (max_y) 15)
	(= (min_y) 1)
	(= (x player1) 14)
	(= (y player1) 7)
	(= (x stone1) 5)
	(= (y stone1) 8)
	(= (x stone2) 3)
	(= (y stone2) 2)
	(= (x stone3) 7)
	(= (y stone3) 13)
	(= (x stone4) 12)
	(= (y stone4) 13)
	(= (x stone5) 11)
	(= (y stone5) 4)
	(= (x stone6) 9)
	(= (y stone6) 3)
  )

  (:goal (and 
    (or (and (= (x stone1) 5) (= (y stone1) 10)) (and (= (x stone1) 1) (= (y stone1) 11)) (and (= (x stone1) 3) (= (y stone1) 4)) (and (= (x stone1) 6) (= (y stone1) 13)) (and (= (x stone1) 11) (= (y stone1) 3)) (and (= (x stone1) 7) (= (y stone1) 14)))
	(or (and (= (x stone2) 5) (= (y stone2) 10)) (and (= (x stone2) 1) (= (y stone2) 11)) (and (= (x stone2) 3) (= (y stone2) 4)) (and (= (x stone2) 6) (= (y stone2) 13)) (and (= (x stone2) 11) (= (y stone2) 3)) (and (= (x stone2) 7) (= (y stone2) 14)))
	(or (and (= (x stone3) 5) (= (y stone3) 10)) (and (= (x stone3) 1) (= (y stone3) 11)) (and (= (x stone3) 3) (= (y stone3) 4)) (and (= (x stone3) 6) (= (y stone3) 13)) (and (= (x stone3) 11) (= (y stone3) 3)) (and (= (x stone3) 7) (= (y stone3) 14)))
	(or (and (= (x stone4) 5) (= (y stone4) 10)) (and (= (x stone4) 1) (= (y stone4) 11)) (and (= (x stone4) 3) (= (y stone4) 4)) (and (= (x stone4) 6) (= (y stone4) 13)) (and (= (x stone4) 11) (= (y stone4) 3)) (and (= (x stone4) 7) (= (y stone4) 14)))
	(or (and (= (x stone5) 5) (= (y stone5) 10)) (and (= (x stone5) 1) (= (y stone5) 11)) (and (= (x stone5) 3) (= (y stone5) 4)) (and (= (x stone5) 6) (= (y stone5) 13)) (and (= (x stone5) 11) (= (y stone5) 3)) (and (= (x stone5) 7) (= (y stone5) 14)))
	(or (and (= (x stone6) 5) (= (y stone6) 10)) (and (= (x stone6) 1) (= (y stone6) 11)) (and (= (x stone6) 3) (= (y stone6) 4)) (and (= (x stone6) 6) (= (y stone6) 13)) (and (= (x stone6) 11) (= (y stone6) 3)) (and (= (x stone6) 7) (= (y stone6) 14)))
  ))

  
  

  
)
