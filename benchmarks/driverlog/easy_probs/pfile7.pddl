(define (problem DLOG_3_3_6)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	driver3 - driver
	truck1 - truck
	truck2 - truck
	truck3 - truck
	package1 - obj
	package2 - obj
	package3 - obj
	package4 - obj
	package5 - obj
	package6 - obj
	s0 - location
	s1 - location
	s2 - location
	p0_1 - location
	p0_2 - location
	p2_1 - location
	)
	(:init
	(at driver1 s1)
	(at driver2 s2)
	(at driver3 s2)
	(at truck1 s1)
	(empty truck1)
	(at truck2 s1)
	(empty truck2)
	(at truck3 s1)
	(empty truck3)
	(at package1 s0)
	(at package2 s2)
	(at package3 s1)
	(at package4 s1)
	(at package5 s1)
	(at package6 s0)
	(path s0 p0_1)
	(path p0_1 s0)
	(path s1 p0_1)
	(path p0_1 s1)
	(= (time_to_walk s0 p0_1) 1)
	(= (time_to_walk p0_1 s0) 1)
	(= (time_to_walk s1 p0_1) 87)
	(= (time_to_walk p0_1 s1) 87)
	(path s0 p0_2)
	(path p0_2 s0)
	(path s2 p0_2)
	(path p0_2 s2)
	(= (time_to_walk s0 p0_2) 77)
	(= (time_to_walk p0_2 s0) 77)
	(= (time_to_walk s2 p0_2) 29)
	(= (time_to_walk p0_2 s2) 29)
	(path s2 p2_1)
	(path p2_1 s2)
	(path s1 p2_1)
	(path p2_1 s1)
	(= (time_to_walk s2 p2_1) 44)
	(= (time_to_walk p2_1 s2) 44)
	(= (time_to_walk s1 p2_1) 22)
	(= (time_to_walk p2_1 s1) 22)
	(link s1 s0)
	(link s0 s1)
	(= (time_to_drive s1 s0) 76)
	(= (time_to_drive s0 s1) 76)
	(link s1 s2)
	(link s2 s1)
	(= (time_to_drive s1 s2) 92)
	(= (time_to_drive s2 s1) 92)
	(link s2 s0)
	(link s0 s2)
	(= (time_to_drive s2 s0) 34)
	(= (time_to_drive s0 s2) 34)
	(= (driven) 0)
	(= (walked) 0)
)
	(:goal (and
	(at driver1 s0)
	(at driver2 s0)
	(at truck1 s1)
	(at truck2 s0)
	(at package1 s0)
	(at package2 s1)
	(at package3 s1)
	(at package4 s2)
	(at package5 s0)
	(at package6 s0)
	))

;(:metric minimize (+ (+ (* 4  (total_time)) (* 2  (driven))) (* 3  (walked))))

)
