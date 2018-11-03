(define (problem instance_70_4_3)
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
	(= (x player1) 58)
	(= (y player1) 47)
	(= (x stone1) 9)
	(= (y stone1) 65)
	(= (x stone2) 52)
	(= (y stone2) 9)
	(= (x stone3) 21)
	(= (y stone3) 10)
	(= (x stone4) 62)
	(= (y stone4) 46)
  )

  (:goal (and 
    (or (and (= (x stone1) 47) (= (y stone1) 41)) (and (= (x stone1) 43) (= (y stone1) 63)) (and (= (x stone1) 1) (= (y stone1) 28)) (and (= (x stone1) 53) (= (y stone1) 27)))
	(or (and (= (x stone2) 47) (= (y stone2) 41)) (and (= (x stone2) 43) (= (y stone2) 63)) (and (= (x stone2) 1) (= (y stone2) 28)) (and (= (x stone2) 53) (= (y stone2) 27)))
	(or (and (= (x stone3) 47) (= (y stone3) 41)) (and (= (x stone3) 43) (= (y stone3) 63)) (and (= (x stone3) 1) (= (y stone3) 28)) (and (= (x stone3) 53) (= (y stone3) 27)))
	(or (and (= (x stone4) 47) (= (y stone4) 41)) (and (= (x stone4) 43) (= (y stone4) 63)) (and (= (x stone4) 1) (= (y stone4) 28)) (and (= (x stone4) 53) (= (y stone4) 27)))
  ))

  
  

  
)
