(define (problem DLOG_2_2_3)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	truck1 - truck
	truck2 - truck
	package1 - obj
	package2 - obj
	package3 - obj
	s0 - location
	s1 - location
	s2 - location
	p0_1 - location
	p0_2 - location
	p1_0 - location
	p2_1 - location
	)
	(:init
	(at driver1 s0)
	(at driver2 s0)
	(at truck1 s0)
	(empty truck1)
	(at truck2 s1)
	(empty truck2)
	(at package1 s2)
	(at package2 s1)
	(at package3 s1)
	(path s0 p0_1)
	(path p0_1 s0)
	(path s1 p0_1)
	(path p0_1 s1)
	(= (time_to_walk s0 p0_1) 37)
	(= (time_to_walk p0_1 s0) 37)
	(= (time_to_walk s1 p0_1) 39)
	(= (time_to_walk p0_1 s1) 39)
	(path s0 p0_2)
	(path p0_2 s0)
	(path s2 p0_2)
	(path p0_2 s2)
	(= (time_to_walk s0 p0_2) 68)
	(= (time_to_walk p0_2 s0) 68)
	(= (time_to_walk s2 p0_2) 7)
	(= (time_to_walk p0_2 s2) 7)
	(path s2 p2_1)
	(path p2_1 s2)
	(path s1 p2_1)
	(path p2_1 s1)
	(= (time_to_walk s2 p2_1) 30)
	(= (time_to_walk p2_1 s2) 30)
	(= (time_to_walk s1 p2_1) 19)
	(= (time_to_walk p2_1 s1) 19)
	(link s0 s2)
	(link s2 s0)
	(= (time_to_drive s0 s2) 52)
	(= (time_to_drive s2 s0) 52)
	(link s1 s0)
	(link s0 s1)
	(= (time_to_drive s1 s0) 63)
	(= (time_to_drive s0 s1) 63)
	(link s1 s2)
	(link s2 s1)
	(= (time_to_drive s1 s2) 86)
	(= (time_to_drive s2 s1) 86)
	(= (driven) 0)
	(= (walked) 0)
)
	(:goal (and
	(at driver1 s1)
	(at driver2 s1)
	(at truck1 s2)
	(at truck2 s0)
	(at package1 s0)
	(at package2 s2)
	(at package3 s0)
	))

;(:metric minimize (+ (+ (* 2  (total_time)) (* 4  (driven))) (* 1  (walked))))

)
