(define (problem instance_100_10_3)
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
	(= (x player1) 9)
	(= (y player1) 56)
	(= (x stone1) 59)
	(= (y stone1) 81)
	(= (x stone2) 43)
	(= (y stone2) 11)
	(= (x stone3) 7)
	(= (y stone3) 77)
	(= (x stone4) 43)
	(= (y stone4) 31)
	(= (x stone5) 26)
	(= (y stone5) 22)
	(= (x stone6) 10)
	(= (y stone6) 10)
	(= (x stone7) 82)
	(= (y stone7) 14)
	(= (x stone8) 32)
	(= (y stone8) 55)
	(= (x stone9) 17)
	(= (y stone9) 49)
	(= (x stone10) 69)
	(= (y stone10) 63)
  )

  (:goal (and 
    (or (and (= (x stone1) 7) (= (y stone1) 97)) (and (= (x stone1) 67) (= (y stone1) 80)) (and (= (x stone1) 68) (= (y stone1) 14)) (and (= (x stone1) 47) (= (y stone1) 14)) (and (= (x stone1) 96) (= (y stone1) 98)) (and (= (x stone1) 33) (= (y stone1) 53)) (and (= (x stone1) 59) (= (y stone1) 20)) (and (= (x stone1) 74) (= (y stone1) 11)) (and (= (x stone1) 93) (= (y stone1) 85)) (and (= (x stone1) 29) (= (y stone1) 6)))
	(or (and (= (x stone2) 7) (= (y stone2) 97)) (and (= (x stone2) 67) (= (y stone2) 80)) (and (= (x stone2) 68) (= (y stone2) 14)) (and (= (x stone2) 47) (= (y stone2) 14)) (and (= (x stone2) 96) (= (y stone2) 98)) (and (= (x stone2) 33) (= (y stone2) 53)) (and (= (x stone2) 59) (= (y stone2) 20)) (and (= (x stone2) 74) (= (y stone2) 11)) (and (= (x stone2) 93) (= (y stone2) 85)) (and (= (x stone2) 29) (= (y stone2) 6)))
	(or (and (= (x stone3) 7) (= (y stone3) 97)) (and (= (x stone3) 67) (= (y stone3) 80)) (and (= (x stone3) 68) (= (y stone3) 14)) (and (= (x stone3) 47) (= (y stone3) 14)) (and (= (x stone3) 96) (= (y stone3) 98)) (and (= (x stone3) 33) (= (y stone3) 53)) (and (= (x stone3) 59) (= (y stone3) 20)) (and (= (x stone3) 74) (= (y stone3) 11)) (and (= (x stone3) 93) (= (y stone3) 85)) (and (= (x stone3) 29) (= (y stone3) 6)))
	(or (and (= (x stone4) 7) (= (y stone4) 97)) (and (= (x stone4) 67) (= (y stone4) 80)) (and (= (x stone4) 68) (= (y stone4) 14)) (and (= (x stone4) 47) (= (y stone4) 14)) (and (= (x stone4) 96) (= (y stone4) 98)) (and (= (x stone4) 33) (= (y stone4) 53)) (and (= (x stone4) 59) (= (y stone4) 20)) (and (= (x stone4) 74) (= (y stone4) 11)) (and (= (x stone4) 93) (= (y stone4) 85)) (and (= (x stone4) 29) (= (y stone4) 6)))
	(or (and (= (x stone5) 7) (= (y stone5) 97)) (and (= (x stone5) 67) (= (y stone5) 80)) (and (= (x stone5) 68) (= (y stone5) 14)) (and (= (x stone5) 47) (= (y stone5) 14)) (and (= (x stone5) 96) (= (y stone5) 98)) (and (= (x stone5) 33) (= (y stone5) 53)) (and (= (x stone5) 59) (= (y stone5) 20)) (and (= (x stone5) 74) (= (y stone5) 11)) (and (= (x stone5) 93) (= (y stone5) 85)) (and (= (x stone5) 29) (= (y stone5) 6)))
	(or (and (= (x stone6) 7) (= (y stone6) 97)) (and (= (x stone6) 67) (= (y stone6) 80)) (and (= (x stone6) 68) (= (y stone6) 14)) (and (= (x stone6) 47) (= (y stone6) 14)) (and (= (x stone6) 96) (= (y stone6) 98)) (and (= (x stone6) 33) (= (y stone6) 53)) (and (= (x stone6) 59) (= (y stone6) 20)) (and (= (x stone6) 74) (= (y stone6) 11)) (and (= (x stone6) 93) (= (y stone6) 85)) (and (= (x stone6) 29) (= (y stone6) 6)))
	(or (and (= (x stone7) 7) (= (y stone7) 97)) (and (= (x stone7) 67) (= (y stone7) 80)) (and (= (x stone7) 68) (= (y stone7) 14)) (and (= (x stone7) 47) (= (y stone7) 14)) (and (= (x stone7) 96) (= (y stone7) 98)) (and (= (x stone7) 33) (= (y stone7) 53)) (and (= (x stone7) 59) (= (y stone7) 20)) (and (= (x stone7) 74) (= (y stone7) 11)) (and (= (x stone7) 93) (= (y stone7) 85)) (and (= (x stone7) 29) (= (y stone7) 6)))
	(or (and (= (x stone8) 7) (= (y stone8) 97)) (and (= (x stone8) 67) (= (y stone8) 80)) (and (= (x stone8) 68) (= (y stone8) 14)) (and (= (x stone8) 47) (= (y stone8) 14)) (and (= (x stone8) 96) (= (y stone8) 98)) (and (= (x stone8) 33) (= (y stone8) 53)) (and (= (x stone8) 59) (= (y stone8) 20)) (and (= (x stone8) 74) (= (y stone8) 11)) (and (= (x stone8) 93) (= (y stone8) 85)) (and (= (x stone8) 29) (= (y stone8) 6)))
	(or (and (= (x stone9) 7) (= (y stone9) 97)) (and (= (x stone9) 67) (= (y stone9) 80)) (and (= (x stone9) 68) (= (y stone9) 14)) (and (= (x stone9) 47) (= (y stone9) 14)) (and (= (x stone9) 96) (= (y stone9) 98)) (and (= (x stone9) 33) (= (y stone9) 53)) (and (= (x stone9) 59) (= (y stone9) 20)) (and (= (x stone9) 74) (= (y stone9) 11)) (and (= (x stone9) 93) (= (y stone9) 85)) (and (= (x stone9) 29) (= (y stone9) 6)))
	(or (and (= (x stone10) 7) (= (y stone10) 97)) (and (= (x stone10) 67) (= (y stone10) 80)) (and (= (x stone10) 68) (= (y stone10) 14)) (and (= (x stone10) 47) (= (y stone10) 14)) (and (= (x stone10) 96) (= (y stone10) 98)) (and (= (x stone10) 33) (= (y stone10) 53)) (and (= (x stone10) 59) (= (y stone10) 20)) (and (= (x stone10) 74) (= (y stone10) 11)) (and (= (x stone10) 93) (= (y stone10) 85)) (and (= (x stone10) 29) (= (y stone10) 6)))
  ))

  
  

  
)
