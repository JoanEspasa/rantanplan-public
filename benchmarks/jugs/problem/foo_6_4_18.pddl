(define
(problem foo_6_4_18)
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
(= (capacity j1) 6)
(= (amount j1) 0)
(= (capacity j2) 3)
(= (amount j2) 0)
(= (capacity j3) 6)
(= (amount j3) 0)
)
(:goal
 (and
(= (amount j0) 3)
(= (amount j1) 3)
(= (amount j2) 3)
(= (amount j3) 3)
)
)
