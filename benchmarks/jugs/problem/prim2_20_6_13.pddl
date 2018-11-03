(define
(problem prim2_20_6_13)
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
(= (capacity j0) 13)
(= (amount j0) 0)
(= (capacity j1) 1)
(= (amount j1) 0)
(= (capacity j2) 14)
(= (amount j2) 0)
(= (capacity j3) 20)
(= (amount j3) 0)
(= (capacity j4) 17)
(= (amount j4) 0)
(= (capacity j5) 37)
(= (amount j5) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 13)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 36)
)
))
