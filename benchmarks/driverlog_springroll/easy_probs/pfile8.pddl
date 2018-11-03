(define (problem DLOG_3_3_7)
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
	package7 - obj
	s0 - location
	s1 - location
	s2 - location
	p1_0 - location
	p2_0 - location
	p2_1 - location
	)
	(:init
	(at_ driver1 s2)
	(at_ driver2 s0)
	(at_ driver3 s1)
	(at_ truck1 s2)
	(empty truck1)
	(at_ truck2 s2)
	(empty truck2)
	(at_ truck3 s2)
	(empty truck3)
	(at_ package1 s0)
	(at_ package2 s1)
	(at_ package3 s0)
	(at_ package4 s0)
	(at_ package5 s1)
	(at_ package6 s2)
	(at_ package7 s2)
	(path s1 p1_0)
	(path p1_0 s1)
	(path s0 p1_0)
	(path p1_0 s0)
	(= (time_to_walk s1 p1_0) 75)
	(= (time_to_walk p1_0 s1) 75)
	(= (time_to_walk s0 p1_0) 24)
	(= (time_to_walk p1_0 s0) 24)
	(path s2 p2_0)
	(path p2_0 s2)
	(path s0 p2_0)
	(path p2_0 s0)
	(= (time_to_walk s2 p2_0) 77)
	(= (time_to_walk p2_0 s2) 77)
	(= (time_to_walk s0 p2_0) 91)
	(= (time_to_walk p2_0 s0) 91)
	(path s2 p2_1)
	(path p2_1 s2)
	(path s1 p2_1)
	(path p2_1 s1)
	(= (time_to_walk s2 p2_1) 15)
	(= (time_to_walk p2_1 s2) 15)
	(= (time_to_walk s1 p2_1) 17)
	(= (time_to_walk p2_1 s1) 17)
	(link s0 s1)
	(link s1 s0)
	(= (time_to_drive s0 s1) 83)
	(= (time_to_drive s1 s0) 83)
	(link s0 s2)
	(link s2 s0)
	(= (time_to_drive s0 s2) 87)
	(= (time_to_drive s2 s0) 87)
	(link s1 s2)
	(link s2 s1)
	(= (time_to_drive s1 s2) 25)
	(= (time_to_drive s2 s1) 25)
	(= (driven) 0)
	(= (walked) 0)
)
	(:goal (and
	(at_ driver1 s2)
	(at_ driver2 s0)
	(at_ truck2 s1)
	(at_ truck3 s0)
	(at_ package1 s2)
	(at_ package2 s0)
	(at_ package3 s1)
	(at_ package4 s2)
	(at_ package5 s1)
	(at_ package6 s2)
	(at_ package7 s1)
	))

;(:metric minimize (+ (+ (* 1  (total_time)) (* 4  (driven))) (* 3  (walked))))

)
