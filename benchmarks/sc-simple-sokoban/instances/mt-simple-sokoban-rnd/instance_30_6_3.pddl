(define (problem instance_30_6_3)
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
	(= (x player1) 29)
	(= (y player1) 25)
	(= (x stone1) 15)
	(= (y stone1) 17)
	(= (x stone2) 8)
	(= (y stone2) 26)
	(= (x stone3) 19)
	(= (y stone3) 9)
	(= (x stone4) 2)
	(= (y stone4) 9)
	(= (x stone5) 11)
	(= (y stone5) 21)
	(= (x stone6) 28)
	(= (y stone6) 4)
  )

  (:goal (and 
    (or (and (= (x stone1) 1) (= (y stone1) 25)) (and (= (x stone1) 10) (= (y stone1) 10)) (and (= (x stone1) 7) (= (y stone1) 6)) (and (= (x stone1) 7) (= (y stone1) 11)) (and (= (x stone1) 27) (= (y stone1) 21)) (and (= (x stone1) 20) (= (y stone1) 17)))
	(or (and (= (x stone2) 1) (= (y stone2) 25)) (and (= (x stone2) 10) (= (y stone2) 10)) (and (= (x stone2) 7) (= (y stone2) 6)) (and (= (x stone2) 7) (= (y stone2) 11)) (and (= (x stone2) 27) (= (y stone2) 21)) (and (= (x stone2) 20) (= (y stone2) 17)))
	(or (and (= (x stone3) 1) (= (y stone3) 25)) (and (= (x stone3) 10) (= (y stone3) 10)) (and (= (x stone3) 7) (= (y stone3) 6)) (and (= (x stone3) 7) (= (y stone3) 11)) (and (= (x stone3) 27) (= (y stone3) 21)) (and (= (x stone3) 20) (= (y stone3) 17)))
	(or (and (= (x stone4) 1) (= (y stone4) 25)) (and (= (x stone4) 10) (= (y stone4) 10)) (and (= (x stone4) 7) (= (y stone4) 6)) (and (= (x stone4) 7) (= (y stone4) 11)) (and (= (x stone4) 27) (= (y stone4) 21)) (and (= (x stone4) 20) (= (y stone4) 17)))
	(or (and (= (x stone5) 1) (= (y stone5) 25)) (and (= (x stone5) 10) (= (y stone5) 10)) (and (= (x stone5) 7) (= (y stone5) 6)) (and (= (x stone5) 7) (= (y stone5) 11)) (and (= (x stone5) 27) (= (y stone5) 21)) (and (= (x stone5) 20) (= (y stone5) 17)))
	(or (and (= (x stone6) 1) (= (y stone6) 25)) (and (= (x stone6) 10) (= (y stone6) 10)) (and (= (x stone6) 7) (= (y stone6) 6)) (and (= (x stone6) 7) (= (y stone6) 11)) (and (= (x stone6) 27) (= (y stone6) 21)) (and (= (x stone6) 20) (= (y stone6) 17)))
  ))

  
  

  
)
