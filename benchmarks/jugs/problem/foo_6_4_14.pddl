(define
(problem foo_6_4_14)
(:domain jug-pouring)
(:objects
j0 - jug
j1 - jug
j2 - jug
j3 - jug
)
(:init
(= (capacity j0) 3)
(= (amount j0) 0)
(= (capacity j1) 3)
(= (amount j1) 0)
(= (capacity j2) 1)
(= (amount j2) 0)
(= (capacity j3) 2)
(= (amount j3) 0)
)
(:goal
 (and
(= (amount j0) 3)
(= (amount j1) 1)
(= (amount j2) 1)
(= (amount j3) 1)
)
)
