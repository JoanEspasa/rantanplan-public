(define (problem DLOG-33-5)
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
	p12 - location
	p20 - location
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
	(= (at driver1) s2)
	(= (at driver2) s2)
	(= (at driver3) s1)
	(= (at truck1) s0)
	(empty truck1)
	(= (at truck2) s1)
	(empty truck2)
	(= (at truck3) s1)
	(empty truck3)
	(= (at package1) s1)
	(= (at package2) s1)
	(= (at package3) s0)
	(= (at package4) s1)
	(= (at package5) s1)
	(path s1 p12)
	(path p12 s1)
	(path s2 p12)
	(path p12 s2)
	(= (time_to_walk s1 p12) 44)
	(= (time_to_walk p12 s1) 44)
	(= (time_to_walk s2 p12) 29)
	(= (time_to_walk p12 s2) 29)
	(path s2 p20)
	(path p20 s2)
	(path s0 p20)
	(path p20 s0)
	(= (time_to_walk s2 p20) 97)
	(= (time_to_walk p20 s2) 97)
	(= (time_to_walk s0 p20) 77)
	(= (time_to_walk p20 s0) 77)
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
)
	(:goal (and
	(= (at driver1) s1)
	(= (at driver2) s0)
	(= (at truck1) s0)
	(= (at truck2) s0)
	(= (at truck3) s2)
	(= (at package1) s2)
	(= (at package2) s1)
	(= (at package3) s0)
	(= (at package4) s1)
	(= (at package5) s1)
	))

;(:metric minimize (+ (+ (* 3  (total-time)) (* 2  (driven))) (* 4  (walked))))

)
