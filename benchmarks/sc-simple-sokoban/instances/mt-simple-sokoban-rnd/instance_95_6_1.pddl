(define (problem instance_95_6_1)
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
	(= (x player1) 10)
	(= (y player1) 60)
	(= (x stone1) 80)
	(= (y stone1) 52)
	(= (x stone2) 67)
	(= (y stone2) 17)
	(= (x stone3) 41)
	(= (y stone3) 27)
	(= (x stone4) 58)
	(= (y stone4) 42)
	(= (x stone5) 36)
	(= (y stone5) 79)
	(= (x stone6) 13)
	(= (y stone6) 59)
  )

  (:goal (and 
    (or (and (= (x stone1) 86) (= (y stone1) 78)) (and (= (x stone1) 61) (= (y stone1) 59)) (and (= (x stone1) 63) (= (y stone1) 90)) (and (= (x stone1) 88) (= (y stone1) 9)) (and (= (x stone1) 85) (= (y stone1) 67)) (and (= (x stone1) 17) (= (y stone1) 61)))
	(or (and (= (x stone2) 86) (= (y stone2) 78)) (and (= (x stone2) 61) (= (y stone2) 59)) (and (= (x stone2) 63) (= (y stone2) 90)) (and (= (x stone2) 88) (= (y stone2) 9)) (and (= (x stone2) 85) (= (y stone2) 67)) (and (= (x stone2) 17) (= (y stone2) 61)))
	(or (and (= (x stone3) 86) (= (y stone3) 78)) (and (= (x stone3) 61) (= (y stone3) 59)) (and (= (x stone3) 63) (= (y stone3) 90)) (and (= (x stone3) 88) (= (y stone3) 9)) (and (= (x stone3) 85) (= (y stone3) 67)) (and (= (x stone3) 17) (= (y stone3) 61)))
	(or (and (= (x stone4) 86) (= (y stone4) 78)) (and (= (x stone4) 61) (= (y stone4) 59)) (and (= (x stone4) 63) (= (y stone4) 90)) (and (= (x stone4) 88) (= (y stone4) 9)) (and (= (x stone4) 85) (= (y stone4) 67)) (and (= (x stone4) 17) (= (y stone4) 61)))
	(or (and (= (x stone5) 86) (= (y stone5) 78)) (and (= (x stone5) 61) (= (y stone5) 59)) (and (= (x stone5) 63) (= (y stone5) 90)) (and (= (x stone5) 88) (= (y stone5) 9)) (and (= (x stone5) 85) (= (y stone5) 67)) (and (= (x stone5) 17) (= (y stone5) 61)))
	(or (and (= (x stone6) 86) (= (y stone6) 78)) (and (= (x stone6) 61) (= (y stone6) 59)) (and (= (x stone6) 63) (= (y stone6) 90)) (and (= (x stone6) 88) (= (y stone6) 9)) (and (= (x stone6) 85) (= (y stone6) 67)) (and (= (x stone6) 17) (= (y stone6) 61)))
  ))

  
  

  
)
