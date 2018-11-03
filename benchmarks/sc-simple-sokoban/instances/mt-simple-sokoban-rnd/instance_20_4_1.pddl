(define (problem instance_20_4_1)
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
	(= (x player1) 1)
	(= (y player1) 11)
	(= (x stone1) 3)
	(= (y stone1) 14)
	(= (x stone2) 14)
	(= (y stone2) 17)
	(= (x stone3) 13)
	(= (y stone3) 3)
	(= (x stone4) 7)
	(= (y stone4) 12)
  )

  (:goal (and 
    (or (and (= (x stone1) 10) (= (y stone1) 11)) (and (= (x stone1) 11) (= (y stone1) 5)) (and (= (x stone1) 9) (= (y stone1) 11)) (and (= (x stone1) 13) (= (y stone1) 16)))
	(or (and (= (x stone2) 10) (= (y stone2) 11)) (and (= (x stone2) 11) (= (y stone2) 5)) (and (= (x stone2) 9) (= (y stone2) 11)) (and (= (x stone2) 13) (= (y stone2) 16)))
	(or (and (= (x stone3) 10) (= (y stone3) 11)) (and (= (x stone3) 11) (= (y stone3) 5)) (and (= (x stone3) 9) (= (y stone3) 11)) (and (= (x stone3) 13) (= (y stone3) 16)))
	(or (and (= (x stone4) 10) (= (y stone4) 11)) (and (= (x stone4) 11) (= (y stone4) 5)) (and (= (x stone4) 9) (= (y stone4) 11)) (and (= (x stone4) 13) (= (y stone4) 16)))
  ))

  
  

  
)
