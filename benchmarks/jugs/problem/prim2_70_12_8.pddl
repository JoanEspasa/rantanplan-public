(define
(problem prim2_70_12_8)
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
(= (capacity j0) 56)
(= (amount j0) 0)
(= (capacity j1) 17)
(= (amount j1) 0)
(= (capacity j2) 73)
(= (amount j2) 0)
(= (capacity j3) 63)
(= (amount j3) 0)
(= (capacity j4) 68)
(= (amount j4) 0)
(= (capacity j5) 131)
(= (amount j5) 0)
(= (capacity j6) 58)
(= (amount j6) 0)
(= (capacity j7) 39)
(= (amount j7) 0)
(= (capacity j8) 97)
(= (amount j8) 0)
(= (capacity j9) 47)
(= (amount j9) 0)
(= (capacity j10) 5)
(= (amount j10) 0)
(= (capacity j11) 52)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 72)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 130)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 96)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 51)
)
))
