(define (problem blocks-3-3)(:domain blocks)(:objects  b0 -block  b1 -block  b2 -block  b3 -block  c0 -piston  c1 -piston  c2 -piston  )

(:init 
(handempty)
(true)
(= (w b0) 5)
(= (w b1) 9)
(= (w b2) 7)
(= (w b3) 2)
(= (a c0) 2)
(= (l c0) 10)
(= (a c1) 2)
(= (l c1) 10)
(= (a c2) 1)
(= (l c2) 10)
(= (v) 5)
(= (rho) 5)
(onbottom b0)
(in b0 c0)
(in b1 c0)
(on b1 b0)
(clear b1)
(onbottom b2)
(in b2 c1)
(in b3 c1)
(on b3 b2)
(clear b3)
(= (p c0) 14)
(= (p c1) 9)
(empty c2)
(= (p c2) 0)
)
(:goal (and 
(onbottom b0)
(on b1 b0)
(on b2 b1)
(onbottom b3)
)))
