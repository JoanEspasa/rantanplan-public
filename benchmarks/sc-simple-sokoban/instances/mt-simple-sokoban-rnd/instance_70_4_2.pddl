(define (problem instance_70_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 70)
	(= (min_x) 1)
	(= (max_y) 70)
	(= (min_y) 1)
	(= (x player1) 49)
	(= (y player1) 24)
	(= (x stone1) 64)
	(= (y stone1) 56)
	(= (x stone2) 69)
	(= (y stone2) 69)
	(= (x stone3) 10)
	(= (y stone3) 25)
	(= (x stone4) 13)
	(= (y stone4) 41)
  )

  (:goal (and 
    (or (and (= (x stone1) 26) (= (y stone1) 17)) (and (= (x stone1) 21) (= (y stone1) 45)) (and (= (x stone1) 57) (= (y stone1) 45)) (and (= (x stone1) 7) (= (y stone1) 39)))
	(or (and (= (x stone2) 26) (= (y stone2) 17)) (and (= (x stone2) 21) (= (y stone2) 45)) (and (= (x stone2) 57) (= (y stone2) 45)) (and (= (x stone2) 7) (= (y stone2) 39)))
	(or (and (= (x stone3) 26) (= (y stone3) 17)) (and (= (x stone3) 21) (= (y stone3) 45)) (and (= (x stone3) 57) (= (y stone3) 45)) (and (= (x stone3) 7) (= (y stone3) 39)))
	(or (and (= (x stone4) 26) (= (y stone4) 17)) (and (= (x stone4) 21) (= (y stone4) 45)) (and (= (x stone4) 57) (= (y stone4) 45)) (and (= (x stone4) 7) (= (y stone4) 39)))
  ))

  
  

  
)
