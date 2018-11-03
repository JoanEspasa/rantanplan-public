(define (problem instance_30_10_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 30)
	(= (min_x) 1)
	(= (max_y) 30)
	(= (min_y) 1)
	(= (x player1) 20)
	(= (y player1) 30)
	(= (x stone1) 2)
	(= (y stone1) 28)
	(= (x stone2) 18)
	(= (y stone2) 8)
	(= (x stone3) 14)
	(= (y stone3) 13)
	(= (x stone4) 17)
	(= (y stone4) 20)
	(= (x stone5) 3)
	(= (y stone5) 7)
	(= (x stone6) 28)
	(= (y stone6) 4)
	(= (x stone7) 10)
	(= (y stone7) 11)
	(= (x stone8) 17)
	(= (y stone8) 5)
	(= (x stone9) 28)
	(= (y stone9) 22)
	(= (x stone10) 2)
	(= (y stone10) 11)
  )

  (:goal (and 
    (or (and (= (x stone1) 9) (= (y stone1) 3)) (and (= (x stone1) 6) (= (y stone1) 29)) (and (= (x stone1) 2) (= (y stone1) 8)) (and (= (x stone1) 23) (= (y stone1) 20)) (and (= (x stone1) 10) (= (y stone1) 29)) (and (= (x stone1) 27) (= (y stone1) 20)) (and (= (x stone1) 3) (= (y stone1) 26)) (and (= (x stone1) 28) (= (y stone1) 11)) (and (= (x stone1) 30) (= (y stone1) 10)) (and (= (x stone1) 16) (= (y stone1) 22)))
	(or (and (= (x stone2) 9) (= (y stone2) 3)) (and (= (x stone2) 6) (= (y stone2) 29)) (and (= (x stone2) 2) (= (y stone2) 8)) (and (= (x stone2) 23) (= (y stone2) 20)) (and (= (x stone2) 10) (= (y stone2) 29)) (and (= (x stone2) 27) (= (y stone2) 20)) (and (= (x stone2) 3) (= (y stone2) 26)) (and (= (x stone2) 28) (= (y stone2) 11)) (and (= (x stone2) 30) (= (y stone2) 10)) (and (= (x stone2) 16) (= (y stone2) 22)))
	(or (and (= (x stone3) 9) (= (y stone3) 3)) (and (= (x stone3) 6) (= (y stone3) 29)) (and (= (x stone3) 2) (= (y stone3) 8)) (and (= (x stone3) 23) (= (y stone3) 20)) (and (= (x stone3) 10) (= (y stone3) 29)) (and (= (x stone3) 27) (= (y stone3) 20)) (and (= (x stone3) 3) (= (y stone3) 26)) (and (= (x stone3) 28) (= (y stone3) 11)) (and (= (x stone3) 30) (= (y stone3) 10)) (and (= (x stone3) 16) (= (y stone3) 22)))
	(or (and (= (x stone4) 9) (= (y stone4) 3)) (and (= (x stone4) 6) (= (y stone4) 29)) (and (= (x stone4) 2) (= (y stone4) 8)) (and (= (x stone4) 23) (= (y stone4) 20)) (and (= (x stone4) 10) (= (y stone4) 29)) (and (= (x stone4) 27) (= (y stone4) 20)) (and (= (x stone4) 3) (= (y stone4) 26)) (and (= (x stone4) 28) (= (y stone4) 11)) (and (= (x stone4) 30) (= (y stone4) 10)) (and (= (x stone4) 16) (= (y stone4) 22)))
	(or (and (= (x stone5) 9) (= (y stone5) 3)) (and (= (x stone5) 6) (= (y stone5) 29)) (and (= (x stone5) 2) (= (y stone5) 8)) (and (= (x stone5) 23) (= (y stone5) 20)) (and (= (x stone5) 10) (= (y stone5) 29)) (and (= (x stone5) 27) (= (y stone5) 20)) (and (= (x stone5) 3) (= (y stone5) 26)) (and (= (x stone5) 28) (= (y stone5) 11)) (and (= (x stone5) 30) (= (y stone5) 10)) (and (= (x stone5) 16) (= (y stone5) 22)))
	(or (and (= (x stone6) 9) (= (y stone6) 3)) (and (= (x stone6) 6) (= (y stone6) 29)) (and (= (x stone6) 2) (= (y stone6) 8)) (and (= (x stone6) 23) (= (y stone6) 20)) (and (= (x stone6) 10) (= (y stone6) 29)) (and (= (x stone6) 27) (= (y stone6) 20)) (and (= (x stone6) 3) (= (y stone6) 26)) (and (= (x stone6) 28) (= (y stone6) 11)) (and (= (x stone6) 30) (= (y stone6) 10)) (and (= (x stone6) 16) (= (y stone6) 22)))
	(or (and (= (x stone7) 9) (= (y stone7) 3)) (and (= (x stone7) 6) (= (y stone7) 29)) (and (= (x stone7) 2) (= (y stone7) 8)) (and (= (x stone7) 23) (= (y stone7) 20)) (and (= (x stone7) 10) (= (y stone7) 29)) (and (= (x stone7) 27) (= (y stone7) 20)) (and (= (x stone7) 3) (= (y stone7) 26)) (and (= (x stone7) 28) (= (y stone7) 11)) (and (= (x stone7) 30) (= (y stone7) 10)) (and (= (x stone7) 16) (= (y stone7) 22)))
	(or (and (= (x stone8) 9) (= (y stone8) 3)) (and (= (x stone8) 6) (= (y stone8) 29)) (and (= (x stone8) 2) (= (y stone8) 8)) (and (= (x stone8) 23) (= (y stone8) 20)) (and (= (x stone8) 10) (= (y stone8) 29)) (and (= (x stone8) 27) (= (y stone8) 20)) (and (= (x stone8) 3) (= (y stone8) 26)) (and (= (x stone8) 28) (= (y stone8) 11)) (and (= (x stone8) 30) (= (y stone8) 10)) (and (= (x stone8) 16) (= (y stone8) 22)))
	(or (and (= (x stone9) 9) (= (y stone9) 3)) (and (= (x stone9) 6) (= (y stone9) 29)) (and (= (x stone9) 2) (= (y stone9) 8)) (and (= (x stone9) 23) (= (y stone9) 20)) (and (= (x stone9) 10) (= (y stone9) 29)) (and (= (x stone9) 27) (= (y stone9) 20)) (and (= (x stone9) 3) (= (y stone9) 26)) (and (= (x stone9) 28) (= (y stone9) 11)) (and (= (x stone9) 30) (= (y stone9) 10)) (and (= (x stone9) 16) (= (y stone9) 22)))
	(or (and (= (x stone10) 9) (= (y stone10) 3)) (and (= (x stone10) 6) (= (y stone10) 29)) (and (= (x stone10) 2) (= (y stone10) 8)) (and (= (x stone10) 23) (= (y stone10) 20)) (and (= (x stone10) 10) (= (y stone10) 29)) (and (= (x stone10) 27) (= (y stone10) 20)) (and (= (x stone10) 3) (= (y stone10) 26)) (and (= (x stone10) 28) (= (y stone10) 11)) (and (= (x stone10) 30) (= (y stone10) 10)) (and (= (x stone10) 16) (= (y stone10) 22)))
  ))

  
  

  
)
