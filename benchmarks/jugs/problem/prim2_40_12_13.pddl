(define
(problem prim2_40_12_13)
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
(= (capacity j0) 21)
(= (amount j0) 0)
(= (capacity j1) 22)
(= (amount j1) 0)
(= (capacity j2) 43)
(= (amount j2) 0)
(= (capacity j3) 1)
(= (amount j3) 0)
(= (capacity j4) 11)
(= (amount j4) 0)
(= (capacity j5) 12)
(= (amount j5) 0)
(= (capacity j6) 18)
(= (amount j6) 0)
(= (capacity j7) 31)
(= (amount j7) 0)
(= (capacity j8) 49)
(= (amount j8) 0)
(= (capacity j9) 6)
(= (amount j9) 0)
(= (capacity j10) 31)
(= (amount j10) 0)
(= (capacity j11) 37)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 42)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 11)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 48)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 36)
)
))
