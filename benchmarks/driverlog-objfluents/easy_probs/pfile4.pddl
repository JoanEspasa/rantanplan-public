(define (problem DLOG-32-4)
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
	p01 - location
	p10 - location
	p12 - location
	p21 - location
	)
	(:init
     (= (driving driver1) undefined)
     (= (driving driver2) undefined)
     (= (driving driver3) undefined)
    (= (in package1) undefined)
    (= (in package2) undefined)
    (= (in package3) undefined)
    (= (in package4) undefined)
	(= (at driver1) s1)
	(= (at driver2) s1)
	(= (at driver3) s0)
	(= (at truck1) s1)
	(empty truck1)
	(= (at truck2) s0)
	(empty truck2)
	(= (at package1) s2)
	(= (at package2) s2)
	(= (at package3) s0)
	(= (at package4) s1)
	(path s0 p01)
	(path p01 s0)
	(path s1 p01)
	(path p01 s1)
	(= (time_to_walk s0 p01) 8)
	(= (time_to_walk p01 s0) 8)
	(= (time_to_walk s1 p01) 99)
	(= (time_to_walk p01 s1) 99)
	(path s1 p12)
	(path p12 s1)
	(path s2 p12)
	(path p12 s2)
	(= (time_to_walk s1 p12) 94)
	(= (time_to_walk p12 s1) 94)
	(= (time_to_walk s2 p12) 97)
	(= (time_to_walk p12 s2) 97)
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
)
	(:goal (and
	(= (at driver1) s1)
	(= (at driver2) s0)
	(= (at driver3) s1)
	(= (at truck1) s1)
	(= (at truck2) s2)
	(= (at package1) s1)
	(= (at package2) s2)
	(= (at package3) s2)
	(= (at package4) s0)
	))

;(:metric minimize (+ (+ (* 3  (total-time)) (* 2  (driven))) (* 1  (walked))))

)
