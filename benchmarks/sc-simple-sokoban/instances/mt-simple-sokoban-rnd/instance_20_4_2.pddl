(define (problem instance_20_4_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 20)
	(= (min_x) 1)
	(= (max_y) 20)
	(= (min_y) 1)
	(= (x player1) 6)
	(= (y player1) 16)
	(= (x stone1) 7)
	(= (y stone1) 3)
	(= (x stone2) 10)
	(= (y stone2) 5)
	(= (x stone3) 14)
	(= (y stone3) 19)
	(= (x stone4) 18)
	(= (y stone4) 7)
  )

  (:goal (and 
    (or (and (= (x stone1) 15) (= (y stone1) 7)) (and (= (x stone1) 18) (= (y stone1) 17)) (and (= (x stone1) 15) (= (y stone1) 8)) (and (= (x stone1) 13) (= (y stone1) 18)))
	(or (and (= (x stone2) 15) (= (y stone2) 7)) (and (= (x stone2) 18) (= (y stone2) 17)) (and (= (x stone2) 15) (= (y stone2) 8)) (and (= (x stone2) 13) (= (y stone2) 18)))
	(or (and (= (x stone3) 15) (= (y stone3) 7)) (and (= (x stone3) 18) (= (y stone3) 17)) (and (= (x stone3) 15) (= (y stone3) 8)) (and (= (x stone3) 13) (= (y stone3) 18)))
	(or (and (= (x stone4) 15) (= (y stone4) 7)) (and (= (x stone4) 18) (= (y stone4) 17)) (and (= (x stone4) 15) (= (y stone4) 8)) (and (= (x stone4) 13) (= (y stone4) 18)))
  ))

  
  

  
)
