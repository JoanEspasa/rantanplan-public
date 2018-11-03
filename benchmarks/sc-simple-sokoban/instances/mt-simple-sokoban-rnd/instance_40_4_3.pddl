(define (problem instance_40_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 40)
	(= (min_x) 1)
	(= (max_y) 40)
	(= (min_y) 1)
	(= (x player1) 14)
	(= (y player1) 25)
	(= (x stone1) 20)
	(= (y stone1) 28)
	(= (x stone2) 16)
	(= (y stone2) 28)
	(= (x stone3) 30)
	(= (y stone3) 14)
	(= (x stone4) 26)
	(= (y stone4) 11)
  )

  (:goal (and 
    (or (and (= (x stone1) 16) (= (y stone1) 2)) (and (= (x stone1) 16) (= (y stone1) 11)) (and (= (x stone1) 40) (= (y stone1) 7)) (and (= (x stone1) 14) (= (y stone1) 34)))
	(or (and (= (x stone2) 16) (= (y stone2) 2)) (and (= (x stone2) 16) (= (y stone2) 11)) (and (= (x stone2) 40) (= (y stone2) 7)) (and (= (x stone2) 14) (= (y stone2) 34)))
	(or (and (= (x stone3) 16) (= (y stone3) 2)) (and (= (x stone3) 16) (= (y stone3) 11)) (and (= (x stone3) 40) (= (y stone3) 7)) (and (= (x stone3) 14) (= (y stone3) 34)))
	(or (and (= (x stone4) 16) (= (y stone4) 2)) (and (= (x stone4) 16) (= (y stone4) 11)) (and (= (x stone4) 40) (= (y stone4) 7)) (and (= (x stone4) 14) (= (y stone4) 34)))
  ))

  
  

  
)
