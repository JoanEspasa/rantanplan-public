(define (problem instance_70_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 70)
	(= (min_x) 1)
	(= (max_y) 70)
	(= (min_y) 1)
	(= (x player1) 57)
	(= (y player1) 60)
	(= (x stone1) 58)
	(= (y stone1) 22)
	(= (x stone2) 51)
	(= (y stone2) 17)
	(= (x stone3) 16)
	(= (y stone3) 20)
	(= (x stone4) 69)
	(= (y stone4) 45)
	(= (x stone5) 65)
	(= (y stone5) 7)
	(= (x stone6) 34)
	(= (y stone6) 38)
  )

  (:goal (and 
    (or (and (= (x stone1) 48) (= (y stone1) 51)) (and (= (x stone1) 10) (= (y stone1) 1)) (and (= (x stone1) 27) (= (y stone1) 62)) (and (= (x stone1) 4) (= (y stone1) 37)) (and (= (x stone1) 55) (= (y stone1) 36)) (and (= (x stone1) 30) (= (y stone1) 36)))
	(or (and (= (x stone2) 48) (= (y stone2) 51)) (and (= (x stone2) 10) (= (y stone2) 1)) (and (= (x stone2) 27) (= (y stone2) 62)) (and (= (x stone2) 4) (= (y stone2) 37)) (and (= (x stone2) 55) (= (y stone2) 36)) (and (= (x stone2) 30) (= (y stone2) 36)))
	(or (and (= (x stone3) 48) (= (y stone3) 51)) (and (= (x stone3) 10) (= (y stone3) 1)) (and (= (x stone3) 27) (= (y stone3) 62)) (and (= (x stone3) 4) (= (y stone3) 37)) (and (= (x stone3) 55) (= (y stone3) 36)) (and (= (x stone3) 30) (= (y stone3) 36)))
	(or (and (= (x stone4) 48) (= (y stone4) 51)) (and (= (x stone4) 10) (= (y stone4) 1)) (and (= (x stone4) 27) (= (y stone4) 62)) (and (= (x stone4) 4) (= (y stone4) 37)) (and (= (x stone4) 55) (= (y stone4) 36)) (and (= (x stone4) 30) (= (y stone4) 36)))
	(or (and (= (x stone5) 48) (= (y stone5) 51)) (and (= (x stone5) 10) (= (y stone5) 1)) (and (= (x stone5) 27) (= (y stone5) 62)) (and (= (x stone5) 4) (= (y stone5) 37)) (and (= (x stone5) 55) (= (y stone5) 36)) (and (= (x stone5) 30) (= (y stone5) 36)))
	(or (and (= (x stone6) 48) (= (y stone6) 51)) (and (= (x stone6) 10) (= (y stone6) 1)) (and (= (x stone6) 27) (= (y stone6) 62)) (and (= (x stone6) 4) (= (y stone6) 37)) (and (= (x stone6) 55) (= (y stone6) 36)) (and (= (x stone6) 30) (= (y stone6) 36)))
  ))

  
  

  
)
