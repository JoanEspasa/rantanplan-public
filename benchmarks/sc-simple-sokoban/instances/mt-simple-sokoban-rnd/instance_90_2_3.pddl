(define (problem instance_90_2_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 - stone
	player1 - player
  )

  (:init
    (= (max_x) 90)
	(= (min_x) 1)
	(= (max_y) 90)
	(= (min_y) 1)
	(= (x player1) 25)
	(= (y player1) 20)
	(= (x stone1) 3)
	(= (y stone1) 62)
	(= (x stone2) 29)
	(= (y stone2) 87)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 40)) (and (= (x stone1) 88) (= (y stone1) 53)))
	(or (and (= (x stone2) 1) (= (y stone2) 40)) (and (= (x stone2) 88) (= (y stone2) 53)))
  ))

  
  

  
)
