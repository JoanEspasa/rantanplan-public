(define (problem instance_13_6_1)
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
	(= (x player1) 7)
	(= (y player1) 2)
	(= (x stone1) 11)
	(= (y stone1) 8)
	(= (x stone2) 4)
	(= (y stone2) 11)
	(= (x stone3) 5)
	(= (y stone3) 8)
	(= (x stone4) 6)
	(= (y stone4) 7)
	(= (x stone5) 4)
	(= (y stone5) 12)
	(= (x stone6) 10)
	(= (y stone6) 10)
  )

  (:goal (and 
    (or (and (= (x stone1) 7) (= (y stone1) 1)) (and (= (x stone1) 10) (= (y stone1) 3)) (and (= (x stone1) 12) (= (y stone1) 6)) (and (= (x stone1) 13) (= (y stone1) 11)) (and (= (x stone1) 5) (= (y stone1) 6)) (and (= (x stone1) 9) (= (y stone1) 1)))
	(or (and (= (x stone2) 7) (= (y stone2) 1)) (and (= (x stone2) 10) (= (y stone2) 3)) (and (= (x stone2) 12) (= (y stone2) 6)) (and (= (x stone2) 13) (= (y stone2) 11)) (and (= (x stone2) 5) (= (y stone2) 6)) (and (= (x stone2) 9) (= (y stone2) 1)))
	(or (and (= (x stone3) 7) (= (y stone3) 1)) (and (= (x stone3) 10) (= (y stone3) 3)) (and (= (x stone3) 12) (= (y stone3) 6)) (and (= (x stone3) 13) (= (y stone3) 11)) (and (= (x stone3) 5) (= (y stone3) 6)) (and (= (x stone3) 9) (= (y stone3) 1)))
	(or (and (= (x stone4) 7) (= (y stone4) 1)) (and (= (x stone4) 10) (= (y stone4) 3)) (and (= (x stone4) 12) (= (y stone4) 6)) (and (= (x stone4) 13) (= (y stone4) 11)) (and (= (x stone4) 5) (= (y stone4) 6)) (and (= (x stone4) 9) (= (y stone4) 1)))
	(or (and (= (x stone5) 7) (= (y stone5) 1)) (and (= (x stone5) 10) (= (y stone5) 3)) (and (= (x stone5) 12) (= (y stone5) 6)) (and (= (x stone5) 13) (= (y stone5) 11)) (and (= (x stone5) 5) (= (y stone5) 6)) (and (= (x stone5) 9) (= (y stone5) 1)))
	(or (and (= (x stone6) 7) (= (y stone6) 1)) (and (= (x stone6) 10) (= (y stone6) 3)) (and (= (x stone6) 12) (= (y stone6) 6)) (and (= (x stone6) 13) (= (y stone6) 11)) (and (= (x stone6) 5) (= (y stone6) 6)) (and (= (x stone6) 9) (= (y stone6) 1)))
  ))

  
  

  
)
