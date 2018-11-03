(define (problem instance_40_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 40)
	(= (min_x) 1)
	(= (max_y) 40)
	(= (min_y) 1)
	(= (x player1) 36)
	(= (y player1) 4)
	(= (x stone1) 26)
	(= (y stone1) 16)
	(= (x stone2) 22)
	(= (y stone2) 39)
	(= (x stone3) 18)
	(= (y stone3) 23)
	(= (x stone4) 39)
	(= (y stone4) 17)
	(= (x stone5) 14)
	(= (y stone5) 8)
	(= (x stone6) 23)
	(= (y stone6) 15)
  )

  (:goal (and 
    (or (and (= (x stone1) 4) (= (y stone1) 39)) (and (= (x stone1) 13) (= (y stone1) 22)) (and (= (x stone1) 10) (= (y stone1) 10)) (and (= (x stone1) 40) (= (y stone1) 37)) (and (= (x stone1) 21) (= (y stone1) 8)) (and (= (x stone1) 22) (= (y stone1) 24)))
	(or (and (= (x stone2) 4) (= (y stone2) 39)) (and (= (x stone2) 13) (= (y stone2) 22)) (and (= (x stone2) 10) (= (y stone2) 10)) (and (= (x stone2) 40) (= (y stone2) 37)) (and (= (x stone2) 21) (= (y stone2) 8)) (and (= (x stone2) 22) (= (y stone2) 24)))
	(or (and (= (x stone3) 4) (= (y stone3) 39)) (and (= (x stone3) 13) (= (y stone3) 22)) (and (= (x stone3) 10) (= (y stone3) 10)) (and (= (x stone3) 40) (= (y stone3) 37)) (and (= (x stone3) 21) (= (y stone3) 8)) (and (= (x stone3) 22) (= (y stone3) 24)))
	(or (and (= (x stone4) 4) (= (y stone4) 39)) (and (= (x stone4) 13) (= (y stone4) 22)) (and (= (x stone4) 10) (= (y stone4) 10)) (and (= (x stone4) 40) (= (y stone4) 37)) (and (= (x stone4) 21) (= (y stone4) 8)) (and (= (x stone4) 22) (= (y stone4) 24)))
	(or (and (= (x stone5) 4) (= (y stone5) 39)) (and (= (x stone5) 13) (= (y stone5) 22)) (and (= (x stone5) 10) (= (y stone5) 10)) (and (= (x stone5) 40) (= (y stone5) 37)) (and (= (x stone5) 21) (= (y stone5) 8)) (and (= (x stone5) 22) (= (y stone5) 24)))
	(or (and (= (x stone6) 4) (= (y stone6) 39)) (and (= (x stone6) 13) (= (y stone6) 22)) (and (= (x stone6) 10) (= (y stone6) 10)) (and (= (x stone6) 40) (= (y stone6) 37)) (and (= (x stone6) 21) (= (y stone6) 8)) (and (= (x stone6) 22) (= (y stone6) 24)))
  ))

  
  

  
)
