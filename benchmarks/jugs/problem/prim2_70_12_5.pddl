(define
(problem prim2_70_12_5)
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
(= (capacity j0) 53)
(= (amount j0) 0)
(= (capacity j1) 37)
(= (amount j1) 0)
(= (capacity j2) 90)
(= (amount j2) 0)
(= (capacity j3) 51)
(= (amount j3) 0)
(= (capacity j4) 26)
(= (amount j4) 0)
(= (capacity j5) 77)
(= (amount j5) 0)
(= (capacity j6) 3)
(= (amount j6) 0)
(= (capacity j7) 38)
(= (amount j7) 0)
(= (capacity j8) 41)
(= (amount j8) 0)
(= (capacity j9) 41)
(= (amount j9) 0)
(= (capacity j10) 1)
(= (amount j10) 0)
(= (capacity j11) 42)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 89)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 76)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 40)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 41)
)
))
