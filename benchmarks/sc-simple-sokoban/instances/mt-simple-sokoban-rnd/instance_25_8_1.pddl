(define (problem instance_25_8_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 - stone
	player1 - player
  )

  (:init
    (= (max_x) 25)
	(= (min_x) 1)
	(= (max_y) 25)
	(= (min_y) 1)
	(= (x player1) 21)
	(= (y player1) 3)
	(= (x stone1) 21)
	(= (y stone1) 20)
	(= (x stone2) 18)
	(= (y stone2) 23)
	(= (x stone3) 16)
	(= (y stone3) 5)
	(= (x stone4) 20)
	(= (y stone4) 19)
	(= (x stone5) 11)
	(= (y stone5) 10)
	(= (x stone6) 15)
	(= (y stone6) 13)
	(= (x stone7) 9)
	(= (y stone7) 23)
	(= (x stone8) 18)
	(= (y stone8) 18)
  )

  (:goal (and 
    (or (and (= (x stone1) 21) (= (y stone1) 1)) (and (= (x stone1) 14) (= (y stone1) 1)) (and (= (x stone1) 14) (= (y stone1) 25)) (and (= (x stone1) 25) (= (y stone1) 16)) (and (= (x stone1) 22) (= (y stone1) 17)) (and (= (x stone1) 18) (= (y stone1) 22)) (and (= (x stone1) 19) (= (y stone1) 21)) (and (= (x stone1) 22) (= (y stone1) 15)))
	(or (and (= (x stone2) 21) (= (y stone2) 1)) (and (= (x stone2) 14) (= (y stone2) 1)) (and (= (x stone2) 14) (= (y stone2) 25)) (and (= (x stone2) 25) (= (y stone2) 16)) (and (= (x stone2) 22) (= (y stone2) 17)) (and (= (x stone2) 18) (= (y stone2) 22)) (and (= (x stone2) 19) (= (y stone2) 21)) (and (= (x stone2) 22) (= (y stone2) 15)))
	(or (and (= (x stone3) 21) (= (y stone3) 1)) (and (= (x stone3) 14) (= (y stone3) 1)) (and (= (x stone3) 14) (= (y stone3) 25)) (and (= (x stone3) 25) (= (y stone3) 16)) (and (= (x stone3) 22) (= (y stone3) 17)) (and (= (x stone3) 18) (= (y stone3) 22)) (and (= (x stone3) 19) (= (y stone3) 21)) (and (= (x stone3) 22) (= (y stone3) 15)))
	(or (and (= (x stone4) 21) (= (y stone4) 1)) (and (= (x stone4) 14) (= (y stone4) 1)) (and (= (x stone4) 14) (= (y stone4) 25)) (and (= (x stone4) 25) (= (y stone4) 16)) (and (= (x stone4) 22) (= (y stone4) 17)) (and (= (x stone4) 18) (= (y stone4) 22)) (and (= (x stone4) 19) (= (y stone4) 21)) (and (= (x stone4) 22) (= (y stone4) 15)))
	(or (and (= (x stone5) 21) (= (y stone5) 1)) (and (= (x stone5) 14) (= (y stone5) 1)) (and (= (x stone5) 14) (= (y stone5) 25)) (and (= (x stone5) 25) (= (y stone5) 16)) (and (= (x stone5) 22) (= (y stone5) 17)) (and (= (x stone5) 18) (= (y stone5) 22)) (and (= (x stone5) 19) (= (y stone5) 21)) (and (= (x stone5) 22) (= (y stone5) 15)))
	(or (and (= (x stone6) 21) (= (y stone6) 1)) (and (= (x stone6) 14) (= (y stone6) 1)) (and (= (x stone6) 14) (= (y stone6) 25)) (and (= (x stone6) 25) (= (y stone6) 16)) (and (= (x stone6) 22) (= (y stone6) 17)) (and (= (x stone6) 18) (= (y stone6) 22)) (and (= (x stone6) 19) (= (y stone6) 21)) (and (= (x stone6) 22) (= (y stone6) 15)))
	(or (and (= (x stone7) 21) (= (y stone7) 1)) (and (= (x stone7) 14) (= (y stone7) 1)) (and (= (x stone7) 14) (= (y stone7) 25)) (and (= (x stone7) 25) (= (y stone7) 16)) (and (= (x stone7) 22) (= (y stone7) 17)) (and (= (x stone7) 18) (= (y stone7) 22)) (and (= (x stone7) 19) (= (y stone7) 21)) (and (= (x stone7) 22) (= (y stone7) 15)))
	(or (and (= (x stone8) 21) (= (y stone8) 1)) (and (= (x stone8) 14) (= (y stone8) 1)) (and (= (x stone8) 14) (= (y stone8) 25)) (and (= (x stone8) 25) (= (y stone8) 16)) (and (= (x stone8) 22) (= (y stone8) 17)) (and (= (x stone8) 18) (= (y stone8) 22)) (and (= (x stone8) 19) (= (y stone8) 21)) (and (= (x stone8) 22) (= (y stone8) 15)))
  ))

  
  

  
)
