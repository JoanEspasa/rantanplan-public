(define
(problem prim2_70_12_11)
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
(= (capacity j0) 64)
(= (amount j0) 0)
(= (capacity j1) 21)
(= (amount j1) 0)
(= (capacity j2) 85)
(= (amount j2) 0)
(= (capacity j3) 59)
(= (amount j3) 0)
(= (capacity j4) 42)
(= (amount j4) 0)
(= (capacity j5) 101)
(= (amount j5) 0)
(= (capacity j6) 43)
(= (amount j6) 0)
(= (capacity j7) 9)
(= (amount j7) 0)
(= (capacity j8) 52)
(= (amount j8) 0)
(= (capacity j9) 22)
(= (amount j9) 0)
(= (capacity j10) 69)
(= (amount j10) 0)
(= (capacity j11) 91)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 84)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 100)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 51)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 90)
)
))
