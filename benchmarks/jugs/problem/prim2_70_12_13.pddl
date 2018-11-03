(define
(problem prim2_70_12_13)
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
(= (capacity j0) 41)
(= (amount j0) 0)
(= (capacity j1) 14)
(= (amount j1) 0)
(= (capacity j2) 55)
(= (amount j2) 0)
(= (capacity j3) 7)
(= (amount j3) 0)
(= (capacity j4) 38)
(= (amount j4) 0)
(= (capacity j5) 45)
(= (amount j5) 0)
(= (capacity j6) 43)
(= (amount j6) 0)
(= (capacity j7) 16)
(= (amount j7) 0)
(= (capacity j8) 59)
(= (amount j8) 0)
(= (capacity j9) 69)
(= (amount j9) 0)
(= (capacity j10) 32)
(= (amount j10) 0)
(= (capacity j11) 101)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 54)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 44)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 58)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 100)
)
))
