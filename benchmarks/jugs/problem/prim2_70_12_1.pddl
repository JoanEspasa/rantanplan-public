(define
(problem prim2_70_12_1)
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
(= (capacity j0) 49)
(= (amount j0) 0)
(= (capacity j1) 38)
(= (amount j1) 0)
(= (capacity j2) 87)
(= (amount j2) 0)
(= (capacity j3) 64)
(= (amount j3) 0)
(= (capacity j4) 3)
(= (amount j4) 0)
(= (capacity j5) 67)
(= (amount j5) 0)
(= (capacity j6) 11)
(= (amount j6) 0)
(= (capacity j7) 12)
(= (amount j7) 0)
(= (capacity j8) 23)
(= (amount j8) 0)
(= (capacity j9) 19)
(= (amount j9) 0)
(= (capacity j10) 58)
(= (amount j10) 0)
(= (capacity j11) 77)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 86)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 66)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 22)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 76)
)
))
