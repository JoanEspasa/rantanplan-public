(define (problem DLOG-32-5)
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
	p01 - location
	p02 - location
	p12 - location
	)
	(:init
     (= (driving driver1) undefined)
     (= (driving driver2) undefined)
     (= (driving driver3) undefined)
    (= (in package1) undefined)
    (= (in package2) undefined)
    (= (in package3) undefined)
    (= (in package4) undefined)
    (= (in package5) undefined)
	(= (at driver1) s1)
	(= (at driver2) s0)
	(= (at driver3) s0)
	(= (at truck1) s1)
	(empty truck1)
	(= (at truck2) s1)
	(empty truck2)
	(= (at package1) s0)
	(= (at package2) s0)
	(= (at package3) s2)
	(= (at package4) s2)
	(= (at package5) s1)
	(path s0 p01)
	(path p01 s0)
	(path s1 p01)
	(path p01 s1)
	(= (time_to_walk s0 p01) 64)
	(= (time_to_walk p01 s0) 64)
	(= (time_to_walk s1 p01) 23)
	(= (time_to_walk p01 s1) 23)
	(path s0 p02)
	(path p02 s0)
	(path s2 p02)
	(path p02 s2)
	(= (time_to_walk s0 p02) 34)
	(= (time_to_walk p02 s0) 34)
	(= (time_to_walk s2 p02) 78)
	(= (time_to_walk p02 s2) 78)
	(path s1 p12)
	(path p12 s1)
	(path s2 p12)
	(path p12 s2)
	(= (time_to_walk s1 p12) 46)
	(= (time_to_walk p12 s1) 46)
	(= (time_to_walk s2 p12) 18)
	(= (time_to_walk p12 s2) 18)
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
)
	(:goal (and
	(= (at driver2) s2)
	(= (at truck1) s2)
	(= (at truck2) s2)
	(= (at package1) s1)
	(= (at package2) s1)
	(= (at package3) s1)
	(= (at package4) s0)
	(= (at package5) s1)
	))

;(:metric minimize (+ (+ (* 4  (total-time)) (* 4  (driven))) (* 2  (walked))))

)
