(define (domain blocks)
  (:requirements :typing :fluents)
(:types block -object piston -object)
(:constants 
b0 -block  b1 -block  b2 -block  b3 -block  c0 -piston  c1 -piston  c2 -piston  )

(:predicates (on ?x - block ?y - block)
(onbottom ?x - block)
(clear ?x - block)
(handempty)
(holding ?x - block)
(in ?x - block ?y -piston)
(empty ?z -piston)
(true))
(:functions (w ?x -block) ;;indicates the current weight of a block (constant)
                 (p ?z -piston) ;;indicates the weith of the fluid inside a cylinder
                 (active ?x -block ?z -piston) ;;indicates the numerical implication of having a block inside a cylinder 
                 (a ?z -piston) ;;this is the cylunder's crhossectional area (constant)
                 (d ?z -piston) ;;the height of the fluid in each cylinder 
                (l ?z -piston) ;;the maximum height of the fluid in each cylinder (constant)
                 (f ?z -piston) ;;the downward force at the bottom of each cylinder 
                 (rho) ;;the fluid density. this is independent from the specific cylinder (constant)
                 (v) ;;the total amount of fluid over the cylinders never change (constant)
   )            
  (:action pick-up 
	     :parameters (?x - block ?z -piston)
 	     :precondition (and (clear ?x) (onbottom ?x) (in ?x ?z) (handempty))
 	     :effect 	     (and (not (onbottom ?x))
            (empty ?z)
 		   (not (clear ?x))
            (not (in ?x ?z))
 		   (not (handempty))
 		   (holding ?x)))
   (:action put-down 
	     :parameters (?x - block ?z -piston)
 	     :precondition (and (holding ?x) (empty ?z))
 	     :effect 	     (and (not  (holding ?x))
 		   (clear ?x)
            (not (empty ?z))
 		   (handempty)
 		   (onbottom ?x)
            (in ?x ?z)))
   (:action stack 
	     :parameters (?x - block ?y - block ?z -piston)
 	     :precondition (and (holding ?x) (clear ?y) (in ?y ?z))
 	     :effect 
	     (and (not (holding ?x))
 		   (not (clear ?y))
 		   (clear ?x)
 		   (handempty)
 		   (on ?x ?y)
            (in ?x ?z)))
   (:action unstack 
	     :parameters (?x - block ?y - block ?z -piston)
 	     :precondition (and (on ?x ?y) (clear ?x) (handempty) (in ?x ?z) (in ?y ?z))
 	     :effect 
	     (and (holding ?x)
 		   (clear ?y) 
           (not (in ?x ?z))
 		   (not (clear ?x))
            (not (handempty))
 		   (not (on ?x ?y))))
  )
