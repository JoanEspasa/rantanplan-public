(define (problem blocks-3-3)(:domain blocks)(:objects  b0 -block  b1 -block  b2 -block  b3 -block  b4 -block  b5 -block  c0 -piston  c1 -piston  c2 -piston  )

(:init 
(handempty)
(true)
(= (w b0) 5)
(= (w b1) 9)
(= (w b2) 7)
(= (w b3) 2)
(= (w b4) 4)
(= (w b5) 7)
(= (a c0) 2)
(= (l c0) 10)
(= (a c1) 2)
(= (l c1) 10)
(= (a c2) 1)
(= (l c2) 10)
(= (v) 10)
(= (rho) 5)
(onbottom b0)
(in b0 c0)
(in b2 c0)
(on b2 b0)
(in b4 c0)
(on b4 b2)
(clear b4)
(onbottom b1)
(in b1 c1)
(in b3 c1)
(on b3 b1)
(clear b3)
(onbottom b5)
(in b5 c2)
(clear b5)
(= (p c0) 16)
(= (p c1) 11)
(= (p c2) 7)
)
(:goal (and 
(onbottom b0)
(on b5 b0)
(onbottom b1)
(onbottom b2)
(on b3 b2)
)))
