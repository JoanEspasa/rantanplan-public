(define
(problem prim2_70_12_4)
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
(= (capacity j0) 67)
(= (amount j0) 0)
(= (capacity j1) 34)
(= (amount j1) 0)
(= (capacity j2) 101)
(= (amount j2) 0)
(= (capacity j3) 19)
(= (amount j3) 0)
(= (capacity j4) 58)
(= (amount j4) 0)
(= (capacity j5) 77)
(= (amount j5) 0)
(= (capacity j6) 18)
(= (amount j6) 0)
(= (capacity j7) 55)
(= (amount j7) 0)
(= (capacity j8) 73)
(= (amount j8) 0)
(= (capacity j9) 47)
(= (amount j9) 0)
(= (capacity j10) 12)
(= (amount j10) 0)
(= (capacity j11) 59)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 100)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 76)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 72)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 58)
)
))
