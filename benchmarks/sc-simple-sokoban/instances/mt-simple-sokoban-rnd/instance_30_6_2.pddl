(define (problem instance_30_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 30)
	(= (min_x) 1)
	(= (max_y) 30)
	(= (min_y) 1)
	(= (x player1) 15)
	(= (y player1) 14)
	(= (x stone1) 11)
	(= (y stone1) 17)
	(= (x stone2) 11)
	(= (y stone2) 4)
	(= (x stone3) 2)
	(= (y stone3) 13)
	(= (x stone4) 12)
	(= (y stone4) 23)
	(= (x stone5) 23)
	(= (y stone5) 25)
	(= (x stone6) 20)
	(= (y stone6) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 14) (= (y stone1) 2)) (and (= (x stone1) 9) (= (y stone1) 6)) (and (= (x stone1) 27) (= (y stone1) 7)) (and (= (x stone1) 15) (= (y stone1) 29)) (and (= (x stone1) 8) (= (y stone1) 26)) (and (= (x stone1) 18) (= (y stone1) 6)))
	(or (and (= (x stone2) 14) (= (y stone2) 2)) (and (= (x stone2) 9) (= (y stone2) 6)) (and (= (x stone2) 27) (= (y stone2) 7)) (and (= (x stone2) 15) (= (y stone2) 29)) (and (= (x stone2) 8) (= (y stone2) 26)) (and (= (x stone2) 18) (= (y stone2) 6)))
	(or (and (= (x stone3) 14) (= (y stone3) 2)) (and (= (x stone3) 9) (= (y stone3) 6)) (and (= (x stone3) 27) (= (y stone3) 7)) (and (= (x stone3) 15) (= (y stone3) 29)) (and (= (x stone3) 8) (= (y stone3) 26)) (and (= (x stone3) 18) (= (y stone3) 6)))
	(or (and (= (x stone4) 14) (= (y stone4) 2)) (and (= (x stone4) 9) (= (y stone4) 6)) (and (= (x stone4) 27) (= (y stone4) 7)) (and (= (x stone4) 15) (= (y stone4) 29)) (and (= (x stone4) 8) (= (y stone4) 26)) (and (= (x stone4) 18) (= (y stone4) 6)))
	(or (and (= (x stone5) 14) (= (y stone5) 2)) (and (= (x stone5) 9) (= (y stone5) 6)) (and (= (x stone5) 27) (= (y stone5) 7)) (and (= (x stone5) 15) (= (y stone5) 29)) (and (= (x stone5) 8) (= (y stone5) 26)) (and (= (x stone5) 18) (= (y stone5) 6)))
	(or (and (= (x stone6) 14) (= (y stone6) 2)) (and (= (x stone6) 9) (= (y stone6) 6)) (and (= (x stone6) 27) (= (y stone6) 7)) (and (= (x stone6) 15) (= (y stone6) 29)) (and (= (x stone6) 8) (= (y stone6) 26)) (and (= (x stone6) 18) (= (y stone6) 6)))
  ))

  
  

  
)
