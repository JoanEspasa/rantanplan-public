(define (problem instance_95_6_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 95)
	(= (min_x) 1)
	(= (max_y) 95)
	(= (min_y) 1)
	(= (x player1) 24)
	(= (y player1) 3)
	(= (x stone1) 77)
	(= (y stone1) 47)
	(= (x stone2) 86)
	(= (y stone2) 51)
	(= (x stone3) 73)
	(= (y stone3) 89)
	(= (x stone4) 88)
	(= (y stone4) 37)
	(= (x stone5) 35)
	(= (y stone5) 26)
	(= (x stone6) 5)
	(= (y stone6) 66)
  )

  (:goal (and 
    (or (and (= (x stone1) 61) (= (y stone1) 79)) (and (= (x stone1) 25) (= (y stone1) 26)) (and (= (x stone1) 70) (= (y stone1) 32)) (and (= (x stone1) 23) (= (y stone1) 56)) (and (= (x stone1) 26) (= (y stone1) 52)) (and (= (x stone1) 7) (= (y stone1) 9)))
	(or (and (= (x stone2) 61) (= (y stone2) 79)) (and (= (x stone2) 25) (= (y stone2) 26)) (and (= (x stone2) 70) (= (y stone2) 32)) (and (= (x stone2) 23) (= (y stone2) 56)) (and (= (x stone2) 26) (= (y stone2) 52)) (and (= (x stone2) 7) (= (y stone2) 9)))
	(or (and (= (x stone3) 61) (= (y stone3) 79)) (and (= (x stone3) 25) (= (y stone3) 26)) (and (= (x stone3) 70) (= (y stone3) 32)) (and (= (x stone3) 23) (= (y stone3) 56)) (and (= (x stone3) 26) (= (y stone3) 52)) (and (= (x stone3) 7) (= (y stone3) 9)))
	(or (and (= (x stone4) 61) (= (y stone4) 79)) (and (= (x stone4) 25) (= (y stone4) 26)) (and (= (x stone4) 70) (= (y stone4) 32)) (and (= (x stone4) 23) (= (y stone4) 56)) (and (= (x stone4) 26) (= (y stone4) 52)) (and (= (x stone4) 7) (= (y stone4) 9)))
	(or (and (= (x stone5) 61) (= (y stone5) 79)) (and (= (x stone5) 25) (= (y stone5) 26)) (and (= (x stone5) 70) (= (y stone5) 32)) (and (= (x stone5) 23) (= (y stone5) 56)) (and (= (x stone5) 26) (= (y stone5) 52)) (and (= (x stone5) 7) (= (y stone5) 9)))
	(or (and (= (x stone6) 61) (= (y stone6) 79)) (and (= (x stone6) 25) (= (y stone6) 26)) (and (= (x stone6) 70) (= (y stone6) 32)) (and (= (x stone6) 23) (= (y stone6) 56)) (and (= (x stone6) 26) (= (y stone6) 52)) (and (= (x stone6) 7) (= (y stone6) 9)))
  ))

  
  

  
)
