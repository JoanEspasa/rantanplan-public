(define (problem instance_25_6_2)
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
	(= (x player1) 16)
	(= (y player1) 5)
	(= (x stone1) 9)
	(= (y stone1) 23)
	(= (x stone2) 24)
	(= (y stone2) 18)
	(= (x stone3) 4)
	(= (y stone3) 10)
	(= (x stone4) 24)
	(= (y stone4) 24)
	(= (x stone5) 14)
	(= (y stone5) 21)
	(= (x stone6) 17)
	(= (y stone6) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 16) (= (y stone1) 24)) (and (= (x stone1) 18) (= (y stone1) 16)) (and (= (x stone1) 18) (= (y stone1) 22)) (and (= (x stone1) 10) (= (y stone1) 1)) (and (= (x stone1) 3) (= (y stone1) 20)) (and (= (x stone1) 7) (= (y stone1) 3)))
	(or (and (= (x stone2) 16) (= (y stone2) 24)) (and (= (x stone2) 18) (= (y stone2) 16)) (and (= (x stone2) 18) (= (y stone2) 22)) (and (= (x stone2) 10) (= (y stone2) 1)) (and (= (x stone2) 3) (= (y stone2) 20)) (and (= (x stone2) 7) (= (y stone2) 3)))
	(or (and (= (x stone3) 16) (= (y stone3) 24)) (and (= (x stone3) 18) (= (y stone3) 16)) (and (= (x stone3) 18) (= (y stone3) 22)) (and (= (x stone3) 10) (= (y stone3) 1)) (and (= (x stone3) 3) (= (y stone3) 20)) (and (= (x stone3) 7) (= (y stone3) 3)))
	(or (and (= (x stone4) 16) (= (y stone4) 24)) (and (= (x stone4) 18) (= (y stone4) 16)) (and (= (x stone4) 18) (= (y stone4) 22)) (and (= (x stone4) 10) (= (y stone4) 1)) (and (= (x stone4) 3) (= (y stone4) 20)) (and (= (x stone4) 7) (= (y stone4) 3)))
	(or (and (= (x stone5) 16) (= (y stone5) 24)) (and (= (x stone5) 18) (= (y stone5) 16)) (and (= (x stone5) 18) (= (y stone5) 22)) (and (= (x stone5) 10) (= (y stone5) 1)) (and (= (x stone5) 3) (= (y stone5) 20)) (and (= (x stone5) 7) (= (y stone5) 3)))
	(or (and (= (x stone6) 16) (= (y stone6) 24)) (and (= (x stone6) 18) (= (y stone6) 16)) (and (= (x stone6) 18) (= (y stone6) 22)) (and (= (x stone6) 10) (= (y stone6) 1)) (and (= (x stone6) 3) (= (y stone6) 20)) (and (= (x stone6) 7) (= (y stone6) 3)))
  ))

  
  

  
)
