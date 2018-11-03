(define
(problem foo_30_10_9)
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
(= (capacity j0) 18)
(= (amount j0) 0)
(= (capacity j1) 9)
(= (amount j1) 0)
(= (capacity j2) 10)
(= (amount j2) 0)
(= (capacity j3) 14)
(= (amount j3) 0)
(= (capacity j4) 9)
(= (amount j4) 0)
(= (capacity j5) 22)
(= (amount j5) 0)
(= (capacity j6) 3)
(= (amount j6) 0)
(= (capacity j7) 27)
(= (amount j7) 0)
(= (capacity j8) 17)
(= (amount j8) 0)
(= (capacity j9) 10)
(= (amount j9) 0)
)
(:goal
 (and
(= (amount j0) 9)
(= (amount j1) 1)
(= (amount j2) 2)
(= (amount j3) 1)
(= (amount j4) 1)
(= (amount j5) 1)
(= (amount j6) 3)
(= (amount j7) 1)
(= (amount j8) 1)
(= (amount j9) 1)
)
)
