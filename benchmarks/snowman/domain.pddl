(define (domain snowman_domain)
	(:requirements :fluents)
	(:types posicio - object)
	(:predicates
		(agent_at ?a - posicio)
		(snow_at ?a - posicio)
		(adjacent ?a - posicio ?b - posicio)
		(inline ?a - posicio ?b - posicio)
		(done)		
	)
	(:functions
		(ball_at ?a - posicio) 
	)
	(:action finalitza 
		:parameters (?a - posicio)
		:precondition
			(and
				(= (ball_at ?a) 7))
		:effect
			(and
				(done))
	)
	(:action move_agent
		:parameters (?s - posicio ?d - posicio)
		:precondition 
			(and 
				(adjacent ?s ?d)
				(agent_at ?s)
				(= (ball_at ?d) 0))
		:effect
			(and
				(not (agent_at ?s))
				(agent_at ?d))
	)
	(:action move_ball
		:parameters
			(?a - posicio ?b - posicio ?c - posicio)
		:precondition 
			(and
				(adjacent ?a ?b)
				(adjacent ?b ?c)
				(inline ?a ?c)
				(agent_at ?a)
				(or
					(= (ball_at ?b) 1)
					(= (ball_at ?b) 2)
					(= (ball_at ?b) 4))
				(= (ball_at ?c) 0)
				(not (snow_at ?c)))
		:effect
			(and
				(not (agent_at ?a))
				(agent_at ?b)
				(assign (ball_at ?b) 0)
				(assign (ball_at ?c) (ball_at ?b)))
	)
	(:action move_ball_snow
		:parameters
			(?a - posicio ?b - posicio ?c - posicio)
		:precondition 
			(and
				(adjacent ?a ?b)
				(adjacent ?b ?c)
				(inline ?a ?c)
				(agent_at ?a)
				(or
					(= (ball_at ?b) 1)
					(= (ball_at ?b) 2)
					(= (ball_at ?b) 4))
				(= (ball_at ?c) 0)
				(snow_at ?c))
		:effect
			(and
				(not (agent_at ?a))
				(agent_at ?b)
				(assign (ball_at ?b) 0)
				(not (snow_at ?c))
				(when
					(= (ball_at ?b) 1)
					(assign (ball_at ?c) 2))
				(when
					(= (ball_at ?b) 2)
					(assign (ball_at ?c) 4))
				(when
					(= (ball_at ?b) 4)
					(assign (ball_at ?c) 4)))
	)
	(:action push_ball
		:parameters
			(?a - posicio ?b - posicio ?c - posicio)
		:precondition
			(and
				(adjacent ?a ?b)
				(adjacent ?b ?c)
				(inline ?a ?c)
				(agent_at ?a)
				(< (ball_at ?b) (ball_at ?c))
				(< (ball_at ?b) 3)
				(> (ball_at ?b) 0)
                )
		:effect
			(and
				(not (agent_at ?a))
				(agent_at ?b)
				(assign (ball_at ?b) 0)
				(increase (ball_at ?c) (ball_at ?b)))
	)
	(:action pop_ball
		:parameters
			(?a - posicio ?b - posicio ?c - posicio)
		:precondition
			(and
				(adjacent ?a ?b)
				(adjacent ?b ?c)
				(inline ?a ?c)
				(agent_at ?a)
				(or
					(= (ball_at ?b) 3)
					(= (ball_at ?b) 5)
					(= (ball_at ?b) 6))
				(= (ball_at ?c) 0)
				(not (snow_at ?c)))
		:effect
			(and
				(when
					(= (ball_at ?b) 3)
					(and
					  (assign (ball_at ?b) 2)
					  (assign (ball_at ?c) 1)))
				(when
					(= (ball_at ?b) 5)
					(and
						(assign (ball_at ?b) 4)
						(assign (ball_at ?c) 1)))
				(when
					(= (ball_at ?b) 6)
					(and
						(assign (ball_at ?b) 4)
						(assign (ball_at ?c) 2))))
	)
	(:action pop_ball_snow
		:parameters
			(?a - posicio ?b - posicio ?c - posicio)
		:precondition
			(and
				(adjacent ?a ?b)
				(adjacent ?b ?c)
				(inline ?a ?c)
				(agent_at ?a)
				(or
					(= (ball_at ?b) 3)
					(= (ball_at ?b) 5)
					(= (ball_at ?b) 6))
				(= (ball_at ?c) 0)
				(snow_at ?c))
		:effect
			(and
				(not (snow_at ?c))
				(when
					(= (ball_at ?b) 3)
					(and 
						(assign (ball_at ?b) 2)
						(assign (ball_at ?c) 2)))
				(when
					(= (ball_at ?b) 5)
					(and 
						(assign (ball_at ?b) 4)
						(assign (ball_at ?c) 2)))
				(when
					(= (ball_at ?b) 6)
					(and 
						(assign (ball_at ?b) 4)
						(assign (ball_at ?c) 4))))
	)
)
