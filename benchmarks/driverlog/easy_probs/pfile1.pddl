(define (problem DLOG_2_2_2)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	truck1 - truck
	truck2 - truck
	package1 - obj
	package2 - obj
	s0 - location
	s1 - location
	s2 - location
	p10 - location
	p12 - location
	)
	(:init
	(at driver1 s2)
	(at driver2 s2)
	(at truck1 s0)
	(empty truck1)
	(at truck2 s0)
	(empty truck2)
	(at package1 s0)
	(at package2 s0)
	(path s1 p10)
	(path p10 s1)
	(path s0 p10)
	(path p10 s0)
	(= (time_to_walk s1 p10) 43)
	(= (time_to_walk p10 s1) 43)
	(= (time_to_walk s0 p10) 80)
	(= (time_to_walk p10 s0) 80)
	(path s1 p12)
	(path p12 s1)
	(path s2 p12)
	(path p12 s2)
	(= (time_to_walk s1 p12) 29)
	(= (time_to_walk p12 s1) 29)
	(= (time_to_walk s2 p12) 79)
	(= (time_to_walk p12 s2) 79)
	(link s0 s1)
	(link s1 s0)
	(= (time_to_drive s0 s1) 70)
	(= (time_to_drive s1 s0) 70)
	(link s0 s2)
	(link s2 s0)
	(= (time_to_drive s0 s2) 47)
	(= (time_to_drive s2 s0) 47)
	(link s2 s1)
	(link s1 s2)
	(= (time_to_drive s2 s1) 24)
	(= (time_to_drive s1 s2) 24)
	(= (driven) 0)
	(= (walked) 0)
)
	(:goal (and
	(at driver1 s1)
	(at truck1 s1)
	(at package1 s0)
	(at package2 s0)
	))

; (:metric minimize (+ (+ (* 2  (total_time)) (* 1  (driven))) (* 3  (walked))))

)
