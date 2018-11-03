(define (problem DLOG_3_3_5)
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
	s0 - location
	s1 - location
	s2 - location
	p1_2 - location
	p2_0 - location
	)
	(:init
	(at_ driver1 s2)
	(at_ driver2 s2)
	(at_ driver3 s1)
	(at_ truck1 s0)
	(empty truck1)
	(at_ truck2 s1)
	(empty truck2)
	(at_ truck3 s1)
	(empty truck3)
	(at_ package1 s1)
	(at_ package2 s1)
	(at_ package3 s0)
	(at_ package4 s1)
	(at_ package5 s1)
	(path s1 p1_2)
	(path p1_2 s1)
	(path s2 p1_2)
	(path p1_2 s2)
	(= (time_to_walk s1 p1_2) 44)
	(= (time_to_walk p1_2 s1) 44)
	(= (time_to_walk s2 p1_2) 29)
	(= (time_to_walk p1_2 s2) 29)
	(path s2 p2_0)
	(path p2_0 s2)
	(path s0 p2_0)
	(path p2_0 s0)
	(= (time_to_walk s2 p2_0) 97)
	(= (time_to_walk p2_0 s2) 97)
	(= (time_to_walk s0 p2_0) 77)
	(= (time_to_walk p2_0 s0) 77)
	(link s0 s1)
	(link s1 s0)
	(= (time_to_drive s0 s1) 93)
	(= (time_to_drive s1 s0) 93)
	(link s0 s2)
	(link s2 s0)
	(= (time_to_drive s0 s2) 19)
	(= (time_to_drive s2 s0) 19)
	(link s2 s1)
	(link s1 s2)
	(= (time_to_drive s2 s1) 90)
	(= (time_to_drive s1 s2) 90)
	(= (driven) 0)
	(= (walked) 0)
)
	(:goal (and
	(at_ driver1 s1)
	(at_ driver2 s0)
	(at_ truck1 s0)
	(at_ truck2 s0)
	(at_ truck3 s2)
	(at_ package1 s2)
	(at_ package2 s1)
	(at_ package3 s0)
	(at_ package4 s1)
	(at_ package5 s1)
	))

;(:metric minimize (+ (+ (* 3  (total_time)) (* 2  (driven))) (* 4  (walked))))

)
