(define (problem instance_80_4_3)
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
	(= (x player1) 40)
	(= (y player1) 39)
	(= (x stone1) 20)
	(= (y stone1) 55)
	(= (x stone2) 56)
	(= (y stone2) 65)
	(= (x stone3) 25)
	(= (y stone3) 11)
	(= (x stone4) 49)
	(= (y stone4) 78)
  )

  (:goal (and 
    (or (and (= (x stone1) 43) (= (y stone1) 61)) (and (= (x stone1) 15) (= (y stone1) 66)) (and (= (x stone1) 39) (= (y stone1) 65)) (and (= (x stone1) 5) (= (y stone1) 72)))
	(or (and (= (x stone2) 43) (= (y stone2) 61)) (and (= (x stone2) 15) (= (y stone2) 66)) (and (= (x stone2) 39) (= (y stone2) 65)) (and (= (x stone2) 5) (= (y stone2) 72)))
	(or (and (= (x stone3) 43) (= (y stone3) 61)) (and (= (x stone3) 15) (= (y stone3) 66)) (and (= (x stone3) 39) (= (y stone3) 65)) (and (= (x stone3) 5) (= (y stone3) 72)))
	(or (and (= (x stone4) 43) (= (y stone4) 61)) (and (= (x stone4) 15) (= (y stone4) 66)) (and (= (x stone4) 39) (= (y stone4) 65)) (and (= (x stone4) 5) (= (y stone4) 72)))
  ))

  
  

  
)
