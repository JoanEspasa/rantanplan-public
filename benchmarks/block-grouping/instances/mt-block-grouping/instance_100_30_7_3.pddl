(define (problem instance_100_30_7_3)
  (:domain mt-block-grouping)
  (:objects
    b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 - block
  )

  (:init
    (= (x b5) 9)
	(= (y b5) 32)
	(= (x b4) 27)
	(= (y b4) 59)
	(= (x b27) 49)
	(= (y b27) 95)
	(= (x b30) 71)
	(= (y b30) 83)
	(= (x b8) 63)
	(= (y b8) 17)
	(= (x b16) 90)
	(= (y b16) 51)
	(= (x b15) 55)
	(= (y b15) 71)
	(= (x b10) 41)
	(= (y b10) 8)
	(= (x b1) 79)
	(= (y b1) 1)
	(= (x b28) 88)
	(= (y b28) 1)
	(= (x b26) 67)
	(= (y b26) 29)
	(= (x b21) 66)
	(= (y b21) 61)
	(= (x b18) 18)
	(= (y b18) 23)
	(= (x b3) 85)
	(= (y b3) 4)
	(= (x b6) 44)
	(= (y b6) 6)
	(= (x b19) 93)
	(= (y b19) 38)
	(= (x b25) 59)
	(= (y b25) 21)
	(= (x b2) 45)
	(= (y b2) 10)
	(= (x b17) 88)
	(= (y b17) 9)
	(= (x b22) 69)
	(= (y b22) 89)
	(= (x b11) 84)
	(= (y b11) 96)
	(= (x b23) 95)
	(= (y b23) 96)
	(= (x b24) 64)
	(= (y b24) 73)
	(= (x b9) 75)
	(= (y b9) 36)
	(= (x b20) 32)
	(= (y b20) 6)
	(= (x b14) 1)
	(= (y b14) 95)
	(= (x b7) 73)
	(= (y b7) 77)
	(= (x b12) 48)
	(= (y b12) 33)
	(= (x b29) 74)
	(= (y b29) 26)
	(= (x b13) 94)
	(= (y b13) 85)
	(= (max_x) 100 )
	(= (min_x) 1 )
	(= (max_y) 100 )
	(= (min_y) 1 )
  )

  (:goal (and 
    (or (not (= (x b1) (x b2))) (not (= (y b1) (y b2))))
	(or (not (= (x b1) (x b3))) (not (= (y b1) (y b3))))
	(= (x b1) (x b4))
(= (y b1) (y b4))
	(or (not (= (x b1) (x b5))) (not (= (y b1) (y b5))))
	(or (not (= (x b1) (x b6))) (not (= (y b1) (y b6))))
	(or (not (= (x b1) (x b7))) (not (= (y b1) (y b7))))
	(= (x b1) (x b8))
(= (y b1) (y b8))
	(or (not (= (x b1) (x b9))) (not (= (y b1) (y b9))))
	(or (not (= (x b1) (x b10))) (not (= (y b1) (y b10))))
	(or (not (= (x b1) (x b11))) (not (= (y b1) (y b11))))
	(or (not (= (x b1) (x b12))) (not (= (y b1) (y b12))))
	(or (not (= (x b1) (x b13))) (not (= (y b1) (y b13))))
	(= (x b1) (x b14))
(= (y b1) (y b14))
	(= (x b1) (x b15))
(= (y b1) (y b15))
	(or (not (= (x b1) (x b16))) (not (= (y b1) (y b16))))
	(= (x b1) (x b17))
(= (y b1) (y b17))
	(or (not (= (x b1) (x b18))) (not (= (y b1) (y b18))))
	(or (not (= (x b1) (x b19))) (not (= (y b1) (y b19))))
	(= (x b1) (x b20))
(= (y b1) (y b20))
	(or (not (= (x b1) (x b21))) (not (= (y b1) (y b21))))
	(or (not (= (x b1) (x b22))) (not (= (y b1) (y b22))))
	(or (not (= (x b1) (x b23))) (not (= (y b1) (y b23))))
	(or (not (= (x b1) (x b24))) (not (= (y b1) (y b24))))
	(or (not (= (x b1) (x b25))) (not (= (y b1) (y b25))))
	(or (not (= (x b1) (x b26))) (not (= (y b1) (y b26))))
	(= (x b1) (x b27))
(= (y b1) (y b27))
	(or (not (= (x b1) (x b28))) (not (= (y b1) (y b28))))
	(or (not (= (x b1) (x b29))) (not (= (y b1) (y b29))))
	(or (not (= (x b1) (x b30))) (not (= (y b1) (y b30))))
	(or (not (= (x b2) (x b3))) (not (= (y b2) (y b3))))
	(or (not (= (x b2) (x b4))) (not (= (y b2) (y b4))))
	(or (not (= (x b2) (x b5))) (not (= (y b2) (y b5))))
	(or (not (= (x b2) (x b6))) (not (= (y b2) (y b6))))
	(or (not (= (x b2) (x b7))) (not (= (y b2) (y b7))))
	(or (not (= (x b2) (x b8))) (not (= (y b2) (y b8))))
	(or (not (= (x b2) (x b9))) (not (= (y b2) (y b9))))
	(or (not (= (x b2) (x b20))) (not (= (y b2) (y b20))))
	(or (not (= (x b2) (x b21))) (not (= (y b2) (y b21))))
	(or (not (= (x b2) (x b22))) (not (= (y b2) (y b22))))
	(= (x b2) (x b23))
(= (y b2) (y b23))
	(or (not (= (x b2) (x b24))) (not (= (y b2) (y b24))))
	(or (not (= (x b2) (x b25))) (not (= (y b2) (y b25))))
	(or (not (= (x b2) (x b26))) (not (= (y b2) (y b26))))
	(or (not (= (x b2) (x b27))) (not (= (y b2) (y b27))))
	(or (not (= (x b2) (x b28))) (not (= (y b2) (y b28))))
	(= (x b2) (x b29))
(= (y b2) (y b29))
	(or (not (= (x b2) (x b30))) (not (= (y b2) (y b30))))
	(or (not (= (x b3) (x b4))) (not (= (y b3) (y b4))))
	(or (not (= (x b3) (x b5))) (not (= (y b3) (y b5))))
	(= (x b3) (x b6))
(= (y b3) (y b6))
	(or (not (= (x b3) (x b7))) (not (= (y b3) (y b7))))
	(or (not (= (x b3) (x b8))) (not (= (y b3) (y b8))))
	(or (not (= (x b3) (x b9))) (not (= (y b3) (y b9))))
	(or (not (= (x b3) (x b30))) (not (= (y b3) (y b30))))
	(or (not (= (x b4) (x b5))) (not (= (y b4) (y b5))))
	(or (not (= (x b4) (x b6))) (not (= (y b4) (y b6))))
	(or (not (= (x b4) (x b7))) (not (= (y b4) (y b7))))
	(= (x b4) (x b8))
(= (y b4) (y b8))
	(or (not (= (x b4) (x b9))) (not (= (y b4) (y b9))))
	(or (not (= (x b5) (x b6))) (not (= (y b5) (y b6))))
	(or (not (= (x b5) (x b7))) (not (= (y b5) (y b7))))
	(or (not (= (x b5) (x b8))) (not (= (y b5) (y b8))))
	(or (not (= (x b5) (x b9))) (not (= (y b5) (y b9))))
	(or (not (= (x b6) (x b7))) (not (= (y b6) (y b7))))
	(or (not (= (x b6) (x b8))) (not (= (y b6) (y b8))))
	(or (not (= (x b6) (x b9))) (not (= (y b6) (y b9))))
	(or (not (= (x b7) (x b8))) (not (= (y b7) (y b8))))
	(= (x b7) (x b9))
(= (y b7) (y b9))
	(or (not (= (x b8) (x b9))) (not (= (y b8) (y b9))))
	(or (not (= (x b10) (x b2))) (not (= (y b10) (y b2))))
	(= (x b10) (x b3))
(= (y b10) (y b3))
	(or (not (= (x b10) (x b4))) (not (= (y b10) (y b4))))
	(or (not (= (x b10) (x b5))) (not (= (y b10) (y b5))))
	(= (x b10) (x b6))
(= (y b10) (y b6))
	(or (not (= (x b10) (x b7))) (not (= (y b10) (y b7))))
	(or (not (= (x b10) (x b8))) (not (= (y b10) (y b8))))
	(or (not (= (x b10) (x b9))) (not (= (y b10) (y b9))))
	(= (x b10) (x b11))
(= (y b10) (y b11))
	(or (not (= (x b10) (x b12))) (not (= (y b10) (y b12))))
	(or (not (= (x b10) (x b13))) (not (= (y b10) (y b13))))
	(or (not (= (x b10) (x b14))) (not (= (y b10) (y b14))))
	(or (not (= (x b10) (x b15))) (not (= (y b10) (y b15))))
	(or (not (= (x b10) (x b16))) (not (= (y b10) (y b16))))
	(or (not (= (x b10) (x b17))) (not (= (y b10) (y b17))))
	(= (x b10) (x b18))
(= (y b10) (y b18))
	(or (not (= (x b10) (x b19))) (not (= (y b10) (y b19))))
	(or (not (= (x b10) (x b20))) (not (= (y b10) (y b20))))
	(or (not (= (x b10) (x b21))) (not (= (y b10) (y b21))))
	(or (not (= (x b10) (x b22))) (not (= (y b10) (y b22))))
	(or (not (= (x b10) (x b23))) (not (= (y b10) (y b23))))
	(= (x b10) (x b24))
(= (y b10) (y b24))
	(= (x b10) (x b25))
(= (y b10) (y b25))
	(or (not (= (x b10) (x b26))) (not (= (y b10) (y b26))))
	(or (not (= (x b10) (x b27))) (not (= (y b10) (y b27))))
	(= (x b10) (x b28))
(= (y b10) (y b28))
	(or (not (= (x b10) (x b29))) (not (= (y b10) (y b29))))
	(or (not (= (x b10) (x b30))) (not (= (y b10) (y b30))))
	(or (not (= (x b11) (x b2))) (not (= (y b11) (y b2))))
	(= (x b11) (x b3))
(= (y b11) (y b3))
	(or (not (= (x b11) (x b4))) (not (= (y b11) (y b4))))
	(or (not (= (x b11) (x b5))) (not (= (y b11) (y b5))))
	(= (x b11) (x b6))
(= (y b11) (y b6))
	(or (not (= (x b11) (x b7))) (not (= (y b11) (y b7))))
	(or (not (= (x b11) (x b8))) (not (= (y b11) (y b8))))
	(or (not (= (x b11) (x b9))) (not (= (y b11) (y b9))))
	(or (not (= (x b11) (x b12))) (not (= (y b11) (y b12))))
	(or (not (= (x b11) (x b13))) (not (= (y b11) (y b13))))
	(or (not (= (x b11) (x b14))) (not (= (y b11) (y b14))))
	(or (not (= (x b11) (x b15))) (not (= (y b11) (y b15))))
	(or (not (= (x b11) (x b16))) (not (= (y b11) (y b16))))
	(or (not (= (x b11) (x b17))) (not (= (y b11) (y b17))))
	(= (x b11) (x b18))
(= (y b11) (y b18))
	(or (not (= (x b11) (x b19))) (not (= (y b11) (y b19))))
	(or (not (= (x b11) (x b20))) (not (= (y b11) (y b20))))
	(or (not (= (x b11) (x b21))) (not (= (y b11) (y b21))))
	(or (not (= (x b11) (x b22))) (not (= (y b11) (y b22))))
	(or (not (= (x b11) (x b23))) (not (= (y b11) (y b23))))
	(= (x b11) (x b24))
(= (y b11) (y b24))
	(= (x b11) (x b25))
(= (y b11) (y b25))
	(or (not (= (x b11) (x b26))) (not (= (y b11) (y b26))))
	(or (not (= (x b11) (x b27))) (not (= (y b11) (y b27))))
	(= (x b11) (x b28))
(= (y b11) (y b28))
	(or (not (= (x b11) (x b29))) (not (= (y b11) (y b29))))
	(or (not (= (x b11) (x b30))) (not (= (y b11) (y b30))))
	(or (not (= (x b12) (x b2))) (not (= (y b12) (y b2))))
	(or (not (= (x b12) (x b3))) (not (= (y b12) (y b3))))
	(or (not (= (x b12) (x b4))) (not (= (y b12) (y b4))))
	(= (x b12) (x b5))
(= (y b12) (y b5))
	(or (not (= (x b12) (x b6))) (not (= (y b12) (y b6))))
	(or (not (= (x b12) (x b7))) (not (= (y b12) (y b7))))
	(or (not (= (x b12) (x b8))) (not (= (y b12) (y b8))))
	(or (not (= (x b12) (x b9))) (not (= (y b12) (y b9))))
	(= (x b12) (x b13))
(= (y b12) (y b13))
	(or (not (= (x b12) (x b14))) (not (= (y b12) (y b14))))
	(or (not (= (x b12) (x b15))) (not (= (y b12) (y b15))))
	(or (not (= (x b12) (x b16))) (not (= (y b12) (y b16))))
	(or (not (= (x b12) (x b17))) (not (= (y b12) (y b17))))
	(or (not (= (x b12) (x b18))) (not (= (y b12) (y b18))))
	(or (not (= (x b12) (x b19))) (not (= (y b12) (y b19))))
	(or (not (= (x b12) (x b20))) (not (= (y b12) (y b20))))
	(= (x b12) (x b21))
(= (y b12) (y b21))
	(or (not (= (x b12) (x b22))) (not (= (y b12) (y b22))))
	(or (not (= (x b12) (x b23))) (not (= (y b12) (y b23))))
	(or (not (= (x b12) (x b24))) (not (= (y b12) (y b24))))
	(or (not (= (x b12) (x b25))) (not (= (y b12) (y b25))))
	(or (not (= (x b12) (x b26))) (not (= (y b12) (y b26))))
	(or (not (= (x b12) (x b27))) (not (= (y b12) (y b27))))
	(or (not (= (x b12) (x b28))) (not (= (y b12) (y b28))))
	(or (not (= (x b12) (x b29))) (not (= (y b12) (y b29))))
	(or (not (= (x b12) (x b30))) (not (= (y b12) (y b30))))
	(or (not (= (x b13) (x b2))) (not (= (y b13) (y b2))))
	(or (not (= (x b13) (x b3))) (not (= (y b13) (y b3))))
	(or (not (= (x b13) (x b4))) (not (= (y b13) (y b4))))
	(= (x b13) (x b5))
(= (y b13) (y b5))
	(or (not (= (x b13) (x b6))) (not (= (y b13) (y b6))))
	(or (not (= (x b13) (x b7))) (not (= (y b13) (y b7))))
	(or (not (= (x b13) (x b8))) (not (= (y b13) (y b8))))
	(or (not (= (x b13) (x b9))) (not (= (y b13) (y b9))))
	(or (not (= (x b13) (x b14))) (not (= (y b13) (y b14))))
	(or (not (= (x b13) (x b15))) (not (= (y b13) (y b15))))
	(or (not (= (x b13) (x b16))) (not (= (y b13) (y b16))))
	(or (not (= (x b13) (x b17))) (not (= (y b13) (y b17))))
	(or (not (= (x b13) (x b18))) (not (= (y b13) (y b18))))
	(or (not (= (x b13) (x b19))) (not (= (y b13) (y b19))))
	(or (not (= (x b13) (x b20))) (not (= (y b13) (y b20))))
	(= (x b13) (x b21))
(= (y b13) (y b21))
	(or (not (= (x b13) (x b22))) (not (= (y b13) (y b22))))
	(or (not (= (x b13) (x b23))) (not (= (y b13) (y b23))))
	(or (not (= (x b13) (x b24))) (not (= (y b13) (y b24))))
	(or (not (= (x b13) (x b25))) (not (= (y b13) (y b25))))
	(or (not (= (x b13) (x b26))) (not (= (y b13) (y b26))))
	(or (not (= (x b13) (x b27))) (not (= (y b13) (y b27))))
	(or (not (= (x b13) (x b28))) (not (= (y b13) (y b28))))
	(or (not (= (x b13) (x b29))) (not (= (y b13) (y b29))))
	(or (not (= (x b13) (x b30))) (not (= (y b13) (y b30))))
	(or (not (= (x b14) (x b2))) (not (= (y b14) (y b2))))
	(or (not (= (x b14) (x b3))) (not (= (y b14) (y b3))))
	(= (x b14) (x b4))
(= (y b14) (y b4))
	(or (not (= (x b14) (x b5))) (not (= (y b14) (y b5))))
	(or (not (= (x b14) (x b6))) (not (= (y b14) (y b6))))
	(or (not (= (x b14) (x b7))) (not (= (y b14) (y b7))))
	(= (x b14) (x b8))
(= (y b14) (y b8))
	(or (not (= (x b14) (x b9))) (not (= (y b14) (y b9))))
	(= (x b14) (x b15))
(= (y b14) (y b15))
	(or (not (= (x b14) (x b16))) (not (= (y b14) (y b16))))
	(= (x b14) (x b17))
(= (y b14) (y b17))
	(or (not (= (x b14) (x b18))) (not (= (y b14) (y b18))))
	(or (not (= (x b14) (x b19))) (not (= (y b14) (y b19))))
	(= (x b14) (x b20))
(= (y b14) (y b20))
	(or (not (= (x b14) (x b21))) (not (= (y b14) (y b21))))
	(or (not (= (x b14) (x b22))) (not (= (y b14) (y b22))))
	(or (not (= (x b14) (x b23))) (not (= (y b14) (y b23))))
	(or (not (= (x b14) (x b24))) (not (= (y b14) (y b24))))
	(or (not (= (x b14) (x b25))) (not (= (y b14) (y b25))))
	(or (not (= (x b14) (x b26))) (not (= (y b14) (y b26))))
	(= (x b14) (x b27))
(= (y b14) (y b27))
	(or (not (= (x b14) (x b28))) (not (= (y b14) (y b28))))
	(or (not (= (x b14) (x b29))) (not (= (y b14) (y b29))))
	(or (not (= (x b14) (x b30))) (not (= (y b14) (y b30))))
	(or (not (= (x b15) (x b2))) (not (= (y b15) (y b2))))
	(or (not (= (x b15) (x b3))) (not (= (y b15) (y b3))))
	(= (x b15) (x b4))
(= (y b15) (y b4))
	(or (not (= (x b15) (x b5))) (not (= (y b15) (y b5))))
	(or (not (= (x b15) (x b6))) (not (= (y b15) (y b6))))
	(or (not (= (x b15) (x b7))) (not (= (y b15) (y b7))))
	(= (x b15) (x b8))
(= (y b15) (y b8))
	(or (not (= (x b15) (x b9))) (not (= (y b15) (y b9))))
	(or (not (= (x b15) (x b16))) (not (= (y b15) (y b16))))
	(= (x b15) (x b17))
(= (y b15) (y b17))
	(or (not (= (x b15) (x b18))) (not (= (y b15) (y b18))))
	(or (not (= (x b15) (x b19))) (not (= (y b15) (y b19))))
	(= (x b15) (x b20))
(= (y b15) (y b20))
	(or (not (= (x b15) (x b21))) (not (= (y b15) (y b21))))
	(or (not (= (x b15) (x b22))) (not (= (y b15) (y b22))))
	(or (not (= (x b15) (x b23))) (not (= (y b15) (y b23))))
	(or (not (= (x b15) (x b24))) (not (= (y b15) (y b24))))
	(or (not (= (x b15) (x b25))) (not (= (y b15) (y b25))))
	(or (not (= (x b15) (x b26))) (not (= (y b15) (y b26))))
	(= (x b15) (x b27))
(= (y b15) (y b27))
	(or (not (= (x b15) (x b28))) (not (= (y b15) (y b28))))
	(or (not (= (x b15) (x b29))) (not (= (y b15) (y b29))))
	(or (not (= (x b15) (x b30))) (not (= (y b15) (y b30))))
	(or (not (= (x b16) (x b2))) (not (= (y b16) (y b2))))
	(or (not (= (x b16) (x b3))) (not (= (y b16) (y b3))))
	(or (not (= (x b16) (x b4))) (not (= (y b16) (y b4))))
	(or (not (= (x b16) (x b5))) (not (= (y b16) (y b5))))
	(or (not (= (x b16) (x b6))) (not (= (y b16) (y b6))))
	(or (not (= (x b16) (x b7))) (not (= (y b16) (y b7))))
	(or (not (= (x b16) (x b8))) (not (= (y b16) (y b8))))
	(or (not (= (x b16) (x b9))) (not (= (y b16) (y b9))))
	(or (not (= (x b16) (x b17))) (not (= (y b16) (y b17))))
	(or (not (= (x b16) (x b18))) (not (= (y b16) (y b18))))
	(or (not (= (x b16) (x b19))) (not (= (y b16) (y b19))))
	(or (not (= (x b16) (x b20))) (not (= (y b16) (y b20))))
	(or (not (= (x b16) (x b21))) (not (= (y b16) (y b21))))
	(or (not (= (x b16) (x b22))) (not (= (y b16) (y b22))))
	(or (not (= (x b16) (x b23))) (not (= (y b16) (y b23))))
	(or (not (= (x b16) (x b24))) (not (= (y b16) (y b24))))
	(or (not (= (x b16) (x b25))) (not (= (y b16) (y b25))))
	(or (not (= (x b16) (x b26))) (not (= (y b16) (y b26))))
	(or (not (= (x b16) (x b27))) (not (= (y b16) (y b27))))
	(or (not (= (x b16) (x b28))) (not (= (y b16) (y b28))))
	(or (not (= (x b16) (x b29))) (not (= (y b16) (y b29))))
	(or (not (= (x b16) (x b30))) (not (= (y b16) (y b30))))
	(or (not (= (x b17) (x b2))) (not (= (y b17) (y b2))))
	(or (not (= (x b17) (x b3))) (not (= (y b17) (y b3))))
	(= (x b17) (x b4))
(= (y b17) (y b4))
	(or (not (= (x b17) (x b5))) (not (= (y b17) (y b5))))
	(or (not (= (x b17) (x b6))) (not (= (y b17) (y b6))))
	(or (not (= (x b17) (x b7))) (not (= (y b17) (y b7))))
	(= (x b17) (x b8))
(= (y b17) (y b8))
	(or (not (= (x b17) (x b9))) (not (= (y b17) (y b9))))
	(or (not (= (x b17) (x b18))) (not (= (y b17) (y b18))))
	(or (not (= (x b17) (x b19))) (not (= (y b17) (y b19))))
	(= (x b17) (x b20))
(= (y b17) (y b20))
	(or (not (= (x b17) (x b21))) (not (= (y b17) (y b21))))
	(or (not (= (x b17) (x b22))) (not (= (y b17) (y b22))))
	(or (not (= (x b17) (x b23))) (not (= (y b17) (y b23))))
	(or (not (= (x b17) (x b24))) (not (= (y b17) (y b24))))
	(or (not (= (x b17) (x b25))) (not (= (y b17) (y b25))))
	(or (not (= (x b17) (x b26))) (not (= (y b17) (y b26))))
	(= (x b17) (x b27))
(= (y b17) (y b27))
	(or (not (= (x b17) (x b28))) (not (= (y b17) (y b28))))
	(or (not (= (x b17) (x b29))) (not (= (y b17) (y b29))))
	(or (not (= (x b17) (x b30))) (not (= (y b17) (y b30))))
	(or (not (= (x b18) (x b2))) (not (= (y b18) (y b2))))
	(= (x b18) (x b3))
(= (y b18) (y b3))
	(or (not (= (x b18) (x b4))) (not (= (y b18) (y b4))))
	(or (not (= (x b18) (x b5))) (not (= (y b18) (y b5))))
	(= (x b18) (x b6))
(= (y b18) (y b6))
	(or (not (= (x b18) (x b7))) (not (= (y b18) (y b7))))
	(or (not (= (x b18) (x b8))) (not (= (y b18) (y b8))))
	(or (not (= (x b18) (x b9))) (not (= (y b18) (y b9))))
	(or (not (= (x b18) (x b19))) (not (= (y b18) (y b19))))
	(or (not (= (x b18) (x b20))) (not (= (y b18) (y b20))))
	(or (not (= (x b18) (x b21))) (not (= (y b18) (y b21))))
	(or (not (= (x b18) (x b22))) (not (= (y b18) (y b22))))
	(or (not (= (x b18) (x b23))) (not (= (y b18) (y b23))))
	(= (x b18) (x b24))
(= (y b18) (y b24))
	(= (x b18) (x b25))
(= (y b18) (y b25))
	(or (not (= (x b18) (x b26))) (not (= (y b18) (y b26))))
	(or (not (= (x b18) (x b27))) (not (= (y b18) (y b27))))
	(= (x b18) (x b28))
(= (y b18) (y b28))
	(or (not (= (x b18) (x b29))) (not (= (y b18) (y b29))))
	(or (not (= (x b18) (x b30))) (not (= (y b18) (y b30))))
	(or (not (= (x b19) (x b2))) (not (= (y b19) (y b2))))
	(or (not (= (x b19) (x b3))) (not (= (y b19) (y b3))))
	(or (not (= (x b19) (x b4))) (not (= (y b19) (y b4))))
	(or (not (= (x b19) (x b5))) (not (= (y b19) (y b5))))
	(or (not (= (x b19) (x b6))) (not (= (y b19) (y b6))))
	(or (not (= (x b19) (x b7))) (not (= (y b19) (y b7))))
	(or (not (= (x b19) (x b8))) (not (= (y b19) (y b8))))
	(or (not (= (x b19) (x b9))) (not (= (y b19) (y b9))))
	(or (not (= (x b19) (x b20))) (not (= (y b19) (y b20))))
	(or (not (= (x b19) (x b21))) (not (= (y b19) (y b21))))
	(= (x b19) (x b22))
(= (y b19) (y b22))
	(or (not (= (x b19) (x b23))) (not (= (y b19) (y b23))))
	(or (not (= (x b19) (x b24))) (not (= (y b19) (y b24))))
	(or (not (= (x b19) (x b25))) (not (= (y b19) (y b25))))
	(or (not (= (x b19) (x b26))) (not (= (y b19) (y b26))))
	(or (not (= (x b19) (x b27))) (not (= (y b19) (y b27))))
	(or (not (= (x b19) (x b28))) (not (= (y b19) (y b28))))
	(or (not (= (x b19) (x b29))) (not (= (y b19) (y b29))))
	(= (x b19) (x b30))
(= (y b19) (y b30))
	(or (not (= (x b20) (x b3))) (not (= (y b20) (y b3))))
	(= (x b20) (x b4))
(= (y b20) (y b4))
	(or (not (= (x b20) (x b5))) (not (= (y b20) (y b5))))
	(or (not (= (x b20) (x b6))) (not (= (y b20) (y b6))))
	(or (not (= (x b20) (x b7))) (not (= (y b20) (y b7))))
	(= (x b20) (x b8))
(= (y b20) (y b8))
	(or (not (= (x b20) (x b9))) (not (= (y b20) (y b9))))
	(or (not (= (x b20) (x b21))) (not (= (y b20) (y b21))))
	(or (not (= (x b20) (x b22))) (not (= (y b20) (y b22))))
	(or (not (= (x b20) (x b23))) (not (= (y b20) (y b23))))
	(or (not (= (x b20) (x b24))) (not (= (y b20) (y b24))))
	(or (not (= (x b20) (x b25))) (not (= (y b20) (y b25))))
	(or (not (= (x b20) (x b26))) (not (= (y b20) (y b26))))
	(= (x b20) (x b27))
(= (y b20) (y b27))
	(or (not (= (x b20) (x b28))) (not (= (y b20) (y b28))))
	(or (not (= (x b20) (x b29))) (not (= (y b20) (y b29))))
	(or (not (= (x b20) (x b30))) (not (= (y b20) (y b30))))
	(or (not (= (x b21) (x b3))) (not (= (y b21) (y b3))))
	(or (not (= (x b21) (x b4))) (not (= (y b21) (y b4))))
	(= (x b21) (x b5))
(= (y b21) (y b5))
	(or (not (= (x b21) (x b6))) (not (= (y b21) (y b6))))
	(or (not (= (x b21) (x b7))) (not (= (y b21) (y b7))))
	(or (not (= (x b21) (x b8))) (not (= (y b21) (y b8))))
	(or (not (= (x b21) (x b9))) (not (= (y b21) (y b9))))
	(or (not (= (x b21) (x b22))) (not (= (y b21) (y b22))))
	(or (not (= (x b21) (x b23))) (not (= (y b21) (y b23))))
	(or (not (= (x b21) (x b24))) (not (= (y b21) (y b24))))
	(or (not (= (x b21) (x b25))) (not (= (y b21) (y b25))))
	(or (not (= (x b21) (x b26))) (not (= (y b21) (y b26))))
	(or (not (= (x b21) (x b27))) (not (= (y b21) (y b27))))
	(or (not (= (x b21) (x b28))) (not (= (y b21) (y b28))))
	(or (not (= (x b21) (x b29))) (not (= (y b21) (y b29))))
	(or (not (= (x b21) (x b30))) (not (= (y b21) (y b30))))
	(or (not (= (x b22) (x b3))) (not (= (y b22) (y b3))))
	(or (not (= (x b22) (x b4))) (not (= (y b22) (y b4))))
	(or (not (= (x b22) (x b5))) (not (= (y b22) (y b5))))
	(or (not (= (x b22) (x b6))) (not (= (y b22) (y b6))))
	(or (not (= (x b22) (x b7))) (not (= (y b22) (y b7))))
	(or (not (= (x b22) (x b8))) (not (= (y b22) (y b8))))
	(or (not (= (x b22) (x b9))) (not (= (y b22) (y b9))))
	(or (not (= (x b22) (x b23))) (not (= (y b22) (y b23))))
	(or (not (= (x b22) (x b24))) (not (= (y b22) (y b24))))
	(or (not (= (x b22) (x b25))) (not (= (y b22) (y b25))))
	(or (not (= (x b22) (x b26))) (not (= (y b22) (y b26))))
	(or (not (= (x b22) (x b27))) (not (= (y b22) (y b27))))
	(or (not (= (x b22) (x b28))) (not (= (y b22) (y b28))))
	(or (not (= (x b22) (x b29))) (not (= (y b22) (y b29))))
	(= (x b22) (x b30))
(= (y b22) (y b30))
	(or (not (= (x b23) (x b3))) (not (= (y b23) (y b3))))
	(or (not (= (x b23) (x b4))) (not (= (y b23) (y b4))))
	(or (not (= (x b23) (x b5))) (not (= (y b23) (y b5))))
	(or (not (= (x b23) (x b6))) (not (= (y b23) (y b6))))
	(or (not (= (x b23) (x b7))) (not (= (y b23) (y b7))))
	(or (not (= (x b23) (x b8))) (not (= (y b23) (y b8))))
	(or (not (= (x b23) (x b9))) (not (= (y b23) (y b9))))
	(or (not (= (x b23) (x b24))) (not (= (y b23) (y b24))))
	(or (not (= (x b23) (x b25))) (not (= (y b23) (y b25))))
	(or (not (= (x b23) (x b26))) (not (= (y b23) (y b26))))
	(or (not (= (x b23) (x b27))) (not (= (y b23) (y b27))))
	(or (not (= (x b23) (x b28))) (not (= (y b23) (y b28))))
	(= (x b23) (x b29))
(= (y b23) (y b29))
	(or (not (= (x b23) (x b30))) (not (= (y b23) (y b30))))
	(= (x b24) (x b3))
(= (y b24) (y b3))
	(or (not (= (x b24) (x b4))) (not (= (y b24) (y b4))))
	(or (not (= (x b24) (x b5))) (not (= (y b24) (y b5))))
	(= (x b24) (x b6))
(= (y b24) (y b6))
	(or (not (= (x b24) (x b7))) (not (= (y b24) (y b7))))
	(or (not (= (x b24) (x b8))) (not (= (y b24) (y b8))))
	(or (not (= (x b24) (x b9))) (not (= (y b24) (y b9))))
	(= (x b24) (x b25))
(= (y b24) (y b25))
	(or (not (= (x b24) (x b26))) (not (= (y b24) (y b26))))
	(or (not (= (x b24) (x b27))) (not (= (y b24) (y b27))))
	(= (x b24) (x b28))
(= (y b24) (y b28))
	(or (not (= (x b24) (x b29))) (not (= (y b24) (y b29))))
	(or (not (= (x b24) (x b30))) (not (= (y b24) (y b30))))
	(= (x b25) (x b3))
(= (y b25) (y b3))
	(or (not (= (x b25) (x b4))) (not (= (y b25) (y b4))))
	(or (not (= (x b25) (x b5))) (not (= (y b25) (y b5))))
	(= (x b25) (x b6))
(= (y b25) (y b6))
	(or (not (= (x b25) (x b7))) (not (= (y b25) (y b7))))
	(or (not (= (x b25) (x b8))) (not (= (y b25) (y b8))))
	(or (not (= (x b25) (x b9))) (not (= (y b25) (y b9))))
	(or (not (= (x b25) (x b26))) (not (= (y b25) (y b26))))
	(or (not (= (x b25) (x b27))) (not (= (y b25) (y b27))))
	(= (x b25) (x b28))
(= (y b25) (y b28))
	(or (not (= (x b25) (x b29))) (not (= (y b25) (y b29))))
	(or (not (= (x b25) (x b30))) (not (= (y b25) (y b30))))
	(or (not (= (x b26) (x b3))) (not (= (y b26) (y b3))))
	(or (not (= (x b26) (x b4))) (not (= (y b26) (y b4))))
	(or (not (= (x b26) (x b5))) (not (= (y b26) (y b5))))
	(or (not (= (x b26) (x b6))) (not (= (y b26) (y b6))))
	(= (x b26) (x b7))
(= (y b26) (y b7))
	(or (not (= (x b26) (x b8))) (not (= (y b26) (y b8))))
	(= (x b26) (x b9))
(= (y b26) (y b9))
	(or (not (= (x b26) (x b27))) (not (= (y b26) (y b27))))
	(or (not (= (x b26) (x b28))) (not (= (y b26) (y b28))))
	(or (not (= (x b26) (x b29))) (not (= (y b26) (y b29))))
	(or (not (= (x b26) (x b30))) (not (= (y b26) (y b30))))
	(or (not (= (x b27) (x b3))) (not (= (y b27) (y b3))))
	(= (x b27) (x b4))
(= (y b27) (y b4))
	(or (not (= (x b27) (x b5))) (not (= (y b27) (y b5))))
	(or (not (= (x b27) (x b6))) (not (= (y b27) (y b6))))
	(or (not (= (x b27) (x b7))) (not (= (y b27) (y b7))))
	(= (x b27) (x b8))
(= (y b27) (y b8))
	(or (not (= (x b27) (x b9))) (not (= (y b27) (y b9))))
	(or (not (= (x b27) (x b28))) (not (= (y b27) (y b28))))
	(or (not (= (x b27) (x b29))) (not (= (y b27) (y b29))))
	(or (not (= (x b27) (x b30))) (not (= (y b27) (y b30))))
	(= (x b28) (x b3))
(= (y b28) (y b3))
	(or (not (= (x b28) (x b4))) (not (= (y b28) (y b4))))
	(or (not (= (x b28) (x b5))) (not (= (y b28) (y b5))))
	(= (x b28) (x b6))
(= (y b28) (y b6))
	(or (not (= (x b28) (x b7))) (not (= (y b28) (y b7))))
	(or (not (= (x b28) (x b8))) (not (= (y b28) (y b8))))
	(or (not (= (x b28) (x b9))) (not (= (y b28) (y b9))))
	(or (not (= (x b28) (x b29))) (not (= (y b28) (y b29))))
	(or (not (= (x b28) (x b30))) (not (= (y b28) (y b30))))
	(or (not (= (x b29) (x b3))) (not (= (y b29) (y b3))))
	(or (not (= (x b29) (x b4))) (not (= (y b29) (y b4))))
	(or (not (= (x b29) (x b5))) (not (= (y b29) (y b5))))
	(or (not (= (x b29) (x b6))) (not (= (y b29) (y b6))))
	(or (not (= (x b29) (x b7))) (not (= (y b29) (y b7))))
	(or (not (= (x b29) (x b8))) (not (= (y b29) (y b8))))
	(or (not (= (x b29) (x b9))) (not (= (y b29) (y b9))))
	(or (not (= (x b29) (x b30))) (not (= (y b29) (y b30))))
	(or (not (= (x b30) (x b4))) (not (= (y b30) (y b4))))
	(or (not (= (x b30) (x b5))) (not (= (y b30) (y b5))))
	(or (not (= (x b30) (x b6))) (not (= (y b30) (y b6))))
	(or (not (= (x b30) (x b7))) (not (= (y b30) (y b7))))
	(or (not (= (x b30) (x b8))) (not (= (y b30) (y b8))))
	(or (not (= (x b30) (x b9))) (not (= (y b30) (y b9))))
  ))

  
  

  
)
