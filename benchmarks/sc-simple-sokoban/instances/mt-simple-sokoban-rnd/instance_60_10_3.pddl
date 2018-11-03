(define (problem instance_60_10_3)
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
	(= (x player1) 19)
	(= (y player1) 13)
	(= (x stone1) 32)
	(= (y stone1) 49)
	(= (x stone2) 12)
	(= (y stone2) 20)
	(= (x stone3) 50)
	(= (y stone3) 8)
	(= (x stone4) 7)
	(= (y stone4) 4)
	(= (x stone5) 45)
	(= (y stone5) 40)
	(= (x stone6) 15)
	(= (y stone6) 10)
	(= (x stone7) 57)
	(= (y stone7) 29)
	(= (x stone8) 7)
	(= (y stone8) 9)
	(= (x stone9) 34)
	(= (y stone9) 55)
	(= (x stone10) 6)
	(= (y stone10) 35)
  )

  (:goal (and 
    (or (and (= (x stone1) 27) (= (y stone1) 19)) (and (= (x stone1) 5) (= (y stone1) 21)) (and (= (x stone1) 59) (= (y stone1) 45)) (and (= (x stone1) 55) (= (y stone1) 1)) (and (= (x stone1) 40) (= (y stone1) 24)) (and (= (x stone1) 52) (= (y stone1) 58)) (and (= (x stone1) 47) (= (y stone1) 34)) (and (= (x stone1) 21) (= (y stone1) 44)) (and (= (x stone1) 18) (= (y stone1) 8)) (and (= (x stone1) 55) (= (y stone1) 52)))
	(or (and (= (x stone2) 27) (= (y stone2) 19)) (and (= (x stone2) 5) (= (y stone2) 21)) (and (= (x stone2) 59) (= (y stone2) 45)) (and (= (x stone2) 55) (= (y stone2) 1)) (and (= (x stone2) 40) (= (y stone2) 24)) (and (= (x stone2) 52) (= (y stone2) 58)) (and (= (x stone2) 47) (= (y stone2) 34)) (and (= (x stone2) 21) (= (y stone2) 44)) (and (= (x stone2) 18) (= (y stone2) 8)) (and (= (x stone2) 55) (= (y stone2) 52)))
	(or (and (= (x stone3) 27) (= (y stone3) 19)) (and (= (x stone3) 5) (= (y stone3) 21)) (and (= (x stone3) 59) (= (y stone3) 45)) (and (= (x stone3) 55) (= (y stone3) 1)) (and (= (x stone3) 40) (= (y stone3) 24)) (and (= (x stone3) 52) (= (y stone3) 58)) (and (= (x stone3) 47) (= (y stone3) 34)) (and (= (x stone3) 21) (= (y stone3) 44)) (and (= (x stone3) 18) (= (y stone3) 8)) (and (= (x stone3) 55) (= (y stone3) 52)))
	(or (and (= (x stone4) 27) (= (y stone4) 19)) (and (= (x stone4) 5) (= (y stone4) 21)) (and (= (x stone4) 59) (= (y stone4) 45)) (and (= (x stone4) 55) (= (y stone4) 1)) (and (= (x stone4) 40) (= (y stone4) 24)) (and (= (x stone4) 52) (= (y stone4) 58)) (and (= (x stone4) 47) (= (y stone4) 34)) (and (= (x stone4) 21) (= (y stone4) 44)) (and (= (x stone4) 18) (= (y stone4) 8)) (and (= (x stone4) 55) (= (y stone4) 52)))
	(or (and (= (x stone5) 27) (= (y stone5) 19)) (and (= (x stone5) 5) (= (y stone5) 21)) (and (= (x stone5) 59) (= (y stone5) 45)) (and (= (x stone5) 55) (= (y stone5) 1)) (and (= (x stone5) 40) (= (y stone5) 24)) (and (= (x stone5) 52) (= (y stone5) 58)) (and (= (x stone5) 47) (= (y stone5) 34)) (and (= (x stone5) 21) (= (y stone5) 44)) (and (= (x stone5) 18) (= (y stone5) 8)) (and (= (x stone5) 55) (= (y stone5) 52)))
	(or (and (= (x stone6) 27) (= (y stone6) 19)) (and (= (x stone6) 5) (= (y stone6) 21)) (and (= (x stone6) 59) (= (y stone6) 45)) (and (= (x stone6) 55) (= (y stone6) 1)) (and (= (x stone6) 40) (= (y stone6) 24)) (and (= (x stone6) 52) (= (y stone6) 58)) (and (= (x stone6) 47) (= (y stone6) 34)) (and (= (x stone6) 21) (= (y stone6) 44)) (and (= (x stone6) 18) (= (y stone6) 8)) (and (= (x stone6) 55) (= (y stone6) 52)))
	(or (and (= (x stone7) 27) (= (y stone7) 19)) (and (= (x stone7) 5) (= (y stone7) 21)) (and (= (x stone7) 59) (= (y stone7) 45)) (and (= (x stone7) 55) (= (y stone7) 1)) (and (= (x stone7) 40) (= (y stone7) 24)) (and (= (x stone7) 52) (= (y stone7) 58)) (and (= (x stone7) 47) (= (y stone7) 34)) (and (= (x stone7) 21) (= (y stone7) 44)) (and (= (x stone7) 18) (= (y stone7) 8)) (and (= (x stone7) 55) (= (y stone7) 52)))
	(or (and (= (x stone8) 27) (= (y stone8) 19)) (and (= (x stone8) 5) (= (y stone8) 21)) (and (= (x stone8) 59) (= (y stone8) 45)) (and (= (x stone8) 55) (= (y stone8) 1)) (and (= (x stone8) 40) (= (y stone8) 24)) (and (= (x stone8) 52) (= (y stone8) 58)) (and (= (x stone8) 47) (= (y stone8) 34)) (and (= (x stone8) 21) (= (y stone8) 44)) (and (= (x stone8) 18) (= (y stone8) 8)) (and (= (x stone8) 55) (= (y stone8) 52)))
	(or (and (= (x stone9) 27) (= (y stone9) 19)) (and (= (x stone9) 5) (= (y stone9) 21)) (and (= (x stone9) 59) (= (y stone9) 45)) (and (= (x stone9) 55) (= (y stone9) 1)) (and (= (x stone9) 40) (= (y stone9) 24)) (and (= (x stone9) 52) (= (y stone9) 58)) (and (= (x stone9) 47) (= (y stone9) 34)) (and (= (x stone9) 21) (= (y stone9) 44)) (and (= (x stone9) 18) (= (y stone9) 8)) (and (= (x stone9) 55) (= (y stone9) 52)))
	(or (and (= (x stone10) 27) (= (y stone10) 19)) (and (= (x stone10) 5) (= (y stone10) 21)) (and (= (x stone10) 59) (= (y stone10) 45)) (and (= (x stone10) 55) (= (y stone10) 1)) (and (= (x stone10) 40) (= (y stone10) 24)) (and (= (x stone10) 52) (= (y stone10) 58)) (and (= (x stone10) 47) (= (y stone10) 34)) (and (= (x stone10) 21) (= (y stone10) 44)) (and (= (x stone10) 18) (= (y stone10) 8)) (and (= (x stone10) 55) (= (y stone10) 52)))
  ))

  
  

  
)
