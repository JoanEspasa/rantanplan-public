(define (problem instance_55_10_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 55)
	(= (min_x) 1)
	(= (max_y) 55)
	(= (min_y) 1)
	(= (x player1) 47)
	(= (y player1) 4)
	(= (x stone1) 2)
	(= (y stone1) 29)
	(= (x stone2) 15)
	(= (y stone2) 26)
	(= (x stone3) 44)
	(= (y stone3) 46)
	(= (x stone4) 51)
	(= (y stone4) 49)
	(= (x stone5) 51)
	(= (y stone5) 39)
	(= (x stone6) 43)
	(= (y stone6) 50)
	(= (x stone7) 18)
	(= (y stone7) 48)
	(= (x stone8) 3)
	(= (y stone8) 52)
	(= (x stone9) 27)
	(= (y stone9) 33)
	(= (x stone10) 28)
	(= (y stone10) 23)
  )

  (:goal (and 
    (or (and (= (x stone1) 14) (= (y stone1) 37)) (and (= (x stone1) 47) (= (y stone1) 45)) (and (= (x stone1) 52) (= (y stone1) 11)) (and (= (x stone1) 51) (= (y stone1) 34)) (and (= (x stone1) 14) (= (y stone1) 15)) (and (= (x stone1) 46) (= (y stone1) 34)) (and (= (x stone1) 53) (= (y stone1) 34)) (and (= (x stone1) 2) (= (y stone1) 53)) (and (= (x stone1) 6) (= (y stone1) 4)) (and (= (x stone1) 40) (= (y stone1) 31)))
	(or (and (= (x stone2) 14) (= (y stone2) 37)) (and (= (x stone2) 47) (= (y stone2) 45)) (and (= (x stone2) 52) (= (y stone2) 11)) (and (= (x stone2) 51) (= (y stone2) 34)) (and (= (x stone2) 14) (= (y stone2) 15)) (and (= (x stone2) 46) (= (y stone2) 34)) (and (= (x stone2) 53) (= (y stone2) 34)) (and (= (x stone2) 2) (= (y stone2) 53)) (and (= (x stone2) 6) (= (y stone2) 4)) (and (= (x stone2) 40) (= (y stone2) 31)))
	(or (and (= (x stone3) 14) (= (y stone3) 37)) (and (= (x stone3) 47) (= (y stone3) 45)) (and (= (x stone3) 52) (= (y stone3) 11)) (and (= (x stone3) 51) (= (y stone3) 34)) (and (= (x stone3) 14) (= (y stone3) 15)) (and (= (x stone3) 46) (= (y stone3) 34)) (and (= (x stone3) 53) (= (y stone3) 34)) (and (= (x stone3) 2) (= (y stone3) 53)) (and (= (x stone3) 6) (= (y stone3) 4)) (and (= (x stone3) 40) (= (y stone3) 31)))
	(or (and (= (x stone4) 14) (= (y stone4) 37)) (and (= (x stone4) 47) (= (y stone4) 45)) (and (= (x stone4) 52) (= (y stone4) 11)) (and (= (x stone4) 51) (= (y stone4) 34)) (and (= (x stone4) 14) (= (y stone4) 15)) (and (= (x stone4) 46) (= (y stone4) 34)) (and (= (x stone4) 53) (= (y stone4) 34)) (and (= (x stone4) 2) (= (y stone4) 53)) (and (= (x stone4) 6) (= (y stone4) 4)) (and (= (x stone4) 40) (= (y stone4) 31)))
	(or (and (= (x stone5) 14) (= (y stone5) 37)) (and (= (x stone5) 47) (= (y stone5) 45)) (and (= (x stone5) 52) (= (y stone5) 11)) (and (= (x stone5) 51) (= (y stone5) 34)) (and (= (x stone5) 14) (= (y stone5) 15)) (and (= (x stone5) 46) (= (y stone5) 34)) (and (= (x stone5) 53) (= (y stone5) 34)) (and (= (x stone5) 2) (= (y stone5) 53)) (and (= (x stone5) 6) (= (y stone5) 4)) (and (= (x stone5) 40) (= (y stone5) 31)))
	(or (and (= (x stone6) 14) (= (y stone6) 37)) (and (= (x stone6) 47) (= (y stone6) 45)) (and (= (x stone6) 52) (= (y stone6) 11)) (and (= (x stone6) 51) (= (y stone6) 34)) (and (= (x stone6) 14) (= (y stone6) 15)) (and (= (x stone6) 46) (= (y stone6) 34)) (and (= (x stone6) 53) (= (y stone6) 34)) (and (= (x stone6) 2) (= (y stone6) 53)) (and (= (x stone6) 6) (= (y stone6) 4)) (and (= (x stone6) 40) (= (y stone6) 31)))
	(or (and (= (x stone7) 14) (= (y stone7) 37)) (and (= (x stone7) 47) (= (y stone7) 45)) (and (= (x stone7) 52) (= (y stone7) 11)) (and (= (x stone7) 51) (= (y stone7) 34)) (and (= (x stone7) 14) (= (y stone7) 15)) (and (= (x stone7) 46) (= (y stone7) 34)) (and (= (x stone7) 53) (= (y stone7) 34)) (and (= (x stone7) 2) (= (y stone7) 53)) (and (= (x stone7) 6) (= (y stone7) 4)) (and (= (x stone7) 40) (= (y stone7) 31)))
	(or (and (= (x stone8) 14) (= (y stone8) 37)) (and (= (x stone8) 47) (= (y stone8) 45)) (and (= (x stone8) 52) (= (y stone8) 11)) (and (= (x stone8) 51) (= (y stone8) 34)) (and (= (x stone8) 14) (= (y stone8) 15)) (and (= (x stone8) 46) (= (y stone8) 34)) (and (= (x stone8) 53) (= (y stone8) 34)) (and (= (x stone8) 2) (= (y stone8) 53)) (and (= (x stone8) 6) (= (y stone8) 4)) (and (= (x stone8) 40) (= (y stone8) 31)))
	(or (and (= (x stone9) 14) (= (y stone9) 37)) (and (= (x stone9) 47) (= (y stone9) 45)) (and (= (x stone9) 52) (= (y stone9) 11)) (and (= (x stone9) 51) (= (y stone9) 34)) (and (= (x stone9) 14) (= (y stone9) 15)) (and (= (x stone9) 46) (= (y stone9) 34)) (and (= (x stone9) 53) (= (y stone9) 34)) (and (= (x stone9) 2) (= (y stone9) 53)) (and (= (x stone9) 6) (= (y stone9) 4)) (and (= (x stone9) 40) (= (y stone9) 31)))
	(or (and (= (x stone10) 14) (= (y stone10) 37)) (and (= (x stone10) 47) (= (y stone10) 45)) (and (= (x stone10) 52) (= (y stone10) 11)) (and (= (x stone10) 51) (= (y stone10) 34)) (and (= (x stone10) 14) (= (y stone10) 15)) (and (= (x stone10) 46) (= (y stone10) 34)) (and (= (x stone10) 53) (= (y stone10) 34)) (and (= (x stone10) 2) (= (y stone10) 53)) (and (= (x stone10) 6) (= (y stone10) 4)) (and (= (x stone10) 40) (= (y stone10) 31)))
  ))

  
  

  
)
