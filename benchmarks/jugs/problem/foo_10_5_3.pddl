(define
(problem foo_10_5_3)
(:domain jug-pouring)
(:objects
j0 - jug
j1 - jug
j2 - jug
j3 - jug
j4 - jug
)
(:init
(= (capacity j0) 1)
(= (amount j0) 0)
(= (capacity j1) 7)
(= (amount j1) 0)
(= (capacity j2) 7)
(= (amount j2) 0)
(= (capacity j3) 2)
(= (amount j3) 0)
(= (capacity j4) 3)
(= (amount j4) 0)
)
(:goal
 (and
(= (amount j0) 1)
(= (amount j1) 7)
(= (amount j2) 1)
(= (amount j3) 1)
(= (amount j4) 1)
)
)
