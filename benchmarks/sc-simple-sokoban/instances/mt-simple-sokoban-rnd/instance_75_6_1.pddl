(define (problem instance_75_6_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 75)
	(= (min_x) 1)
	(= (max_y) 75)
	(= (min_y) 1)
	(= (x player1) 16)
	(= (y player1) 29)
	(= (x stone1) 50)
	(= (y stone1) 18)
	(= (x stone2) 3)
	(= (y stone2) 70)
	(= (x stone3) 64)
	(= (y stone3) 14)
	(= (x stone4) 33)
	(= (y stone4) 60)
	(= (x stone5) 12)
	(= (y stone5) 7)
	(= (x stone6) 42)
	(= (y stone6) 40)
  )

  (:goal (and 
    (or (and (= (x stone1) 6) (= (y stone1) 51)) (and (= (x stone1) 60) (= (y stone1) 17)) (and (= (x stone1) 2) (= (y stone1) 75)) (and (= (x stone1) 22) (= (y stone1) 58)) (and (= (x stone1) 49) (= (y stone1) 73)) (and (= (x stone1) 64) (= (y stone1) 34)))
	(or (and (= (x stone2) 6) (= (y stone2) 51)) (and (= (x stone2) 60) (= (y stone2) 17)) (and (= (x stone2) 2) (= (y stone2) 75)) (and (= (x stone2) 22) (= (y stone2) 58)) (and (= (x stone2) 49) (= (y stone2) 73)) (and (= (x stone2) 64) (= (y stone2) 34)))
	(or (and (= (x stone3) 6) (= (y stone3) 51)) (and (= (x stone3) 60) (= (y stone3) 17)) (and (= (x stone3) 2) (= (y stone3) 75)) (and (= (x stone3) 22) (= (y stone3) 58)) (and (= (x stone3) 49) (= (y stone3) 73)) (and (= (x stone3) 64) (= (y stone3) 34)))
	(or (and (= (x stone4) 6) (= (y stone4) 51)) (and (= (x stone4) 60) (= (y stone4) 17)) (and (= (x stone4) 2) (= (y stone4) 75)) (and (= (x stone4) 22) (= (y stone4) 58)) (and (= (x stone4) 49) (= (y stone4) 73)) (and (= (x stone4) 64) (= (y stone4) 34)))
	(or (and (= (x stone5) 6) (= (y stone5) 51)) (and (= (x stone5) 60) (= (y stone5) 17)) (and (= (x stone5) 2) (= (y stone5) 75)) (and (= (x stone5) 22) (= (y stone5) 58)) (and (= (x stone5) 49) (= (y stone5) 73)) (and (= (x stone5) 64) (= (y stone5) 34)))
	(or (and (= (x stone6) 6) (= (y stone6) 51)) (and (= (x stone6) 60) (= (y stone6) 17)) (and (= (x stone6) 2) (= (y stone6) 75)) (and (= (x stone6) 22) (= (y stone6) 58)) (and (= (x stone6) 49) (= (y stone6) 73)) (and (= (x stone6) 64) (= (y stone6) 34)))
  ))

  
  

  
)
