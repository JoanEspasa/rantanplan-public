(define (problem instance_90_10_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 90)
	(= (min_x) 1)
	(= (max_y) 90)
	(= (min_y) 1)
	(= (x player1) 60)
	(= (y player1) 89)
	(= (x stone1) 77)
	(= (y stone1) 87)
	(= (x stone2) 62)
	(= (y stone2) 13)
	(= (x stone3) 87)
	(= (y stone3) 23)
	(= (x stone4) 80)
	(= (y stone4) 55)
	(= (x stone5) 59)
	(= (y stone5) 3)
	(= (x stone6) 31)
	(= (y stone6) 89)
	(= (x stone7) 81)
	(= (y stone7) 81)
	(= (x stone8) 22)
	(= (y stone8) 68)
	(= (x stone9) 28)
	(= (y stone9) 29)
	(= (x stone10) 9)
	(= (y stone10) 27)
  )

  (:goal (and 
    (or (and (= (x stone1) 76) (= (y stone1) 89)) (and (= (x stone1) 57) (= (y stone1) 85)) (and (= (x stone1) 86) (= (y stone1) 59)) (and (= (x stone1) 9) (= (y stone1) 74)) (and (= (x stone1) 28) (= (y stone1) 54)) (and (= (x stone1) 30) (= (y stone1) 37)) (and (= (x stone1) 27) (= (y stone1) 79)) (and (= (x stone1) 31) (= (y stone1) 83)) (and (= (x stone1) 49) (= (y stone1) 84)) (and (= (x stone1) 68) (= (y stone1) 65)))
	(or (and (= (x stone2) 76) (= (y stone2) 89)) (and (= (x stone2) 57) (= (y stone2) 85)) (and (= (x stone2) 86) (= (y stone2) 59)) (and (= (x stone2) 9) (= (y stone2) 74)) (and (= (x stone2) 28) (= (y stone2) 54)) (and (= (x stone2) 30) (= (y stone2) 37)) (and (= (x stone2) 27) (= (y stone2) 79)) (and (= (x stone2) 31) (= (y stone2) 83)) (and (= (x stone2) 49) (= (y stone2) 84)) (and (= (x stone2) 68) (= (y stone2) 65)))
	(or (and (= (x stone3) 76) (= (y stone3) 89)) (and (= (x stone3) 57) (= (y stone3) 85)) (and (= (x stone3) 86) (= (y stone3) 59)) (and (= (x stone3) 9) (= (y stone3) 74)) (and (= (x stone3) 28) (= (y stone3) 54)) (and (= (x stone3) 30) (= (y stone3) 37)) (and (= (x stone3) 27) (= (y stone3) 79)) (and (= (x stone3) 31) (= (y stone3) 83)) (and (= (x stone3) 49) (= (y stone3) 84)) (and (= (x stone3) 68) (= (y stone3) 65)))
	(or (and (= (x stone4) 76) (= (y stone4) 89)) (and (= (x stone4) 57) (= (y stone4) 85)) (and (= (x stone4) 86) (= (y stone4) 59)) (and (= (x stone4) 9) (= (y stone4) 74)) (and (= (x stone4) 28) (= (y stone4) 54)) (and (= (x stone4) 30) (= (y stone4) 37)) (and (= (x stone4) 27) (= (y stone4) 79)) (and (= (x stone4) 31) (= (y stone4) 83)) (and (= (x stone4) 49) (= (y stone4) 84)) (and (= (x stone4) 68) (= (y stone4) 65)))
	(or (and (= (x stone5) 76) (= (y stone5) 89)) (and (= (x stone5) 57) (= (y stone5) 85)) (and (= (x stone5) 86) (= (y stone5) 59)) (and (= (x stone5) 9) (= (y stone5) 74)) (and (= (x stone5) 28) (= (y stone5) 54)) (and (= (x stone5) 30) (= (y stone5) 37)) (and (= (x stone5) 27) (= (y stone5) 79)) (and (= (x stone5) 31) (= (y stone5) 83)) (and (= (x stone5) 49) (= (y stone5) 84)) (and (= (x stone5) 68) (= (y stone5) 65)))
	(or (and (= (x stone6) 76) (= (y stone6) 89)) (and (= (x stone6) 57) (= (y stone6) 85)) (and (= (x stone6) 86) (= (y stone6) 59)) (and (= (x stone6) 9) (= (y stone6) 74)) (and (= (x stone6) 28) (= (y stone6) 54)) (and (= (x stone6) 30) (= (y stone6) 37)) (and (= (x stone6) 27) (= (y stone6) 79)) (and (= (x stone6) 31) (= (y stone6) 83)) (and (= (x stone6) 49) (= (y stone6) 84)) (and (= (x stone6) 68) (= (y stone6) 65)))
	(or (and (= (x stone7) 76) (= (y stone7) 89)) (and (= (x stone7) 57) (= (y stone7) 85)) (and (= (x stone7) 86) (= (y stone7) 59)) (and (= (x stone7) 9) (= (y stone7) 74)) (and (= (x stone7) 28) (= (y stone7) 54)) (and (= (x stone7) 30) (= (y stone7) 37)) (and (= (x stone7) 27) (= (y stone7) 79)) (and (= (x stone7) 31) (= (y stone7) 83)) (and (= (x stone7) 49) (= (y stone7) 84)) (and (= (x stone7) 68) (= (y stone7) 65)))
	(or (and (= (x stone8) 76) (= (y stone8) 89)) (and (= (x stone8) 57) (= (y stone8) 85)) (and (= (x stone8) 86) (= (y stone8) 59)) (and (= (x stone8) 9) (= (y stone8) 74)) (and (= (x stone8) 28) (= (y stone8) 54)) (and (= (x stone8) 30) (= (y stone8) 37)) (and (= (x stone8) 27) (= (y stone8) 79)) (and (= (x stone8) 31) (= (y stone8) 83)) (and (= (x stone8) 49) (= (y stone8) 84)) (and (= (x stone8) 68) (= (y stone8) 65)))
	(or (and (= (x stone9) 76) (= (y stone9) 89)) (and (= (x stone9) 57) (= (y stone9) 85)) (and (= (x stone9) 86) (= (y stone9) 59)) (and (= (x stone9) 9) (= (y stone9) 74)) (and (= (x stone9) 28) (= (y stone9) 54)) (and (= (x stone9) 30) (= (y stone9) 37)) (and (= (x stone9) 27) (= (y stone9) 79)) (and (= (x stone9) 31) (= (y stone9) 83)) (and (= (x stone9) 49) (= (y stone9) 84)) (and (= (x stone9) 68) (= (y stone9) 65)))
	(or (and (= (x stone10) 76) (= (y stone10) 89)) (and (= (x stone10) 57) (= (y stone10) 85)) (and (= (x stone10) 86) (= (y stone10) 59)) (and (= (x stone10) 9) (= (y stone10) 74)) (and (= (x stone10) 28) (= (y stone10) 54)) (and (= (x stone10) 30) (= (y stone10) 37)) (and (= (x stone10) 27) (= (y stone10) 79)) (and (= (x stone10) 31) (= (y stone10) 83)) (and (= (x stone10) 49) (= (y stone10) 84)) (and (= (x stone10) 68) (= (y stone10) 65)))
  ))

  
  

  
)
