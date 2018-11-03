(define
(problem foo_20_10_19)
(:domain jug-pouring)
(:objects
j0 - jug
j1 - jug
j2 - jug
j3 - jug
j4 - jug
j5 - jug
j6 - jug
j7 - jug
j8 - jug
j9 - jug
)
(:init
(= (capacity j0) 8)
(= (amount j0) 0)
(= (capacity j1) 10)
(= (amount j1) 0)
(= (capacity j2) 15)
(= (amount j2) 0)
(= (capacity j3) 3)
(= (amount j3) 0)
(= (capacity j4) 12)
(= (amount j4) 0)
(= (capacity j5) 1)
(= (amount j5) 0)
(= (capacity j6) 1)
(= (amount j6) 0)
(= (capacity j7) 17)
(= (amount j7) 0)
(= (capacity j8) 11)
(= (amount j8) 0)
(= (capacity j9) 15)
(= (amount j9) 0)
)
(:goal
 (and
(= (amount j0) 2)
(= (amount j1) 5)
(= (amount j2) 3)
(= (amount j3) 3)
(= (amount j4) 1)
(= (amount j5) 1)
(= (amount j6) 1)
(= (amount j7) 1)
(= (amount j8) 1)
(= (amount j9) 1)
)
)
