(define (problem DLOG_3_2_5)
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
	package5 - obj
	s0 - location
	s1 - location
	s2 - location
	p0_1 - location
	p0_2 - location
	p1_2 - location
	)
	(:init
	(at driver1 s1)
	(at driver2 s0)
	(at driver3 s0)
	(at truck1 s1)
	(empty truck1)
	(at truck2 s1)
	(empty truck2)
	(at package1 s0)
	(at package2 s0)
	(at package3 s2)
	(at package4 s2)
	(at package5 s1)
	(path s0 p0_1)
	(path p0_1 s0)
	(path s1 p0_1)
	(path p0_1 s1)
	(= (time_to_walk s0 p0_1) 64)
	(= (time_to_walk p0_1 s0) 64)
	(= (time_to_walk s1 p0_1) 23)
	(= (time_to_walk p0_1 s1) 23)
	(path s0 p0_2)
	(path p0_2 s0)
	(path s2 p0_2)
	(path p0_2 s2)
	(= (time_to_walk s0 p0_2) 34)
	(= (time_to_walk p0_2 s0) 34)
	(= (time_to_walk s2 p0_2) 78)
	(= (time_to_walk p0_2 s2) 78)
	(path s1 p1_2)
	(path p1_2 s1)
	(path s2 p1_2)
	(path p1_2 s2)
	(= (time_to_walk s1 p1_2) 46)
	(= (time_to_walk p1_2 s1) 46)
	(= (time_to_walk s2 p1_2) 18)
	(= (time_to_walk p1_2 s2) 18)
	(link s0 s1)
	(link s1 s0)
	(= (time_to_drive s0 s1) 20)
	(= (time_to_drive s1 s0) 20)
	(link s0 s2)
	(link s2 s0)
	(= (time_to_drive s0 s2) 50)
	(= (time_to_drive s2 s0) 50)
	(link s1 s2)
	(link s2 s1)
	(= (time_to_drive s1 s2) 14)
	(= (time_to_drive s2 s1) 14)
	(= (driven) 0)
	(= (walked) 0)
)
	(:goal (and
	(at driver2 s2)
	(at truck1 s2)
	(at truck2 s2)
	(at package1 s1)
	(at package2 s1)
	(at package3 s1)
	(at package4 s0)
	(at package5 s1)
	))

;(:metric minimize (+ (+ (* 4  (total_time)) (* 4  (driven))) (* 2  (walked))))

)
