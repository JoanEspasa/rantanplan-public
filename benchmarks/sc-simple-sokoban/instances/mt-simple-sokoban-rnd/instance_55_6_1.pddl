(define (problem instance_55_6_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 55)
	(= (min_x) 1)
	(= (max_y) 55)
	(= (min_y) 1)
	(= (x player1) 23)
	(= (y player1) 53)
	(= (x stone1) 14)
	(= (y stone1) 37)
	(= (x stone2) 16)
	(= (y stone2) 48)
	(= (x stone3) 9)
	(= (y stone3) 37)
	(= (x stone4) 34)
	(= (y stone4) 11)
	(= (x stone5) 11)
	(= (y stone5) 20)
	(= (x stone6) 16)
	(= (y stone6) 24)
  )

  (:goal (and 
    (or (and (= (x stone1) 3) (= (y stone1) 14)) (and (= (x stone1) 54) (= (y stone1) 26)) (and (= (x stone1) 53) (= (y stone1) 24)) (and (= (x stone1) 22) (= (y stone1) 43)) (and (= (x stone1) 2) (= (y stone1) 44)) (and (= (x stone1) 44) (= (y stone1) 17)))
	(or (and (= (x stone2) 3) (= (y stone2) 14)) (and (= (x stone2) 54) (= (y stone2) 26)) (and (= (x stone2) 53) (= (y stone2) 24)) (and (= (x stone2) 22) (= (y stone2) 43)) (and (= (x stone2) 2) (= (y stone2) 44)) (and (= (x stone2) 44) (= (y stone2) 17)))
	(or (and (= (x stone3) 3) (= (y stone3) 14)) (and (= (x stone3) 54) (= (y stone3) 26)) (and (= (x stone3) 53) (= (y stone3) 24)) (and (= (x stone3) 22) (= (y stone3) 43)) (and (= (x stone3) 2) (= (y stone3) 44)) (and (= (x stone3) 44) (= (y stone3) 17)))
	(or (and (= (x stone4) 3) (= (y stone4) 14)) (and (= (x stone4) 54) (= (y stone4) 26)) (and (= (x stone4) 53) (= (y stone4) 24)) (and (= (x stone4) 22) (= (y stone4) 43)) (and (= (x stone4) 2) (= (y stone4) 44)) (and (= (x stone4) 44) (= (y stone4) 17)))
	(or (and (= (x stone5) 3) (= (y stone5) 14)) (and (= (x stone5) 54) (= (y stone5) 26)) (and (= (x stone5) 53) (= (y stone5) 24)) (and (= (x stone5) 22) (= (y stone5) 43)) (and (= (x stone5) 2) (= (y stone5) 44)) (and (= (x stone5) 44) (= (y stone5) 17)))
	(or (and (= (x stone6) 3) (= (y stone6) 14)) (and (= (x stone6) 54) (= (y stone6) 26)) (and (= (x stone6) 53) (= (y stone6) 24)) (and (= (x stone6) 22) (= (y stone6) 43)) (and (= (x stone6) 2) (= (y stone6) 44)) (and (= (x stone6) 44) (= (y stone6) 17)))
  ))

  
  

  
)
