(define (problem instance_60_10_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 60)
	(= (min_x) 1)
	(= (max_y) 60)
	(= (min_y) 1)
	(= (x player1) 28)
	(= (y player1) 16)
	(= (x stone1) 28)
	(= (y stone1) 3)
	(= (x stone2) 28)
	(= (y stone2) 31)
	(= (x stone3) 3)
	(= (y stone3) 16)
	(= (x stone4) 9)
	(= (y stone4) 36)
	(= (x stone5) 8)
	(= (y stone5) 43)
	(= (x stone6) 23)
	(= (y stone6) 54)
	(= (x stone7) 17)
	(= (y stone7) 18)
	(= (x stone8) 5)
	(= (y stone8) 40)
	(= (x stone9) 16)
	(= (y stone9) 20)
	(= (x stone10) 23)
	(= (y stone10) 38)
  )

  (:goal (and 
    (or (and (= (x stone1) 2) (= (y stone1) 5)) (and (= (x stone1) 10) (= (y stone1) 10)) (and (= (x stone1) 16) (= (y stone1) 9)) (and (= (x stone1) 52) (= (y stone1) 35)) (and (= (x stone1) 46) (= (y stone1) 16)) (and (= (x stone1) 57) (= (y stone1) 57)) (and (= (x stone1) 46) (= (y stone1) 7)) (and (= (x stone1) 7) (= (y stone1) 54)) (and (= (x stone1) 26) (= (y stone1) 36)) (and (= (x stone1) 38) (= (y stone1) 27)))
	(or (and (= (x stone2) 2) (= (y stone2) 5)) (and (= (x stone2) 10) (= (y stone2) 10)) (and (= (x stone2) 16) (= (y stone2) 9)) (and (= (x stone2) 52) (= (y stone2) 35)) (and (= (x stone2) 46) (= (y stone2) 16)) (and (= (x stone2) 57) (= (y stone2) 57)) (and (= (x stone2) 46) (= (y stone2) 7)) (and (= (x stone2) 7) (= (y stone2) 54)) (and (= (x stone2) 26) (= (y stone2) 36)) (and (= (x stone2) 38) (= (y stone2) 27)))
	(or (and (= (x stone3) 2) (= (y stone3) 5)) (and (= (x stone3) 10) (= (y stone3) 10)) (and (= (x stone3) 16) (= (y stone3) 9)) (and (= (x stone3) 52) (= (y stone3) 35)) (and (= (x stone3) 46) (= (y stone3) 16)) (and (= (x stone3) 57) (= (y stone3) 57)) (and (= (x stone3) 46) (= (y stone3) 7)) (and (= (x stone3) 7) (= (y stone3) 54)) (and (= (x stone3) 26) (= (y stone3) 36)) (and (= (x stone3) 38) (= (y stone3) 27)))
	(or (and (= (x stone4) 2) (= (y stone4) 5)) (and (= (x stone4) 10) (= (y stone4) 10)) (and (= (x stone4) 16) (= (y stone4) 9)) (and (= (x stone4) 52) (= (y stone4) 35)) (and (= (x stone4) 46) (= (y stone4) 16)) (and (= (x stone4) 57) (= (y stone4) 57)) (and (= (x stone4) 46) (= (y stone4) 7)) (and (= (x stone4) 7) (= (y stone4) 54)) (and (= (x stone4) 26) (= (y stone4) 36)) (and (= (x stone4) 38) (= (y stone4) 27)))
	(or (and (= (x stone5) 2) (= (y stone5) 5)) (and (= (x stone5) 10) (= (y stone5) 10)) (and (= (x stone5) 16) (= (y stone5) 9)) (and (= (x stone5) 52) (= (y stone5) 35)) (and (= (x stone5) 46) (= (y stone5) 16)) (and (= (x stone5) 57) (= (y stone5) 57)) (and (= (x stone5) 46) (= (y stone5) 7)) (and (= (x stone5) 7) (= (y stone5) 54)) (and (= (x stone5) 26) (= (y stone5) 36)) (and (= (x stone5) 38) (= (y stone5) 27)))
	(or (and (= (x stone6) 2) (= (y stone6) 5)) (and (= (x stone6) 10) (= (y stone6) 10)) (and (= (x stone6) 16) (= (y stone6) 9)) (and (= (x stone6) 52) (= (y stone6) 35)) (and (= (x stone6) 46) (= (y stone6) 16)) (and (= (x stone6) 57) (= (y stone6) 57)) (and (= (x stone6) 46) (= (y stone6) 7)) (and (= (x stone6) 7) (= (y stone6) 54)) (and (= (x stone6) 26) (= (y stone6) 36)) (and (= (x stone6) 38) (= (y stone6) 27)))
	(or (and (= (x stone7) 2) (= (y stone7) 5)) (and (= (x stone7) 10) (= (y stone7) 10)) (and (= (x stone7) 16) (= (y stone7) 9)) (and (= (x stone7) 52) (= (y stone7) 35)) (and (= (x stone7) 46) (= (y stone7) 16)) (and (= (x stone7) 57) (= (y stone7) 57)) (and (= (x stone7) 46) (= (y stone7) 7)) (and (= (x stone7) 7) (= (y stone7) 54)) (and (= (x stone7) 26) (= (y stone7) 36)) (and (= (x stone7) 38) (= (y stone7) 27)))
	(or (and (= (x stone8) 2) (= (y stone8) 5)) (and (= (x stone8) 10) (= (y stone8) 10)) (and (= (x stone8) 16) (= (y stone8) 9)) (and (= (x stone8) 52) (= (y stone8) 35)) (and (= (x stone8) 46) (= (y stone8) 16)) (and (= (x stone8) 57) (= (y stone8) 57)) (and (= (x stone8) 46) (= (y stone8) 7)) (and (= (x stone8) 7) (= (y stone8) 54)) (and (= (x stone8) 26) (= (y stone8) 36)) (and (= (x stone8) 38) (= (y stone8) 27)))
	(or (and (= (x stone9) 2) (= (y stone9) 5)) (and (= (x stone9) 10) (= (y stone9) 10)) (and (= (x stone9) 16) (= (y stone9) 9)) (and (= (x stone9) 52) (= (y stone9) 35)) (and (= (x stone9) 46) (= (y stone9) 16)) (and (= (x stone9) 57) (= (y stone9) 57)) (and (= (x stone9) 46) (= (y stone9) 7)) (and (= (x stone9) 7) (= (y stone9) 54)) (and (= (x stone9) 26) (= (y stone9) 36)) (and (= (x stone9) 38) (= (y stone9) 27)))
	(or (and (= (x stone10) 2) (= (y stone10) 5)) (and (= (x stone10) 10) (= (y stone10) 10)) (and (= (x stone10) 16) (= (y stone10) 9)) (and (= (x stone10) 52) (= (y stone10) 35)) (and (= (x stone10) 46) (= (y stone10) 16)) (and (= (x stone10) 57) (= (y stone10) 57)) (and (= (x stone10) 46) (= (y stone10) 7)) (and (= (x stone10) 7) (= (y stone10) 54)) (and (= (x stone10) 26) (= (y stone10) 36)) (and (= (x stone10) 38) (= (y stone10) 27)))
  ))

  
  

  
)
