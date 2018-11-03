(define
(problem prim2_50_6_12)
(:domain jug-pouring)
(:objects
j0 - jug
j1 - jug
j2 - jug
j3 - jug
j4 - jug
j5 - jug
)
(:init
(= (capacity j0) 33)
(= (amount j0) 0)
(= (capacity j1) 4)
(= (amount j1) 0)
(= (capacity j2) 37)
(= (amount j2) 0)
(= (capacity j3) 32)
(= (amount j3) 0)
(= (capacity j4) 41)
(= (amount j4) 0)
(= (capacity j5) 73)
(= (amount j5) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 36)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 72)
)
))
