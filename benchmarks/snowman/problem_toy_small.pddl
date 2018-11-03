;; Toy small
;; #####
;; #'24#
;; #'1'#
;; #p''#
;; #####

(define (problem problem_toy_small)
	(:domain 
		snowman_domain
	)
	(:objects
		p0_0 - posicio
		p0_1 - posicio
		p0_2 - posicio
		p1_0 - posicio
		p1_1 - posicio
		p1_2 - posicio
		p2_0 - posicio
		p2_1 - posicio
		p2_2 - posicio
	)
	(:init
		(agent_at p2_2)
		
		(= (ball_at p0_0) 0)
		(= (ball_at p0_1) 2)
		(= (ball_at p0_2) 4)
		(= (ball_at p1_0) 0)
		(= (ball_at p1_1) 1)
		(= (ball_at p1_2) 0)
		(= (ball_at p2_0) 0)
		(= (ball_at p2_1) 0)
		(= (ball_at p2_2) 0)

		(adjacent p0_0 p0_1)
		(adjacent p0_1 p1_1)
		(adjacent p0_1 p0_2)
		(adjacent p0_1 p0_0)
		(adjacent p0_2 p1_2)
		(adjacent p0_2 p0_1)
		(adjacent p1_0 p2_0)
		(adjacent p1_0 p0_0)
		(adjacent p1_0 p1_1)
		(adjacent p1_1 p2_1)
		(adjacent p1_1 p0_1)
		(adjacent p1_1 p1_2)
		(adjacent p1_1 p1_0)
		(adjacent p1_2 p2_2)
		(adjacent p1_2 p0_2)
		(adjacent p1_2 p1_1)
		(adjacent p2_0 p1_0)
		(adjacent p2_0 p2_1)
		(adjacent p2_1 p1_1)
		(adjacent p2_1 p2_2)
		(adjacent p2_1 p2_0)
		(adjacent p2_2 p1_2)
		(adjacent p2_2 p2_1)
		(inline p0_0 p2_0)
		(inline p0_0 p0_2)
		(inline p0_1 p2_1)
		(inline p0_2 p2_2)
		(inline p0_2 p0_0)
		(inline p1_0 p1_2)
		(inline p1_2 p1_0)
		(inline p2_0 p0_0)
		(inline p2_0 p2_2)
		(inline p2_1 p0_1)
		(inline p2_2 p0_2)
		(inline p2_2 p2_0)
	)
	(:goal 
		(and (done))
	)
)
