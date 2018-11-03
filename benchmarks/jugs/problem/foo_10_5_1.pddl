(define
(problem foo_10_5_1)
(:domain jug-pouring)
(:objects
j0 - jug
j1 - jug
j2 - jug
j3 - jug
j4 - jug
)
(:init
(= (capacity j0) 8)
(= (amount j0) 0)
(= (capacity j1) 10)
(= (amount j1) 0)
(= (capacity j2) 10)
(= (amount j2) 0)
(= (capacity j3) 4)
(= (amount j3) 0)
(= (capacity j4) 5)
(= (amount j4) 0)
)
(:goal
 (and
(= (amount j0) 2)
(= (amount j1) 10)
(= (amount j2) 2)
(= (amount j3) 1)
(= (amount j4) 1)
)
)
