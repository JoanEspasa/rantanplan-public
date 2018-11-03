(define (problem instance_70_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 70)
	(= (min_x) 1)
	(= (max_y) 70)
	(= (min_y) 1)
	(= (x player1) 17)
	(= (y player1) 14)
	(= (x stone1) 40)
	(= (y stone1) 15)
	(= (x stone2) 49)
	(= (y stone2) 57)
	(= (x stone3) 15)
	(= (y stone3) 25)
	(= (x stone4) 37)
	(= (y stone4) 26)
	(= (x stone5) 27)
	(= (y stone5) 33)
	(= (x stone6) 20)
	(= (y stone6) 19)
  )

  (:goal (and 
    (or (and (= (x stone1) 24) (= (y stone1) 27)) (and (= (x stone1) 43) (= (y stone1) 43)) (and (= (x stone1) 18) (= (y stone1) 7)) (and (= (x stone1) 19) (= (y stone1) 2)) (and (= (x stone1) 55) (= (y stone1) 42)) (and (= (x stone1) 37) (= (y stone1) 66)))
	(or (and (= (x stone2) 24) (= (y stone2) 27)) (and (= (x stone2) 43) (= (y stone2) 43)) (and (= (x stone2) 18) (= (y stone2) 7)) (and (= (x stone2) 19) (= (y stone2) 2)) (and (= (x stone2) 55) (= (y stone2) 42)) (and (= (x stone2) 37) (= (y stone2) 66)))
	(or (and (= (x stone3) 24) (= (y stone3) 27)) (and (= (x stone3) 43) (= (y stone3) 43)) (and (= (x stone3) 18) (= (y stone3) 7)) (and (= (x stone3) 19) (= (y stone3) 2)) (and (= (x stone3) 55) (= (y stone3) 42)) (and (= (x stone3) 37) (= (y stone3) 66)))
	(or (and (= (x stone4) 24) (= (y stone4) 27)) (and (= (x stone4) 43) (= (y stone4) 43)) (and (= (x stone4) 18) (= (y stone4) 7)) (and (= (x stone4) 19) (= (y stone4) 2)) (and (= (x stone4) 55) (= (y stone4) 42)) (and (= (x stone4) 37) (= (y stone4) 66)))
	(or (and (= (x stone5) 24) (= (y stone5) 27)) (and (= (x stone5) 43) (= (y stone5) 43)) (and (= (x stone5) 18) (= (y stone5) 7)) (and (= (x stone5) 19) (= (y stone5) 2)) (and (= (x stone5) 55) (= (y stone5) 42)) (and (= (x stone5) 37) (= (y stone5) 66)))
	(or (and (= (x stone6) 24) (= (y stone6) 27)) (and (= (x stone6) 43) (= (y stone6) 43)) (and (= (x stone6) 18) (= (y stone6) 7)) (and (= (x stone6) 19) (= (y stone6) 2)) (and (= (x stone6) 55) (= (y stone6) 42)) (and (= (x stone6) 37) (= (y stone6) 66)))
  ))

  
  

  
)
