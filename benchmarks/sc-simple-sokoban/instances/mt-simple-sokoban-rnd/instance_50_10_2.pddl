(define (problem instance_50_10_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 50)
	(= (min_x) 1)
	(= (max_y) 50)
	(= (min_y) 1)
	(= (x player1) 6)
	(= (y player1) 33)
	(= (x stone1) 25)
	(= (y stone1) 6)
	(= (x stone2) 13)
	(= (y stone2) 37)
	(= (x stone3) 11)
	(= (y stone3) 18)
	(= (x stone4) 21)
	(= (y stone4) 5)
	(= (x stone5) 13)
	(= (y stone5) 42)
	(= (x stone6) 4)
	(= (y stone6) 11)
	(= (x stone7) 43)
	(= (y stone7) 13)
	(= (x stone8) 40)
	(= (y stone8) 49)
	(= (x stone9) 29)
	(= (y stone9) 23)
	(= (x stone10) 48)
	(= (y stone10) 35)
  )

  (:goal (and 
    (or (and (= (x stone1) 26) (= (y stone1) 37)) (and (= (x stone1) 3) (= (y stone1) 10)) (and (= (x stone1) 24) (= (y stone1) 46)) (and (= (x stone1) 26) (= (y stone1) 22)) (and (= (x stone1) 40) (= (y stone1) 11)) (and (= (x stone1) 26) (= (y stone1) 49)) (and (= (x stone1) 21) (= (y stone1) 38)) (and (= (x stone1) 19) (= (y stone1) 7)) (and (= (x stone1) 35) (= (y stone1) 20)) (and (= (x stone1) 20) (= (y stone1) 2)))
	(or (and (= (x stone2) 26) (= (y stone2) 37)) (and (= (x stone2) 3) (= (y stone2) 10)) (and (= (x stone2) 24) (= (y stone2) 46)) (and (= (x stone2) 26) (= (y stone2) 22)) (and (= (x stone2) 40) (= (y stone2) 11)) (and (= (x stone2) 26) (= (y stone2) 49)) (and (= (x stone2) 21) (= (y stone2) 38)) (and (= (x stone2) 19) (= (y stone2) 7)) (and (= (x stone2) 35) (= (y stone2) 20)) (and (= (x stone2) 20) (= (y stone2) 2)))
	(or (and (= (x stone3) 26) (= (y stone3) 37)) (and (= (x stone3) 3) (= (y stone3) 10)) (and (= (x stone3) 24) (= (y stone3) 46)) (and (= (x stone3) 26) (= (y stone3) 22)) (and (= (x stone3) 40) (= (y stone3) 11)) (and (= (x stone3) 26) (= (y stone3) 49)) (and (= (x stone3) 21) (= (y stone3) 38)) (and (= (x stone3) 19) (= (y stone3) 7)) (and (= (x stone3) 35) (= (y stone3) 20)) (and (= (x stone3) 20) (= (y stone3) 2)))
	(or (and (= (x stone4) 26) (= (y stone4) 37)) (and (= (x stone4) 3) (= (y stone4) 10)) (and (= (x stone4) 24) (= (y stone4) 46)) (and (= (x stone4) 26) (= (y stone4) 22)) (and (= (x stone4) 40) (= (y stone4) 11)) (and (= (x stone4) 26) (= (y stone4) 49)) (and (= (x stone4) 21) (= (y stone4) 38)) (and (= (x stone4) 19) (= (y stone4) 7)) (and (= (x stone4) 35) (= (y stone4) 20)) (and (= (x stone4) 20) (= (y stone4) 2)))
	(or (and (= (x stone5) 26) (= (y stone5) 37)) (and (= (x stone5) 3) (= (y stone5) 10)) (and (= (x stone5) 24) (= (y stone5) 46)) (and (= (x stone5) 26) (= (y stone5) 22)) (and (= (x stone5) 40) (= (y stone5) 11)) (and (= (x stone5) 26) (= (y stone5) 49)) (and (= (x stone5) 21) (= (y stone5) 38)) (and (= (x stone5) 19) (= (y stone5) 7)) (and (= (x stone5) 35) (= (y stone5) 20)) (and (= (x stone5) 20) (= (y stone5) 2)))
	(or (and (= (x stone6) 26) (= (y stone6) 37)) (and (= (x stone6) 3) (= (y stone6) 10)) (and (= (x stone6) 24) (= (y stone6) 46)) (and (= (x stone6) 26) (= (y stone6) 22)) (and (= (x stone6) 40) (= (y stone6) 11)) (and (= (x stone6) 26) (= (y stone6) 49)) (and (= (x stone6) 21) (= (y stone6) 38)) (and (= (x stone6) 19) (= (y stone6) 7)) (and (= (x stone6) 35) (= (y stone6) 20)) (and (= (x stone6) 20) (= (y stone6) 2)))
	(or (and (= (x stone7) 26) (= (y stone7) 37)) (and (= (x stone7) 3) (= (y stone7) 10)) (and (= (x stone7) 24) (= (y stone7) 46)) (and (= (x stone7) 26) (= (y stone7) 22)) (and (= (x stone7) 40) (= (y stone7) 11)) (and (= (x stone7) 26) (= (y stone7) 49)) (and (= (x stone7) 21) (= (y stone7) 38)) (and (= (x stone7) 19) (= (y stone7) 7)) (and (= (x stone7) 35) (= (y stone7) 20)) (and (= (x stone7) 20) (= (y stone7) 2)))
	(or (and (= (x stone8) 26) (= (y stone8) 37)) (and (= (x stone8) 3) (= (y stone8) 10)) (and (= (x stone8) 24) (= (y stone8) 46)) (and (= (x stone8) 26) (= (y stone8) 22)) (and (= (x stone8) 40) (= (y stone8) 11)) (and (= (x stone8) 26) (= (y stone8) 49)) (and (= (x stone8) 21) (= (y stone8) 38)) (and (= (x stone8) 19) (= (y stone8) 7)) (and (= (x stone8) 35) (= (y stone8) 20)) (and (= (x stone8) 20) (= (y stone8) 2)))
	(or (and (= (x stone9) 26) (= (y stone9) 37)) (and (= (x stone9) 3) (= (y stone9) 10)) (and (= (x stone9) 24) (= (y stone9) 46)) (and (= (x stone9) 26) (= (y stone9) 22)) (and (= (x stone9) 40) (= (y stone9) 11)) (and (= (x stone9) 26) (= (y stone9) 49)) (and (= (x stone9) 21) (= (y stone9) 38)) (and (= (x stone9) 19) (= (y stone9) 7)) (and (= (x stone9) 35) (= (y stone9) 20)) (and (= (x stone9) 20) (= (y stone9) 2)))
	(or (and (= (x stone10) 26) (= (y stone10) 37)) (and (= (x stone10) 3) (= (y stone10) 10)) (and (= (x stone10) 24) (= (y stone10) 46)) (and (= (x stone10) 26) (= (y stone10) 22)) (and (= (x stone10) 40) (= (y stone10) 11)) (and (= (x stone10) 26) (= (y stone10) 49)) (and (= (x stone10) 21) (= (y stone10) 38)) (and (= (x stone10) 19) (= (y stone10) 7)) (and (= (x stone10) 35) (= (y stone10) 20)) (and (= (x stone10) 20) (= (y stone10) 2)))
  ))

  
  

  
)
