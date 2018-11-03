(define (problem DLOG_2_2_4)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	truck1 - truck
	truck2 - truck
	package1 - obj
	package2 - obj
	package3 - obj
	package4 - obj
	s0 - location
	s1 - location
	s2 - location
	p0_1 - location
	p2_0 - location
	p2_1 - location
	)
	(:init
	(at_ driver1 s1)
	(at_ driver2 s0)
	(at_ truck1 s1)
	(empty truck1)
	(at_ truck2 s2)
	(empty truck2)
	(at_ package1 s0)
	(at_ package2 s0)
	(at_ package3 s1)
	(at_ package4 s1)
	(path s0 p0_1)
	(path p0_1 s0)
	(path s1 p0_1)
	(path p0_1 s1)
	(= (time_to_walk s0 p0_1) 50)
	(= (time_to_walk p0_1 s0) 50)
	(= (time_to_walk s1 p0_1) 92)
	(= (time_to_walk p0_1 s1) 92)
	(path s2 p2_0)
	(path p2_0 s2)
	(path s0 p2_0)
	(path p2_0 s0)
	(= (time_to_walk s2 p2_0) 73)
	(= (time_to_walk p2_0 s2) 73)
	(= (time_to_walk s0 p2_0) 100)
	(= (time_to_walk p2_0 s0) 100)
	(path s2 p2_1)
	(path p2_1 s2)
	(path s1 p2_1)
	(path p2_1 s1)
	(= (time_to_walk s2 p2_1) 8)
	(= (time_to_walk p2_1 s2) 8)
	(= (time_to_walk s1 p2_1) 71)
	(= (time_to_walk p2_1 s1) 71)
	(link s1 s0)
	(link s0 s1)
	(= (time_to_drive s1 s0) 42)
	(= (time_to_drive s0 s1) 42)
	(link s1 s2)
	(link s2 s1)
	(= (time_to_drive s1 s2) 55)
	(= (time_to_drive s2 s1) 55)
	(link s2 s0)
	(link s0 s2)
	(= (time_to_drive s2 s0) 23)
	(= (time_to_drive s0 s2) 23)
	(= (driven) 0)
	(= (walked) 0)
)
	(:goal (and
	(at_ driver2 s2)
	(at_ truck1 s1)
	(at_ truck2 s2)
	(at_ package1 s1)
	(at_ package2 s1)
	(at_ package3 s2)
	))

;(:metric minimize (+ (+ (* 4  (total_time)) (* 3  (driven))) (* 3  (walked))))

)
