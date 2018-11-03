(define
(problem prim2_70_12_9)
(:domain jug-pouring)
(:objects
j0 - jug
j1 - jug
j2 - jug
j3 - jug
j4 - jug
j5 - jug
j6 - jug
j7 - jug
j8 - jug
j9 - jug
j10 - jug
j11 - jug
)
(:init
(= (capacity j0) 8)
(= (amount j0) 0)
(= (capacity j1) 49)
(= (amount j1) 0)
(= (capacity j2) 57)
(= (amount j2) 0)
(= (capacity j3) 35)
(= (amount j3) 0)
(= (capacity j4) 38)
(= (amount j4) 0)
(= (capacity j5) 73)
(= (amount j5) 0)
(= (capacity j6) 10)
(= (amount j6) 0)
(= (capacity j7) 61)
(= (amount j7) 0)
(= (capacity j8) 71)
(= (amount j8) 0)
(= (capacity j9) 27)
(= (amount j9) 0)
(= (capacity j10) 11)
(= (amount j10) 0)
(= (capacity j11) 38)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 56)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 72)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 70)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 37)
)
))
