(define (problem instance_70_10_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 70)
	(= (min_x) 1)
	(= (max_y) 70)
	(= (min_y) 1)
	(= (x player1) 39)
	(= (y player1) 69)
	(= (x stone1) 16)
	(= (y stone1) 5)
	(= (x stone2) 68)
	(= (y stone2) 23)
	(= (x stone3) 66)
	(= (y stone3) 10)
	(= (x stone4) 67)
	(= (y stone4) 30)
	(= (x stone5) 31)
	(= (y stone5) 58)
	(= (x stone6) 30)
	(= (y stone6) 26)
	(= (x stone7) 49)
	(= (y stone7) 23)
	(= (x stone8) 39)
	(= (y stone8) 19)
	(= (x stone9) 22)
	(= (y stone9) 7)
	(= (x stone10) 54)
	(= (y stone10) 57)
  )

  (:goal (and 
    (or (and (= (x stone1) 7) (= (y stone1) 66)) (and (= (x stone1) 56) (= (y stone1) 10)) (and (= (x stone1) 21) (= (y stone1) 2)) (and (= (x stone1) 22) (= (y stone1) 64)) (and (= (x stone1) 50) (= (y stone1) 7)) (and (= (x stone1) 46) (= (y stone1) 59)) (and (= (x stone1) 23) (= (y stone1) 68)) (and (= (x stone1) 21) (= (y stone1) 4)) (and (= (x stone1) 44) (= (y stone1) 20)) (and (= (x stone1) 15) (= (y stone1) 19)))
	(or (and (= (x stone2) 7) (= (y stone2) 66)) (and (= (x stone2) 56) (= (y stone2) 10)) (and (= (x stone2) 21) (= (y stone2) 2)) (and (= (x stone2) 22) (= (y stone2) 64)) (and (= (x stone2) 50) (= (y stone2) 7)) (and (= (x stone2) 46) (= (y stone2) 59)) (and (= (x stone2) 23) (= (y stone2) 68)) (and (= (x stone2) 21) (= (y stone2) 4)) (and (= (x stone2) 44) (= (y stone2) 20)) (and (= (x stone2) 15) (= (y stone2) 19)))
	(or (and (= (x stone3) 7) (= (y stone3) 66)) (and (= (x stone3) 56) (= (y stone3) 10)) (and (= (x stone3) 21) (= (y stone3) 2)) (and (= (x stone3) 22) (= (y stone3) 64)) (and (= (x stone3) 50) (= (y stone3) 7)) (and (= (x stone3) 46) (= (y stone3) 59)) (and (= (x stone3) 23) (= (y stone3) 68)) (and (= (x stone3) 21) (= (y stone3) 4)) (and (= (x stone3) 44) (= (y stone3) 20)) (and (= (x stone3) 15) (= (y stone3) 19)))
	(or (and (= (x stone4) 7) (= (y stone4) 66)) (and (= (x stone4) 56) (= (y stone4) 10)) (and (= (x stone4) 21) (= (y stone4) 2)) (and (= (x stone4) 22) (= (y stone4) 64)) (and (= (x stone4) 50) (= (y stone4) 7)) (and (= (x stone4) 46) (= (y stone4) 59)) (and (= (x stone4) 23) (= (y stone4) 68)) (and (= (x stone4) 21) (= (y stone4) 4)) (and (= (x stone4) 44) (= (y stone4) 20)) (and (= (x stone4) 15) (= (y stone4) 19)))
	(or (and (= (x stone5) 7) (= (y stone5) 66)) (and (= (x stone5) 56) (= (y stone5) 10)) (and (= (x stone5) 21) (= (y stone5) 2)) (and (= (x stone5) 22) (= (y stone5) 64)) (and (= (x stone5) 50) (= (y stone5) 7)) (and (= (x stone5) 46) (= (y stone5) 59)) (and (= (x stone5) 23) (= (y stone5) 68)) (and (= (x stone5) 21) (= (y stone5) 4)) (and (= (x stone5) 44) (= (y stone5) 20)) (and (= (x stone5) 15) (= (y stone5) 19)))
	(or (and (= (x stone6) 7) (= (y stone6) 66)) (and (= (x stone6) 56) (= (y stone6) 10)) (and (= (x stone6) 21) (= (y stone6) 2)) (and (= (x stone6) 22) (= (y stone6) 64)) (and (= (x stone6) 50) (= (y stone6) 7)) (and (= (x stone6) 46) (= (y stone6) 59)) (and (= (x stone6) 23) (= (y stone6) 68)) (and (= (x stone6) 21) (= (y stone6) 4)) (and (= (x stone6) 44) (= (y stone6) 20)) (and (= (x stone6) 15) (= (y stone6) 19)))
	(or (and (= (x stone7) 7) (= (y stone7) 66)) (and (= (x stone7) 56) (= (y stone7) 10)) (and (= (x stone7) 21) (= (y stone7) 2)) (and (= (x stone7) 22) (= (y stone7) 64)) (and (= (x stone7) 50) (= (y stone7) 7)) (and (= (x stone7) 46) (= (y stone7) 59)) (and (= (x stone7) 23) (= (y stone7) 68)) (and (= (x stone7) 21) (= (y stone7) 4)) (and (= (x stone7) 44) (= (y stone7) 20)) (and (= (x stone7) 15) (= (y stone7) 19)))
	(or (and (= (x stone8) 7) (= (y stone8) 66)) (and (= (x stone8) 56) (= (y stone8) 10)) (and (= (x stone8) 21) (= (y stone8) 2)) (and (= (x stone8) 22) (= (y stone8) 64)) (and (= (x stone8) 50) (= (y stone8) 7)) (and (= (x stone8) 46) (= (y stone8) 59)) (and (= (x stone8) 23) (= (y stone8) 68)) (and (= (x stone8) 21) (= (y stone8) 4)) (and (= (x stone8) 44) (= (y stone8) 20)) (and (= (x stone8) 15) (= (y stone8) 19)))
	(or (and (= (x stone9) 7) (= (y stone9) 66)) (and (= (x stone9) 56) (= (y stone9) 10)) (and (= (x stone9) 21) (= (y stone9) 2)) (and (= (x stone9) 22) (= (y stone9) 64)) (and (= (x stone9) 50) (= (y stone9) 7)) (and (= (x stone9) 46) (= (y stone9) 59)) (and (= (x stone9) 23) (= (y stone9) 68)) (and (= (x stone9) 21) (= (y stone9) 4)) (and (= (x stone9) 44) (= (y stone9) 20)) (and (= (x stone9) 15) (= (y stone9) 19)))
	(or (and (= (x stone10) 7) (= (y stone10) 66)) (and (= (x stone10) 56) (= (y stone10) 10)) (and (= (x stone10) 21) (= (y stone10) 2)) (and (= (x stone10) 22) (= (y stone10) 64)) (and (= (x stone10) 50) (= (y stone10) 7)) (and (= (x stone10) 46) (= (y stone10) 59)) (and (= (x stone10) 23) (= (y stone10) 68)) (and (= (x stone10) 21) (= (y stone10) 4)) (and (= (x stone10) 44) (= (y stone10) 20)) (and (= (x stone10) 15) (= (y stone10) 19)))
  ))

  
  

  
)
