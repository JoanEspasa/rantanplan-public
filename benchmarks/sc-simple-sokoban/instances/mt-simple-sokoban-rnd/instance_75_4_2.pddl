(define (problem instance_75_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 75)
	(= (min_x) 1)
	(= (max_y) 75)
	(= (min_y) 1)
	(= (x player1) 70)
	(= (y player1) 29)
	(= (x stone1) 26)
	(= (y stone1) 12)
	(= (x stone2) 26)
	(= (y stone2) 46)
	(= (x stone3) 63)
	(= (y stone3) 10)
	(= (x stone4) 39)
	(= (y stone4) 62)
  )

  (:goal (and 
    (or (and (= (x stone1) 28) (= (y stone1) 71)) (and (= (x stone1) 7) (= (y stone1) 65)) (and (= (x stone1) 11) (= (y stone1) 27)) (and (= (x stone1) 49) (= (y stone1) 4)))
	(or (and (= (x stone2) 28) (= (y stone2) 71)) (and (= (x stone2) 7) (= (y stone2) 65)) (and (= (x stone2) 11) (= (y stone2) 27)) (and (= (x stone2) 49) (= (y stone2) 4)))
	(or (and (= (x stone3) 28) (= (y stone3) 71)) (and (= (x stone3) 7) (= (y stone3) 65)) (and (= (x stone3) 11) (= (y stone3) 27)) (and (= (x stone3) 49) (= (y stone3) 4)))
	(or (and (= (x stone4) 28) (= (y stone4) 71)) (and (= (x stone4) 7) (= (y stone4) 65)) (and (= (x stone4) 11) (= (y stone4) 27)) (and (= (x stone4) 49) (= (y stone4) 4)))
  ))

  
  

  
)
