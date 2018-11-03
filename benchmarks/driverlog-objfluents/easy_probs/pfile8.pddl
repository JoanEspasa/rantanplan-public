(define (problem DLOG-33-7)
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
	p10 - location
	p20 - location
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
    (= (in package7) undefined)
	(= (at driver1) s2)
	(= (at driver2) s0)
	(= (at driver3) s1)
	(= (at truck1) s2)
	(empty truck1)
	(= (at truck2) s2)
	(empty truck2)
	(= (at truck3) s2)
	(empty truck3)
	(= (at package1) s0)
	(= (at package2) s1)
	(= (at package3) s0)
	(= (at package4) s0)
	(= (at package5) s1)
	(= (at package6) s2)
	(= (at package7) s2)
	(path s1 p10)
	(path p10 s1)
	(path s0 p10)
	(path p10 s0)
	(= (time_to_walk s1 p10) 75)
	(= (time_to_walk p10 s1) 75)
	(= (time_to_walk s0 p10) 24)
	(= (time_to_walk p10 s0) 24)
	(path s2 p20)
	(path p20 s2)
	(path s0 p20)
	(path p20 s0)
	(= (time_to_walk s2 p20) 77)
	(= (time_to_walk p20 s2) 77)
	(= (time_to_walk s0 p20) 91)
	(= (time_to_walk p20 s0) 91)
	(path s2 p21)
	(path p21 s2)
	(path s1 p21)
	(path p21 s1)
	(= (time_to_walk s2 p21) 15)
	(= (time_to_walk p21 s2) 15)
	(= (time_to_walk s1 p21) 17)
	(= (time_to_walk p21 s1) 17)
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
)
	(:goal (and
	(= (at driver1) s2)
	(= (at driver2) s0)
	(= (at truck2) s1)
	(= (at truck3) s0)
	(= (at package1) s2)
	(= (at package2) s0)
	(= (at package3) s1)
	(= (at package4) s2)
	(= (at package5) s1)
	(= (at package6) s2)
	(= (at package7) s1)
	))

;(:metric minimize (+ (+ (* 1  (total-time)) (* 4  (driven))) (* 3  (walked))))

)
