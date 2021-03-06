(define (problem DLOG-23-6)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
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
	s3 - location
	s4 - location
	p01 - location
	p12 - location
	p13 - location
	p32 - location
	p34 - location
	p40 - location
	)
	(:init
     (= (driving driver1) undefined)
     (= (driving driver2) undefined)
    (= (in package1) undefined)
    (= (in package2) undefined)
    (= (in package3) undefined)
    (= (in package4) undefined)
    (= (in package5) undefined)
    (= (in package6) undefined)
	(= (at driver1) s4)
	(= (at driver2) s1)
	(= (at truck1) s2)
	(empty truck1)
	(= (at truck2) s0)
	(empty truck2)
	(= (at truck3) s3)
	(empty truck3)
	(= (at package1) s2)
	(= (at package2) s1)
	(= (at package3) s3)
	(= (at package4) s0)
	(= (at package5) s1)
	(= (at package6) s1)
	(path s0 p01)
	(path p01 s0)
	(path s1 p01)
	(path p01 s1)
	(= (time_to_walk s0 p01) 67)
	(= (time_to_walk p01 s0) 67)
	(= (time_to_walk s1 p01) 63)
	(= (time_to_walk p01 s1) 63)
	(path s1 p12)
	(path p12 s1)
	(path s2 p12)
	(path p12 s2)
	(= (time_to_walk s1 p12) 69)
	(= (time_to_walk p12 s1) 69)
	(= (time_to_walk s2 p12) 100)
	(= (time_to_walk p12 s2) 100)
	(path s1 p13)
	(path p13 s1)
	(path s3 p13)
	(path p13 s3)
	(= (time_to_walk s1 p13) 11)
	(= (time_to_walk p13 s1) 11)
	(= (time_to_walk s3 p13) 41)
	(= (time_to_walk p13 s3) 41)
	(path s3 p32)
	(path p32 s3)
	(path s2 p32)
	(path p32 s2)
	(= (time_to_walk s3 p32) 95)
	(= (time_to_walk p32 s3) 95)
	(= (time_to_walk s2 p32) 25)
	(= (time_to_walk p32 s2) 25)
	(path s3 p34)
	(path p34 s3)
	(path s4 p34)
	(path p34 s4)
	(= (time_to_walk s3 p34) 20)
	(= (time_to_walk p34 s3) 20)
	(= (time_to_walk s4 p34) 63)
	(= (time_to_walk p34 s4) 63)
	(path s4 p40)
	(path p40 s4)
	(path s0 p40)
	(path p40 s0)
	(= (time_to_walk s4 p40) 85)
	(= (time_to_walk p40 s4) 85)
	(= (time_to_walk s0 p40) 22)
	(= (time_to_walk p40 s0) 22)
	(link s0 s2)
	(link s2 s0)
	(= (time_to_drive s0 s2) 65)
	(= (time_to_drive s2 s0) 65)
	(link s0 s3)
	(link s3 s0)
	(= (time_to_drive s0 s3) 39)
	(= (time_to_drive s3 s0) 39)
	(link s1 s0)
	(link s0 s1)
	(= (time_to_drive s1 s0) 99)
	(= (time_to_drive s0 s1) 99)
	(link s2 s1)
	(link s1 s2)
	(= (time_to_drive s2 s1) 40)
	(= (time_to_drive s1 s2) 40)
	(link s3 s2)
	(link s2 s3)
	(= (time_to_drive s3 s2) 74)
	(= (time_to_drive s2 s3) 74)
	(link s4 s0)
	(link s0 s4)
	(= (time_to_drive s4 s0) 41)
	(= (time_to_drive s0 s4) 41)
	(link s4 s2)
	(link s2 s4)
	(= (time_to_drive s4 s2) 96)
	(= (time_to_drive s2 s4) 96)
	(link s4 s3)
	(link s3 s4)
	(= (time_to_drive s4 s3) 53)
	(= (time_to_drive s3 s4) 53)
)
	(:goal (and
	(= (at driver1) s3)
	(= (at driver2) s4)
	(= (at truck1) s3)
	(= (at truck2) s3)
	(= (at package1) s3)
	(= (at package2) s2)
	(= (at package3) s1)
	(= (at package4) s0)
	(= (at package5) s1)
	(= (at package6) s1)
	))

;(:metric minimize (+ (+ (* 3  (total-time)) (* 4  (driven))) (* 3  (walked))))

)
