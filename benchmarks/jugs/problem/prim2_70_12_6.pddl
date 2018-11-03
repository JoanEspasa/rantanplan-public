(define
(problem prim2_70_12_6)
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
(= (capacity j0) 15)
(= (amount j0) 0)
(= (capacity j1) 4)
(= (amount j1) 0)
(= (capacity j2) 19)
(= (amount j2) 0)
(= (capacity j3) 37)
(= (amount j3) 0)
(= (capacity j4) 69)
(= (amount j4) 0)
(= (capacity j5) 106)
(= (amount j5) 0)
(= (capacity j6) 21)
(= (amount j6) 0)
(= (capacity j7) 25)
(= (amount j7) 0)
(= (capacity j8) 46)
(= (amount j8) 0)
(= (capacity j9) 62)
(= (amount j9) 0)
(= (capacity j10) 57)
(= (amount j10) 0)
(= (capacity j11) 119)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 18)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 105)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 45)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 118)
)
))
