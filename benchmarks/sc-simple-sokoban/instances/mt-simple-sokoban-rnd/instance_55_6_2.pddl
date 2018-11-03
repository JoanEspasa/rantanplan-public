(define (problem instance_55_6_2)
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
	(= (x player1) 37)
	(= (y player1) 4)
	(= (x stone1) 33)
	(= (y stone1) 26)
	(= (x stone2) 45)
	(= (y stone2) 22)
	(= (x stone3) 8)
	(= (y stone3) 20)
	(= (x stone4) 54)
	(= (y stone4) 33)
	(= (x stone5) 34)
	(= (y stone5) 11)
	(= (x stone6) 10)
	(= (y stone6) 2)
  )

  (:goal (and 
    (or (and (= (x stone1) 55) (= (y stone1) 26)) (and (= (x stone1) 33) (= (y stone1) 52)) (and (= (x stone1) 24) (= (y stone1) 27)) (and (= (x stone1) 9) (= (y stone1) 53)) (and (= (x stone1) 27) (= (y stone1) 32)) (and (= (x stone1) 42) (= (y stone1) 23)))
	(or (and (= (x stone2) 55) (= (y stone2) 26)) (and (= (x stone2) 33) (= (y stone2) 52)) (and (= (x stone2) 24) (= (y stone2) 27)) (and (= (x stone2) 9) (= (y stone2) 53)) (and (= (x stone2) 27) (= (y stone2) 32)) (and (= (x stone2) 42) (= (y stone2) 23)))
	(or (and (= (x stone3) 55) (= (y stone3) 26)) (and (= (x stone3) 33) (= (y stone3) 52)) (and (= (x stone3) 24) (= (y stone3) 27)) (and (= (x stone3) 9) (= (y stone3) 53)) (and (= (x stone3) 27) (= (y stone3) 32)) (and (= (x stone3) 42) (= (y stone3) 23)))
	(or (and (= (x stone4) 55) (= (y stone4) 26)) (and (= (x stone4) 33) (= (y stone4) 52)) (and (= (x stone4) 24) (= (y stone4) 27)) (and (= (x stone4) 9) (= (y stone4) 53)) (and (= (x stone4) 27) (= (y stone4) 32)) (and (= (x stone4) 42) (= (y stone4) 23)))
	(or (and (= (x stone5) 55) (= (y stone5) 26)) (and (= (x stone5) 33) (= (y stone5) 52)) (and (= (x stone5) 24) (= (y stone5) 27)) (and (= (x stone5) 9) (= (y stone5) 53)) (and (= (x stone5) 27) (= (y stone5) 32)) (and (= (x stone5) 42) (= (y stone5) 23)))
	(or (and (= (x stone6) 55) (= (y stone6) 26)) (and (= (x stone6) 33) (= (y stone6) 52)) (and (= (x stone6) 24) (= (y stone6) 27)) (and (= (x stone6) 9) (= (y stone6) 53)) (and (= (x stone6) 27) (= (y stone6) 32)) (and (= (x stone6) 42) (= (y stone6) 23)))
  ))

  
  

  
)
