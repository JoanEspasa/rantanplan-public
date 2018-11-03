(define
(problem prim2_20_6_8)
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
(= (capacity j0) 8)
(= (amount j0) 0)
(= (capacity j1) 9)
(= (amount j1) 0)
(= (capacity j2) 17)
(= (amount j2) 0)
(= (capacity j3) 7)
(= (amount j3) 0)
(= (capacity j4) 13)
(= (amount j4) 0)
(= (capacity j5) 20)
(= (amount j5) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 16)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 19)
)
))
