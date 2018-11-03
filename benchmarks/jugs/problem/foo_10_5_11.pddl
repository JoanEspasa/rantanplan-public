(define
(problem foo_10_5_11)
(:domain jug-pouring)
(:objects
j0 - jug
j1 - jug
j2 - jug
j3 - jug
j4 - jug
)
(:init
(= (capacity j0) 5)
(= (amount j0) 0)
(= (capacity j1) 6)
(= (amount j1) 0)
(= (capacity j2) 10)
(= (amount j2) 0)
(= (capacity j3) 6)
(= (amount j3) 0)
(= (capacity j4) 10)
(= (amount j4) 0)
)
(:goal
 (and
(= (amount j0) 1)
(= (amount j1) 2)
(= (amount j2) 2)
(= (amount j3) 2)
(= (amount j4) 2)
)
)
