(define
(problem prim2_70_12_3)
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
j10 - jug
j11 - jug
)
(:init
(= (capacity j0) 41)
(= (amount j0) 0)
(= (capacity j1) 11)
(= (amount j1) 0)
(= (capacity j2) 52)
(= (amount j2) 0)
(= (capacity j3) 47)
(= (amount j3) 0)
(= (capacity j4) 51)
(= (amount j4) 0)
(= (capacity j5) 98)
(= (amount j5) 0)
(= (capacity j6) 31)
(= (amount j6) 0)
(= (capacity j7) 60)
(= (amount j7) 0)
(= (capacity j8) 91)
(= (amount j8) 0)
(= (capacity j9) 23)
(= (amount j9) 0)
(= (capacity j10) 38)
(= (amount j10) 0)
(= (capacity j11) 61)
(= (amount j11) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 51)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 97)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 90)
(= (amount j9) 0)
(= (amount j10) 0)
(= (amount j11) 60)
)
))
