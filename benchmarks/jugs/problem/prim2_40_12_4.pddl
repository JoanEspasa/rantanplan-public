(define
(problem prim2_40_12_4)
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
(= (capacity j0) 23)
(= (amount j0) 0)
(= (capacity j1) 31)
(= (amount j1) 0)
(= (capacity j2) 54)
(= (amount j2) 0)
(= (capacity j3) 24)
(= (amount j3) 0)
(= (capacity j4) 35)
(= (amount j4) 0)
(= (capacity j5) 59)
(= (amount j5) 0)
(= (capacity j6) 37)
(= (amount j6) 0)
(= (capacity j7) 16)
(= (amount j7) 0)
(= (capacity j8) 53)
(= (amount j8) 0)
(= (capacity j9) 5)
(= (amount j9) 0)
(= (capacity j10) 36)
(= (amount j10) 0)
(= (capacity j11) 41)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 53)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 58)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 52)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 40)
)
))
