(define (problem DLOG_3_2_4)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	driver3 - driver
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
	p1_0 - location
	p1_2 - location
	p2_1 - location
	)
	(:init
	(at_ driver1 s1)
	(at_ driver2 s1)
	(at_ driver3 s0)
	(at_ truck1 s1)
	(empty truck1)
	(at_ truck2 s0)
	(empty truck2)
	(at_ package1 s2)
	(at_ package2 s2)
	(at_ package3 s0)
	(at_ package4 s1)
	(path s0 p0_1)
	(path p0_1 s0)
	(path s1 p0_1)
	(path p0_1 s1)
	(= (time_to_walk s0 p0_1) 8)
	(= (time_to_walk p0_1 s0) 8)
	(= (time_to_walk s1 p0_1) 99)
	(= (time_to_walk p0_1 s1) 99)
	(path s1 p1_2)
	(path p1_2 s1)
	(path s2 p1_2)
	(path p1_2 s2)
	(= (time_to_walk s1 p1_2) 94)
	(= (time_to_walk p1_2 s1) 94)
	(= (time_to_walk s2 p1_2) 97)
	(= (time_to_walk p1_2 s2) 97)
	(link s0 s2)
	(link s2 s0)
	(= (time_to_drive s0 s2) 56)
	(= (time_to_drive s2 s0) 56)
	(link s1 s0)
	(link s0 s1)
	(= (time_to_drive s1 s0) 43)
	(= (time_to_drive s0 s1) 43)
	(link s2 s1)
	(link s1 s2)
	(= (time_to_drive s2 s1) 37)
	(= (time_to_drive s1 s2) 37)
	(= (driven) 0)
	(= (walked) 0)
)
	(:goal (and
	(at_ driver1 s1)
	(at_ driver2 s0)
	(at_ driver3 s1)
	(at_ truck1 s1)
	(at_ truck2 s2)
	(at_ package1 s1)
	(at_ package2 s2)
	(at_ package3 s2)
	(at_ package4 s0)
	))

;(:metric minimize (+ (+ (* 3  (total_time)) (* 2  (driven))) (* 1  (walked))))

)
