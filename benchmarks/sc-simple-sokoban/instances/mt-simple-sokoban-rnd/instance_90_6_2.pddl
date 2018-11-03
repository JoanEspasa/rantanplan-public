(define (problem instance_90_6_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 - stone
	player1 - player
  )

  (:init
    (= (max_x) 90)
	(= (min_x) 1)
	(= (max_y) 90)
	(= (min_y) 1)
	(= (x player1) 36)
	(= (y player1) 42)
	(= (x stone1) 87)
	(= (y stone1) 56)
	(= (x stone2) 19)
	(= (y stone2) 89)
	(= (x stone3) 88)
	(= (y stone3) 2)
	(= (x stone4) 85)
	(= (y stone4) 55)
	(= (x stone5) 59)
	(= (y stone5) 26)
	(= (x stone6) 24)
	(= (y stone6) 25)
  )

  (:goal (and 
    (or (and (= (x stone1) 31) (= (y stone1) 9)) (and (= (x stone1) 75) (= (y stone1) 43)) (and (= (x stone1) 59) (= (y stone1) 1)) (and (= (x stone1) 48) (= (y stone1) 16)) (and (= (x stone1) 83) (= (y stone1) 53)) (and (= (x stone1) 70) (= (y stone1) 35)))
	(or (and (= (x stone2) 31) (= (y stone2) 9)) (and (= (x stone2) 75) (= (y stone2) 43)) (and (= (x stone2) 59) (= (y stone2) 1)) (and (= (x stone2) 48) (= (y stone2) 16)) (and (= (x stone2) 83) (= (y stone2) 53)) (and (= (x stone2) 70) (= (y stone2) 35)))
	(or (and (= (x stone3) 31) (= (y stone3) 9)) (and (= (x stone3) 75) (= (y stone3) 43)) (and (= (x stone3) 59) (= (y stone3) 1)) (and (= (x stone3) 48) (= (y stone3) 16)) (and (= (x stone3) 83) (= (y stone3) 53)) (and (= (x stone3) 70) (= (y stone3) 35)))
	(or (and (= (x stone4) 31) (= (y stone4) 9)) (and (= (x stone4) 75) (= (y stone4) 43)) (and (= (x stone4) 59) (= (y stone4) 1)) (and (= (x stone4) 48) (= (y stone4) 16)) (and (= (x stone4) 83) (= (y stone4) 53)) (and (= (x stone4) 70) (= (y stone4) 35)))
	(or (and (= (x stone5) 31) (= (y stone5) 9)) (and (= (x stone5) 75) (= (y stone5) 43)) (and (= (x stone5) 59) (= (y stone5) 1)) (and (= (x stone5) 48) (= (y stone5) 16)) (and (= (x stone5) 83) (= (y stone5) 53)) (and (= (x stone5) 70) (= (y stone5) 35)))
	(or (and (= (x stone6) 31) (= (y stone6) 9)) (and (= (x stone6) 75) (= (y stone6) 43)) (and (= (x stone6) 59) (= (y stone6) 1)) (and (= (x stone6) 48) (= (y stone6) 16)) (and (= (x stone6) 83) (= (y stone6) 53)) (and (= (x stone6) 70) (= (y stone6) 35)))
  ))

  
  

  
)
