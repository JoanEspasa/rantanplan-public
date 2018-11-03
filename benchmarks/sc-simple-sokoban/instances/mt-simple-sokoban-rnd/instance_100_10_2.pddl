(define (problem instance_100_10_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 100)
	(= (min_x) 1)
	(= (max_y) 100)
	(= (min_y) 1)
	(= (x player1) 82)
	(= (y player1) 86)
	(= (x stone1) 7)
	(= (y stone1) 7)
	(= (x stone2) 72)
	(= (y stone2) 26)
	(= (x stone3) 85)
	(= (y stone3) 23)
	(= (x stone4) 90)
	(= (y stone4) 75)
	(= (x stone5) 77)
	(= (y stone5) 15)
	(= (x stone6) 84)
	(= (y stone6) 56)
	(= (x stone7) 80)
	(= (y stone7) 61)
	(= (x stone8) 13)
	(= (y stone8) 63)
	(= (x stone9) 33)
	(= (y stone9) 2)
	(= (x stone10) 75)
	(= (y stone10) 56)
  )

  (:goal (and 
    (or (and (= (x stone1) 61) (= (y stone1) 89)) (and (= (x stone1) 20) (= (y stone1) 78)) (and (= (x stone1) 13) (= (y stone1) 28)) (and (= (x stone1) 15) (= (y stone1) 22)) (and (= (x stone1) 30) (= (y stone1) 36)) (and (= (x stone1) 2) (= (y stone1) 59)) (and (= (x stone1) 58) (= (y stone1) 67)) (and (= (x stone1) 71) (= (y stone1) 61)) (and (= (x stone1) 39) (= (y stone1) 79)) (and (= (x stone1) 50) (= (y stone1) 44)))
	(or (and (= (x stone2) 61) (= (y stone2) 89)) (and (= (x stone2) 20) (= (y stone2) 78)) (and (= (x stone2) 13) (= (y stone2) 28)) (and (= (x stone2) 15) (= (y stone2) 22)) (and (= (x stone2) 30) (= (y stone2) 36)) (and (= (x stone2) 2) (= (y stone2) 59)) (and (= (x stone2) 58) (= (y stone2) 67)) (and (= (x stone2) 71) (= (y stone2) 61)) (and (= (x stone2) 39) (= (y stone2) 79)) (and (= (x stone2) 50) (= (y stone2) 44)))
	(or (and (= (x stone3) 61) (= (y stone3) 89)) (and (= (x stone3) 20) (= (y stone3) 78)) (and (= (x stone3) 13) (= (y stone3) 28)) (and (= (x stone3) 15) (= (y stone3) 22)) (and (= (x stone3) 30) (= (y stone3) 36)) (and (= (x stone3) 2) (= (y stone3) 59)) (and (= (x stone3) 58) (= (y stone3) 67)) (and (= (x stone3) 71) (= (y stone3) 61)) (and (= (x stone3) 39) (= (y stone3) 79)) (and (= (x stone3) 50) (= (y stone3) 44)))
	(or (and (= (x stone4) 61) (= (y stone4) 89)) (and (= (x stone4) 20) (= (y stone4) 78)) (and (= (x stone4) 13) (= (y stone4) 28)) (and (= (x stone4) 15) (= (y stone4) 22)) (and (= (x stone4) 30) (= (y stone4) 36)) (and (= (x stone4) 2) (= (y stone4) 59)) (and (= (x stone4) 58) (= (y stone4) 67)) (and (= (x stone4) 71) (= (y stone4) 61)) (and (= (x stone4) 39) (= (y stone4) 79)) (and (= (x stone4) 50) (= (y stone4) 44)))
	(or (and (= (x stone5) 61) (= (y stone5) 89)) (and (= (x stone5) 20) (= (y stone5) 78)) (and (= (x stone5) 13) (= (y stone5) 28)) (and (= (x stone5) 15) (= (y stone5) 22)) (and (= (x stone5) 30) (= (y stone5) 36)) (and (= (x stone5) 2) (= (y stone5) 59)) (and (= (x stone5) 58) (= (y stone5) 67)) (and (= (x stone5) 71) (= (y stone5) 61)) (and (= (x stone5) 39) (= (y stone5) 79)) (and (= (x stone5) 50) (= (y stone5) 44)))
	(or (and (= (x stone6) 61) (= (y stone6) 89)) (and (= (x stone6) 20) (= (y stone6) 78)) (and (= (x stone6) 13) (= (y stone6) 28)) (and (= (x stone6) 15) (= (y stone6) 22)) (and (= (x stone6) 30) (= (y stone6) 36)) (and (= (x stone6) 2) (= (y stone6) 59)) (and (= (x stone6) 58) (= (y stone6) 67)) (and (= (x stone6) 71) (= (y stone6) 61)) (and (= (x stone6) 39) (= (y stone6) 79)) (and (= (x stone6) 50) (= (y stone6) 44)))
	(or (and (= (x stone7) 61) (= (y stone7) 89)) (and (= (x stone7) 20) (= (y stone7) 78)) (and (= (x stone7) 13) (= (y stone7) 28)) (and (= (x stone7) 15) (= (y stone7) 22)) (and (= (x stone7) 30) (= (y stone7) 36)) (and (= (x stone7) 2) (= (y stone7) 59)) (and (= (x stone7) 58) (= (y stone7) 67)) (and (= (x stone7) 71) (= (y stone7) 61)) (and (= (x stone7) 39) (= (y stone7) 79)) (and (= (x stone7) 50) (= (y stone7) 44)))
	(or (and (= (x stone8) 61) (= (y stone8) 89)) (and (= (x stone8) 20) (= (y stone8) 78)) (and (= (x stone8) 13) (= (y stone8) 28)) (and (= (x stone8) 15) (= (y stone8) 22)) (and (= (x stone8) 30) (= (y stone8) 36)) (and (= (x stone8) 2) (= (y stone8) 59)) (and (= (x stone8) 58) (= (y stone8) 67)) (and (= (x stone8) 71) (= (y stone8) 61)) (and (= (x stone8) 39) (= (y stone8) 79)) (and (= (x stone8) 50) (= (y stone8) 44)))
	(or (and (= (x stone9) 61) (= (y stone9) 89)) (and (= (x stone9) 20) (= (y stone9) 78)) (and (= (x stone9) 13) (= (y stone9) 28)) (and (= (x stone9) 15) (= (y stone9) 22)) (and (= (x stone9) 30) (= (y stone9) 36)) (and (= (x stone9) 2) (= (y stone9) 59)) (and (= (x stone9) 58) (= (y stone9) 67)) (and (= (x stone9) 71) (= (y stone9) 61)) (and (= (x stone9) 39) (= (y stone9) 79)) (and (= (x stone9) 50) (= (y stone9) 44)))
	(or (and (= (x stone10) 61) (= (y stone10) 89)) (and (= (x stone10) 20) (= (y stone10) 78)) (and (= (x stone10) 13) (= (y stone10) 28)) (and (= (x stone10) 15) (= (y stone10) 22)) (and (= (x stone10) 30) (= (y stone10) 36)) (and (= (x stone10) 2) (= (y stone10) 59)) (and (= (x stone10) 58) (= (y stone10) 67)) (and (= (x stone10) 71) (= (y stone10) 61)) (and (= (x stone10) 39) (= (y stone10) 79)) (and (= (x stone10) 50) (= (y stone10) 44)))
  ))

  
  

  
)
