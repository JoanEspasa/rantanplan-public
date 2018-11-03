(define
(problem prim2_70_12_12)
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
(= (capacity j0) 37)
(= (amount j0) 0)
(= (capacity j1) 45)
(= (amount j1) 0)
(= (capacity j2) 82)
(= (amount j2) 0)
(= (capacity j3) 59)
(= (amount j3) 0)
(= (capacity j4) 45)
(= (amount j4) 0)
(= (capacity j5) 104)
(= (amount j5) 0)
(= (capacity j6) 5)
(= (amount j6) 0)
(= (capacity j7) 24)
(= (amount j7) 0)
(= (capacity j8) 29)
(= (amount j8) 0)
(= (capacity j9) 49)
(= (amount j9) 0)
(= (capacity j10) 65)
(= (amount j10) 0)
(= (capacity j11) 114)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 81)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 103)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 28)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 113)
)
))
