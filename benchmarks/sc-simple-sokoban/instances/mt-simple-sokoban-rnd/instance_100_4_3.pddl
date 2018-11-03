(define (problem instance_100_4_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 - stone
	player1 - player
  )

  (:init
    (= (max_x) 100)
	(= (min_x) 1)
	(= (max_y) 100)
	(= (min_y) 1)
	(= (x player1) 98)
	(= (y player1) 98)
	(= (x stone1) 70)
	(= (y stone1) 92)
	(= (x stone2) 20)
	(= (y stone2) 33)
	(= (x stone3) 90)
	(= (y stone3) 46)
	(= (x stone4) 87)
	(= (y stone4) 45)
  )

  (:goal (and 
    (or (and (= (x stone1) 98) (= (y stone1) 33)) (and (= (x stone1) 9) (= (y stone1) 53)) (and (= (x stone1) 72) (= (y stone1) 61)) (and (= (x stone1) 94) (= (y stone1) 59)))
	(or (and (= (x stone2) 98) (= (y stone2) 33)) (and (= (x stone2) 9) (= (y stone2) 53)) (and (= (x stone2) 72) (= (y stone2) 61)) (and (= (x stone2) 94) (= (y stone2) 59)))
	(or (and (= (x stone3) 98) (= (y stone3) 33)) (and (= (x stone3) 9) (= (y stone3) 53)) (and (= (x stone3) 72) (= (y stone3) 61)) (and (= (x stone3) 94) (= (y stone3) 59)))
	(or (and (= (x stone4) 98) (= (y stone4) 33)) (and (= (x stone4) 9) (= (y stone4) 53)) (and (= (x stone4) 72) (= (y stone4) 61)) (and (= (x stone4) 94) (= (y stone4) 59)))
  ))

  
  

  
)
