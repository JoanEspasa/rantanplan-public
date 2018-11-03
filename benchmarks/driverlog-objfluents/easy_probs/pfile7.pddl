(define (problem DLOG-33-6)
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
	p01 - location
	p02 - location
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
    (= (in package5) undefined)
    (= (in package6) undefined)
	(= (at driver1) s1)
	(= (at driver2) s2)
	(= (at driver3) s2)
	(= (at truck1) s1)
	(empty truck1)
	(= (at truck2) s1)
	(empty truck2)
	(= (at truck3) s1)
	(empty truck3)
	(= (at package1) s0)
	(= (at package2) s2)
	(= (at package3) s1)
	(= (at package4) s1)
	(= (at package5) s1)
	(= (at package6) s0)
	(path s0 p01)
	(path p01 s0)
	(path s1 p01)
	(path p01 s1)
	(= (time_to_walk s0 p01) 1)
	(= (time_to_walk p01 s0) 1)
	(= (time_to_walk s1 p01) 87)
	(= (time_to_walk p01 s1) 87)
	(path s0 p02)
	(path p02 s0)
	(path s2 p02)
	(path p02 s2)
	(= (time_to_walk s0 p02) 77)
	(= (time_to_walk p02 s0) 77)
	(= (time_to_walk s2 p02) 29)
	(= (time_to_walk p02 s2) 29)
	(path s2 p21)
	(path p21 s2)
	(path s1 p21)
	(path p21 s1)
	(= (time_to_walk s2 p21) 44)
	(= (time_to_walk p21 s2) 44)
	(= (time_to_walk s1 p21) 22)
	(= (time_to_walk p21 s1) 22)
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
)
	(:goal (and
	(= (at driver1) s0)
	(= (at driver2) s0)
	(= (at truck1) s1)
	(= (at truck2) s0)
	(= (at package1) s0)
	(= (at package2) s1)
	(= (at package3) s1)
	(= (at package4) s2)
	(= (at package5) s0)
	(= (at package6) s0)
	))

;(:metric minimize (+ (+ (* 4  (total-time)) (* 2  (driven))) (* 3  (walked))))

)
