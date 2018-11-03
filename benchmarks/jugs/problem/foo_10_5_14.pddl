(define
(problem foo_10_5_14)
(:domain jug-pouring)
(:objects
j0 - jug
j1 - jug
j2 - jug
j3 - jug
j4 - jug
)
(:init
(= (capacity j0) 3)
(= (amount j0) 0)
(= (capacity j1) 3)
(= (amount j1) 0)
(= (capacity j2) 9)
(= (amount j2) 0)
(= (capacity j3) 7)
(= (amount j3) 0)
(= (capacity j4) 5)
(= (amount j4) 0)
)
(:goal
 (and
(= (amount j0) 3)
(= (amount j1) 3)
(= (amount j2) 1)
(= (amount j3) 1)
(= (amount j4) 1)
)
)
