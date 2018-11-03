(define
(problem jugs3)
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
(= (capacity j0) 0)
(= (amount j0) 0)
(= (capacity j1) 1)
(= (amount j1) 0)
(= (capacity j2) 2)
(= (amount j2) 0)
(= (capacity j3) 3)
(= (amount j3) 0)
(= (capacity j4) 4)
(= (amount j4) 0)
(= (capacity j5) 5)
(= (amount j5) 0)
)
(:goal
 (and
(= (amount j0) 1)
(= (amount j1) 1)
(= (amount j2) 1)
(= (amount j3) 1)
(= (amount j4) 1)
(= (amount j5) 1)
)
)
