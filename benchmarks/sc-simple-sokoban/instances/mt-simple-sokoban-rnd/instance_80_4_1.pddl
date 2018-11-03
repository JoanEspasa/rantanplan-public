(define (problem instance_80_4_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 80)
	(= (min_x) 1)
	(= (max_y) 80)
	(= (min_y) 1)
	(= (x player1) 45)
	(= (y player1) 39)
	(= (x stone1) 35)
	(= (y stone1) 5)
	(= (x stone2) 35)
	(= (y stone2) 12)
	(= (x stone3) 34)
	(= (y stone3) 8)
	(= (x stone4) 47)
	(= (y stone4) 78)
  )

  (:goal (and 
    (or (and (= (x stone1) 66) (= (y stone1) 10)) (and (= (x stone1) 48) (= (y stone1) 39)) (and (= (x stone1) 28) (= (y stone1) 22)) (and (= (x stone1) 48) (= (y stone1) 32)))
	(or (and (= (x stone2) 66) (= (y stone2) 10)) (and (= (x stone2) 48) (= (y stone2) 39)) (and (= (x stone2) 28) (= (y stone2) 22)) (and (= (x stone2) 48) (= (y stone2) 32)))
	(or (and (= (x stone3) 66) (= (y stone3) 10)) (and (= (x stone3) 48) (= (y stone3) 39)) (and (= (x stone3) 28) (= (y stone3) 22)) (and (= (x stone3) 48) (= (y stone3) 32)))
	(or (and (= (x stone4) 66) (= (y stone4) 10)) (and (= (x stone4) 48) (= (y stone4) 39)) (and (= (x stone4) 28) (= (y stone4) 22)) (and (= (x stone4) 48) (= (y stone4) 32)))
  ))

  
  

  
)
