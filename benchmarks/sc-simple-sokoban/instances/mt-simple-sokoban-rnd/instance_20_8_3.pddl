(define (problem instance_20_8_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 - stone
	player1 - player
  )

  (:init
    (= (max_x) 20)
	(= (min_x) 1)
	(= (max_y) 20)
	(= (min_y) 1)
	(= (x player1) 2)
	(= (y player1) 1)
	(= (x stone1) 12)
	(= (y stone1) 3)
	(= (x stone2) 13)
	(= (y stone2) 6)
	(= (x stone3) 8)
	(= (y stone3) 4)
	(= (x stone4) 12)
	(= (y stone4) 4)
	(= (x stone5) 10)
	(= (y stone5) 8)
	(= (x stone6) 3)
	(= (y stone6) 6)
	(= (x stone7) 7)
	(= (y stone7) 18)
	(= (x stone8) 12)
	(= (y stone8) 9)
  )

  (:goal (and 
    (or (and (= (x stone1) 4) (= (y stone1) 9)) (and (= (x stone1) 12) (= (y stone1) 20)) (and (= (x stone1) 17) (= (y stone1) 13)) (and (= (x stone1) 9) (= (y stone1) 11)) (and (= (x stone1) 7) (= (y stone1) 5)) (and (= (x stone1) 7) (= (y stone1) 19)) (and (= (x stone1) 15) (= (y stone1) 6)) (and (= (x stone1) 17) (= (y stone1) 2)))
	(or (and (= (x stone2) 4) (= (y stone2) 9)) (and (= (x stone2) 12) (= (y stone2) 20)) (and (= (x stone2) 17) (= (y stone2) 13)) (and (= (x stone2) 9) (= (y stone2) 11)) (and (= (x stone2) 7) (= (y stone2) 5)) (and (= (x stone2) 7) (= (y stone2) 19)) (and (= (x stone2) 15) (= (y stone2) 6)) (and (= (x stone2) 17) (= (y stone2) 2)))
	(or (and (= (x stone3) 4) (= (y stone3) 9)) (and (= (x stone3) 12) (= (y stone3) 20)) (and (= (x stone3) 17) (= (y stone3) 13)) (and (= (x stone3) 9) (= (y stone3) 11)) (and (= (x stone3) 7) (= (y stone3) 5)) (and (= (x stone3) 7) (= (y stone3) 19)) (and (= (x stone3) 15) (= (y stone3) 6)) (and (= (x stone3) 17) (= (y stone3) 2)))
	(or (and (= (x stone4) 4) (= (y stone4) 9)) (and (= (x stone4) 12) (= (y stone4) 20)) (and (= (x stone4) 17) (= (y stone4) 13)) (and (= (x stone4) 9) (= (y stone4) 11)) (and (= (x stone4) 7) (= (y stone4) 5)) (and (= (x stone4) 7) (= (y stone4) 19)) (and (= (x stone4) 15) (= (y stone4) 6)) (and (= (x stone4) 17) (= (y stone4) 2)))
	(or (and (= (x stone5) 4) (= (y stone5) 9)) (and (= (x stone5) 12) (= (y stone5) 20)) (and (= (x stone5) 17) (= (y stone5) 13)) (and (= (x stone5) 9) (= (y stone5) 11)) (and (= (x stone5) 7) (= (y stone5) 5)) (and (= (x stone5) 7) (= (y stone5) 19)) (and (= (x stone5) 15) (= (y stone5) 6)) (and (= (x stone5) 17) (= (y stone5) 2)))
	(or (and (= (x stone6) 4) (= (y stone6) 9)) (and (= (x stone6) 12) (= (y stone6) 20)) (and (= (x stone6) 17) (= (y stone6) 13)) (and (= (x stone6) 9) (= (y stone6) 11)) (and (= (x stone6) 7) (= (y stone6) 5)) (and (= (x stone6) 7) (= (y stone6) 19)) (and (= (x stone6) 15) (= (y stone6) 6)) (and (= (x stone6) 17) (= (y stone6) 2)))
	(or (and (= (x stone7) 4) (= (y stone7) 9)) (and (= (x stone7) 12) (= (y stone7) 20)) (and (= (x stone7) 17) (= (y stone7) 13)) (and (= (x stone7) 9) (= (y stone7) 11)) (and (= (x stone7) 7) (= (y stone7) 5)) (and (= (x stone7) 7) (= (y stone7) 19)) (and (= (x stone7) 15) (= (y stone7) 6)) (and (= (x stone7) 17) (= (y stone7) 2)))
	(or (and (= (x stone8) 4) (= (y stone8) 9)) (and (= (x stone8) 12) (= (y stone8) 20)) (and (= (x stone8) 17) (= (y stone8) 13)) (and (= (x stone8) 9) (= (y stone8) 11)) (and (= (x stone8) 7) (= (y stone8) 5)) (and (= (x stone8) 7) (= (y stone8) 19)) (and (= (x stone8) 15) (= (y stone8) 6)) (and (= (x stone8) 17) (= (y stone8) 2)))
  ))

  
  

  
)
