;; Toy linear
;; ######
;; #p'16#
;; ######

(define (problem problem_toy_linear)
	(:domain 
		snowman_domain
	)
	(:objects
		p0_0 - posicio
		p0_1 - posicio
		p0_2 - posicio
		p0_3 - posicio
	)
	(:init
		(agent_at p0_0)
		
		(= (ball_at p0_0) 0)
		(= (ball_at p0_1) 0)
		(= (ball_at p0_2) 1)
		(= (ball_at p0_3) 6)

		(adjacent p0_0 p0_1)
		(adjacent p0_1 p0_2)
		(adjacent p0_1 p0_0)
		(adjacent p0_2 p0_3)
		(adjacent p0_2 p0_1)
		(adjacent p0_3 p0_2)
		(inline p0_0 p0_2)
		(inline p0_1 p0_3)
		(inline p0_2 p0_0)
		(inline p0_3 p0_1)
	)
	(:goal 
		(and (done))
	)
)
