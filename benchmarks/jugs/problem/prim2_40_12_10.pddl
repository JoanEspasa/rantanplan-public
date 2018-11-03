(define
(problem prim2_40_12_10)
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
(= (capacity j0) 1)
(= (amount j0) 0)
(= (capacity j1) 5)
(= (amount j1) 0)
(= (capacity j2) 6)
(= (amount j2) 0)
(= (capacity j3) 35)
(= (amount j3) 0)
(= (capacity j4) 27)
(= (amount j4) 0)
(= (capacity j5) 62)
(= (amount j5) 0)
(= (capacity j6) 31)
(= (amount j6) 0)
(= (capacity j7) 29)
(= (amount j7) 0)
(= (capacity j8) 60)
(= (amount j8) 0)
(= (capacity j9) 1)
(= (amount j9) 0)
(= (capacity j10) 23)
(= (amount j10) 0)
(= (capacity j11) 24)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 5)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 61)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 59)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 23)
)
))
