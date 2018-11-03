(define
(problem prim2_60_9_6)
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
)
(:init
(= (capacity j0) 36)
(= (amount j0) 0)
(= (capacity j1) 13)
(= (amount j1) 0)
(= (capacity j2) 49)
(= (amount j2) 0)
(= (capacity j3) 7)
(= (amount j3) 0)
(= (capacity j4) 58)
(= (amount j4) 0)
(= (capacity j5) 65)
(= (amount j5) 0)
(= (capacity j6) 37)
(= (amount j6) 0)
(= (capacity j7) 42)
(= (amount j7) 0)
(= (capacity j8) 79)
(= (amount j8) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 48)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 64)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 78)
)
))
